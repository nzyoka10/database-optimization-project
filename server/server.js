// server.js
// Betty Style Comment: Setup Express server and load routes

const express = require('express');
const cors = require('cors');
const app = express();
const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('../docs/swagger');
const customerRoutes = require('./routes/customers');

app.use(cors());
app.use(express.json());
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
app.use('/api/customers', customerRoutes);

app.listen(3000, () => console.log('Server started on port 3000'));
