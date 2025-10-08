 -- ==========================================================
-- SCRIPT: silver/02_dim_customer.sql
-- PURPOSE: Create dimension table for customer
-- AUTHOR: Igor
-- DATE: 2025-10-08
-- ===========================================================


-- 1. Create dim_customer table
CREATE TABLE silver.dim_customer(
    customer_sk BIGSERIAL PRIMARY KEY,
    customer_unique_id TEXT,
    zip_code_prefix INT,
    city TEXT,
    state TEXT,
    is_deduped BOOLEAN,
    record_source TEXT
);

-- 2. Cleaning and standardization
WITH raw_std AS(
    SELECT 
        c.customer_unique_id, 
        c.customer_zip_code_prefix::INT,
        INITCAP(btrim(c.customer_city)) AS city_std,
        INITCAP(btrim(c.customer_state)) AS state_std
    FROM bronze.customers_raw AS c
    WHERE c.customer_unique_id IS NOT NULL
);

-- 3. Choosing latest row with unique_id
last_row AS(
    SELECT
        DISTINCT ON (c.customer_unique_id),
        c.customer_unique_id,
        c.customer_id AS latest_customer_id
    FROM bronze.customers_raw AS c
    ORDER BY c.customer_unique_id, c.ingested_at DESC
);
