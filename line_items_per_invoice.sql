SELECT InvoiceId, COUNT(InvoiceId) as LinesOnInvoice
FROM InvoiceLine
GROUP BY InvoiceId;