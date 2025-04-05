// populate.js
// Load required modules
const fs = require('fs');
const csv = require('csv-parser');
const { Pool } = require('pg');

// PostgreSQL connection setup
const pool = new Pool({
  user: 'your_user',          // change to your PostgreSQL user
  host: 'localhost',
  database: 'your_db',        // change to your DB name
  password: 'your_password',  // your DB password
  port: 5432,
});

// Read CSV and insert into PostgreSQL
fs.createReadStream('db/bank-full.csv')
  .pipe(csv({ separator: ';' })) // dataset uses semicolons
  .on('data', async (row) => {
    // Insert each row into 'bank' table
    try {
      await pool.query(
        `INSERT INTO bank (
          age, job, marital, education, default, balance,
          housing, loan, contact, day, month, duration,
          campaign, pdays, previous, poutcome, y
        ) VALUES (
          $1, $2, $3, $4, $5, $6,
          $7, $8, $9, $10, $11, $12,
          $13, $14, $15, $16, $17
        )`,
        [
          row.age,
          row.job,
          row.marital,
          row.education,
          row.default,
          row.balance,
          row.housing,
          row.loan,
          row.contact,
          row.day,
          row.month,
          row.duration,
          row.campaign,
          row.pdays,
          row.previous,
          row.poutcome,
          row.y,
        ]
      );
    } catch (err) {
      console.error('Insert error:', err.message);
    }
  })
  .on('end', () => {
    console.log('✅ Data insertion complete!');
    pool.end();
  });
