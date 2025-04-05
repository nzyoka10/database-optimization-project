// db.js
// Betty Style Comment: PostgreSQL database connection using pooling

const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

module.exports = pool;
