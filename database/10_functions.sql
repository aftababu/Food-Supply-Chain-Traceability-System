-- ====================================================================
-- Script: 10_functions_procedures_triggers.sql
-- Description: Contains procedural logic to automate traceability rules. (Req 9)
-- ====================================================================

-- ---------------------------------------------------------
-- 1. FUNCTION: Calculate Remaining Shelf Life
-- ---------------------------------------------------------
CREATE OR REPLACE FUNCTION get_remaining_shelf_life(p_batch_id INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    v_expiry_date TIMESTAMPTZ;
    v_days_left INT;
BEGIN
    SELECT expiry_date INTO v_expiry_date FROM batches WHERE batch_id = p_batch_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Batch ID % not found.', p_batch_id;
    END IF;

    v_days_left := EXTRACT(DAY FROM (v_expiry_date - CURRENT_TIMESTAMP));
    RETURN v_days_left;
END;
$$;

-- Test the function
-- SELECT get_remaining_shelf_life(1);

