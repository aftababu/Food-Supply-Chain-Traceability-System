13. Data Dictionary

1. stakeholder_roles

Defines the categories of network participants.

role_id (INT, PK): Unique identifier for the role. (Generated Identity)

role_name (VARCHAR): Name of the role (e.g., Farmer, Retailer).

2. stakeholders

The physical entities handling the food.

stakeholder_id (INT, PK): Unique identifier.

name (VARCHAR): Company or person's name.

role_id (INT, FK): References stakeholder_roles.

location (VARCHAR): Physical address/city.

contact_email (VARCHAR): Unique email for communications.

3. products

The catalog of generic food items being traced.

product_id (INT, PK): Unique identifier.

name (VARCHAR): Name of the food item.

category (VARCHAR): Grouping (e.g., Dairy, Meat).

ideal_temp_min (DECIMAL): Minimum safe storage temperature.

ideal_temp_max (DECIMAL): Maximum safe storage temperature.

shelf_life_days (INT): Total days until expiry.

4. batches

The core traceability unit tracking a specific production run.

batch_id (INT, PK): Unique identifier.

product_id (INT, FK): References products.

producer_id (INT, FK): References stakeholders.

production_date (TIMESTAMPTZ): When the batch was created.

expiry_date (TIMESTAMPTZ): Calculated expiry date.

current_status (VARCHAR): Tracks the overall state (e.g., In Transit, Quarantined).

5. shipments

Tracks the chain of custody.

shipment_id (INT, PK): Unique identifier.

batch_id (INT, FK): References batches.

sender_id (INT, FK): References stakeholders sending the goods.

receiver_id (INT, FK): References stakeholders receiving the goods.

dispatch_time (TIMESTAMPTZ): Timestamp of departure.

arrival_time (TIMESTAMPTZ): Timestamp of delivery (Nullable).

transit_status (VARCHAR): e.g., In Transit, Delivered.

6. safety_inspections

Logs environmental parameters and manual checks.

inspection_id (INT, PK): Unique identifier.

batch_id (INT, FK): References batches.

inspector_id (INT, FK): References stakeholders.

inspection_time (TIMESTAMPTZ): When the check occurred.

recorded_temp (DECIMAL): Temperature at the time of inspection.

pass_fail (VARCHAR): 'PASS' or 'FAIL'.

remarks (TEXT): Inspector notes.

7. system_alerts

Automatically generated logs for violations.

alert_id (INT, PK): Unique identifier.

batch_id (INT, FK): References batches.

alert_type (VARCHAR): Category of alert.

alert_message (TEXT): Description of the violation.

created_at (TIMESTAMPTZ): Timestamp of alert generation.
