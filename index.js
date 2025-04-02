// Description: Main entry point for the application.
// Author: [Your Name]
// Date: [Today's Date]
// Version: 1.0
// Dependencies: express
// Update: [Date of Last Update]
// Notes: [Any additional notes or comments]
// =====================================================================================================
//
// =====================================================================================================

// Import express
const express = require("express");
const app = express();

// Define the PORT
const PORT = process.env.PORT || 8080;

// Root endpoint
app.get("/", (req, res) => {
    res.send("Database Optimization Project is Running!");
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
