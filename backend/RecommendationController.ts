import express, { Request, Response, NextFunction } from 'express';
import pool from './connectionpool';
import sql from 'mssql';
import cors from 'cors';
import { User } from '../model/User';

const app = express();
const port = 3000;

app.use(cors({
    origin: 'http://localhost:3001'
}));

app.use(express.json());


// Middleware for authorization
const authorize = (req: Request, res: Response, next: NextFunction) => {
    const token = req.headers.authorization;
    if (token === 'swipeApp') { 
        next(); // Token is valid, proceed to the next middleware
    } else {
        res.status(401).send('Unauthorized');
    }
};


const getDailyRecommendations = async (userId: string): Promise<User[]> => {
    try {
        await pool.connect();
        const userQuery = 'SELECT * FROM users WHERE id = @userId';
        const userResult = await pool.request()
            .input('userId', sql.UniqueIdentifier, userId)
            .query(userQuery);

        const user = userResult.recordset[0];
        if (!user) {
            throw new Error('User not found');
        }

        const userUniversity = user.university;
        const userInterests = user.interests.split(',');

        const recommendationQuery = `
            SELECT *, 
                   (CASE WHEN university = @userUniversity THEN 1 ELSE 0 END) * 0.6 + 
                   (SELECT COUNT(*) FROM STRING_SPLIT(interests, ',') 
                    WHERE value IN (@userInterests)) * 0.4 + 
                   RAND() * 0.1 AS score
            FROM users
            WHERE id != @userId
            ORDER BY score DESC
            OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY
        `;

        const recommendationResult = await pool.request()
            .input('userUniversity', sql.VarChar, userUniversity)
            .input('userInterests', sql.VarChar, userInterests.join(','))
            .input('userId', sql.UniqueIdentifier, userId)
            .query(recommendationQuery);

        return recommendationResult.recordset;
    } catch (error) {
        console.error('Error connecting to database:', error);
        throw error;
    } finally {
        await pool.close();
    }
};

app.get('/api/recommendations/:userId', authorize,async (req: Request, res: Response) => {
    const userId = req.params.userId;
    console.log(userId);

    try {
        const recommendations = await getDailyRecommendations(userId);
        res.json(recommendations);
    } catch (error) {
        if (error instanceof Error) {
            res.status(500).send(error.message);
        } else {
            res.status(500).send('An unknown error occurred');
        }
    }
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
});
