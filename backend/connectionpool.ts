import sql from 'mssql';

const pool = new sql.ConnectionPool({
    user: 'shaun3', // Replace 'your_sql_server_username' with your actual SQL Server username
    password: 'admin', // Replace 'your_sql_server_password' with your actual SQL Server password
    server: 'DESKTOP-KJG0MS7',
    database: 'SwipeAppDb',
    options: {
        encrypt: true, // Use this if you're on Windows Azure
        trustServerCertificate: true, // Use this if you're on a local development environment
    }
});

export default pool;