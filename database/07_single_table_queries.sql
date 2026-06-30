-- ====================================================================
-- Script: DML Queries (Combines Requirements 6, 7, 8)
-- Includes Single-Table, Multi-Table, and Subqueries
-- ====================================================================

-- ---------------------------------------------------------
-- PART A: 10 Single-Table DML Queries (Req 6)
-- ---------------------------------------------------------
-- 1. Simple SELECT with WHERE
SELECT name, category FROM products WHERE shelf_life_days > 30;

-- 2. SELECT with IN and ORDER BY
SELECT name, location FROM stakeholders WHERE role_id IN (1, 2) ORDER BY name ASC;

-- 3. Aggregate Function with GROUP BY
SELECT category, AVG(shelf_life_days) as avg_shelf_life FROM products GROUP BY category;

-- 4. GROUP BY with HAVING clause
SELECT producer_id, COUNT(*) as batch_count FROM batches GROUP BY producer_id HAVING COUNT(*) >= 2;

-- 5. SELECT with BETWEEN for dates
SELECT batch_id, production_date FROM batches WHERE production_date BETWEEN '2026-05-01' AND '2026-05-10';

-- 6. SELECT with LIKE (Pattern Matching)
SELECT name, contact_email FROM stakeholders WHERE contact_email LIKE '%@greenvalley.bd%';

-- 7. UPDATE specific records
UPDATE shipments SET transit_status = 'Delayed' WHERE shipment_id = 2;

-- 8. DELETE with condition (Safe delete on alerts)
DELETE FROM system_alerts WHERE alert_type = 'ROUTING_ERROR';

-- 9. SELECT using IS NULL
SELECT shipment_id, dispatch_time FROM shipments WHERE arrival_time IS NULL;

-- 10. SELECT with DISTINCT
SELECT DISTINCT category FROM products;


-- ---------------------------------------------------------
