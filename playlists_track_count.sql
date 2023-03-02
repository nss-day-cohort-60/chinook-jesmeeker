/*
    Provide a query that shows the total number of tracks in each playlist. The resultant table should include:
        Playlist name
        Total number of tracks on each playlist
*/

SELECT pl.Name,
    COUNT(plt.PlayListId) as NumTracksInPlaylist
FROM Playlist as pl
    LEFT JOIN PlayListTrack as plt ON pl.PlayListId = plt.PlayListId
Group By pl.Name;