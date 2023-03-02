/*
    My first attempt at sub-subquery (non-working)
*/
SELECT ttt.Name, secondquery.Total
FROM Track ttt
    INNER Join (
        SELECT tt.Name as TrackName,
            MAX(initialquery.TotalPurchases) as MaxPurchases, initialquery.TotalPurchases as Total
        FROM Track tt
            INNER JOIN (
                SELECT t.Name AS TrackName,
                    Count(Quantity) AS TotalPurchases
                FROM Track AS t
                    JOIN InvoiceLine AS l ON t.TrackId = l.TrackId
                    JOIN Invoice AS i ON l.InvoiceId = i.InvoiceId
                WHERE InvoiceDate LIKE "%2013%"
                GROUP BY TrackName
            ) initialquery ON TrackName = initialquery.Trackname) as secondquery
On ttt.Name = TrackName
WHERE secondquery.Total = MaxPurchases;

/*
    My hybrid sub-subquery, taking coach's and reworking with my own aliases
*/
SELECT 
    initialquery.TRACKNAME, 
    initialquery.PurchaseCount
FROM 
    (
        SELECT tt.Name as TrackName, COUNT(tt.Name) as PurchaseCount
        FROM Track tt
            JOIN InvoiceLine AS l ON tt.TrackId = l.TrackId
            JOIN Invoice AS i ON l.InvoiceId = i.InvoiceId
            WHERE InvoiceDate LIKE "%2013%"
            GROUP BY TrackName
            ) initialquery 
        JOIN (
            SELECT MAX(PurchaseCount) as MaxCount
        FROM (
            SELECT t.Name as TRACKNAME, count(t.Name) as PurchaseCount
            FROM Track t
            JOIN InvoiceLine AS l ON t.TrackId = l.TrackId
            JOIN Invoice AS i ON l.InvoiceId = i.InvoiceId
            WHERE InvoiceDate LIKE "%2013%"
            GROUP BY TRACKNAME
            ORDER BY PurchaseCount DESC
        ) initialquery
        ) jjj
            ON initialquery.PurchaseCount = jjj.MaxCount
            ;

/*
    Coach's sub-subquery example
*/
select 
	TrackCounts.Name, 
	TrackCounts.PurchaseCount
from (
	select t.Name, count(t.Name) as PurchaseCount
			from Track t
            join InvoiceLine l on l.TrackId = t.TrackId
			join Invoice i on l.InvoiceId = i.InvoiceId
			where STRFTIME('%Y', i.InvoiceDate) = "2013"
            group by t.Name
     ) TrackCounts 
	 join
     (
		select max(PurchaseCount) as MaxCount
      	from (
			select t.Name, count(t.Name) as PurchaseCount
			from Track t
            join InvoiceLine l on l.TrackId = t.TrackId
			join Invoice i on l.InvoiceId = i.InvoiceId
			where STRFTIME('%Y', i.InvoiceDate) = "2013"
            group by t.Name
			order by PurchaseCount desc
           ) TrackCounts
     ) Maxx
     on TrackCounts.PurchaseCount = Maxx.MaxCount
	 ;

/*
    Coach's CTE example
*/
with TopTracks as (
    select t.Name,
        COUNT(t.Name) PurchaseCount
    from Track t
        join InvoiceLine l on l.TrackId = t.TrackId
        join Invoice i on l.InvoiceId = i.InvoiceId
    where STRFTIME('%Y', i.InvoiceDate) = "2013"
    group by t.Name
    order by PurchaseCount desc
)

select Name,
    PurchaseCount
from TopTracks
where (
        select max(PurchaseCount)
        from TopTracks
    ) = PurchaseCount
;