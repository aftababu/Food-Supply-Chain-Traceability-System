-- ====================================================================
-- Script: 06_insert_data.sql
-- Description: Inserts exactly 10 sample rows per relation.
-- ====================================================================

-- 1. stakeholder_roles
INSERT INTO stakeholder_roles (role_name) VALUES
('Farmer'), ('Processor'), ('Distributor'), ('Wholesaler'), ('Retailer'),
('Quality Inspector'), ('Logistics Provider'), ('Customs Broker'), ('Warehouse Manager'), ('Consumer');

-- 2. stakeholders
INSERT INTO stakeholders (name, role_id, location, contact_email) VALUES
('Green Valley Farms', 1, 'Dhaka, BD', 'contact@greenvalley.bd'),
('AgriCorp Produce', 1, 'Rajshahi, BD', 'info@agricorp.bd'),
('Fresh Meat Packers', 2, 'Chittagong, BD', 'meat@freshpack.bd'),
('ColdChain Logistics', 7, 'Dhaka, BD', 'dispatch@coldchain.bd'),
('National Foods', 4, 'Sylhet, BD', 'wholesale@natfoods.bd'),
('MegaMart Retail', 5, 'Khulna, BD', 'store1@megamart.bd'),
('BD Quality Assurance', 6, 'Dhaka, BD', 'inspector1@bdqa.bd'),
('Port Authority Storage', 9, 'Chittagong, BD', 'storage@port.bd'),
('Daily Fresh Grocery', 5, 'Comilla, BD', 'hello@dailyfresh.bd'),
('Rapid Transit Bros', 7, 'Bogra, BD', 'freight@rapidtransit.bd');

-- 3. products
INSERT INTO products (name, category, ideal_temp_min, ideal_temp_max, shelf_life_days) VALUES
('Organic Milk', 'Dairy', 2.00, 4.00, 14),
('Fresh Beef', 'Meat', -1.00, 3.00, 10),
('Alphonso Mangoes', 'Produce', 10.00, 15.00, 20),
('Frozen Salmon', 'Seafood', -20.00, -15.00, 180),
('Cheddar Cheese', 'Dairy', 4.00, 8.00, 120),
('Ice Cream', 'Frozen', -25.00, -18.00, 365),
('Leafy Greens', 'Produce', 1.00, 5.00, 7),
('Tomatoes', 'Produce', 12.00, 15.00, 14),
('Chicken Breast', 'Meat', 0.00, 4.00, 7),
('Yogurt', 'Dairy', 2.00, 6.00, 30);

-- 4. batches
INSERT INTO batches (product_id, producer_id, production_date, expiry_date, current_status) VALUES
(1, 1, '2026-05-01 08:00:00+06', '2026-05-15 08:00:00+06', 'Delivered'),
(2, 3, '2026-05-02 09:00:00+06', '2026-05-12 09:00:00+06', 'In Transit'),
(3, 2, '2026-05-05 07:00:00+06', '2026-05-25 07:00:00+06', 'At Producer'),
(4, 3, '2026-01-10 10:00:00+06', '2026-07-09 10:00:00+06', 'At Retailer'),
(5, 1, '2026-04-01 11:00:00+06', '2026-07-30 11:00:00+06', 'At Retailer'),
(6, 1, '2026-05-10 08:00:00+06', '2027-05-10 08:00:00+06', 'In Transit'),
(7, 2, '2026-05-12 06:00:00+06', '2026-05-19 06:00:00+06', 'Delivered'),
(8, 2, '2026-05-11 07:30:00+06', '2026-05-25 07:30:00+06', 'At Retailer'),
(9, 3, '2026-05-14 14:00:00+06', '2026-05-21 14:00:00+06', 'At Producer'),
(10, 1, '2026-05-13 12:00:00+06', '2026-06-12 12:00:00+06', 'In Transit');

-- 5. shipments
INSERT INTO shipments (batch_id, sender_id, receiver_id, dispatch_time, arrival_time, transit_status) VALUES
(1, 1, 6, '2026-05-01 10:00:00+06', '2026-05-02 14:00:00+06', 'Delivered'),
(2, 3, 5, '2026-05-03 08:00:00+06', NULL, 'In Transit'),
(4, 3, 8, '2026-01-12 09:00:00+06', '2026-01-13 18:00:00+06', 'Delivered'),
(4, 8, 6, '2026-02-01 08:00:00+06', '2026-02-02 10:00:00+06', 'Delivered'),
(5, 1, 9, '2026-04-05 11:00:00+06', '2026-04-06 12:00:00+06', 'Delivered'),
(6, 1, 4, '2026-05-11 09:00:00+06', NULL, 'In Transit'),
(7, 2, 6, '2026-05-12 10:00:00+06', '2026-05-13 06:00:00+06', 'Delivered'),
(8, 2, 9, '2026-05-11 12:00:00+06', '2026-05-12 15:00:00+06', 'Delivered'),
(10, 1, 5, '2026-05-14 08:00:00+06', NULL, 'In Transit'),
(1, 5, 9, '2026-05-02 16:00:00+06', '2026-05-03 09:00:00+06', 'Delivered');

-- 6. safety_inspections
INSERT INTO safety_inspections (batch_id, inspector_id, recorded_temp, pass_fail, remarks) VALUES
(1, 7, 3.50, 'PASS', 'Temp normal at origin.'),
(1, 7, 4.10, 'FAIL', 'Slight temp elevation during transit.'),
(2, 7, 1.00, 'PASS', 'Meat frozen properly.'),
(3, 7, 12.00, 'PASS', 'Mangoes ripening nicely.'),
(4, 7, -18.50, 'PASS', 'Salmon frozen solid.'),
(5, 7, 6.00, 'PASS', 'Cheese stored optimally.'),
(6, 7, -10.00, 'FAIL', 'Ice cream freezer malfunction detected.'),
(7, 7, 3.00, 'PASS', 'Greens crisp and fresh.'),
(8, 7, 14.00, 'PASS', 'Tomatoes at ambient target.'),
(9, 7, 2.00, 'PASS', 'Chicken temp verified.');

-- 7. system_alerts (Simulating past alerts)
INSERT INTO system_alerts (batch_id, alert_type, alert_message) VALUES
(1, 'TEMPERATURE_WARNING', 'Batch 1 temp exceeded safe limits.'),
(6, 'TEMPERATURE_CRITICAL', 'Batch 6 ice cream thawing hazard.'),
(4, 'EXPIRY_WARNING', 'Batch 4 approaching shelf life end.'),
(2, 'TRANSIT_DELAY', 'Shipment delayed due to traffic.'),
(3, 'INSPECTION_MISSED', 'Routine check missed at producer.'),
(7, 'EXPIRY_WARNING', 'Leafy greens expire in 2 days.'),
(8, 'QUALITY_HOLD', 'Tomatoes held for color check.'),
(10, 'ROUTING_ERROR', 'Yogurt sent to wrong hub.'),
(5, 'TEMPERATURE_WARNING', 'Cheese temp hit 8.00C.'),
(9, 'CUSTOMS_HOLD', 'Export documents pending.');
