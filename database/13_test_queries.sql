-- ====================================================================
-- Script: 13_test_queries.sql
-- Description: Tests all PL/pgSQL objects (Functions, Procedures, Triggers).
-- ====================================================================

-- ---------------------------------------------------------
-- 1. Test Function: get_remaining_shelf_life
-- ---------------------------------------------------------
-- Description: Calculates the days remaining until a batch expires.
SELECT
    batch_id,
    production_date,
    expiry_date,
    get_remaining_shelf_life(batch_id) AS days_until_expiry
FROM batches
WHERE batch_id IN (1, 2, 3);

-- ---------------------------------------------------------
-- 2. Test Procedure: record_shipment_arrival
-- ---------------------------------------------------------
-- Description: Updates a shipment's arrival time and automatically updates the batch status.
-- Step A: Check current status of Shipment 2 and its associated Batch
SELECT shipment_id, transit_status, arrival_time FROM shipments WHERE shipment_id = 2;
SELECT batch_id, current_status FROM batches WHERE batch_id = (SELECT batch_id FROM shipments WHERE shipment_id = 2);

-- Step B: Call the procedure to mark arrival
CALL record_shipment_arrival(2, CURRENT_TIMESTAMP);

-- Step C: Verify updates (Shipment should be 'Delivered', Batch should be 'At Receiver')
SELECT shipment_id, transit_status, arrival_time FROM shipments WHERE shipment_id = 2;
SELECT batch_id, current_status FROM batches WHERE batch_id = (SELECT batch_id FROM shipments WHERE shipment_id = 2);

-- ---------------------------------------------------------
-- 3. Test Trigger: trg_audit_safety_inspection
-- ---------------------------------------------------------
-- Description: Inserting a 'FAIL' inspection should auto-quarantine the batch and log an alert.
-- Step A: Check initial status of Batch 3 and its alerts
SELECT batch_id, current_status FROM batches WHERE batch_id = 3;
SELECT * FROM system_alerts WHERE batch_id = 3;

-- Step B: Insert a failed safety inspection for Batch 3
INSERT INTO safety_inspections (batch_id, inspector_id, recorded_temp, pass_fail, remarks)
VALUES (3, 7, 35.50, 'FAIL', 'TEST TRIGGER: Critical temperature breach!');

-- Step C: Verify Trigger Execution (Batch 3 status should be 'Quarantined' and a new alert should exist)
SELECT batch_id, current_status FROM batches WHERE batch_id = 3;
SELECT * FROM system_alerts WHERE batch_id = 3 ORDER BY created_at DESC LIMIT 1;
