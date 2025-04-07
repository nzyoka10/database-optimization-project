-- Insert sample data (short sample shown; repeat for bulk insert)
INSERT INTO customers (age, job, marital, education, default_status, balance, housing, loan, contact, day, month, duration, campaign, pdays, previous, poutcome, y)
VALUES
(35, 'admin', 'married', 'university.degree', 'no', 1500, 'yes', 'no', 'cellular', 5, 'may', 200, 2, 999, 0, 'unknown', 'yes'),
(42, 'technician', 'single', 'high.school', 'no', 1200, 'yes', 'yes', 'cellular', 12, 'jul', 180, 3, 5, 2, 'success', 'no'),
(29, 'blue-collar', 'married', 'basic.9y', 'yes', 500, 'no', 'yes', 'telephone', 23, 'aug', 100, 1, 999, 0, 'failure', 'no'),
(50, 'management', 'divorced', 'basic.4y', 'no', 2000, 'yes', 'no', 'cellular', 15, 'oct', 300, 4, 999, 0, 'success', 'yes'),
(33, 'entrepreneur', 'single', 'master.degree', 'no', 2500, 'yes', 'no', 'telephone', 10, 'nov', 150, 2, 999, 0, 'unknown', 'yes'),
(40, 'student', 'single', 'high.school', 'no', 800, 'no', 'no', 'cellular', 20, 'dec', 120, 1, 999, 0, 'failure', 'no');

-- Insert more sample data IF needed
-- Note: The above data is a sample. You can add more rows to test the triggers and procedures.
