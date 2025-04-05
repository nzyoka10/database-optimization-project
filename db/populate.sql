// populate.js
const fs = require('fs');
const csv = require('csv-parser');
const { Pool } = require('pg');

// PostgreSQL connection settings
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'bank_db',
  password: 'root',
  port: 5432,
});

// Insert each row into the database
async function insertRow(row) {
  const query = `
    INSERT INTO customers (
      age, job, marital, education, default_status, balance, housing,
      loan, contact, day, month, duration, campaign, pdays, previous,
      poutcome, y
    ) VALUES (
      $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17
    )
  `;
  const values = [
    row.age, row.job, row.marital, row.education, row.default, row.balance,
    row.housing, row.loan, row.contact, row.day, row.month, row.duration,
    row.campaign, row.pdays, row.previous, row.poutcome, row.y
  ];
  try {
    await pool.query(query, values);
  } catch (err) {
    console.error("Insert failed:", err.message);
  }
}

// Read CSV and insert rows
let count = 0;
fs.createReadStream('bank-full.csv')
  .pipe(csv({ separator: ';' }))
  .on('data', (row) => {
    if (count < 10000) {
      insertRow(row);
      count++;
    }
  })
  .on('end', () => {
    console.log(`✅ Imported ${count} records`);
    pool.end();
  });
