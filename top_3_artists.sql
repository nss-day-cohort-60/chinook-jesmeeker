SELECT a.Name as ArtistName,
    count(a.Name) as PurchaseCount
FROM Artist as a
    JOIN Album ON Album.ArtistId = a.ArtistId
    JOIN Track as t ON t.AlbumId = Album.AlbumId
    JOIN InvoiceLine AS l ON t.TrackId = l.TrackId
    JOIN Invoice AS i ON l.InvoiceId = i.InvoiceId
WHERE InvoiceDate LIKE "%2013%"
GROUP BY ArtistName
ORDER BY PurchaseCount DESC
Limit 3;