 SELECT *
 FROM dbo.products;



 -- SQL Query to categorize products based on their price

SELECT 
    ProductID, 
    ProductName,
    Price,  
	-- Category, -- Selects the product category for each product

    CASE 
        WHEN Price < 50 THEN 'Low'
        WHEN Price BETWEEN 50 AND 200 THEN 'Medium'  
        ELSE 'High'  
    END AS PriceCategory

	FROM 
    dbo.products;