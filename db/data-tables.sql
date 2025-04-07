CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    age INT,
    job VARCHAR(50),
    marital VARCHAR(20),
    education VARCHAR(50),
    default_credit VARCHAR(10),
    housing VARCHAR(10),
    loan VARCHAR(10)
);


CREATE TABLE contacts (
    contact_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    contact_type VARCHAR(20),
    month VARCHAR(10),
    day_of_week VARCHAR(10),
    duration INT  -- Use for benchmarking only
);

CREATE TABLE campaigns (
    campaign_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(20)
);

CREATE TABLE economics (
    econ_id SERIAL PRIMARY KEY,
    emp_var_rate NUMERIC,
    cons_price_idx NUMERIC,
    cons_conf_idx NUMERIC,
    euribor3m NUMERIC,
    nr_employed NUMERIC
);

CREATE TABLE subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    econ_id INT REFERENCES economics(econ_id),
    subscribed VARCHAR(5)  -- 'yes' or 'no'
);
