SELECT * FROM userRoles;


SELECT * FROM systemUsers WHERE organizationName = 'Pran Foods Ltd.';



SELECT * FROM products WHERE totalLifeSpan > 30;


SELECT * FROM productBatches WHERE batchStatus = 'InTransit';

SELECT * FROM locations WHERE city = 'Dhaka';


SELECT * FROM batchEvents ORDER BY  eventTime DESC;


SELECT * FROM sensorReadings WHERE status = 'Critical';


SELECT * FROM safetyTests WHERE result = 'Fail';

SELECT * FROM shipmentRecords WHERE status = 'Delayed';


SELECT * FROM shipmentItemDetails WHERE quantityReceived IS NOT NULL  AND quantityReceived < quantityShipped;
