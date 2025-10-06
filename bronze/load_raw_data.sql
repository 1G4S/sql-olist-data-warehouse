-- ==========================================================
-- SCRIPT: bronze/load_raw_data.sql
-- PURPOSE: Load raw data to tables in bronze layer
-- AUTHOR: Igor
-- DATE: 2025-10-06
-- ==========================================================

-- ================
-- STEP: Load raw data to customers table
-- TABLE: bronze.customers_raw
-- ================

BEGIN;

-- 1. Delete all rows from customers
TRUNCATE TABLE bronze.customers_raw;

-- 2. Load raw data to customers
COPY bronze.customers_raw(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
FROM '/Users/igorsarnowski/e_commerce_analysis_sql/data/olist_customers_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- 3. Insert information about load to load_log table
INSERT INTO bronze.load_log(
	table_name,
	file_name,
	rows_loaded,
	load_start,
	load_end,
	status,
	notes
)
VALUES (
	'bronze.customers_raw',
	'olist_customers_dataset/csv',
	(SELECT COUNT(*) FROM bronze.customers_raw),
	now(),
	now(),
	'SUCCESS',
	NULL
)

COMMIT;

-- ================
-- STEP: Load raw data to geolocation table
-- TABLE: bronze.geolocation_raw
-- ================

BEGIN;

-- 1. Delete all rows from geolocation_raw table
TRUNCATE TABLE bronze.geolocation_raw;

-- 2. Load raw data to geolocation_raw table
COPY bronze.geolocation_raw(geolocation_zip_code_prefix,geolocation_lat,geolocation_lng,geolocation_city,geolocation_state)
FROM '/Users/igorsarnowski/e_commerce_analysis_sql/data/olist_geolocation_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODIN 'UTF8');

-- 3. Insert information about load to load_log table
INSERT INTO bronze.load_log(
	table_name,
	file_name,
	rows_loaded,
	load_start,
	load_end,
	status,
	notes
)
VALUES(
	'bronze.geolocation_raw',
	'olist_geolocation_dataset.csv',
	(SELECT COUNT(*) FROM bronze.geolocation_raw),
	now(),
	now(),
	'SUCCESS',
	NULL
);

COMMIT;