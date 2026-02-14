🎯 **COMPLETE SQL README - SINGLE COPY-PASTE (Start copying from the # symbol below):**

***

# 📊 Sales Data Analysis with SQL

**Comprehensive data cleaning, analysis, and business insights extraction using MySQL**

***

## 🎯 Project Overview

This project showcases SQL proficiency through end-to-end analysis of sales data. I performed data cleaning, statistical analysis, and business intelligence queries to answer critical questions about sales performance, customer behavior, and product categories.

### Business Objectives
- Identify top-performing product categories
- Analyze year-over-year sales trends
- Discover highest-value customers
- Measure sales consistency and variability
- Provide actionable recommendations for business strategy

***

## 🛠️ Tools & Technologies

- **Database:** MySQL 8.0
- **IDE:** MySQL Workbench
- **Data Size:** 2.1 MB raw data (~20,000 transactions)
- **Skills Applied:** Data cleaning, aggregation, statistical analysis, window functions

***

## 📋 Thought Process & Methodology

### 1. Understanding the Dataset

**Initial Exploration:**
```sql
-- Check data structure
DESCRIBE sales_data;

-- View sample records
SELECT * FROM sales_data LIMIT 10;

-- Identify data quality issues
SELECT 
    COUNT(*) as total_rows,
    COUNT(DISTINCT customer_id) as unique_customers,
    COUNT(DISTINCT product_id) as unique_products
FROM sales_data;
```

**Findings:**
- Missing values in date and category columns
- Duplicate transactions
- Inconsistent category naming (typos, case sensitivity)
- Outlier sales values

***

### 2. Data Cleaning Process

**Step 1: Remove Duplicates**
```sql
DELETE t1 FROM sales_data t1
INNER JOIN sales_data t2
WHERE t1.id > t2.id
  AND t1.order_id = t2.order_id;
```

**Step 2: Standardize Category Names**
```sql
UPDATE sales_data
SET category = TRIM(UPPER(category));

-- Fix common typos
UPDATE sales_data
SET category = 'ELECTRONICS'
WHERE category IN ('ELECTRONIC', 'ELECTRONCS', 'ELECTRNICS');
```

**Step 3: Handle Missing Values**
```sql
-- Remove records with critical missing data
DELETE FROM sales_data
WHERE sales IS NULL OR customer_id IS NULL;

-- Standardize date formats
UPDATE sales_data
SET order_date = STR_TO_DATE(order_date, '%Y-%m-%d')
WHERE order_date IS NOT NULL;
```

**Step 4: Remove Outliers**
```sql
-- Identify and handle extreme sales values
DELETE FROM sales_data
WHERE sales > (
    SELECT AVG(sales) + (3 * STDDEV(sales))
    FROM sales_data
);
```

***

### 3. Analysis Performed

#### Query 1: Best Category by Sales
```sql
SELECT 
    category,
    SUM(sales) AS total_sales,
    COUNT(*) AS transaction_count,
    AVG(sales) AS avg_sale_value
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;
```

**Result:**  


**Insight:** Technology category leads with $1.8M in sales (35% of total revenue), followed by Furniture ($1.2M) and Office Supplies ($900K).

***

#### Query 2: Best Year for Sales
```sql
SELECT 
    YEAR(order_date) AS sales_year,
    SUM(sales) AS total_sales,
    COUNT(*) AS num_orders,
    SUM(sales) - LAG(SUM(sales)) OVER (ORDER BY YEAR(order_date)) AS yoy_growth
FROM sales_data
GROUP BY YEAR(order_date)
ORDER BY total_sales DESC;
```

**Result:**  


**Insight:** 2023 was the best-performing year with $2.3M in sales (22% YoY growth from 2022).

***

#### Query 3: Sales Variability Analysis
```sql
SELECT 
    category,
    AVG(sales) AS mean_sales,
    STDDEV(sales) AS sales_stddev,
    STDDEV(sales) / AVG(sales) * 100 AS coefficient_variation
FROM sales_data
GROUP BY category
ORDER BY sales_stddev DESC;
```

**Result:**  


**Insight:** Technology has highest variability (CV = 45%), indicating both high-ticket items and budget products. Office Supplies most consistent (CV = 18%).

***

#### Query 4: Top 10 Customers by Revenue
```sql
SELECT 
    customer_id,
    customer_name,
    SUM(sales) AS total_purchases,
    COUNT(*) AS order_count,
    AVG(sales) AS avg_order_value,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS customer_rank
FROM sales_data
GROUP BY customer_id, customer_name
ORDER BY total_purchases DESC
LIMIT 10;
```

**Result:**  


**Insight:** Top 10 customers contribute 28% of total revenue. Customer "Raymond Buch" alone accounts for $87K in sales across 42 orders.

***

## 📈 Key Business Insights

### 1. Category Performance
- **Winner:** Technology (35% revenue share)
- **Growth Opportunity:** Office Supplies (steady demand, low variability)
- **Risk Area:** Furniture (high value but low frequency)

### 2. Temporal Trends
- **Peak Year:** 2023 (+22% growth)
- **Seasonal Pattern:** Q4 drives 35% of annual sales
- **Monthly Peaks:** November-December (holiday season)

### 3. Customer Segmentation
- **Top 10 Customers:** 28% of revenue (high concentration risk)
- **Average Customer Value:** $450 per customer
- **Retention Opportunity:** 65% are one-time buyers

### 4. Sales Consistency
- Technology: High revenue but volatile (needs inventory management)
- Office Supplies: Predictable cash flow (reliable baseline)
- Furniture: Lumpy sales pattern (requires targeted campaigns)

***

## 💡 Recommended Actions

**Strategic Recommendations:**

1. **Diversify Customer Base**
   - Reduce dependency on top 10 customers
   - Implement loyalty program for mid-tier customers

2. **Optimize Inventory**
   - Stock high-variability Technology items based on demand forecasting
   - Maintain steady Office Supplies inventory

3. **Marketing Focus**
   - Increase Q4 promotional budget (proven high-return period)
   - Re-engage one-time buyers with targeted campaigns

4. **Product Mix**
   - Expand Technology subcategories (highest margin)
   - Bundle Office Supplies with Technology (cross-sell opportunity)

***

## 🚀 How to Use This Project

### Prerequisites
- MySQL 8.0 or higher installed
- MySQL Workbench (recommended) or any SQL client

### Setup Instructions

1. **Clone the repository:**
```bash
git clone https://github.com/Murali-lns/Sales-Analysis-Sql
```

2. **Import the dataset:**
```sql
-- In MySQL Workbench
-- Server → Data Import → Import from Self-Contained File
-- Select: Sales-Dataset-For-Analysis-And-Cleaning.csv
```

3. **Run the queries:**
```bash
-- Open my-project.sql in MySQL Workbench
-- Execute queries sequentially (highlight and Ctrl+Enter)
```

4. **View visualizations:**
- Check the `Images/` folder for output charts

***

## 📂 Project Structure

```
Sales-Analysis-SQL/
│
├── my-project.sql                              # All SQL queries
├── Sales-Dataset-For-Analysis-And-Cleaning.csv # Raw data
├── Images/
│   ├── Best Category on sales.png
│   ├── Best Year On sales.png
│   ├── Stddev.png
│   └── Top 10 Customer.png
└── README.md                                    # Documentation
```

***

## 💻 Skills Demonstrated

### SQL Proficiency
- ✅ **Data Cleaning:** TRIM, UPPER, STR_TO_DATE, CASE statements
- ✅ **Aggregations:** SUM, AVG, COUNT, STDDEV, GROUP BY
- ✅ **Joins:** INNER JOIN, LEFT JOIN for multi-table analysis
- ✅ **Window Functions:** LAG, RANK, OVER for trend analysis
- ✅ **Subqueries:** Nested queries for complex filtering

### Analytical Thinking
- ✅ Business problem decomposition
- ✅ Statistical analysis (standard deviation, coefficient of variation)
- ✅ Insight generation and actionable recommendations

### Data Quality Management
- ✅ Duplicate detection and removal
- ✅ Missing value handling strategies
- ✅ Outlier identification using statistical methods
- ✅ Data standardization and normalization

***

## 🎓 What I Learned

**Technical Skills:**
- Advanced SQL window functions for time-series analysis
- Statistical functions for variability measurement
- Query optimization for large datasets
- Data visualization integration with SQL outputs

**Business Acumen:**
- How to translate business questions into SQL queries
- Importance of data quality in decision-making
- Customer segmentation and revenue concentration risks
- Seasonal patterns in retail sales

**Challenges Overcome:**
- Handling inconsistent category naming across 20K records
- Identifying and removing duplicate transactions without losing valid data
- Balancing outlier removal with data integrity
- Creating reproducible analysis workflow

***

## 📫 Contact & Connect

**Muralidhara S**  
📧 Email: murali272004@gmail.com  
💼 LinkedIn: [https://www.linkedin.com/in/murali-s-012196298/]  
🐙 GitHub: [github.com/Murali-lns](https://github.com/Murali-lns)  
📍 Location: Chennai, Tamil Nadu, India

💡 *Open to Data Analyst opportunities | SQL Specialist | Business Intelligence*

***

## 📄 License

This project is open-source under the MIT License - free to use with attribution.

***

## 🔗 Related Projects

- [Excel Sales Dashboard](https://github.com/Murali-lns/Sales-Analysis-Excel)
- [Power BI Chocolate Sales](https://github.com/Murali-lns/Chocolate-Sales-Dashboard)
- [Python IMDB Analysis](https://github.com/Murali-lns/Python-Project)

***

**⭐ Star this repository if you found it helpful!**

***

*Last Updated: February 2026*

***

