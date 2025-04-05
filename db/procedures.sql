-- Calculate number of customers who subscribed during a month
CREATE OR REPLACE FUNCTION count_subscribers(month_name VARCHAR)
RETURNS INT AS $$
DECLARE count_result INT;
BEGIN
  SELECT COUNT(*) INTO count_result
  FROM customers
  WHERE month = month_name AND y = 'yes';

  RETURN count_result;
END;
$$ LANGUAGE plpgsql;
