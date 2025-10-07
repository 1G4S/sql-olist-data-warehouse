-- ==========================================================
-- SCRIPT: bronze/03_simple_sanity_check.sql
-- PURPOSE: Checking raw tables
-- AUTHOR: Igor
-- DATE: 2025-10-07
-- ==========================================================

-- Amount of rows in each table

SELECT 'customers_raw' AS rows_check, COUNT(*) FROM bronze.customers_raw
UNION ALL
SELECT 'orders_raw', COUNT(*) FROM bronze.orders_raw
UNION ALL
SELECT 'order_items', COUNT(*) FROM bronze.order_items_raw
UNION ALL
SELECT 'order_payments_raw', COUNT(*) FROM bronze.order_payments_raw
UNION ALL
SELECT 'reviews_raw', COUNT(*) FROM bronze.order_reviews_raw
UNION ALL
SELECT 'products_raw', COUNT(*) FROM bronze.products_raw
UNION ALL
SELECT 'sellers_raw', COUNT(*) FROM bronze.sellers_raw
UNION ALL
SELECT 'geolocation_raw', COUNT(*) FROM bronze.geolocation_raw
UNION ALL
SELECT 'product_category_name_translation_raw', COUNT(*) FROM bronze.product_category_name_translation_raw;