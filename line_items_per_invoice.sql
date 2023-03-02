/*
    Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.
*/

SELECT InvoiceId,
    COUNT(InvoiceId) as LinesOnInvoice
FROM InvoiceLine
GROUP BY InvoiceId;