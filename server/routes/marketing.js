// server/routes/marketing.js
const express = require('express');
const router = express.Router();

// Example marketing routes
router.get('/', (req, res) => {
  res.json({ message: 'Marketing campaigns data' });
});

module.exports = router;
