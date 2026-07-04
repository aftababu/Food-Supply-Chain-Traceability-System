-- random data generate by deepseek
INSERT INTO userRoles (id, roleName) VALUES
(1, 'Administrator'),
(2, 'Quality Manager'),
(3, 'Production Supervisor'),
(4, 'Logistics Coordinator'),
(5, 'Warehouse Manager'),
(6, 'Safety Inspector'),
(7, 'Sales Representative'),
(8, 'Procurement Officer'),
(9, 'Compliance Officer'),
(10, 'System Admin');

INSERT INTO systemUsers (id, email, phoneNumber, roleId, organizationName, createdAt) VALUES
(1, 'rahim@pranfoods.com', '01711123456', 1, 'Pran Foods Ltd.', '2025-01-15 09:00:00'),
(2, 'karim@akijfood.com', '01811654321', 2, 'Akij Food & Beverage', '2025-01-16 09:30:00'),
(3, 'shahida@bracfoods.com', '01911789012', 3, 'BRAC Foods', '2025-02-01 10:00:00'),
(4, 'nurul@arong.com', '01712345678', 4, 'Arong Dairy', '2025-02-02 11:00:00'),
(5, 'sultana@kazi.com', '01812901234', 5, 'Kazi Farms', '2025-03-01 08:30:00'),
(6, 'kamal@freshbazar.com', '01912567890', 6, 'Fresh Bazar', '2025-03-02 09:00:00'),
(7, 'anjuman@meghna.com', '01713234567', 7, 'Meghna Group', '2025-04-01 10:30:00'),
(8, 'mizan@aciagro.com', '01813890123', 8, 'ACI Agro', '2025-04-02 11:30:00'),
(9, 'farhana@bracfoods.com', '01913456789', 9, 'BRAC Foods', '2025-05-01 09:15:00'),
(10, 'habib@pranfoods.com', '01714678901', 10, 'Pran Foods Ltd.', '2025-05-02 10:45:00');

INSERT INTO products (id, productName, productCategory, unitMeasure, totalLifeSpan, createdAt) VALUES
(1, 'Hilsa Fish', 'Seafood', 'kg', 7, '2025-01-01 00:00:00'),
(2, 'Cow Milk', 'Dairy', 'liters', 10, '2025-01-02 00:00:00'),
(3, 'Nakshi Bread', 'Bakery', 'loaf', 5, '2025-01-03 00:00:00'),
(4, 'Broiler Chicken', 'Meat', 'kg', 14, '2025-01-04 00:00:00'),
(5, 'Tomato Sauce', 'Canned Goods', 'can', 365, '2025-01-05 00:00:00'),
(6, 'Green Chili', 'Produce', 'kg', 5, '2025-01-06 00:00:00'),
(7, 'Ghee', 'Dairy', 'kg', 60, '2025-01-07 00:00:00'),
(8, 'Rohu Fish', 'Seafood', 'kg', 7, '2025-01-08 00:00:00'),
(9, 'Mustard Oil', 'Pantry', 'liters', 730, '2025-01-09 00:00:00'),
(10, 'Nazirshail Rice', 'Grains', 'kg', 365, '2025-01-10 00:00:00');

INSERT INTO locations (id, locationName, address, city, country, longitude, latitude) VALUES
(1, 'Chandpur Hilsa Dock', 'Ghat no. 3, Meghna River', 'Chandpur', 'Bangladesh', 90.650000, 23.220000),
(2, 'Dairy Processing Plant', 'Mymensingh Road', 'Sherpur', 'Bangladesh', 90.020000, 24.680000),
(3, 'Nakshi Bread Bakery', 'Eden Complex', 'Dhaka', 'Bangladesh', 90.410000, 23.810000),
(4, 'Kazi Poultry Farm', 'Bypass Road', 'Tangail', 'Bangladesh', 89.920000, 24.250000),
(5, 'Tomato Sauce Factory', 'Industrial Zone', 'Narsingdi', 'Bangladesh', 90.720000, 23.930000),
(6, 'Green Chili Farm', 'Bogra Shador', 'Bogra', 'Bangladesh', 89.370000, 24.840000),
(7, 'Ghee Production Unit', 'Shahjalal Road', 'Sylhet', 'Bangladesh', 91.870000, 24.900000),
(8, 'Rohu Fishery', 'Kaptai Lake', 'Rangamati', 'Bangladesh', 92.180000, 22.650000),
(9, 'Mustard Oil Mill', 'Rangpur Highway', 'Dinajpur', 'Bangladesh', 88.640000, 25.620000),
(10, 'Rice Mill Complex', 'Bhati Para', 'Rajshahi', 'Bangladesh', 88.600000, 24.370000);

