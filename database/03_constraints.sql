-- ====================================================================
-- Script: 03_constraints.sql
-- Description: Applies Foreign Keys, UNIQUE, and CHECK constraints.
-- ====================================================================

-- Foreign Keys
ALTER TABLE stakeholders ADD CONSTRAINT fk_stakeholder_role FOREIGN KEY (role_id) REFERENCES stakeholder_roles(role_id);
ALTER TABLE batches ADD CONSTRAINT fk_batch_product FOREIGN KEY (product_id) REFERENCES products(product_id);
ALTER TABLE batches ADD CONSTRAINT fk_batch_producer FOREIGN KEY (producer_id) REFERENCES stakeholders(stakeholder_id);
ALTER TABLE shipments ADD CONSTRAINT fk_shipment_batch FOREIGN KEY (batch_id) REFERENCES batches(batch_id);
ALTER TABLE shipments ADD CONSTRAINT fk_shipment_sender FOREIGN KEY (sender_id) REFERENCES stakeholders(stakeholder_id);
ALTER TABLE shipments ADD CONSTRAINT fk_shipment_receiver FOREIGN KEY (receiver_id) REFERENCES stakeholders(stakeholder_id);
ALTER TABLE safety_inspections ADD CONSTRAINT fk_inspection_batch FOREIGN KEY (batch_id) REFERENCES batches(batch_id);
ALTER TABLE safety_inspections ADD CONSTRAINT fk_inspection_inspector FOREIGN KEY (inspector_id) REFERENCES stakeholders(stakeholder_id);
ALTER TABLE system_alerts ADD CONSTRAINT fk_alert_batch FOREIGN KEY (batch_id) REFERENCES batches(batch_id);

-- Unique Constraints
ALTER TABLE stakeholder_roles ADD CONSTRAINT uq_role_name UNIQUE (role_name);
ALTER TABLE stakeholders ADD CONSTRAINT uq_contact_email UNIQUE (contact_email);

-- CHECK Constraints
ALTER TABLE products ADD CONSTRAINT chk_temp_range CHECK (ideal_temp_max > ideal_temp_min);
ALTER TABLE batches ADD CONSTRAINT chk_expiry_date CHECK (expiry_date > production_date);
ALTER TABLE batches ADD CONSTRAINT chk_batch_status CHECK (current_status IN ('At Producer', 'In Transit', 'At Retailer', 'Quarantined', 'Recalled', 'Sold'));
ALTER TABLE shipments ADD CONSTRAINT chk_arrival_time CHECK (arrival_time IS NULL OR arrival_time >= dispatch_time);
ALTER TABLE shipments ADD CONSTRAINT chk_transit_status CHECK (transit_status IN ('In Transit', 'Delivered', 'Delayed', 'Lost'));
ALTER TABLE safety_inspections ADD CONSTRAINT chk_pass_fail CHECK (pass_fail IN ('PASS', 'FAIL'));
