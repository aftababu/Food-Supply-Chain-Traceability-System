-- ====================================================================
-- Script: 02_create_tables.sql
-- Description: Defines the 3NF schema using IDENTITY columns.
-- ====================================================================

CREATE TABLE stakeholder_roles (
    role_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE stakeholders (
    stakeholder_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role_id INT NOT NULL,
    location VARCHAR(255) NOT NULL,
    contact_email VARCHAR(100) NOT NULL,
    join_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    ideal_temp_min DECIMAL(5,2) NOT NULL,
    ideal_temp_max DECIMAL(5,2) NOT NULL,
    shelf_life_days INT NOT NULL
);

CREATE TABLE batches (
    batch_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_id INT NOT NULL,
    producer_id INT NOT NULL,
    production_date TIMESTAMPTZ NOT NULL,
    expiry_date TIMESTAMPTZ NOT NULL,
    current_status VARCHAR(50) DEFAULT 'At Producer' NOT NULL
);

CREATE TABLE shipments (
    shipment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    batch_id INT NOT NULL,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    dispatch_time TIMESTAMPTZ NOT NULL,
    arrival_time TIMESTAMPTZ,
    transit_status VARCHAR(50) DEFAULT 'In Transit' NOT NULL
);

CREATE TABLE safety_inspections (
    inspection_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    batch_id INT NOT NULL,
    inspector_id INT NOT NULL,
    inspection_time TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    recorded_temp DECIMAL(5,2) NOT NULL,
    pass_fail VARCHAR(10) NOT NULL,
    remarks TEXT
);

CREATE TABLE system_alerts (
    alert_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    batch_id INT NOT NULL,
    alert_type VARCHAR(100) NOT NULL,
    alert_message TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
