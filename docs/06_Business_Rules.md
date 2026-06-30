# 6. Business Rules

The following business rules are actively enforced at the database level using constraints and PL/pgSQL logic:

1. **BR-01 (Role Exclusivity):** A stakeholder role name must be strictly unique. No duplicate roles can exist. _(Enforced via UNIQUE constraint)._

2. **BR-02 (Temperature Logic):** For any registered product, the defined maximum ideal temperature must be strictly greater than the minimum ideal temperature. _(Enforced via CHECK constraint)._

3. **BR-03 (Chronological Lifecycle):** A food batch's expiration date must always be later than its production date. _(Enforced via CHECK constraint)._

4. **BR-04 (Chronological Transit):** If a shipment has arrived, its arrival time must be equal to or greater than its dispatch time. _(Enforced via CHECK constraint)._

5. **BR-05 (Valid Batch States):** A batch can only exist in one of the following states: 'At Producer', 'In Transit', 'At Retailer', 'Quarantined', 'Recalled', or 'Sold'. _(Enforced via CHECK constraint)._

6. **BR-06 (Inspection Binary):** A safety inspection can only have a pass/fail status of 'PASS' or 'FAIL'. _(Enforced via CHECK constraint)._

7. **BR-07 (Automated Quarantine):** Any batch receiving a 'FAIL' inspection status is immediately and automatically transitioned to a 'Quarantined' state. _(Enforced via PostgreSQL AFTER INSERT Trigger)._
