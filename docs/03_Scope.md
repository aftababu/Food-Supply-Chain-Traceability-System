# 3. Project Scope

## 3.1. In-Scope Boundaries

The Food Supply Chain Traceability System will encompass:

1. **Stakeholder Management:** Categorization and recording of all participants (Farmers, Logistics, Retailers, Inspectors).

2. **Product & Batch Tracking:** Defining core product parameters (safe temperatures, shelf life) and tracking individual production runs (batches).

3. **Logistics & Custody:** Recording the dispatch and arrival of shipments between stakeholders.

4. **Safety & Compliance Monitoring:** Logging environmental inspections and automatically triggering alerts/status changes if parameters are breached.

## 3.2. Out-of-Scope (Limitations)

1. **Financial Transactions:** The system tracks physical custody and safety, not financial billing, payments, or ledger accounting between stakeholders.

2. **Physical IoT Integration:** While the system models temperature data, it does not physically connect to hardware IoT sensors. Sensor data is simulated via SQL `INSERT` statements by Quality Inspectors.

3. **End-Consumer Interface:** The current scope ends at the "Retailer" stage; it does not include a mobile app for end-consumers to scan QR codes (though the database supports this future capability).

## 3.3. Future Scope

- Integration with blockchain networks for immutable, decentralized auditing.

- Integration with live IoT temperature sensors for real-time automated data entry via REST APIs.
