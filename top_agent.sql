SELECT e.FirstName || ' ' || e.LastName as TopSalesAgent2009,
    SUM(i.Total) as TotalSales
From Employee as e
    JOIN Customer as c ON c.SupportRepId = e.EmployeeId
    Join Invoice as i on i.CustomerId = c.CustomerId
ORDER BY MAX(i.Total);