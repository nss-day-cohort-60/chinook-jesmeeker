/*
    Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include:
        Album name
        Media type
        Genre
 */
 
SELECT t.Name,
    al.Title as AlbumName,
    mt.Name,
    g.Name
From Track as t
    JOIN Album as al ON t.AlbumId = al.AlbumId
    Join MediaType as mt ON t.MediaTypeId = mt.MediaTypeId
    Join Genre as g ON g.GenreId = t.GenreId;