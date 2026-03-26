CREATE DATABASE youtube_analysis;
USE youtube_analysis;
CREATE TABLE youtube_data (
    video_id VARCHAR(50),
    title TEXT,
    channel_title VARCHAR(255),
    country VARCHAR(10),
    views BIGINT,
    likes BIGINT,
    comments BIGINT,
    published_at DATETIME,
    trending_date DATETIME,
    engagement_rate FLOAT,
    days_to_trend INT,
    popularity VARCHAR(20),
    title_clean TEXT,
    channel_clean VARCHAR(255),
    category VARCHAR(50),
    sentiment_scores TEXT,
    neg FLOAT,
    neu FLOAT,
    pos FLOAT,
    compound FLOAT,
    sentiment VARCHAR(20)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/youtube_data.csv'
INTO TABLE youtube_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(video_id, title, channel_title, country, views, likes, comments,
 @published_at, @trending_date, engagement_rate, days_to_trend,
 popularity, title_clean, channel_clean, category, sentiment_scores,
 neg, neu, pos, compound, sentiment)
SET 
published_at = STR_TO_DATE(@published_at, '%d-%m-%Y %H:%i:%s'),
trending_date = STR_TO_DATE(@trending_date, '%d-%m-%Y %H:%i:%s');

SELECT COUNT(*) FROM youtube_data;
SELECT * FROM youtube_data LIMIT 10;
SELECT DISTINCT category FROM youtube_data;

# BASIC DATA CLEANING
SELECT * FROM youtube_data WHERE views IS NOT NULL AND category IS NOT NULL;
SELECT category, COUNT(*) AS total FROM youtube_data GROUP BY category ORDER BY total DESC;

# RANK CATEGORIES BY AVG VIEWS
SELECT category, ROUND(AVG(views), 2) AS avg_views FROM youtube_data GROUP BY category ORDER BY avg_views DESC;

# COUNTRY-WISE CATEGORY RANKING
SELECT country, category, ROUND(AVG(views),2) AS avg_views, RANK() OVER (PARTITION BY country ORDER BY AVG(views) DESC) from youtube_data GROUP BY country, category;

# TOP 5 CATEGORIES ONLY
SELECT * FROM (SELECT category, ROUND(AVG(views), 2) AS avg_views, RANK() OVER (ORDER BY AVG(views) DESC) AS rank_position FROM youtube_data GROUP BY category) ranked WHERE rank_position <=5;

# CATEGORY + SENTIMENT ANALYSIS
SELECT category, sentiment, ROUND(AVG(views), 2) AS avg_views FROM youtube_data GROUP BY category, sentiment ORDER BY category, avg_views DESC;

# CATEGORY + ENGAGEMENT
SELECT category, ROUND(AVG(engagement_rate), 4) AS avg_engagement FROM youtube_data GROUP BY category ORDER BY avg_engagement DESC;

# EXPORT FOR POWER BI
SELECT category, ROUND(AVG(views), 2) AS avg_views FROM youtube_data GROUP BY category ORDER BY avg_views DESC;