SELECT t.Name,
    COUNT(t.Name) as PurchaseCount
FROM Track t
    JOIN InvoiceLine AS l ON t.TrackId = l.TrackId
    JOIN Invoice AS i ON l.InvoiceId = i.InvoiceId
GROUP BY Name
ORDER BY PurchaseCount DESC
Limit 5;