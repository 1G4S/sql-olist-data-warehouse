-- ==========================================================
-- SCRIPT: bronze/01_create_schema_bronze.sql
-- PURPOSE: Create the BRONZE schema and technical load log
-- AUTHOR: Igor
-- DATE: 2025-10-06
-- ==========================================================

-- 1. Create schema
CREATE SCHEMA IF NOT EXISTS bronze;

-- 2. Create load log table

CREATE TABLE IF NOT EXISTS bronze.load_log(
    load_id BIGSERIAL PRIMARY KEY,
    table_name TEXT NOT NULL,
    file_name TEXT,
    rows_loaded INT,
    load_start TIMESTAMPTZ DEFAULT now(),
    load_end TIMESTAMPTZ,
    status TEXT,
    notes TEXT
);

-- 3. Set default path
SET search_path TO bronze, public;