# Sales Data SQL Project

## Overview
In this project, I used SQL to analyze sales data and discover key business insights. I performed data cleaning, aggregation, and visualization to answer important questions about sales performance.
> **Tools Used:** MySQL 8.0

## Thought Process

1. **Understanding the Dataset**
   - Explored the raw sales data to identify columns, missing values, and outliers.

2. **Data Cleaning**
   - Removed duplicates and standardized formats (like dates and category names).
   - Handled missing or incorrect values.

3. **Analysis Performed**
   - Calculated total sales and compared performance by category, year, and customers.
   - Used GROUP BY and aggregate functions (SUM, AVG) for summarizing data.
   - Applied statistical functions like STDDEV to understand variability in sales.

4. **Key Questions Answered**
   - **Best Category on Sales**  
     ![Best Category on Sales](Images/Best%20Category%20on%20sales.png)
   - **Best Year on Sales**  
     ![Best Year On Sales](Images/Best%20Year%20On%20sales.png)
   - **Sales Standard Deviation (Stddev)**  
     ![Stddev](Images/Stddev.png)
   - **Top 10 Customers by Sales**  
     ![Top 10 Customer](Images/Top%2010%20Customer.png)

5. **Results & Insights**
   - Found which category had the highest overall sales.
   - Identified the best-performing year for sales growth.
   - Listed the top 10 customers who contributed most to revenue.
   - Measured sales consistency with standard deviation.

6. **Challenges**
   - Faced missing data and outlier sales values—handled with SQL filtering and cleaning.
   - Dealing with typos or inconsistencies in categories and customer names.

7. **Learnings**
   - SQL is powerful for both cleaning and analyzing business data.
   - Visualization makes it easier to understand and present results to non-technical audiences.

## Sample Query
SELECT Category, SUM(Sales) AS TotalSales
FROM sales_data
GROUP BY Category
ORDER BY TotalSales DESC;


## How to Use

1. Download the `.sql` file and the dataset (if available).
2. Import the dataset into **MySQL** (tested on MySQL WorkBench version 8.0).
3. Run the queries step-by-step as shown.
4. Check the images folder for output visuals.

## Contact
- **Email:** [murali272004@gmail.com](mailto:murali272004@gmail.com)
- **Location:** India

## License
This project is open-source and free to use under the MIT License.
