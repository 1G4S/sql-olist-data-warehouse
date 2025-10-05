CREATE SCHEMA IF NOT EXISTS bronze;

CREATE TABLE bronze.load_log(
    load_id BIGSERIAL PRIMARY KEY,
    table_name TEXT NOT NULL,
    file_name TEXT,
    rows_loaded INT,
    load_start TIMESTAMPZ DEFAULT now(),
    load_end TIMESTAMPZ,
    status TEXT,
    notes TEXT
);

SET search_path TO bronze, public;