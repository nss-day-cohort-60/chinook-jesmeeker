/*
    Provide a query that shows the invoices associated with each sales agent. The resultant table should include:
        Sales Agent's full name
        Invoice ID
*/

SELECT e.FirstName || ' ' || e.LastName as FullName,
    i.InvoiceId
FROM Employee as e
    JOIN Customer as c ON c.SupportRepId = e.EmployeeId
    JOIN Invoice as i ON i.CustomerId = c.CustomerId
WHERE e.Title LIKE "Sales%Agent";