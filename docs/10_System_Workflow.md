stateDiagram-v2

$$\*$$

--> At_Producer : Batch Registered At_Producer --> In_Transit : Shipment Dispatched In_Transit --> At_Receiver : Shipment Arrived At_Receiver --> At_Retailer : Distributed to Retail At_Retailer --> Sold : Purchased by Consumer

state Safety_Check <<choice>>
In_Transit --> Safety_Check : Inspection Occurs
Safety_Check --> In_Transit : PASS
Safety_Check --> Quarantined : FAIL (Trigger Alert)

At_Receiver --> Safety_Check : Inspection Occurs

Quarantined --> Recalled : Investigation Failed
Quarantined --> At_Receiver : Cleared after Review

Sold --> [*]
Recalled --> [*]
