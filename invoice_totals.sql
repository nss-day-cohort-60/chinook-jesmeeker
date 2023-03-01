SELECT i.Total, c.FirstName || ' ' || c.LastName as CustomerFullName, c.Country as CustomerCountry, e.FirstName || ' ' || e.LastName as SalesAgentFullName
FROM Invoice as i
JOIN Customer as c ON c.customerId = i.customerId
JOIN Employee as e ON c.SupportRepId = e.EmployeeId;