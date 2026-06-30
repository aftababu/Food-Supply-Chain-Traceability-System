erDiagram STAKEHOLDER_ROLES { int role_id PK varchar role_name } STAKEHOLDERS { int stakeholder_id PK varchar name int role_id FK } PRODUCTS { int product_id PK varchar name decimal ideal_temp_min } BATCHES { int batch_id PK int product_id FK int producer_id FK timestamp expiry_date } SHIPMENTS { int shipment_id PK int batch_id FK int sender_id FK int receiver_id FK varchar transit_status } SAFETY_INSPECTIONS { int inspection_id PK int batch_id FK int inspector_id FK varchar pass_fail } SYSTEM_ALERTS { int alert_id PK int batch_id FK varchar alert_type }

STAKEHOLDER_ROLES ||--o{ STAKEHOLDERS : "1:N"
STAKEHOLDERS ||--o{ BATCHES : "1:N"
PRODUCTS ||--o{ BATCHES : "1:N"
BATCHES ||--o{ SHIPMENTS : "1:N"
STAKEHOLDERS ||--o{ SHIPMENTS : "1:N (sender)"
STAKEHOLDERS ||--o{ SHIPMENTS : "1:N (receiver)"
BATCHES ||--o{ SAFETY_INSPECTIONS : "1:N"
STAKEHOLDERS ||--o{ SAFETY_INSPECTIONS : "1:N"
BATCHES ||--o{ SYSTEM_ALERTS : "1:N"