INSERT INTO productBatches (id, code, productId, produceBy, produceDate, expiryDate, initialQuantity, currentQuantity, batchStatus, createdAt) VALUES
(1, 'BATCH-HIL-001', 1, 'Chandpur Hilsa Dock', '2025-06-01', '2025-06-08', 500, 480, 'Stored', '2025-06-01 08:00:00'),
(2, 'BATCH-MILK-002', 2, 'Dairy Processing Plant', '2025-06-05', '2025-06-15', 1200, 900, 'InTransit', '2025-06-05 10:00:00'),
(3, 'BATCH-BRAD-003', 3, 'Nakshi Bread Bakery', '2025-06-10', '2025-06-15', 300, 300, 'Created', '2025-06-10 06:00:00'),
(4, 'BATCH-CHIK-004', 4, 'Kazi Poultry Farm', '2025-06-12', '2025-06-26', 600, 550, 'Processing', '2025-06-12 07:30:00'),
(5, 'BATCH-SAUCE-005', 5, 'Tomato Sauce Factory', '2025-06-15', '2026-06-15', 800, 800, 'Delivered', '2025-06-15 09:00:00'),
(6, 'BATCH-CHILI-006', 6, 'Green Chili Farm', '2025-06-18', '2025-06-23', 200, 150, 'Sold', '2025-06-18 11:00:00'),
(7, 'BATCH-GHEE-007', 7, 'Ghee Production Unit', '2025-05-01', '2025-07-01', 250, 250, 'Stored', '2025-05-01 08:00:00'),
(8, 'BATCH-ROHU-008', 8, 'Rohu Fishery', '2025-06-20', '2025-06-27', 400, 400, 'InTransit', '2025-06-20 14:00:00'),
(9, 'BATCH-MUST-009', 9, 'Mustard Oil Mill', '2025-01-01', '2027-01-01', 600, 600, 'Created', '2025-01-01 09:00:00'),
(10, 'BATCH-RICE-010', 10, 'Rice Mill Complex', '2025-06-25', '2026-06-25', 1500, 1350, 'Processing', '2025-06-25 10:00:00');

INSERT INTO batchEvents (id, batchId, eventType, eventTime, fromLocationId, toLocationId, loggedBy) VALUES
(1, 1, 'Produced', '2025-06-01 08:15:00', NULL, 1, 1),
(2, 2, 'Moved', '2025-06-05 10:30:00', 2, 5, 2),
(3, 3, 'Baked', '2025-06-10 06:30:00', NULL, 3, 3),
(4, 4, 'Butchered', '2025-06-12 08:00:00', 4, 4, 4),
(5, 5, 'Canned', '2025-06-15 09:30:00', NULL, 5, 5),
(6, 6, 'Harvested', '2025-06-18 11:30:00', NULL, 6, 6),
(7, 7, 'Aged', '2025-06-01 08:00:00', NULL, 7, 7),
(8, 8, 'Processed', '2025-06-20 14:30:00', 8, 8, 8),
(9, 9, 'Pressed', '2025-01-01 09:30:00', NULL, 9, 9),
(10, 10, 'Milled', '2025-06-25 10:30:00', NULL, 10, 10);

INSERT INTO sensorReadings (id, batchId, locationId, readingTime, temperature, humidity, status, notes) VALUES
(1, 1, 1, '2025-06-01 09:00:00', 6.5, 85.0, 'Normal', 'Fish cold storage'),
(2, 2, 2, '2025-06-05 11:00:00', 4.0, 80.0, 'Normal', 'Milk chiller'),
(3, 3, 3, '2025-06-10 07:00:00', 28.0, 45.0, 'Normal', 'Bakery oven area'),
(4, 4, 4, '2025-06-12 08:30:00', 2.5, 72.0, 'Warning', 'Meat cooler slightly high'),
(5, 5, 5, '2025-06-15 10:00:00', 22.0, 55.0, 'Normal', 'Canning facility ambient'),
(6, 6, 6, '2025-06-18 12:00:00', 30.0, 65.0, 'Critical', 'Greenhouse too hot, chili at risk'),
(7, 7, 7, '2025-06-01 09:00:00', 12.0, 60.0, 'Normal', 'Ghee storage'),
(8, 8, 8, '2025-06-20 15:00:00', 5.0, 88.0, 'Normal', 'Rohu fish freezer'),
(9, 9, 9, '2025-01-01 10:00:00', 25.0, 45.0, 'Normal', 'Oil storage room'),
(10, 10, 10, '2025-06-25 11:00:00', 22.0, 50.0, 'Normal', 'Rice silo');

