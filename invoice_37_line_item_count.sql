SELECT InvoiceId, COUNT(InvoiceId) as LinesOnInvoice
FROM InvoiceLine
WHERE InvoiceId = 37;