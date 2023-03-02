/*
 Which country's customers spent the most?
 */
 
Select Country,
    MAX(TotalSales)
from (
        SELECT BillingCountry as Country,
            SUM(Total) as TotalSales
        FROM Invoice
        GROUP BY Country
        ORDER BY MAX(BillingCountry)
    );