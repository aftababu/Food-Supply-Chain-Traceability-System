5. Non-Functional Requirements

NFR-01: Performance

The database must utilize indexing on primary and foreign keys to ensure that multi-table JOINs (e.g., tracing a batch's complete history) execute efficiently.

NFR-02: Security & Integrity

The system must strictly enforce ACID (Atomicity, Consistency, Isolation, Durability) properties provided by PostgreSQL.

Stored procedures must be used for multi-table updates (e.g., receiving a shipment and updating batch status) to ensure atomicity.

NFR-03: Scalability

The schema must be designed using INT GENERATED ALWAYS AS IDENTITY to handle potentially millions of batch and shipment records without primary key exhaustion.

NFR-04: Reliability

The database schema must prevent orphaned records by using FOREIGN KEY constraints.

Business logic must reside at the database level using CHECK constraints (e.g., preventing a shipment's arrival time from predating its dispatch time) to guarantee data reliability regardless of the application layer.

NFR-05: Usability

Table and column names must follow clear, lowercase, underscore-separated naming conventions (snake_case) to ensure standard SQL querying usability.
