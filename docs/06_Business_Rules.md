6. Business Rules

The following business rules are actively enforced at the database level using constraints and PL/pgSQL logic:

BR-01 (Role Exclusivity): A stakeholder role name must be strictly unique. No duplicate roles can exist. (Enforced via UNIQUE constraint).

BR-02 (Temperature Logic): For any registered product, the defined maximum ideal temperature must be strictly greater than the minimum ideal temperature. (Enforced via CHECK constraint).

BR-03 (Chronological Lifecycle): A food batch's expiration date must always be later than its production date. (Enforced via CHECK constraint).

BR-04 (Chronological Transit): If a shipment has arrived, its arrival time must be equal to or greater than its dispatch time. (Enforced via CHECK constraint).

BR-05 (Valid Batch States): A batch can only exist in one of the following states: 'At Producer', 'In Transit', 'At Retailer', 'Quarantined', 'Recalled', or 'Sold'. (Enforced via CHECK constraint).

BR-06 (Inspection Binary): A safety inspection can only have a pass/fail status of 'PASS' or 'FAIL'. (Enforced via CHECK constraint).

BR-07 (Automated Quarantine): Any batch receiving a 'FAIL' inspection status is immediately and automatically transitioned to a 'Quarantined' state. (Enforced via PostgreSQL AFTER INSERT Trigger).
