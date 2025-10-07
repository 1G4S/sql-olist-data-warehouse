 -- ==========================================================
-- SCRIPT: silver/01_create_schema_silver.sql
-- PURPOSE: Create schema for silver layer
-- AUTHOR: Igor
-- DATE: 2025-10-07
-- ===========================================================

-- Create schema
CREATE SCHEMA IF NOT EXISTS silver;

-- Set default path
SET search_path TO silver, public;