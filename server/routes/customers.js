// customers.js
// CRUD routes for customer table

// Import required modules
const express = require('express');
const router = express.Router();
const pool = require('../db'); // Database connection pool

// Get all customers
router.get('/', async (req, res) => {
  // Query to select all customers, limiting to 100 records for efficiency
  const result = await pool.query('SELECT * FROM customers LIMIT 200');
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

  res.status(201).send('New customer added!'); // Respond with a success message
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


/**
 * @swagger
 * /api/customers:
 *   get:
 *     summary: Get all customers
 *     description: Retrieve a list of all customers in the database.
 *     responses:
 *       200:
 *         description: A list of customers
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 *                 properties:
 *                   id:
 *                     type: integer
 *                   name:
 *                     type: string
 *                   email:
 *                     type: string
 *                   phone:
 *                     type: string
 *       500:
 *         description: Internal server error
 */

/**
 * @swagger
 * /api/customers/{id}:
 *   get:
 *     summary: Get a customer by ID
 *     description: Retrieve detailed information about a specific customer by their ID.
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         description: ID of the customer
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: A customer object
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 id:
 *                   type: integer
 *                 name:
 *                   type: string
 *                 email:
 *                   type: string
 *                 phone:
 *                   type: string
 *       404:
 *         description: Customer not found
 *       500:
 *         description: Internal server error
 */

/**
 * @swagger
 * /api/customers:
 *   post:
 *     summary: Create a new customer
 *     description: Adds a new customer to the database.
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               email:
 *                 type: string
 *               phone:
 *                 type: string
 *               age:
 *                 type: integer
 *               job:
 *                 type: string
 *               marital:
 *                 type: string
 *               education:
 *                 type: string
 *               default_status:
 *                 type: string
 *               balance:
 *                 type: number
 *                 format: float
 *               housing:
 *                 type: string
 *               loan:
 *                 type: string
 *               contact:
 *                 type: string
 *               day:
 *                 type: integer
 *               month:
 *                 type: string
 *               duration:
 *                 type: integer
 *               campaign:
 *                 type: string
 *               pdays:
 *                 type: integer
 *               previous:
 *                 type: integer
 *               poutcome:
 *                 type: string
 *               y:
 *                 type: string
 *     responses:
 *       201:
 *         description: Customer created successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 age:
 *                   type: integer
 *                 job:
 *                   type: string
 *                 marital:
 *                   type: string
 *                 education:
 *                   type: string
 *                 default_status:
 *                   type: string
 *                 balance:
 *                   type: number
 *                   format: float
 *                 housing:
 *                   type: string
 *                 loan:
 *                   type: string
 *                 contact:
 *                   type: string
 *                 day:
 *                   type: integer
 *                 month:
 *                   type: string
 *                 duration:
 *                   type: integer
 *                 campaign:
 *                   type: string
 *                 pdays:
 *                   type: integer
 *                 previous:
 *                   type: integer
 *                 poutcome:
 *                   type: string
 *                 y:
 *                   type: string
 *       400:
 *         description: Invalid input
 *       500:
 *         description: Internal server error
 */


/**
 * @swagger
 * /api/customers/{id}:
 *   put:
 *     summary: Update customer information
 *     description: Updates details of a specific customer by their ID.
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         description: ID of the customer to update
 *         schema:
 *           type: integer
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               email:
 *                 type: string
 *               phone:
 *                 type: string
 *     responses:
 *       200:
 *         description: Customer updated successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 id:
 *                   type: integer
 *                 name:
 *                   type: string
 *                 email:
 *                   type: string
 *                 phone:
 *                   type: string
 *       400:
 *         description: Invalid input
 *       404:
 *         description: Customer not found
 *       500:
 *         description: Internal server error
 */

/**
 * @swagger
 * /api/customers/{id}:
 *   delete:
 *     summary: Delete a customer
 *     description: Removes a customer from the database using their ID.
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         description: ID of the customer to delete
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Customer deleted successfully
 *       404:
 *         description: Customer not found
 *       500:
 *         description: Internal server error
 */
