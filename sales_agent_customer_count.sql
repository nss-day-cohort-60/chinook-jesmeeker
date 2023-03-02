/*Provide a query that shows how many customers are assigned to each employee. The resultant table should include:
-- Employee full name
-- Total number of customers assigned to each employee (even if it's zero)
*/

SELECT e.FirstName || ' ' || e.LastName as Employee,
    COUNT(c.SupportRepId) as CurrentCustomers
FROM Employee as e
    Left JOIN Customer as c on c.SupportRepId = e.EmployeeId
GROUP BY Employee;