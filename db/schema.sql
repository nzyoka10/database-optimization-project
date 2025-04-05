-- schema.sql
-- Betty Style Comment: Creating a table for bank marketing customers

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,                 -- Unique ID
    age INT,                               -- Age of customer
    job VARCHAR(50),                       -- Job title
    marital VARCHAR(20),                   -- Marital status
    education VARCHAR(50),                 -- Education level
    default_status VARCHAR(5),            -- Credit in default? (yes/no)
    balance INT,                           -- Account balance
    housing VARCHAR(5),                   -- Has housing loan? (yes/no)
    loan VARCHAR(5),                      -- Has personal loan? (yes/no)
    contact VARCHAR(20),                  -- Contact communication type
    day INT,                               -- Last contact day
    month VARCHAR(10),                    -- Last contact month
    duration INT,                          -- Call duration
    campaign INT,                          -- No. of contacts in this campaign
    pdays INT,                             -- Days since last contact
    previous INT,                          -- No. of previous contacts
    poutcome VARCHAR(20),                 -- Outcome of the previous campaign
    y VARCHAR(5)                          -- Subscription to term deposit? (yes/no)
);
