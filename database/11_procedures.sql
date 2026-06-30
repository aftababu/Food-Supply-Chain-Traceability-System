
-- ---------------------------------------------------------
-- 2. PROCEDURE: Record Shipment Arrival (Update Custody)
-- ---------------------------------------------------------
CREATE OR REPLACE PROCEDURE record_shipment_arrival(
    p_shipment_id INT,
    p_arrival_time TIMESTAMPTZ
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_batch_id INT;
BEGIN
    -- Update shipment record
    UPDATE shipments
    SET arrival_time = p_arrival_time, transit_status = 'Delivered'
    WHERE shipment_id = p_shipment_id
    RETURNING batch_id INTO v_batch_id;

    -- Automatically update batch status
    UPDATE batches
    SET current_status = 'At Receiver'
    WHERE batch_id = v_batch_id;

    COMMIT;
END;
$$;

-- Test the procedure
-- CALL record_shipment_arrival(2, '2026-05-15 10:00:00+06');


