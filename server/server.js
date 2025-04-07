// server.js
// Express server and load routes

// Import required modules
const express = require('express');
const cors = require('cors');
const swaggerUi = require('swagger-ui-express');
const path = require('path'); // Required to handle file paths
const swaggerDocument = require('../docs/swagger'); // Swagger documentation setup
const customerRoutes = require('./routes/customers'); // Import customer routes
const marketingRoutes = require('./routes/marketing'); // Import marketing campaign routes (assumed)
const app = express();
const port = 8080;

// Middleware
app.use(cors()); // Enable Cross-Origin Resource Sharing

// Serve Swagger docs
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Home page route for Bank Marketing - Serve an HTML file
app.get('/bank-marketing', (req, res) => {
  // Specify the path to your HTML file
  res.sendFile(path.join(__dirname, 'public', 'index.html')); // Adjust this path based on your project structure
});

// View all customers route
app.use('/api/customers', customerRoutes);

// Marketing campaign data routes
app.use('/api/marketing', marketingRoutes);

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
