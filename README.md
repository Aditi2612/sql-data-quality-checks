# Data Quality Checks — SQL Toolkit

A SQL toolkit that audits a loans dataset for data-quality defects before any analysis is trusted. Built on the principle that in banking, decisions are only as reliable as the data underneath them.

## Why this matters
Supervisors and analysts don't act on raw data — they act on data they trust. If that data is incomplete, duplicated, or invalid, every downstream decision inherits the error. These checks catch defects at the source.

## The 5 checks

| Check | Catches | Example defect |
|-------|---------|----------------|
| **Completeness** | Missing values (NULL or blank) | Blank interest rate = hidden risk |
| **Uniqueness** | Duplicate records | Same loan_id counted twice, inflating totals |
| **Validity** | Impossible values | Age 144, negative loan amount, rate > 100% |
| **Consistency** | Same value recorded differently | 'default' vs 'Default' vs 'DEFAULT' |
| **Accuracy** | Values outside expected range | loan_percent_income above 1.0 |

## Dataset
Credit Risk Dataset (~32,000 loan records) — columns include age, income, loan amount, interest rate, loan grade, and loan status.

## Files
- `data_quality_checks.sql` — all five checks, documented

## Tools
SQL (MySQL)

**Author:** Aditi Bajpai
