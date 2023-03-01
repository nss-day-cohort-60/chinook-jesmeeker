SELECT i.InvoiceId,
    COUNT(il.InvoiceLineId) as TotalLineItems
FROM Invoice as i
    JOIN InvoiceLine as il ON i.InvoiceId = il.InvoiceId
GROUP BY i.InvoiceId;