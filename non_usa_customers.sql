SELECT FirstName || ' ' || LastName as FullName,
CustomerId, 
Country
FROM Customer
WHERE Country NOT LIKE "USA"