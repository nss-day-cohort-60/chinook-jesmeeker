SELECT BillingCountry,
    COUNT(BillingCountry) as TotalInvoices
From Invoice
Group By BillingCountry;