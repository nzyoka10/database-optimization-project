-- schema.sql

-- Create customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    age INT NOT NULL,
    job VARCHAR(50),
    marital VARCHAR(20),
    education VARCHAR(50),
    default_status VARCHAR(10),
    balance INT,
    housing VARCHAR(10),
    loan VARCHAR(10),
    contact VARCHAR(30),
    day INT,
    month VARCHAR(10),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(30),
    y VARCHAR(10)
);
