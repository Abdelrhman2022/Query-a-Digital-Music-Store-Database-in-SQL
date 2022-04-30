use chinook ;
-- Who are the most 5 singer Artist?

Select art.Name as "Artist Name",
		count(alb.ArtistId) as 'Number of Albums'
	from artist as art
    join album as alb
		on alb.ArtistId = art.ArtistId
	group by art.Name 
	order by count(alb.AlbumId) desc
    limit 5;
    
    
-- How are the top buying customer for music?	

select concat(c.FirstName, " " , c.LastName ) as CustomerName,
		sum(i.Total) as Total
	from customer as c
    join invoice as i
		on i.CustomerId = c.CustomerId
	group by  CustomerName
    order by Total desc
    limit 5;
    
    
-- Who's The top MediaType Format used?

select mt.Name , count(t.MediaTypeId) as total
	from track as t
    join mediatype as mt
		on mt.MediaTypeId = t.MediaTypeId
	group by mt.Name
    order by total desc 
    limit 5;
    
-- Who's supportive emplخyee?
 -- What is the Number of Tracks Sold by Genre?

SELECT g.name, COUNT(t.trackid) AS No_Tracks_Sold
FROM genre g
JOIN Track t
ON g.genreid = t.genreid
JOIN InvoiceLine iv
ON iv.trackid = t.trackid
GROUP BY g.name
ORDER BY No_Tracks_Sold DESC;
         