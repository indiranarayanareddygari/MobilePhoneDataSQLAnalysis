-- 1. **Phones with High RAM Storage (Using Advanced SQL Functions):**
   -- Orders phones based on RAM size using advanced SQL functions for numerical sorting.
SELECT Phone_name, RAM_Storage
FROM mobilesdata
ORDER BY CAST(SUBSTRING_INDEX(RAM_Storage, ' ', 1) AS UNSIGNED) DESC
LIMIT 5;

-- 2. **Phones ordered by Internal Storage Size (Using CAST and SUBSTRING_INDEX):**
   -- Sorts phones by internal storage size after extracting numerical values from the storage column.
SELECT Phone_name, Internal_Storage
FROM mobilesdata
WHERE Internal_Storage <> 'Not Specified'
ORDER BY CAST(SUBSTRING_INDEX(Internal_Storage, ' ', 1) AS UNSIGNED) DESC;

-- 3. **Average Battery Capacity by Brand:**
   -- Computes the average battery capacity for each brand by extracting and averaging numerical values from the battery capacity column.
SELECT Brands, AVG(CAST(SUBSTRING_INDEX(Battery_Capacity, ' ', 1) AS UNSIGNED)) AS Avg_Battery_Capacity
FROM mobilesdata
GROUP BY brands;

-- Stored Procedure Example: Count Phones Within a Specific Price Range
DELIMITER //

CREATE PROCEDURE CountPhonesInRange(
    IN min_price DECIMAL(10, 2),
    IN max_price DECIMAL(10, 2),
    OUT phone_count INT
)
BEGIN
    SELECT COUNT(*) INTO phone_count
    FROM Mobilesdata
    WHERE Price BETWEEN min_price AND max_price;
END //

DELIMITER ;

CALL CountPhonesInRange(20000.00, 30000.00, @count);
SELECT @count AS Phones_In_Range_Count;

-- Common Table Expressions (CTEs)
-- CTE for Analyzing Price Ranges and Phone Counts
WITH PriceRanges AS (
    SELECT 
        CASE 
            WHEN Price BETWEEN 0 AND 10000 THEN '0-10000'
            WHEN Price BETWEEN 10001 AND 20000 THEN '10001-20000'
            WHEN Price BETWEEN 20001 AND 30000 THEN '20001-30000'
            ELSE 'Above 30000'
        END AS Price_Range,
        Price
    FROM Mobilesdata
)
SELECT 
    Price_Range,
    COUNT(*) AS Count_of_Phones,
    AVG(Price) AS Avg_Price
FROM PriceRanges
GROUP BY Price_Range;

-- Window Functions:
-- Row number() - Assigns a sequential rank to phones within each brand based on their prices.
SELECT 
    Phone_name,
    Brands,
    Price,
    ROW_NUMBER() OVER(PARTITION BY Brands ORDER BY Price) AS Price_Rank_By_Brand
FROM Mobilesdata;

-- RANK() Function: Assigns ranks to phones within each brand based on their prices (may have tied ranks).
SELECT 
    Phone_name,
    Brands,
    Price,
    RANK() OVER (PARTITION BY Brands ORDER BY Price) AS Price_Rank_By_Brand
FROM mobilesdata;

-- LEAD() and LAG() Functions: Retrieves next and previous prices for phones within each brand using window functions.
SELECT 
    Phone_name,
    Brands,
    Price,
    LEAD(Price) OVER (PARTITION BY Brands ORDER BY Price) AS Next_Price,
    LAG(Price) OVER (PARTITION BY Brands ORDER BY Price) AS Previous_Price
FROM mobilesdata;

-- NTILE() Function: Divides phones into quartiles based on their prices.
SELECT 
    Phone_name,
    Brands,
    Price,
    NTILE(4) OVER (ORDER BY Price) AS Price_Quartile
FROM mobilesdata;

-- SUM() or AVG() as Window Aggregates: Calculates cumulative sums of prices for phones within each brand using window functions.
SELECT 
    Phone_name,
    Brands,
    Price,
    SUM(Price) OVER (PARTITION BY Brands ORDER BY Price) AS Cumulative_Price_Sum
FROM mobilesdata;

-- FIRST_VALUE() and LAST_VALUE() Functions: Retrieves the first and last prices for phones within each brand using window functions.
SELECT 
    Phone_name,
    Brands,
    Price,
    FIRST_VALUE(Price) OVER (PARTITION BY Brands ORDER BY Price) AS First_Price,
    LAST_VALUE(Price) OVER (PARTITION BY Brands ORDER BY Price) AS Last_Price
FROM mobilesdata;
