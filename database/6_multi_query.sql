SELECT
    pb.id AS batchId,
    pb.code AS batchCode,
    p.productName,
    p.productCategory,
    pb.batchStatus,
    pb.produceDate,
    pb.expiryDate
FROM productBatches pb
JOIN products p ON pb.productId = p.id;

SELECT
    be.id AS eventId,
    be.batchId,
    be.eventType,
    be.eventTime,
    lf.locationName AS fromLocation,
    lt.locationName AS toLocation
FROM batchEvents be
LEFT JOIN locations lf ON be.fromLocationId = lf.id
LEFT JOIN locations lt ON be.toLocationId = lt.id
ORDER BY be.eventTime DESC;

SELECT
    sr.id AS shipmentId,
    sr.shipmentCode,
    l1.locationName AS fromLocation,
    l2.locationName AS toLocation,
    su.organizationName AS shippedByOrganization,
    sr.dispatchAt,
    sr.arrivalAt,
    sr.status
FROM shipmentRecords sr
JOIN locations l1 ON sr.fromLocationId = l1.id
JOIN locations l2 ON sr.toLocationId = l2.id
JOIN systemUsers su ON sr.shippedBy = su.id;

SELECT
    sid.id AS shipmentItemId,
    sid.shipmentId,
    pb.code AS batchCode,
    p.productName,
    sid.quantityShipped,
    sid.quantityReceived,
    sid.status
FROM shipmentItemDetails sid
JOIN productBatches pb ON sid.batchId = pb.id
JOIN products p ON pb.productId = p.id;

SELECT
    st.id AS testId,
    st.testDate,
    st.result,
    st.contaminationLevel,
    pb.code AS batchCode,
    p.productName
FROM safetyTests st
JOIN productBatches pb ON st.batchId = pb.id
JOIN products p ON pb.productId = p.id
WHERE st.result = 'Fail';
