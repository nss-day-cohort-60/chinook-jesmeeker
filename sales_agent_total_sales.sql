/*
Provide a query that shows total sales made by each sales agent. The resultant table should include:
    Employee full name
    Total sales for each employee (all time)
*/

SELECT e.FirstName || ' ' || e.LastName as EmployeeName,
    ROUND(SUM(i.Total), 2) as TotalSales
FROM Employee as e
    JOIN Customer as c ON c.SupportRepId = e.EmployeeId
    Join Invoice as i on i.CustomerId = c.CustomerId
GROUP BY EmployeeName;