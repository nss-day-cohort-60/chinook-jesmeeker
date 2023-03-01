SELECT e.FirstName || ' ' || e.LastName as FullName, i.InvoiceId
FROM Employee as e
JOIN Customer as c ON c.SupportRepId = e.EmployeeId
JOIN Invoice as i ON i.CustomerId = c.CustomerId
WHERE e.Title LIKE "Sales%Agent";