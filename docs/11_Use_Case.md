usecaseDiagram actor Farmer as "Farmer/Producer" actor Logistics as "Logistics Provider" actor Inspector as "Quality Inspector" actor Retailer as "Retailer"

```
package "Food Traceability System" {
    usecase UC1 as "Register Food Batch"
    usecase UC2 as "Dispatch Shipment"
    usecase UC3 as "Receive Shipment"
    usecase UC4 as "Record Safety Inspection"
    usecase UC5 as "View Traceability History"
    usecase UC6 as "Generate Alerts"
}

Farmer --> UC1
Farmer --> UC2
Logistics --> UC2
Logistics --> UC3
Retailer --> UC3
Retailer --> UC5
Inspector --> UC4
Inspector --> UC5

UC4 ..> UC6 : <<includes>>

```
