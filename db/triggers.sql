-- Track insertions into customers table
CREATE TABLE log_customers (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    action VARCHAR(10),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger function
CREATE OR REPLACE FUNCTION log_customer_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log_customers (customer_id, action)
    VALUES (NEW.id, 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger itself
CREATE TRIGGER trg_log_customer_insert
AFTER INSERT ON customers
FOR EACH ROW
EXECUTE FUNCTION log_customer_insert();
