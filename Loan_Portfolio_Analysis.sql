-- ============================================================
-- LOAN PORTFOLIO ANALYSIS
-- ============================================================
-- Project: Loan Portfolio Analysis & Risk Dashboard
-- Tool: SQLite
-- Purpose: Analyze loans, customers, disbursements,
-- repayments, outstanding balances and loan status.
-- ============================================================


-- 1. VIEW SAMPLE DATA
SELECT *
FROM loans
LIMIT 20;


-- 2. TOTAL LOAN APPLICATIONS
SELECT
    COUNT(*) AS total_loan_applications
FROM loans;


-- 3. TOTAL CUSTOMERS
SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM loans;


-- 4. TOTAL LOAN AMOUNT
SELECT
    SUM(loan_amount) AS total_loan_amount
FROM loans;


-- 5. TOTAL DISBURSED AMOUNT
SELECT
    SUM(disbursed_amount) AS total_disbursed_amount
FROM loans
WHERE loan_status = 'Disbursed';


-- 6. NUMBER OF DISBURSED LOANS
SELECT
    COUNT(*) AS disbursed_loan_count
FROM loans
WHERE loan_status = 'Disbursed';


-- 7. TOTAL REPAYMENTS
SELECT
    SUM(repayment_amount) AS total_repayments
FROM loans;


-- 8. OUTSTANDING BALANCE
SELECT
    SUM(loan_amount - repayment_amount) AS outstanding_balance
FROM loans;


-- 9. LOANS BY STATUS
SELECT
    loan_status,
    COUNT(*) AS loan_count
FROM loans
GROUP BY loan_status
ORDER BY loan_count DESC;


-- 10. LOAN AMOUNT BY STATUS
SELECT
    loan_status,
    SUM(loan_amount) AS total_loan_amount
FROM loans
GROUP BY loan_status
ORDER BY total_loan_amount DESC;


-- 11. MONTHLY DISBURSEMENT TREND
SELECT
    strftime('%Y-%m', disbursement_date) AS month,
    COUNT(*) AS disbursed_loans,
    SUM(disbursed_amount) AS total_disbursed
FROM loans
WHERE loan_status = 'Disbursed'
GROUP BY strftime('%Y-%m', disbursement_date)
ORDER BY month;


-- 12. MONTHLY REPAYMENT TREND
SELECT
    strftime('%Y-%m', disbursement_date) AS month,
    SUM(repayment_amount) AS total_repayment
FROM loans
GROUP BY strftime('%Y-%m', disbursement_date)
ORDER BY month;


-- 13. CUSTOMER PORTFOLIO SUMMARY
SELECT
    customer_id,
    COUNT(*) AS number_of_loans,
    SUM(loan_amount) AS total_borrowed,
    SUM(disbursed_amount) AS total_disbursed,
    SUM(repayment_amount) AS total_repaid,
    SUM(loan_amount - repayment_amount) AS outstanding_balance
FROM loans
GROUP BY customer_id
ORDER BY outstanding_balance DESC;


-- 14. TOP 10 CUSTOMERS BY LOAN AMOUNT
SELECT
    customer_id,
    SUM(loan_amount) AS total_loan_amount
FROM loans
GROUP BY customer_id
ORDER BY total_loan_amount DESC
LIMIT 10;


-- 15. TOP 10 CUSTOMERS BY REPAYMENT
SELECT
    customer_id,
    SUM(repayment_amount) AS total_repaid
FROM loans
GROUP BY customer_id
ORDER BY total_repaid DESC
LIMIT 10;


-- 16. REPAYMENT RATE
SELECT
    ROUND(
        SUM(repayment_amount) * 100.0 /
        NULLIF(SUM(loan_amount), 0),
        2
    ) AS repayment_rate_percent
FROM loans;


-- 17. OUTSTANDING RATE
SELECT
    ROUND(
        SUM(loan_amount - repayment_amount) * 100.0 /
        NULLIF(SUM(loan_amount), 0),
        2
    ) AS outstanding_rate_percent
FROM loans;


-- 18. DEFAULTED LOANS
SELECT
    COUNT(*) AS defaulted_loans,
    SUM(loan_amount) AS defaulted_loan_amount
FROM loans
WHERE loan_status = 'Defaulted';


-- 19. DEFAULT RATE
SELECT
    ROUND(
        SUM(
            CASE
                WHEN loan_status = 'Defaulted' THEN 1
                ELSE 0
            END
        ) * 100.0 / NULLIF(COUNT(*), 0),
        2
    ) AS default_rate_percent
FROM loans;


-- 20. AVERAGE LOAN AMOUNT
SELECT
    ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM loans;


-- 21. AVERAGE REPAYMENT
SELECT
    ROUND(AVG(repayment_amount), 2) AS average_repayment_amount
FROM loans;


-- 22. LOANS WITH OUTSTANDING BALANCES
SELECT
    loan_id,
    customer_id,
    loan_amount,
    repayment_amount,
    loan_amount - repayment_amount AS outstanding_balance,
    loan_status
FROM loans
WHERE loan_amount > repayment_amount
ORDER BY outstanding_balance DESC;


-- 23. CUSTOMER RISK ANALYSIS
SELECT
    customer_id,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_borrowed,
    SUM(repayment_amount) AS total_repaid,
    SUM(loan_amount - repayment_amount) AS outstanding_balance,
    SUM(
        CASE
            WHEN loan_status = 'Defaulted' THEN 1
            ELSE 0
        END
    ) AS defaulted_loans
FROM loans
GROUP BY customer_id
ORDER BY outstanding_balance DESC;


-- 24. FINAL PORTFOLIO KPI SUMMARY
SELECT
    COUNT(*) AS total_loans,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(loan_amount) AS total_loan_amount,
    SUM(disbursed_amount) AS total_disbursed,
    SUM(repayment_amount) AS total_repaid,
    SUM(loan_amount - repayment_amount) AS outstanding_balance,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM loans;


-- ============================================================
-- END OF LOAN PORTFOLIO ANALYSIS
-- ============================================================
