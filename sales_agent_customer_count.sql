SELECT e.FirstName || ' ' || e.LastName as Employee,
    COUNT(c.SupportRepId) as CurrentCustomers
FROM Employee as e
    Left JOIN Customer as c on c.SupportRepId = e.EmployeeId
GROUP BY Employee;