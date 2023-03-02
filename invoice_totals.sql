/*
    Provide a query that shows the customers and employees associated with each invoice. The resultant table should include:
        Invoice Total
        Customer Name
        Customer Country
        Sale Agent full name
*/

SELECT i.Total,
    c.FirstName || ' ' || c.LastName as CustomerFullName,
    c.Country as CustomerCountry,
    e.FirstName || ' ' || e.LastName as SalesAgentFullName
FROM Invoice as i
    JOIN Customer as c ON c.customerId = i.customerId
    JOIN Employee as e ON c.SupportRepId = e.EmployeeId;