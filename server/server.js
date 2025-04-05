// server.js
// Betty Style Comment: Setup Express server and load routes

// Import required modules
const express = require('express');
const cors = require('cors');
const app = express();
const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('../docs/swagger'); // Swagger documentation setup
const customerRoutes = require('./routes/customers'); // Import customer routes

// Middleware setup
app.use(cors()); // Enable cross-origin requests
app.use(express.json()); // Middleware to parse JSON bodies

// Setup Swagger UI for API documentation
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Mount customer routes
app.use('/api/customers', customerRoutes);

// Start the Express server
app.listen(3000, () => console.log('Server started on port 3000')); // Listening on port 3000
