
-- ---------------------------------------------------------
-- PART B: 5 Multi-Table DML Queries (Joins) (Req 7)
-- ---------------------------------------------------------
-- 1. INNER JOIN: Get Batch details along with Product names.
SELECT b.batch_id, p.name AS product_name, b.production_date, b.current_status
FROM batches b INNER JOIN products p ON b.product_id = p.product_id;

-- 2. LEFT JOIN: Show all stakeholders and any shipments they sent (including those who haven't sent any).
SELECT s.name, sh.shipment_id, sh.dispatch_time
FROM stakeholders s LEFT JOIN shipments sh ON s.stakeholder_id = sh.sender_id;

-- 3. THREE-TABLE JOIN: Trace shipment custody (Sender -> Receiver).
SELECT sh.shipment_id, s1.name AS sender, s2.name AS receiver, sh.transit_status
FROM shipments sh
JOIN stakeholders s1 ON sh.sender_id = s1.stakeholder_id
JOIN stakeholders s2 ON sh.receiver_id = s2.stakeholder_id;

-- 4. RIGHT JOIN: List all roles and the stakeholders assigned to them.
SELECT sr.role_name, s.name
FROM stakeholders s RIGHT JOIN stakeholder_roles sr ON s.role_id = sr.role_id;

-- 5. COMPLEX JOIN: View safety inspections with product and inspector details.
SELECT si.inspection_id, p.name AS product, s.name AS inspector, si.recorded_temp, si.pass_fail
FROM safety_inspections si
JOIN batches b ON si.batch_id = b.batch_id
JOIN products p ON b.product_id = p.product_id
JOIN stakeholders s ON si.inspector_id = s.stakeholder_id;
