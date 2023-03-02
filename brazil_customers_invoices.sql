/*
    Provide a query showing the Invoices of Customers who are from Brazil. The resultant table should include:
        Customer's full name
        Invoice Id,
        Date of the invoice
        Billing country
*/

SELECT Customer.FirstName || ' ' || Customer.LastName as FullName,
    Invoice.InvoiceId,
    Invoice.InvoiceDate,
    Invoice.BillingCountry
FROM Invoice
    JOIN Customer ON Customer.CustomerId = Invoice.CustomerId
WHERE Invoice.BillingCountry LIKE "BRAZIL"