# Appendix C: Project Assumptions

To bound the scope of the project and ensure logical consistency within the database, the following assumptions were made during the design phase:

1. **Honest Actor Assumption:** The database assumes that the data inserted by Quality Inspectors into the `safety_inspections` table is accurate and truthful. Fraud detection algorithms are beyond the current database scope.

2. **Timezone Standardization:** All timestamps (`TIMESTAMPTZ`) are assumed to be recorded in a unified timezone format (UTC/Local offset) handled natively by PostgreSQL, mitigating issues when shipments cross international timezones.

3. **Linear Custody:** It is assumed that a batch cannot be split into multiple smaller shipments in this baseline version. One batch equates to one distinct unit transported in a shipment. (To handle split batches, an additional mapping table would be required in a future iteration).

4. **Permanent Quarantine:** Once a batch is marked as 'Quarantined' by the automated trigger, it requires manual administrative intervention (via `UPDATE` queries) to be cleared. The system does not automatically un-quarantine items.
