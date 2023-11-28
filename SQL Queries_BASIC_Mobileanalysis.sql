-- Create schema
--  use schema

Use DataTalesUnveiled;
-- select schema "datatalesUnveiled" and select "table data import wizard "  and load the data needed
-- show case the tables
show tables from DatatalesUnveiled;

######## QUERY's Writting ##############

-- 1. Essential to understand the structure and contents of the dataset.
SELECT * FROM mobilesdata;

-- 2. **Retrieve the top N most expensive phones from the dataset (basicQuery and Query.adv):**
-- Showcases simple and advanced retrieval methods based on the price column.
SELECT * FROM mobilesdata ORDER BY price DESC LIMIT 10;
## ADVANCED 
SELECT brands, phone_name, price
FROM mobilesdata
ORDER BY price DESC
LIMIT 10;

-- 3. **Phones with Specific Battery Capacities:**
-- Introduces querying based on specific criteria (battery capacity range).
SELECT phone_name, battery_capacity_range
FROM mobilesdata
WHERE Battery_Capacity_Range = 'Between 4001 mAh-5000 mAh';

-- 4. **Phones with High RAM and Internal Storage:**
-- Demonstrates querying with multiple conditions involving RAM and internal storage.
SELECT phone_name, Ram_storage, Internal_storage
FROM mobilesdata
WHERE Ram_storage >= '6GB' 
    AND Internal_storage >= '128Gb' 
    AND Internal_storage <> 'Not Specified' 
    AND Ram_storage <> 'Not Specified';

-- 5. **Phones by Price Range and Operating System:**
-- Displays querying based on price range and operating system type.
SELECT brands, phone_name, price, operating_system_type
FROM mobilesdata
WHERE price BETWEEN 50000 AND 75000
    AND operating_system_type = 'IOS';

-- 6. **Count of Mobile Phones by Brand:**
-- Highlights data aggregation using 'GROUP BY' to count phones by brand.
SELECT brands, COUNT(phone_name) AS no_of_phones_By_BRAND
FROM mobilesdata
GROUP BY brands;

-- 7. **Average Price of Phones:**
-- Shows the calculation of average price.
SELECT AVG(price)
FROM mobilesdata;

-- 8. **Phones with 5G Availability and Specific Operating System Type:**
-- Illustrates filtering based on certain features (5G availability and operating system type).
SELECT phone_name
FROM mobilesdata
WHERE 5G_Availability = 'Yes';

-- 9. **Phones within a Specific Price Range:**
-- Another example of filtering data by price range.
SELECT Phone_name, Price
FROM mobilesdata
WHERE Price BETWEEN 20000 AND 30000;

-- 10. **Aggregate Analysis based on Battery Capacity Range:**
-- Expands on aggregation by counting phones within different battery capacity ranges.
SELECT battery_capacity_range, COUNT(*) AS no_of_phones
FROM mobilesdata
GROUP BY battery_capacity_range;

-- 11. **Phones with High RAM Storage (considering 6GB RAM):**
-- Shows filtering based on a specific RAM size.
SELECT Phone_name, RAM_Storage
FROM mobilesdata
WHERE RAM_Storage > 6;

-- Ordering based on ram_storage
SELECT Phone_name, RAM_Storage
FROM mobilesdata
ORDER BY RAM_Storage DESC
LIMIT 5;

-- 12. **Distribution of Phones by Country of Origin:**
-- Introduces filtering based on the country of origin.
SELECT phone_name, Country_of_Origin
FROM mobilesdata
WHERE Country_of_Origin = 'india';

-- 13. **Phones with Specific USB Type:**
-- Demonstrates the use of the 'LIKE' operator for pattern matching in querying.
SELECT Phone_name, USB_Type
FROM mobilesdata
WHERE USB_Type LIKE '%Type C%';

-- 14. **Comparison of Average Prices by Brand:**
-- Highlights the calculation of average prices per brand.
SELECT Brands, AVG(Price) AS Avg_Price
FROM mobilesdata
GROUP BY Brands;

-- 15. **Phones with Large Internal Storage:**
-- Shows ordering by internal storage size.
SELECT Phone_name, Internal_Storage
FROM mobilesdata
WHERE Internal_Storage <> 'Not Specified'
ORDER BY LENGTH(Internal_Storage) DESC, Internal_Storage DESC;

-- 16. **Phones with Specific Selfie Camera Megapixels:**
-- Focuses on querying based on specific camera specifications.
SELECT Phone_name
FROM mobilesdata
WHERE Selfie_Camera = '16 MP';
