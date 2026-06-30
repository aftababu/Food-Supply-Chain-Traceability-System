-- ====================================================================
-- Script: 14_drop_all.sql
-- Description: Safely removes all database objects created for this project.
--              Run this only when resetting or cleaning the database.
-- ====================================================================

-- 1. Drop Triggers and Functions
DROP TRIGGER IF EXISTS after_inspection_insert ON safety_inspections CASCADE;
DROP FUNCTION IF EXISTS trg_audit_safety_inspection() CASCADE;
DROP FUNCTION IF EXISTS get_remaining_shelf_life(INT) CASCADE;
DROP PROCEDURE IF EXISTS record_shipment_arrival(INT, TIMESTAMPTZ) CASCADE;

-- 2. Drop Tables (Using CASCADE to handle foreign key dependencies automatically)
DROP TABLE IF EXISTS system_alerts CASCADE;
DROP TABLE IF EXISTS safety_inspections CASCADE;
DROP TABLE IF EXISTS shipments CASCADE;
DROP TABLE IF EXISTS batches CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS stakeholders CASCADE;
DROP TABLE IF EXISTS stakeholder_roles CASCADE;

-- Note: To completely drop the database, you must disconnect from it and run:
-- DROP DATABASE IF EXISTS food_traceability_db;
