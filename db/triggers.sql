-- Automatically lowercase job title on insert
CREATE OR REPLACE FUNCTION lowercase_job()
RETURNS TRIGGER AS $$
BEGIN
  NEW.job := LOWER(NEW.job);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_lowercase_job
BEFORE INSERT ON customers
FOR EACH ROW
EXECUTE FUNCTION lowercase_job();
