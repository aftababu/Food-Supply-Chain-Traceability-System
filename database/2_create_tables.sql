

CREATE TABLE IF NOT EXISTS userRoles (
    id INT PRIMARY KEY,
    roleName VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS systemUsers (
    id INT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    phoneNumber VARCHAR(15) NOT NULL,
    roleId INT NOT NULL,
    organizationName VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP


);

CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    productCategory VARCHAR(50) NOT NULL,
    unitMeasure VARCHAR(20) NOT NULL,
    totalLifeSpan INT NOT NULL CHECK (totalLifeSpan > 0),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);


CREATE TYPE batch_status AS ENUM (
    'Created', 'Processing', 'InTransit', 'Stored', 'Delivered', 'Sold', 'Rejected'
);
CREATE TABLE IF NOT EXISTS productBatches (

    id INT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    productId INT NOT NULL,
    produceBy VARCHAR(100) NOT NULL,
    produceDate DATE NOT NULL,
    expiryDate DATE NOT NULL,
    initialQuantity INT NOT NULL CHECK (initialQuantity > 0),
    currentQuantity INT NOT NULL CHECK (currentQuantity > 0),
    batchStatus batch_status NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE IF NOT EXISTS locations (

    id INT PRIMARY KEY,
    locationName VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL
);

CREATE TABLE IF NOT EXISTS batchEvents (
    id INT PRIMARY KEY,
    batchId INT NOT NULL,
    eventType VARCHAR(50) NOT NULL,
    eventTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fromLocationId INT,
    toLocationId INT,
    loggedBy INT NOT NULL

);

CREATE TYPE sensor_status AS ENUM (
    'Normal', 'Warning', 'Critical'
);

CREATE TABLE IF NOT EXISTS sensorReadings (
    id INT PRIMARY KEY,
    batchId INT NOT NULL,
    locationId INT NOT NULL,
    readingTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    temperature DECIMAL(5,2) NOT NULL CHECK (temperature > 0 AND temperature <= 60),
    humidity DECIMAL(5,2) NOT NULL CHECK (humidity >= 0 AND humidity <= 100),
    status sensor_status NOT NULL,
    notes VARCHAR(255)
);

CREATE TYPE test_result AS ENUM (
    'Pass', 'Fail', 'Pending'
);








CREATE TABLE IF NOT EXISTS safetyTests (

    id INT PRIMARY KEY,
    batchId INT NOT NULL,
    testBy VARCHAR(100) NOT NULL,
    testDate DATE NOT NULL,
    result test_result NOT NULL,
    contaminationLevel DECIMAL(5,2) NOT NULL CHECK (contaminationLevel >= 0),
    remarks VARCHAR(255)
);

CREATE TYPE shipment_status AS ENUM (
    'Pending', 'InTransit', 'Delivered', 'Delayed', 'Cancelled'
);

CREATE TABLE IF NOT EXISTS shipmentRecords (
    id INT PRIMARY KEY,
    shipmentCode VARCHAR(50) NOT NULL UNIQUE,
    fromLocationId INT NOT NULL,
    toLocationId INT NOT NULL,
    shippedBy INT NOT NULL,
    shippedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    driverName VARCHAR(100) NOT NULL,
    vehicleNumber VARCHAR(20) NOT NULL,
    dispatchAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    arrivalAt TIMESTAMP,
    status shipment_status NOT NULL

);


CREATE TYPE shipment_item_status AS ENUM (
    'Packed', 'Shipped', 'Received', 'Damaged', 'Short'
);
CREATE TABLE IF NOT EXISTS shipmentItemDetails (
    id INT PRIMARY KEY,
    shipmentId INT NOT NULL,
    batchId INT NOT NULL,
    quantityShipped INT NOT NULL CHECK (quantityShipped > 0),
    quantityReceived INT CHECK (quantityReceived IS NULL OR quantityReceived > 0),
    status shipment_item_status NOT NULL

);








