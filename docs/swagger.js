// swagger.js
// Swagger: API documentation
// Swagger documentation setup for the Bank Marketing API
// This file configures Swagger for the API documentation of the Bank Marketing project.
// It uses the swagger-jsdoc package to generate documentation based on JSDoc comments in the route files.
//

const swaggerJsDoc = require('swagger-jsdoc');

// Swagger configuration options
const options = {
  definition: {
    openapi: '3.0.0',  // OpenAPI version
    info: {
      title: 'Bank Marketing API',  // API title
      version: '1.0.0',  // API version
      description: 'API documentation for Customer Management',  // Brief description of the API's purpose
    },
  },
  apis: ['./server/routes/*.js'],  // Path to the route files that contain Swagger annotations
};

module.exports = swaggerJsDoc(options);  // Export the generated Swagger documentation

