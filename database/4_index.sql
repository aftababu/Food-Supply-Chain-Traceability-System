CREATE INDEX IF NOT EXISTS idx_productBatches_productId
ON productBatches(productId);

CREATE INDEX IF NOT EXISTS idx_productBatches_status
ON productBatches(batchStatus);

CREATE INDEX IF NOT EXISTS idx_batchEvents_batchId_eventTime
ON batchEvents(batchId, eventTime DESC);

CREATE INDEX IF NOT EXISTS idx_sensorReadings_batchId_readingTime
ON sensorReadings(batchId, readingTime DESC);

CREATE INDEX IF NOT EXISTS idx_safetyTests_batchId
ON safetyTests(batchId);

CREATE INDEX IF NOT EXISTS idx_shipmentRecords_status
ON shipmentRecords(status);

CREATE INDEX IF NOT EXISTS idx_shipmentItemDetails_shipmentId_batchId
ON shipmentItemDetails(shipmentId, batchId);
