# 9. Normalization Process

This project tackles Complex Engineering Problem attributes **P3 (Depth of analysis required)** and **P4 (Familiarity of issues)** by transforming raw supply chain data into a Third Normal Form (3NF) relational schema.

## Unnormalized Form (UNF)

_Imagine a raw spreadsheet containing:_ `Batch_ID, Product_Name, Category, Min_Temp, Max_Temp, Producer_Name, Producer_Location, Dispatch_Time, Arrival_Time, Receiver_Name` **Issues:** Severe data redundancy. If a producer changes their location, multiple rows must be updated. Multi-valued logic makes querying impossible.

## First Normal Form (1NF)

**Rule:** All attributes must be atomic (indivisible). No repeating groups.

- **Action:** We ensure every cell holds a single value. A batch cannot have a list of shipment receivers in one cell.

- **Result:** We separate the transit data into distinct rows.

## Second Normal Form (2NF)

**Rule:** Must be in 1NF. All non-key attributes must be fully functionally dependent on the primary key.

- **Action:** In UNF, `Product_Name` and `Min_Temp` depend on the Product, not the specific `Batch_ID`.

- **Result:** We create a separate `Products` table. The `Batches` table now only holds a `product_id` (Foreign Key).

## Third Normal Form (3NF)

**Rule:** Must be in 2NF. No transitive dependencies (non-key attributes depending on other non-key attributes).

- **Action:** In our initial stakeholder mapping, a stakeholder's role (e.g., "Farmer") is a string. If we want to rename "Farmer" to "Agricultural Producer", we'd have to update every stakeholder row. The string "Farmer" depends on the concept of the role, not the specific stakeholder.

- **Result:** We create a `Stakeholder_Roles` table. The `Stakeholders` table now references `role_id`. Furthermore, shipment custody relies entirely on `shipment_id`, separating transit logistics from static batch data.

**Final 3NF Schema:** The resulting structure (`stakeholder_roles`, `stakeholders`, `products`, `batches`, `shipments`, `safety_inspections`, `system_alerts`) is completely free of transitive dependencies and update anomalies.
