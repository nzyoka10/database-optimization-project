-- Procedure to get total customers with positive response
CREATE OR REPLACE FUNCTION get_positive_response_count()
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM customers WHERE y = 'yes';
    RETURN total;
END;
$$ LANGUAGE plpgsql;

-- Procedure to get average balance per job
CREATE OR REPLACE FUNCTION get_avg_balance_by_job(job_title VARCHAR)
RETURNS NUMERIC AS $$
DECLARE
    avg_balance NUMERIC;
BEGIN
    SELECT AVG(balance) INTO avg_balance FROM customers WHERE job = job_title;
    RETURN avg_balance;
END;
$$ LANGUAGE plpgsql;
