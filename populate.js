// populate.js

// Load required modules
const fs = require('fs');            // File system module to read CSV files
const csv = require('csv-parser');   // CSV parser to read CSV data
const { Pool } = require('pg');      // PostgreSQL client for database connection

// PostgreSQL connection setup
const pool = new Pool({
  user: 'postgres',                 // Database username
  host: 'localhost',                // Database host (localhost in this case)
  database: 'bank_db',              // Database name
  password: 'root',                 // Database password
  port: 5432,                       // Database port (default PostgreSQL port)
});

// Read the CSV file and insert data into PostgreSQL
fs.createReadStream('db/bank-full.csv')  // Specify the path to your CSV file
  .pipe(csv({ separator: ';' }))         // Dataset uses semicolons as separator
  .on('data', async (row) => {          // For each row in the CSV file
    try {
      // Insert each row into the 'bank' table
      await pool.query(
        `INSERT INTO bank (
          age, job, marital, education, "default", balance,
          housing, loan, contact, day, month, duration,
          campaign, pdays, previous, poutcome, y
        ) VALUES (
          $1, $2, $3, $4, $5, $6,
          $7, $8, $9, $10, $11, $12,
          $13, $14, $15, $16, $17
        )`, 
        [
          row.age,         // Column 1: Age
          row.job,         // Column 2: Job
          row.marital,     // Column 3: Marital status
          row.education,   // Column 4: Education level
          row.default,     // Column 5: Default status (escaped as "default")
          row.balance,     // Column 6: Account balance
          row.housing,     // Column 7: Housing loan status
          row.loan,        // Column 8: Personal loan status
          row.contact,     // Column 9: Contact communication type
          row.day,         // Column 10: Day of last contact
          row.month,       // Column 11: Month of last contact
          row.duration,    // Column 12: Duration of last contact in seconds
          row.campaign,    // Column 13: Number of contacts during this campaign
          row.pdays,       // Column 14: Days since last contact
          row.previous,    // Column 15: Number of contacts before this campaign
          row.poutcome,    // Column 16: Outcome of the previous marketing campaign
          row.y            // Column 17: Target variable (yes/no for subscription)
        ]
      );
    } catch (err) {
      // Log any errors during the insert process
      console.error('Insert error:', err.message);
    }
  })
  .on('end', () => {  // After all rows are processed
    console.log('New records inserted successfully!');
    pool.end();        // Close the connection pool
  });
