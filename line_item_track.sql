Select i.InvoiceLineId,
    t.Name
From InvoiceLine as i
    JOIN Track as t on i.trackId = t.trackId
Order BY i.InvoiceLineId;