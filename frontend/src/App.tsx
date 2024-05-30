import React, { useEffect, useState } from 'react';
import axios from 'axios';
import SwipableCard from './SwipableCard';
import './App.css';
import { User } from '../../model/User';

const App: React.FC = () => {
    const [recommendations, setRecommendations] = useState<User[]>([]);
    const userId = '7CB26D44-05A1-488D-8C59-E43C44835F12'; // Replace with the actual user ID in db


    useEffect(() => {
        const fetchRecommendations = async () => {
            try {
                console.log("Fetching recommendations...");
                const response = await axios.get<User[]>(`http://localhost:3000/api/recommendations/${userId}`, {
                    headers: {
                        'Authorization': `swipeApp`
                    }
                });
                console.log(response.data); // Add this line
                setRecommendations(response.data);
            } catch (error) {
                console.error('Error fetching recommendations:', error);
            }
        };
    
        fetchRecommendations();
    }, [userId]);

    const handleSwipe = (swipedUserId: string, action: 'like' | 'dislike') => {
        console.log(`User ${swipedUserId} was swiped ${action}`);
        // Update the list to remove the swiped user
        setRecommendations(prev => prev.filter(user => user.id !== swipedUserId));
    };

    return (
        <div className="app">
            <h1>Recommendations</h1>
            <div className="card-container">
                {recommendations.map((user, index) => (
                    <SwipableCard 
                        key={user.id} 
                        user={user} 
                        onSwipe={handleSwipe} 
                        isTop={index === 0} // Only the top card should be draggable
                    />
                ))}
            </div>
        </div>
    );
};

export default App;
