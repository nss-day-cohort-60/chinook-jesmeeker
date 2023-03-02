/*
    Which sales agent made the most in sales over all?
*/

SELECT e.FirstName || ' ' || e.LastName as TopSalesAgent2009,
    ROUND(MAX(totalSales), 2) as TotalSales
from (
        SELECT e.employeeId as ID,
            e.FirstName || ' ' || e.LastName as TopSalesAgent2009,
            SUM(i.Total) as totalSales
        From Employee as e
            JOIN Customer as c ON c.SupportRepId = e.EmployeeId
            Join Invoice as i on i.CustomerId = c.CustomerId
        GROUP BY TopSalesAgent2009
    )
    INNER JOIN Employee as e on e.employeeId = ID;