# MobilePhoneDataSQLAnalysis
This repository contains SQL queries and analyses performed on a dataset encompassing mobile phone information. The queries demonstrate various SQL functionalities and techniques used for exploring, analyzing, and extracting insights from mobile phone data, covering aspects like price, specifications, brand-wise analysis, and dataset exploration.


---

### SQL Queries for Mobile Phone Dataset Analysis

#### Schema Creation and Data Import

1. Created and used the schema "DataTalesUnveiled."
2. Imported data into tables using the "Table Data Import Wizard."
3. Showcased the available tables using `SHOW TABLES` from the DataTalesUnveiled schema.

#### Basic Queries and Data Exploration

1. **Understanding Dataset Structure:** Explored the dataset structure with `SELECT * FROM mobilesdata`.
2. **Retrieving Expensive Phones:** Utilized basic and advanced queries to retrieve the top N most expensive phones from the dataset.
3. **Querying Based on Specific Criteria:** Demonstrated queries based on battery capacity range, internal storage, price range, and more.
4. **Aggregation and Calculations:** Performed aggregation tasks such as counting phones by brand, calculating average price, etc.
5. **Filtering and Pattern Matching:** Used filters and pattern matching to retrieve phones with specific features like operating systems, USB types, etc.
6. **Sorting and Ranking:** Showcased sorting, ranking, and window functions to organize and rank phones based on different attributes.

#### Stored Procedure and Advanced SQL Concepts

1. **Stored Procedure Example:** Created a stored procedure to count phones within a specific price range.
2. **Common Table Expressions (CTEs):** Employed CTEs to categorize and analyze phone counts within different price ranges.
3. **Window Functions:** Utilized window functions like ROW_NUMBER(), RANK(), LEAD(), NTILE(), SUM(), FIRST_VALUE(), LAST_VALUE() to analyze and rank phones based on various factors.

---

This summary aims to display a diverse skillset in SQL querying and analysis techniques using the mobile phone dataset. The queries cover a range of basic and advanced SQL functionalities to explore, filter, aggregate, and manipulate data effectively.
