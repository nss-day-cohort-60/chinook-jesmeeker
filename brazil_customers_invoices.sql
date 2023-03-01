SELECT Customer.FirstName || ' ' || Customer.LastName as FullName,
Invoice.InvoiceId,
Invoice.InvoiceDate,
Invoice.BillingCountry
FROM Invoice
JOIN Customer ON Customer.CustomerId = Invoice.CustomerId
WHERE Invoice.BillingCountry LIKE "BRAZIL"