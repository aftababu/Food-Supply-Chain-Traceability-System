-- ====================================================================
-- Script: 01_create_database.sql
-- Description: Initializes the project database.
-- ====================================================================

-- Drop database if it exists (requires terminating active connections in practice)
DROP DATABASE IF EXISTS food_traceability_db;

-- Create the main database
CREATE DATABASE food_traceability_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

-- NOTE: Connect to this database before running the subsequent scripts.
