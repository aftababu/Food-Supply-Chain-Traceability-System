
CREATE OR REPLACE FUNCTION fn_days_to_expiry(p_batch_id INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    v_expiry DATE;
BEGIN
    SELECT expiryDate
    INTO v_expiry
    FROM productBatches
    WHERE id = p_batch_id;

    IF v_expiry IS NULL THEN
        RETURN NULL;
    END IF;

    RETURN (v_expiry - CURRENT_DATE);
END;
$$;


CREATE OR REPLACE FUNCTION trg_fn_auto_set_shipment_delivered()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.arrivalAt IS NOT NULL THEN
        NEW.status := 'Delivered';
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_auto_set_shipment_delivered
BEFORE INSERT OR UPDATE ON shipmentRecords
FOR EACH ROW
EXECUTE FUNCTION trg_fn_auto_set_shipment_delivered();



CREATE OR REPLACE PROCEDURE sp_update_batch_quantity(
    IN p_batch_id INT,
    IN p_new_quantity INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_initial INT;
BEGIN
    SELECT initialQuantity
    INTO v_initial
    FROM productBatches
    WHERE id = p_batch_id;

    IF v_initial IS NULL THEN
        RAISE EXCEPTION 'Batch % not found', p_batch_id;
    END IF;

    IF p_new_quantity <= 0 THEN
        RAISE EXCEPTION 'New quantity must be greater than zero';
    END IF;

    IF p_new_quantity > v_initial THEN
        RAISE EXCEPTION 'New quantity (%) cannot exceed initial quantity (%)',
            p_new_quantity, v_initial;
    END IF;

    UPDATE productBatches
    SET currentQuantity = p_new_quantity
    WHERE id = p_batch_id;
END;
$$;
