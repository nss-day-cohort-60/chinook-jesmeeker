SELECT SUM(Total) as Total,
    Case
        When InvoiceDate Like '2009%' Then '2009'
        When InvoiceDate Like '2011%' Then '2011'
    End as Year
FROM Invoice
WHERE InvoiceDate LIKE "2009%"
    OR InvoiceDate LIKE "2011%"
GROUP BY Case
        When InvoiceDate Like '2009%' Then '2009'
        When InvoiceDate Like '2011%' Then '2011'
    END;