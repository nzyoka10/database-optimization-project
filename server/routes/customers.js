// customers.js
// Betty Style Comment: CRUD routes for customer table

// Import required modules
const express = require('express');
const router = express.Router();
const pool = require('../db'); // Database connection pool

// Get all customers
router.get('/', async (req, res) => {
  // Query to select all customers, limiting to 100 records for efficiency
  const result = await pool.query('SELECT * FROM customers LIMIT 100');
  res.json(result.rows); // Respond with customer data in JSON format
});

// Get customer by ID
router.get('/:id', async (req, res) => {
  // Query to fetch a customer by their ID, parameterized to prevent SQL injection
  const result = await pool.query('SELECT * FROM customers WHERE id = $1', [req.params.id]);
  res.json(result.rows[0]); // Respond with the first (and only) customer in the result
});

// Add new customer
router.post('/', async (req, res) => {
  // Destructure customer data from the request body
  const {
    age, job, marital, education, default_status, balance,
    housing, loan, contact, day, month, duration,
    campaign, pdays, previous, poutcome, y
  } = req.body;

  // Insert new customer into the database using parameterized query
  await pool.query(`
    INSERT INTO customers (
      age, job, marital, education, default_status, balance,
      housing, loan, contact, day, month, duration,
      campaign, pdays, previous, poutcome, y
    ) VALUES (
      $1, $2, $3, $4, $5, $6,
      $7, $8, $9, $10, $11, $12,
      $13, $14, $15, $16, $17
    )
  `, [
    age, job, marital, education, default_status, balance,
    housing, loan, contact, day, month, duration,
    campaign, pdays, previous, poutcome, y
  ]);

  res.status(201).send('Customer added'); // Respond with a success message
});

// Update customer
router.put('/:id', async (req, res) => {
  // Destructure updated customer data from the request body
  const {
    age, job, marital, education, default_status, balance,
    housing, loan, contact, day, month, duration,
    campaign, pdays, previous, poutcome, y
  } = req.body;

  // Update the existing customer using parameterized query
  await pool.query(`
    UPDATE customers SET
      age=$1, job=$2, marital=$3, education=$4, default_status=$5, balance=$6,
      housing=$7, loan=$8, contact=$9, day=$10, month=$11, duration=$12,
      campaign=$13, pdays=$14, previous=$15, poutcome=$16, y=$17
    WHERE id=$18
  `, [
    age, job, marital, education, default_status, balance,
    housing, loan, contact, day, month, duration,
    campaign, pdays, previous, poutcome, y, req.params.id
  ]);

  res.send('Customer updated'); // Respond with a success message
});

// Delete customer
router.delete('/:id', async (req, res) => {
  // Delete a customer by their ID using parameterized query
  await pool.query('DELETE FROM customers WHERE id=$1', [req.params.id]);
  res.send('Customer deleted'); // Respond with a success message
});

// Export the router to be used in the main server file
module.exports = router;
