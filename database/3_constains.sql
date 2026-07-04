ALTER TABLE systemUsers ADD CONSTRAINT
 foreign_systemUsers FOREIGN KEY (roleId) REFERENCES userRoles(id);

ALTER TABLE productBatches ADD CONSTRAINT foreign_productBatches
FOREIGN KEY (productId) REFERENCES products(id);

ALTER TABLE batchEvents ADD CONSTRAINT foreign_batchEvents_batchId
FOREIGN KEY (batchId) REFERENCES productBatches(id);

ALTER TABLE batchEvents
ADD CONSTRAINT foreign_batchEvents_fromLocationId FOREIGN KEY (fromLocationId) REFERENCES locations(id);

ALTER TABLE batchEvents ADD CONSTRAINT foreign_batchEvents_toLocationId
FOREIGN KEY (toLocationId) REFERENCES locations(id);

ALTER TABLE batchEvents
ADD CONSTRAINT foreign_batchEvents_loggedBy FOREIGN KEY (loggedBy) REFERENCES systemUsers(id);

ALTER TABLE sensorReadings
ADD CONSTRAINT foreign_sensorReadings_batchId FOREIGN KEY (batchId) REFERENCES productBatches(id);

ALTER TABLE sensorReadings ADD CONSTRAINT
 foreign_sensorReadings_locationId FOREIGN KEY (locationId) REFERENCES locations(id);

ALTER TABLE safetyTests ADD CONSTRAINT
foreign_safetyTests FOREIGN KEY (batchId) REFERENCES productBatches(id);

ALTER TABLE shipmentRecords ADD CONSTRAINT
 foreign_shipmentRecords_fromLocationId FOREIGN KEY (fromLocationId) REFERENCES locations(id);

ALTER TABLE shipmentRecords ADD CONSTRAINT
 foreign_shipmentRecords_toLocationId FOREIGN KEY (toLocationId) REFERENCES locations(id);

ALTER TABLE shipmentRecords ADD CONSTRAINT
 foreign_shipmentRecords_shippedBy FOREIGN KEY (shippedBy) REFERENCES systemUsers(id);

ALTER TABLE shipmentItemDetails ADD CONSTRAINT foreign_shipmentItemDetails_shipmentId FOREIGN KEY (shipmentId) REFERENCES shipmentRecords(id);

ALTER TABLE shipmentItemDetails ADD CONSTRAINT foreign_shipmentItemDetails_batchId
FOREIGN KEY (batchId) REFERENCES productBatches(id);






ALTER TABLE productBatches ADD CONSTRAINT productBatches_quantity
CHECK (currentQuantity <= initialQuantity);

ALTER TABLE productBatches ADD CONSTRAINT productBatches_dates
CHECK (expiryDate > produceDate);



ALTER TABLE shipmentRecords
ADD CONSTRAINT shipmentRecords_arrive_dispatch
CHECK (arrivalAt IS NULL OR  arrivalAt >= dispatchAt);

ALTER TABLE shipmentItemDetails
ADD CONSTRAINT detail_quantity
CHECK (quantityReceived IS NULL OR quantityReceived <= quantityShipped);
