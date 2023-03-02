/*
Provide a query that shows the total number of invoices per country.
*/

SELECT BillingCountry,
    COUNT(BillingCountry) as TotalInvoices
From Invoice
Group By BillingCountry;