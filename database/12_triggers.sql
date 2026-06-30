-- ---------------------------------------------------------
-- 3. TRIGGER: Automated Temperature Safety Quarantine
-- Description: If an inspection fails due to bad temp, auto-quarantine the batch and alert.
-- ---------------------------------------------------------
CREATE OR REPLACE FUNCTION trg_audit_safety_inspection()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    -- If the inspection result is FAIL
    IF NEW.pass_fail = 'FAIL' THEN
        -- 1. Quarantine the batch
        UPDATE batches
        SET current_status = 'Quarantined'
        WHERE batch_id = NEW.batch_id;

        -- 2. Log an alert in the system
        INSERT INTO system_alerts (batch_id, alert_type, alert_message)
        VALUES (NEW.batch_id, 'SAFETY_VIOLATION',
                'Batch Quarantined. Failed inspection. Temp recorded: ' || NEW.recorded_temp);
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER after_inspection_insert
AFTER INSERT ON safety_inspections
FOR EACH ROW
EXECUTE FUNCTION trg_audit_safety_inspection();

-- Test the trigger (Will automatically insert to system_alerts and update batches table)
-- INSERT INTO safety_inspections (batch_id, inspector_id, recorded_temp, pass_fail, remarks)
-- VALUES (3, 7, 40.00, 'FAIL', 'Extreme heat exposure!');
