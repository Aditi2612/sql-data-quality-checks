/* =====================================================
   DATA QUALITY CHECKS — Loan Dataset
   Author: Aditi Bajpai
   Purpose: Audit a loans dataset for data-quality
   defects before any analysis is trusted.
   Checks: Completeness, Uniqueness, Validity,
   Consistency, Accuracy
   ===================================================== */


/* 1. COMPLETENESS — are required values missing?
   Missing data hides risk (a blank field = a blind spot). */
SELECT COUNT(*) AS missing_int_rate
FROM loans
WHERE loan_int_rate IS NULL OR loan_int_rate = '';


/* 2. UNIQUENESS — is any record duplicated?
   Duplicates inflate totals (one loan counted twice). */
SELECT loan_id, COUNT(*) AS cnt
FROM loans
GROUP BY loan_id
HAVING cnt > 1;


/* 3. VALIDITY — do any values break real-world rules? */
-- Impossible age
SELECT * FROM loans WHERE person_age > 100;
-- Impossible employment length
SELECT * FROM loans WHERE person_emp_length > 60;
-- Impossible loan amount
SELECT * FROM loans WHERE loan_amnt <= 0;
-- Impossible interest rate
SELECT * FROM loans WHERE loan_int_rate > 100;


/* 4. CONSISTENCY — is the same value recorded differently?
   'default' / 'Default' / 'DEFAULT' should count as one. */
SELECT LOWER(loan_status) AS status, COUNT(*) AS cnt
FROM loans
GROUP BY LOWER(loan_status);


/* 5. ACCURACY — are values within their expected range?
   loan_percent_income is a ratio; must be between 0 and 1. */
SELECT *
FROM loans
WHERE loan_percent_income > 1 OR loan_percent_income < 0;
