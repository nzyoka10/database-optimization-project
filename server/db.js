// db.js
// PostgreSQL database connection using pooling

const { Pool } = require('pg');
require('dotenv').config();

// Create a pool of connections to PostgreSQL
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  // Optional configurations like max connections or idle timeout can be added:
  // max: 20,  // max number of connections in the pool
  // idleTimeoutMillis: 30000,  // time before an idle client is closed
  // connectionTimeoutMillis: 2000, // how long to wait before timing out
});

// Function to test the database connection
const testConnection = async () => {
  try {
    const client = await pool.connect(); // Get a client from the pool
    console.log('Connected to the database');
    client.release(); // Release the client back to the pool
  } catch (error) {
    console.error('Error connecting to the database:', error);
  }
};

// Call testConnection to verify successful setup (optional)
testConnection();

module.exports = pool;
