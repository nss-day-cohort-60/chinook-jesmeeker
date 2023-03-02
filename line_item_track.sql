/*
    Provide a query that shows each Invoice line item, with the name of the track that was purchased.
*/

Select i.InvoiceLineId,
    t.Name
From InvoiceLine as i
    JOIN Track as t on i.trackId = t.trackId
Order BY i.InvoiceLineId;