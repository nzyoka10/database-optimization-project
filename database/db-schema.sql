-- Database schema
-- Version: 1.0
-- Date: 2018-01-01
-- Author: John Doe
-- Description: This is the database schema for the application.
--

-- Create the database
CREATE DATABASE bank_marketing_db;

-- Use the database
USE bank_marketing_db;

-- Create the table clients
CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    age INT NOT NULL,
    job ENUM('admin.', 'blue-collar', 'entrepreneur', 'housemaid', 'management', 
             'retired', 'self-employed', 'services', 'student', 'technician', 'unemployed', 'unknown') NOT NULL,
    marital ENUM('single', 'married', 'divorced') NOT NULL,
    education ENUM('primary', 'secondary', 'tertiary', 'unknown') NOT NULL,
    default_status ENUM('yes', 'no') NOT NULL,
    balance DECIMAL(10,2) NOT NULL,
    housing ENUM('yes', 'no') NOT NULL,
    loan ENUM('yes', 'no') NOT NULL
);

-- Create the table campaigns
CREATE TABLE campaigns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    contact ENUM('cellular', 'telephone', 'unknown') NOT NULL,
    last_contact_date DATE NOT NULL,
    duration INT NOT NULL, -- Call duration in seconds
    campaign INT NOT NULL, -- Number of contacts in the campaign
    pdays INT NOT NULL, -- Days since last contact (-1 means never contacted)
    previous INT NOT NULL, -- Number of contacts before this campaign
    poutcome ENUM('failure', 'success', 'other', 'unknown') NOT NULL,
    subscribed ENUM('yes', 'no') NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

-- Get all clients who subscribed to the term deposit
SELECT c.id, c.age, c.job, c.marital, ca.subscribed
FROM clients c
JOIN campaigns ca ON c.id = ca.client_id
WHERE ca.subscribed = 'yes';

