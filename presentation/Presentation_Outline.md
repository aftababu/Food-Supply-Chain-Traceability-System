Presentation Outline: Food Supply Chain Traceability

Slide 1: Title Slide

Project Title: Food Supply Chain Traceability and Safety Monitoring System

Group: 5

Course: CSE-2424 DBMS Lab (Spring-2026)

Slide 2: Problem Statement

Lack of transparency in the food supply chain.

Inability to pinpoint the source of foodborne illnesses quickly.

High rate of spoilage due to unmonitored cold-chain logistics.

Slide 3: Project Objectives

Design a fully normalized (3NF) relational database.

Implement end-to-end traceability for food batches.

Automate safety quarantine protocols using PostgreSQL triggers.

Slide 4: System Architecture (ER & DFD)

Visual: Embed ER Diagram and Level 0 DFD.

Highlight the core entities: Products, Batches, Stakeholders, Shipments, and Inspections.

Slide 5: Complex Engineering Problems Addressed

P3/P4 (Normalization): Eliminating transitive dependencies between locations, stakeholders, and shipments.

EA1 (Resource Range): Coordinating multi-stakeholder custody transfers logically.

Slide 6: Key Features (PL/pgSQL Demonstration)

Stored Procedure: record_shipment_arrival - Handles multi-table updates securely.

Trigger: trg_audit_safety_inspection - Instantly quarantines batches on 'FAIL' result and logs to system_alerts.

Slide 7: Conclusion & Future Scope

System successfully models real-world track-and-trace requirements.

Future scope includes IoT integration for real-time temperature updates and blockchain for immutable audit trails.

Slide 8: Q&A

Thank the audience.
