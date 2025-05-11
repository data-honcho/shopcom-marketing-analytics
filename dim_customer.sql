 SELECT TOP 5 *
 FROM dbo.customers;

 SELECT TOP 5 *
 FROM dbo.geography;



 ---- SQL statement to join dim_customers with dim_geography to enrich customer data with geographic information
SELECT c.customerid,
       c.customername,
       c.email,
       c.gender,
       c.age,
       g.country,
       g.city
FROM   dbo.customers AS c
       LEFT JOIN dbo.geography g
              ON c.geographyid = g.geographyid; 