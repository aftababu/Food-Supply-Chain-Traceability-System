4. Functional Requirements

FR-01: Stakeholder Registration The system must allow the categorization of stakeholders (e.g., Farmer, Retailer) and record their contact details and physical location.

FR-02: Product Cataloging The system must maintain a catalog of food products defining their critical safety parameters, specifically minimum/maximum storage temperatures and shelf life.

FR-03: Batch Generation Producers must be able to register new batches of food. The system must automatically enforce that the expiration date is logically set after the production date.

FR-04: Shipment & Custody Transfer The system must record the transfer of a batch from a Sender to a Receiver. It must log the exact dispatch time and allow updates for the arrival time.

FR-05: Safety Inspections Quality Inspectors must be able to log temperature checks against specific batches in transit or storage.

FR-06: Automated Quarantining (Trigger) If a safety inspection is recorded as a 'FAIL' (e.g., temperature outside safe parameters), the system must automatically update the affected batch's status to 'Quarantined'.

FR-07: Automated Alerting (Trigger) The system must automatically generate a record in the system_alerts table whenever a safety violation occurs.
