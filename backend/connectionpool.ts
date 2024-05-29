import sql from 'mssql';

const pool = new sql.ConnectionPool({
    user: 'shaun3', // Replace 'your_sql_server_username' 
    password: 'admin', // Replace 'your_sql_server_password' 
    server: 'DESKTOP-KJG0MS7',  // Server name
    database: 'SwipeAppDb',    // DB NAME
    options: {
        encrypt: true, // Use this if you're on Windows Azure
        trustServerCertificate: true, // Use this if you're on a local development environment
    }
});

export default pool;