INSERT INTO safetyTests (id, batchId, testBy, testDate, result, contaminationLevel, remarks) VALUES
(1, 1, 'Rahim', '2025-06-02', 'Pass', 0.01, 'No heavy metals'),
(2, 2, 'Karim', '2025-06-06', 'Pass', 0.00, 'Pasteurization OK'),
(3, 3, 'Shahida', '2025-06-11', 'Pass', 0.02, 'Gluten free'),
(4, 4, 'Nurul', '2025-06-13', 'Fail', 8.20, 'Salmonella detected - rejected'),
(5, 5, 'Sultana', '2025-06-16', 'Pass', 0.00, 'Preservative levels OK'),
(6, 6, 'Kamal', '2025-06-19', 'Pass', 0.03, 'Low pesticide residue'),
(7, 7, 'Anjuman', '2025-06-02', 'Pass', 0.00, 'Aflatoxin free'),
(8, 8, 'Mizan', '2025-06-21', 'Pending', 0.00, 'Awaiting lab report'),
(9, 9, 'Farhana', '2025-01-02', 'Pass', 0.00, 'No contaminants'),
(10, 10, 'Habib', '2025-06-26', 'Pass', 0.04, 'Rice arsenic level safe');

INSERT INTO shipmentRecords (id, shipmentCode, fromLocationId, toLocationId, shippedBy, shippedAt, driverName, vehicleNumber, dispatchAt, arrivalAt, status) VALUES
(1, 'SHIP-BD-001', 1, 2, 1, '2025-06-02 09:00:00', 'Mizanur Rahman', 'DHA-KA-12-3456', '2025-06-02 09:30:00', '2025-06-02 14:00:00', 'Delivered'),
(2, 'SHIP-BD-002', 2, 5, 2, '2025-06-06 10:00:00', 'Kamal Hossain', 'CHA-KA-78-9012', '2025-06-06 10:15:00', '2025-06-06 16:30:00', 'Delivered'),
(3, 'SHIP-BD-003', 3, 1, 3, '2025-06-12 08:00:00', 'Shahidul Islam', 'RAJ-SA-34-5678', '2025-06-12 08:30:00', '2025-06-12 12:00:00', 'Delivered'),
(4, 'SHIP-BD-004', 4, 8, 4, '2025-06-14 07:00:00', 'Nadia Akhter', 'KHU-TA-56-7890', '2025-06-14 07:45:00', NULL, 'InTransit'),
(5, 'SHIP-BD-005', 5, 9, 5, '2025-06-17 11:00:00', 'Rafiq Mia', 'BAR-KU-90-1234', '2025-06-17 11:30:00', '2025-06-18 09:00:00', 'Delivered'),
(6, 'SHIP-BD-006', 6, 7, 6, '2025-06-19 13:00:00', 'Moshiur Rahman', 'DHA-KA-56-7890', '2025-06-19 13:15:00', NULL, 'Pending'),
(7, 'SHIP-BD-007', 7, 4, 7, '2025-06-03 10:00:00', 'Sirajul Islam', 'RAJ-SA-12-3456', '2025-06-03 10:30:00', '2025-06-03 16:00:00', 'Delivered'),
(8, 'SHIP-BD-008', 8, 6, 8, '2025-06-22 09:00:00', 'Laila Begum', 'KHU-TA-34-5678', '2025-06-22 09:30:00', NULL, 'Delayed'),
(9, 'SHIP-BD-009', 9, 10, 9, '2025-01-03 08:00:00', 'Abdul Khaleq', 'BAR-KU-78-9012', '2025-01-03 08:30:00', '2025-01-04 14:00:00', 'Delivered'),
(10, 'SHIP-BD-010', 10, 3, 10, '2025-06-26 10:00:00', 'Momena Akhter', 'DHA-KA-90-1234', '2025-06-26 10:15:00', NULL, 'InTransit');

INSERT INTO shipmentItemDetails (id, shipmentId, batchId, quantityShipped, quantityReceived, status) VALUES
(1, 1, 1, 150, 148, 'Short'),
(2, 2, 2, 250, 250, 'Received'),
(3, 3, 3, 80, 80, 'Received'),
(4, 4, 4, 100, NULL, 'Shipped'),
(5, 5, 5, 200, 200, 'Received'),
(6, 6, 6, 50, NULL, 'Packed'),
(7, 7, 7, 100, 100, 'Received'),
(8, 8, 8, 75, NULL, 'Damaged'),
(9, 9, 9, 150, 150, 'Received'),
(10, 10, 10, 300, NULL, 'Shipped');
