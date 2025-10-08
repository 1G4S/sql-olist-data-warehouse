 -- ==========================================================
-- SCRIPT: silver/02_dim_customer.sql
-- PURPOSE: Create dimension table for customer
-- AUTHOR: Igor
-- DATE: 2025-10-08
-- ===========================================================


-- 1. Create dim_customer table
CREATE TABLE silver.dim_customer(
    customer_sk BIGSERIAL PRIMARY KEY;
    customer_unique_id TEXT,
    zip_code_prefix INT,
    city TEXT,
    state TEXT,
    is_deduped BOOLEAN,
    record_source TEXT
);
