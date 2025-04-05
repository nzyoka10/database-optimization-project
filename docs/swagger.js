// swagger.js
// Betty Style Comment: Swagger setup for documenting the API

const swaggerJsDoc = require('swagger-jsdoc');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Bank Marketing API',
      version: '1.0.0',
      description: 'API documentation for customer management',
    },
  },
  apis: ['./server/routes/*.js'],
};

module.exports = swaggerJsDoc(options);
