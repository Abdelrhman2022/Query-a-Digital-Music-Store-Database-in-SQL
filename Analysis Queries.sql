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

select concat(e.FirstName, " ", e.LastNAme) as 'Employee Name',
		count(c.SupportRepId) as 'Total Support'
	from employee as e
		JOIN customer as c 
			ON c.SupportRepId = e.EmployeeId
		GROUP BY 1
        ORDER BY 2 DESC;

-- What is the Number of Tracks Sold by Genre?

SELECT g.name, 
		COUNT(t.trackid) AS "Total tracks sold"
	FROM genre g
	JOIN Track t
		ON g.genreid = t.genreid
	JOIN InvoiceLine iv
		ON iv.trackid = t.trackid
	GROUP BY 1
	ORDER BY 2 DESC
limit 5;


-- What is the Total Spent Per Country Compared with Number of Tracks Sold?

SELECT i.billingcountry AS Country,
		 SUM(iv.unitprice * iv.quantity) AS Sales,
		 COUNT(t.trackid) AS "Total tracks sold"
FROM Invoice i
JOIN InvoiceLine iv
ON i.invoiceid = iv.invoiceid
JOIN track t
ON t.trackid = iv.trackid
GROUP BY i.billingcountry
ORDER BY sales DESC;


-- What are The Top 10 Albums based on sales?
SELECT a.albumid, a.title, ar.name AS Artist_Name, SUM(iv.unitprice * iv.quantity) AS Sales
FROM Artist ar
JOIN Album a
ON ar.artistid = a.artistid
JOIN Track t
ON a.albumid = t.albumid
JOIN InvoiceLine iv
ON iv.trackid = t.trackid
GROUP BY a.albumid
ORDER BY Sales DESC
LIMIT 10;

-- What is the best-selling country?

select BillingCountry as country, 
		Count(BillingCountry)  as "Total Sold" 
	from invoice
    group by 1
    order by 2 desc
    limit 10;
         