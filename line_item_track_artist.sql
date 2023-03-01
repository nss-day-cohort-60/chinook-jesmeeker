SELECT i.InvoiceLineId, t.Name, ar.Name
FROM InvoiceLine as i
    Join Track as t ON i.TrackId = t.TrackId
    JOIN Album as al on t.AlbumId = al.AlbumId
    Join Artist as ar on al.ArtistId = ar.ArtistId
Order By i.InvoiceLineId ASC;