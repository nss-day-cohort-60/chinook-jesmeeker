/*
    Provide a query that shows the total sales per country.
*/

SELECT BillingCountry as Country,
    SUM(Total) as TotalSales
FROM Invoice
GROUP BY Country;