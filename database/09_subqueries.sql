-- PART C: Subqueries (Req 8)
-- ---------------------------------------------------------
-- 1. SCALAR Subquery: Find products with shelf life greater than the average.
SELECT name, shelf_life_days FROM products
WHERE shelf_life_days > (SELECT AVG(shelf_life_days) FROM products);

-- 2. MULTIPLE-ROW Subquery (IN): Find stakeholders who produce 'Dairy'.
SELECT name, location FROM stakeholders
WHERE stakeholder_id IN (
    SELECT producer_id FROM batches
    WHERE product_id IN (SELECT product_id FROM products WHERE category = 'Dairy')
);

-- 3. CORRELATED Subquery: Find the latest shipment for each batch.
SELECT batch_id, shipment_id, dispatch_time FROM shipments s1
WHERE dispatch_time = (
    SELECT MAX(dispatch_time) FROM shipments s2 WHERE s1.batch_id = s2.batch_id
);

-- 4. EXISTS Subquery: Find stakeholders who have conducted at least one safety inspection.
SELECT name FROM stakeholders s
WHERE EXISTS (
    SELECT 1 FROM safety_inspections si WHERE si.inspector_id = s.stakeholder_id
);

-- 5. ANY Subquery: Find batches produced earlier than ANY batch of product_id 1.
SELECT batch_id, production_date FROM batches
WHERE production_date < ANY (SELECT production_date FROM batches WHERE product_id = 1);
