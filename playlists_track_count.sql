SELECT pl.Name,
    COUNT(plt.PlayListId) as NumTracksInPlaylist
FROM Playlist as pl
    LEFT JOIN PlayListTrack as plt ON pl.PlayListId = plt.PlayListId
Group By pl.Name;