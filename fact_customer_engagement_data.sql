SELECT *
FROM [dbo].[engagement_data];

-- Query to clean and normalize the engagement_data table

SELECT 
    EngagementID, 
    ContentID, 
	CampaignID,  
    ProductID, 
    UPPER(REPLACE(ContentType, 'Socialmedia', 'Social Media')) AS ContentType, --Correct Socialmedia spelt wrongly and set it to uppercase 
    LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) AS Views, -- Extract the Views part from the ViewsClicksCombined column by taking the substring before the '-' character 
    RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks, -- Extract the Clicks part from the ViewsClicksCombined column by taking the substring after the '-' character 
    Likes,
    -- Converts the EngagementDate to the dd.mm.yyyy format
    FORMAT(CONVERT(DATE, EngagementDate), 'dd.MM.yyyy') AS EngagementDate -- Converts and formats the date as dd.mm.yyyy
FROM 
    dbo.engagement_data  
WHERE 
    ContentType != 'Newsletter';  -- Filter out rows where ContentType is 'Newsletter' as these are not relevant for our analysis


