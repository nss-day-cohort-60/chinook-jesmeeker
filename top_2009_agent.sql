/*
    Which sales agent made the most in sales in 2009?
*/

SELECT e.FirstName || ' ' || e.LastName as TopSalesAgent2009,
    MAX(totalSales) as Total2009Sales
from (
        SELECT e.employeeId as ID,
            e.FirstName || ' ' || e.LastName as TopSalesAgent2009,
            SUM(i.Total) as totalSales
        From Employee as e
            JOIN Customer as c ON c.SupportRepId = e.EmployeeId
            Join Invoice as i on i.CustomerId = c.CustomerId
        WHERE i.InvoiceDate LIKE "2009%"
        GROUP BY TopSalesAgent2009
    )
    INNER JOIN Employee as e on e.employeeId = ID;