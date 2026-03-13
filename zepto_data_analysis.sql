create database zepto;
use zepto;

DROP TABLE zepto;

CREATE TABLE zepto (
sku_id SERIAL PRIMARY KEY,
    category VARCHAR(200),
    name VARCHAR(150) NOT NULL,
    mrp DECIMAL(8,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountSellingPrice DECIMAL(8,2),
    weightInGms INT,
    outOfStock VARCHAR(10),
    quantity INT
);

SELECT * from zepto LIMIT 10;

/* Data exploration*/
SELECT count(1) From zepto;

/*count of  rows */
SELECT COUNT(*) FROM zepto;

/*to check null value*/
SELECT * FROM zepto WHERE name IS NULL
OR 
category IS NULL
OR 
mrp IS NULL
OR 
discountPercent IS NULL
OR 
availableQuantity IS NULL
OR 
discountSellingPrice IS NULL
OR 
weightInGms IS NULL
OR 
outOfStock IS NULL
OR 
quantity IS NULL;

/*diffrent product categories*/

SELECT DISTINCT category FROM ZEPTO ORDER BY  category ;

/*PRODUCT VS OUT OF STOCK COUNT*/

SELECT outOfStock, COUNT(sku_id) FROM zepto GROUP BY outOfStock;

/* product  name present multiple timea*/

SELECT name, COUNT(sku_id) AS "NAME OF SKUS" 
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1  
 ORDER BY COUNT(sku_iD)DESC;
 
 /*PRODUCT WITH ZERO PRICE*/
 
 SELECT * FROM zeptO 
 WHERE mrp=0 OR discountSellingPrice=0;
 
 /*after one coming 1 prdouct zero  price then delete the row*/
  delete from zepto where sku_id=3603;
  
  /*convert paise to rupes*/
  SET sql_safe_updates = 0; /*TO PERMISINON FOR UPDATE */
  
  UPDATE zepto set
  mrp = mrp/100.0,
  discountSellingPrice = discountSellingPrice/100.0;
  SELECT mrp,discountSellingPrice FROM ZEPTO;
  
  /*find the top 10 best value product based on disscount percent  */
SELECT name,mrp,discountPercent FROM zepto
ORDER BY discountPercent DESC LIMIT 10; 


/*what are the producct with high mrp but outofstock*/

SELECT DISTINCT name,mrp FROM ZEPTO 
WHERE outOfStock=true
 AND
 mrp >300 
ORDER BY mrp DESC; 

/*FIND ALL PRODUCT WHERE MRP IS GRATERTHAN 500 AND DISCOUNTRLESS THAN 10%*/
SELECT DISTINCT name,mrp,discountPercent FROM ZEPTO 
WHERE mrp>500 AND DiscountPercent<10 
ORDER BY mrp DESC , discountPercent DESC ;

/*IDENTIFY the top 5 categories offering the highest avg discount percentage */
SELECT DISTINCT category, 
ROUND (AVG(discountPercent),2)AS avg_discount 
FROM zepto 
GROUP BY category 
ORDER BY avg_discount DESC
 LIMIT 5;
 
 
 /*find the price per gram for product above 100g and sort by best value*/
 SELECT DISTINCT name,weightInGms,discountSellingPrice, 
 ROUND (discountSellingPrice/weightInGms,2) AS price_per_gram
 FROM zepto
 WHERE weightInGms >=100
 ORDER BY  price_per_gram;
 
 /*group the product into categories like low ,medium,bulk*/
 
 SELECT DISTINCT name,weightInGms,
 CASE
 WHEN weightInGms < 1000 THEN 'LOW'
 WHEN weightIngms < 5000 THEN 'MEDIUM'
 ELSE "BULK"
 END AS Weight_category
 FROM zepto;
 
 
/*What is the Inventory weight per category*/
SELECT category, SUM(weightInGms * availableQuantity) AS total_weight 
FROM zepto GROUP BY category
ORDER BY total_weight; 