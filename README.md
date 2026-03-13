#🛒 Zepto E-commerce SQL Data Analyst Portfolio Project  
---
This is a **complete, real-world data analyst portfolio project** based on an e-commerce inventory dataset scraped from **Zepto**, one of India’s fastest-growing quick-commerce startups.The project simulates real analyst workflows, from **raw data exploration to business-focused data analysis
** This project is perfect for:

📊 Data Analyst aspirants who want to build a strong Portfolio Project for interviews and LinkedIn
📚 Anyone learning SQL hands-on
💼 Preparing for interviews in retail, e-commerce, or product analytics

##📌 Project Overview
---
The goal of this project is to simulate how real data analysts work in **e-commerce or retail companies** using SQL to:

✅ Set up a **messy real-world inventory database**
✅ Perform **Exploratory Data Analysis (EDA)** to understand product categories, pricing, and      
  availability
✅ Implement **Data Cleaning** to fix invalid entries and handle inconsistent pricing
✅ Write **business-focused SQL queries** to generate meaningful insights

##📁 Dataset Overview
---
The dataset was sourced from **Kaggle** and was originally scraped from Zepto’s official product listings. It mimics what you’d typically encounter in a real-world e-commerce inventory system.

Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.

## 🧾 Dataset Columns

* **sku_id** – Unique identifier for each product entry (Primary Key)
* **name** – Product name displayed in the app
* **category** – Product category (Fruits, Snacks, Beverages, etc.)
* **mrp** – Maximum Retail Price (converted from paise to ₹)
* **discountPercent** – Discount percentage applied on MRP
* **discountedSellingPrice** – Final price after discount
* **availableQuantity** – Inventory stock count
* **weightInGms** – Product weight in grams
* **outOfStock** – Boolean flag for stock availability
* **quantity** – Number of units per package


##1.🔧 Project Workflow
Here’s a step-by-step breakdown of what we do in this project:
### 1️ Database & Table Creation
We start by creating a SQL table with appropriate data types:


```sql
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
```


##2️.Data Import

* The dataset was imported using **MySQL Workbench's** Table Data Import Wizard.

* If you're not able to use the import feature, write this code instead:



```sql
\copy zepto(category,name,mrp,discountPercent,availableQuantity,
discountedSellingPrice,weightInGms,outOfStock,quantity)
FROM 'data/zepto_v2.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');
```

⚠️ Faced encoding issues (UTF-8 error), which were fixed by saving the CSV file using CSV **UTF-8 format**


##3.🔍 Data Exploration

*Counted the total number of records in the dataset

*Viewed a sample of the dataset to understand structure and content

*Checked for null values across all columns

*Identified distinct product categories available in the dataset

*Compared in-stock vs out-of-stock product counts

*Detected products present multiple times, representing different SKUs


##4.🧹 Data Cleaning

*Identified and removed rows where MRP or discounted selling price was zero.

*Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability.

---

##5.📊 Business Insights

*Generated insights using SQL queries:

*Found top 10 best-value products based on discount percentage

*Identified high-MRP products that are currently out of stock

*Estimated potential revenue for each product category

*Filtered expensive products (MRP > ₹500) with minimal discount

*Ranked top 5 categories offering highest average discounts

*Calculated price per gram to identify value-for-money products

*Grouped products based on weight into Low, Medium, and Bulk categories

*Measured total inventory weight per product category

---
  
