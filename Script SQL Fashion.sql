-- DATA ANALYSIS

-- TABLE CREATION
CREATE TABLE clothing_sales (
    user_id INT,
    category VARCHAR(255),
    designer_id INT,
    language VARCHAR(50),
    level VARCHAR(50),
    country VARCHAR(50),
    purchase_date DATE,
    platform VARCHAR(50),
    item_id INT,
    stars INT,
    subscription_date DATE
);

-- OVERVIEW
SELECT *
FROM clothing_sales;



-- USERS ANALYSIS:

-- Most Active Users Based on Sales Volume
SELECT user_id, COUNT(purchase_date) as total_sales_by_user_id
FROM clothing_sales
GROUP BY user_id
ORDER BY total_sales_by_user_id DESC
LIMIT 10;

-- Countries with the highest number of users
SELECT country, COUNT(DISTINCT user_id) as total_unique_users
FROM clothing_sales
GROUP BY country
ORDER BY total_unique_users DESC;


-- Subscription Trend by Year
SELECT EXTRACT(YEAR FROM subscription_date) as year, COUNT(DISTINCT user_id) as total_subscription_by_year
FROM clothing_sales
GROUP BY year
ORDER BY year;




-- CATEGORIES ANALYSIS:

-- Extract the best-selling products
SELECT item_id, COUNT(*) as total_sales
FROM clothing_sales
GROUP BY item_id
ORDER BY total_sales DESC
LIMIT 10;

-- Average Star Rating by Category
SELECT category, AVG(stars) as avg_stars
FROM clothing_sales
GROUP BY category
ORDER BY avg_stars DESC;



-- PURCHASES ANALYSIS:

-- Purchases Trend by Month
SELECT EXTRACT(MONTH FROM purchase_date) as month, COUNT(*) as total_sales_by_month
FROM clothing_sales
GROUP BY month
ORDER BY month;

-- Distribution of Sales by Price Range
SELECT level, COUNT(*) as total_sales_by_level
FROM clothing_sales
GROUP BY level
ORDER BY total_sales_by_level DESC;

-- Countries with the highest number of purchases:
SELECT country, COUNT(purchase_date) AS total_sales
FROM clothing_sales
GROUP BY country
ORDER BY total_sales DESC;

-- Purchases Trend by Year
SELECT EXTRACT(YEAR FROM purchase_date) as year, COUNT(purchase_date) as total_purchases_by_year
FROM clothing_sales
GROUP BY year
ORDER BY year;


-- DESIGNERS ANALYSIS:

-- Designer with the Highest Average Rating
SELECT designer_id, AVG(stars) as avg_stars
FROM clothing_sales
GROUP BY designer_id
ORDER BY avg_stars DESC
LIMIT 10;

-- Top Designers by Sales Volume
SELECT designer_id, COUNT(purchase_date) AS total_sales_by_designer
FROM clothing_sales
GROUP BY designer_id
ORDER BY total_sales_by_designer DESC
LIMIT 10;











