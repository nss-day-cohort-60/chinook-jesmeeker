/*
    Provide a query that shows the most purchased Media Type.
*/

SELECT mt.Name as MediaType,
    count(mt.Name) as PurchaseCount
FROM MediaType as mt
    JOIN Track as t ON t.MediaTypeId = mt.MediaTypeId
    JOIN InvoiceLine AS l ON t.TrackId = l.TrackId
    JOIN Invoice AS i ON l.InvoiceId = i.InvoiceId
GROUP BY MediaType
ORDER BY PurchaseCount DESC
Limit 1;