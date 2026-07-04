SELECT id, code, currentQuantity FROM productBatches
WHERE currentQuantity < (
    SELECT AVG(currentQuantity)
    FROM productBatches
);

SELECT id, productName, totalLifeSpan FROM products
WHERE totalLifeSpan > (
    SELECT MIN(totalLifeSpan)
    FROM products
);


SELECT id, code, batchStatus FROM productBatches
WHERE id IN (
    SELECT batchId
    FROM shipmentItemDetails
);

SELECT id, productName FROM products
WHERE id NOT IN (
    SELECT productId
    FROM productBatches
);



SELECT sr.id, sr.shipmentCode, sr.status FROM shipmentRecords sr
WHERE EXISTS (
    SELECT 1
    FROM shipmentItemDetails sid
    WHERE sid.shipmentId = sr.id
);




SELECT id, batchId, temperature, status FROM sensorReadings
WHERE temperature > ANY (
    SELECT temperature
    FROM sensorReadings
    WHERE status = 'Critical'
);

