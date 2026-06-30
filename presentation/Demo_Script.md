Live Demonstration Script

1. Introduction (1 min)

"Hello everyone, we are Group 5. Today we present our Food Supply Chain Traceability system. We built this on PostgreSQL 16 to solve the problem of food spoilage and lack of transparency in supply networks."

2. Schema Walkthrough (1 min)

"Here in pgAdmin, you can see our 7 normalized tables. Notice that Stakeholders are separated from Stakeholder_Roles to achieve 1NF, and all shipment custody logs depend entirely on Shipment_ID, achieving 3NF."

3. Data Queries Demo (2 mins)

"Let's look at the data. (Execute a JOIN query) This Multi-Table query shows exactly who handled Batch #4, from the Sender to the Receiver, tracing the chain of custody."

4. PL/pgSQL Trigger Demo (2 mins) - CRITICAL STEP

"The most advanced feature is our automated safety protocol. Let's look at Batch #3. It is currently 'At Producer'. (Show Batch 3 status). Now, I will simulate a Quality Inspector entering a failed temperature check for this batch. (Execute INSERT into safety_inspections with 'FAIL'). Because of our PL/pgSQL BEFORE Trigger, if we check Batch #3 again, its status is instantly updated to 'Quarantined', and a warning is logged in the system_alerts table. This prevents unsafe food from continuing down the supply chain."

5. Conclusion (1 min)

"This concludes our demo. Our system handles data integrity, automated security rules, and complex relational tracking. Thank you."
