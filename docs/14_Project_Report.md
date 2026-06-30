# Final Project Report: Food Supply Chain Traceability

## 1. System Design & Conceptual Model (P1, P3, P4)

The system addresses the complex engineering problem of mapping physical food supply chain events to a digital ledger. It captures stakeholder interactions, custody transfers (shipments), and environmental conditions (safety inspections).

### Entity Relationship Diagram

```
erDiagram
    STAKEHOLDER_ROLES ||--o{ STAKEHOLDERS : "categorizes"
    STAKEHOLDERS ||--o{ BATCHES : "produces"
    PRODUCTS ||--o{ BATCHES : "defines"
    BATCHES ||--o{ SHIPMENTS : "transported_in"
    STAKEHOLDERS ||--o{ SHIPMENTS : "sends/receives"
    BATCHES ||--o{ SAFETY_INSPECTIONS : "undergoes"
    STAKEHOLDERS ||--o{ SAFETY_INSPECTIONS : "conducts"

    PRODUCTS {
        int product_id PK
        string name
        float ideal_temp_min
        float ideal_temp_max
    }
    BATCHES {
        int batch_id PK
        int product_id FK
        date production_date
        string status
    }
```

## 2. Normalization (P3, P4)

The schema strictly adheres to the **Third Normal Form (3NF)**:

- **1NF:** All attributes are atomic. No multi-valued attributes exist (e.g., separating roles into a distinct table rather than a comma-separated list).

- **2NF:** All non-key attributes are fully functionally dependent on the primary key. (e.g., `Product Name` is in the `products` table, not duplicated in `batches`).

- **3NF:** No transitive dependencies. (e.g., Stakeholder location depends on `stakeholder_id`, not on the `shipment_id`).

## 3. Engineering Activities Justification (EA1, EA5)

- **EA1 (Range of Resources):** The project coordinates multiple entities (human roles, storage environments, transit systems) enforcing logical constraints (e.g., a shipment cannot arrive before it is dispatched).

- **EA5 (Familiarity):** Applying relational normalization and transaction control (triggers/procedures) to the evolving context of food safety and cold-chain monitoring.
