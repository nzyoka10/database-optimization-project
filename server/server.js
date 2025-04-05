// server.js
// Express server and load routes

// Import required modules
const express = require('express');
const cors = require('cors');
const app = express();
const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('../docs/swagger'); // Swagger documentation setup
const customerRoutes = require('./routes/customers'); // Import customer routes
const port = 8080;

// Serve Swagger docs
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Get all customers
app.use('/api/customers', customerRoutes);

// 
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});