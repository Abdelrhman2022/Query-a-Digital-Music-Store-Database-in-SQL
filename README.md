# Query a Digital Music Store Database in SQL
I'll query the Chinook Database. The Chinook Database holds information about a music store. For this lab, you will be answering 4 queries to help the Chinook team understand the media in their store, their customers and employees, and their invoice information. To assist you in the queries ahead, the schema for the Chinook Database is provided below. You can see the columns that link tables together via the arrows.

## Sample Data
Media related data was created using real data from an iTunes Library. It is possible for you to use your own iTunes Library to generate the SQL scripts, see instructions below. Customer and employee information was manually created using fictitious names, addresses that can be located on Google maps, and other well formatted data (phone, fax, email, etc.). Sales information is auto generated using random data for a four year period.

## Why the name Chinook?
The name of this sample database was based on the Northwind database. Chinooks are winds in the interior West of North America, where the Canadian Prairies and Great Plains meet various mountain ranges. Chinooks are most prevalent over southern Alberta in Canada. Chinook is a good name choice for a database that intents to be an alternative to Northwind.

# Schema Design
 
![Database Schema](https://github.com/Abdelrhman2022/Query-a-Digital-Music-Store-Database-in-SQL/blob/main/Database%20Schema.png)

# The project workflow follows the below key questions the insurance underwriters need to be answered:

1- Who are the most 5 singer Artist?

```sql
Select art.Name as "Artist Name",
		count(alb.ArtistId) as 'Number of Albums'
	from artist as art
    join album as alb
		on alb.ArtistId = art.ArtistId
	group by art.Name 
	order by count(alb.AlbumId) desc
    limit 5;
```

1- Who are the most 5 singer Artist?

```sql
Select art.Name as "Artist Name",
		count(alb.ArtistId) as 'Number of Albums'
	from artist as art
    join album as alb
		on alb.ArtistId = art.ArtistId
	group by art.Name 
	order by count(alb.AlbumId) desc
    limit 5;
```

2- How are the top buying customer for music?

```sql
select concat(c.FirstName, " " , c.LastName ) as CustomerName,
		sum(i.Total) as Total
	from customer as c
    join invoice as i
		on i.CustomerId = c.CustomerId
	group by  CustomerName
    order by Total desc
    limit 5;
```

3- Who's The top MediaType Format used?

```sql
select mt.Name , count(t.MediaTypeId) as total
	from track as t
    join mediatype as mt
		on mt.MediaTypeId = t.MediaTypeId
	group by mt.Name
    order by total desc 
    limit 5;
```

4- Who's supportive emplخyee?

```sql
select concat(e.FirstName, " ", e.LastNAme) as 'Employee Name',
		count(c.SupportRepId) as 'Total Support'
	from employee as e
		JOIN customer as c 
			ON c.SupportRepId = e.EmployeeId
		GROUP BY 1
        ORDER BY 2 DESC;
```
