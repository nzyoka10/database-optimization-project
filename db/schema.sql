-- schema.sql
-- Betty Style Comment: Creating a table for bank marketing customers

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,                 -- Unique ID for each customer (auto-incremented)
    age INT,                               -- Age of the customer
    job VARCHAR(50),                       -- Job title of the customer (up to 50 characters)
    marital VARCHAR(20),                   -- Marital status of the customer (e.g., single, married)
    education VARCHAR(50),                 -- Education level of the customer (e.g., high school, university)
    default_status VARCHAR(5),             -- Credit in default? (yes/no)
    balance INT,                           -- Account balance of the customer
    housing VARCHAR(5),                    -- Has housing loan? (yes/no)
    loan VARCHAR(5),                       -- Has personal loan? (yes/no)
    contact VARCHAR(20),                   -- Communication type used for contact (e.g., cellular, telephone)
    day INT,                               -- Last contact day of the month
    month VARCHAR(10),                     -- Last contact month
    duration INT,                          -- Duration of the last contact call in seconds
    campaign INT,                          -- Number of contacts in this campaign
    pdays INT,                             -- Days since last contact
    previous INT,                          -- Number of previous contacts before this campaign
    poutcome VARCHAR(20),                  -- Outcome of the previous marketing campaign (e.g., success, failure)
    y VARCHAR(5)                           -- Subscription to term deposit? (yes/no)
);


-- -- Bank table
CREATE TABLE bank (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  balance DECIMAL,
  account_number VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
