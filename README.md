##🛒 Zepto E-commerce SQL Data Analyst Portfolio Project  
---
This is a **complete, real-world data analyst portfolio project** based on an e-commerce inventory dataset scraped from **Zepto**, one of India’s fastest-growing quick-commerce startups.The project simulates real analyst workflows, from **raw data exploration to business-focused data analysis
** This project is perfect for:

📊 Data Analyst aspirants who want to build a strong Portfolio Project for interviews and LinkedIn
📚 Anyone learning SQL hands-on
💼 Preparing for interviews in retail, e-commerce, or product analytics

# 📌 Project Overview
---
The goal of this project is to simulate how real data analysts work in **e-commerce or retail companies** using SQL to:

✅ Set up a **messy real-world inventory database**
✅ Perform **Exploratory Data Analysis (EDA)** to understand product categories, pricing, and      
  availability
✅ Implement **Data Cleaning** to fix invalid entries and handle inconsistent pricing
✅ Write **business-focused SQL queries** to generate meaningful insights

# 📁 Dataset Overview
---
The dataset was sourced from **Kaggle** and was originally scraped from Zepto’s official product listings. It mimics what you’d typically encounter in a real-world e-commerce inventory system.

Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.

# 🧾 Dataset Columns

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


# 🔧 Project Workflow
---

## 1️ Database & Table Creation

Created a SQL table with appropriate data types.

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

---

## 2️⃣ Data Import

Loaded the CSV dataset using **pgAdmin Import Tool**.

Alternative command:

```sql
\copy zepto(category,name,mrp,discountPercent,availableQuantity,
discountedSellingPrice,weightInGms,outOfStock,quantity)
FROM 'data/zepto_v2.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');
```

⚠️ Faced encoding errors which were fixed by saving the CSV as **UTF-8 format**.

---

# 🔍 Data Exploration

Performed exploratory analysis to understand the dataset.

* Count total records
* View dataset sample
* Check for **NULL values**
* Identify **distinct product categories**
* Compare **in-stock vs out-of-stock products**
* Detect **duplicate product names with different SKUs**

---

# 🧹 Data Cleaning

Performed multiple cleaning steps:

* Removed rows where **MRP or discounted price was zero**
* Converted **price values from paise to rupees**
* Standardized data types for analysis

---

# 📊 Business Insights

Generated insights using SQL queries:

* 🔹 Top **10 best-value products** based on highest discount
* 🔹 **High-MRP products currently out of stock**
* 🔹 Estimated **potential revenue per category**
* 🔹 Expensive products (**MRP > ₹500**) with minimal discount
* 🔹 Top **5 categories offering highest average discounts**
* 🔹 Calculated **price per gram** to find best-value items
* 🔹 Grouped products by **weight category** (Low, Medium, Bulk)
* 🔹 Measured **total inventory weight per category**

---

# 🛠️ How To Use This Project

### 1️⃣ Clone the repository

```bash
git clone https://github.com/amlanmohanty/zepto-SQL-data-analysis-project.git
cd zepto-SQL-data-analysis-project
```

## 🛠️ How To Use This Project

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/amlanmohanty/zepto-SQL-data-analysis-project.git
cd zepto-SQL-data-analysis-project
```

### 2️⃣ Open the SQL File

Open the file:

`zepto_SQL_data_analysis.sql`

This file contains:

* Table creation
* Data exploration queries
* Data cleaning queries
* Business analysis queries

### 3️⃣ Load the Dataset Using MySQL Workbench

1. Open **MySQL Workbench**
2. Create a new database
3. Run the SQL script to create the table
4. Import the CSV dataset using the **Table Data Import Wizard**

Steps:

* Go to **Server → Data Import**
* Select the dataset CSV file
* Map the columns correctly
* Import the data into the `zepto` table

### 4️⃣ Run the Queries

After importing the dataset:

* Execute the SQL queries from `zepto_SQL_data_analysis.sql`
* Analyze the results to generate business insights.


# 👨‍💻 Author

Babu Omase

---

⭐ If you found this project useful, consider giving the repository a **star**!
