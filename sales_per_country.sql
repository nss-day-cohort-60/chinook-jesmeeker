SELECT BillingCountry as Country,
    SUM(Total) as TotalSales
FROM Invoice
GROUP BY Country;