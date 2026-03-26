YouTube Trending Video Analytics

📌 Project Overview
This project analyzes YouTube trending videos across multiple countries to uncover patterns in content popularity, audience engagement, and sentiment.
The goal is to understand what makes videos trend and how factors like category, sentiment, and region influence performance.

🎯 Objectives
- Identify most popular video categories
- Analyze sentiment impact on views and engagement
- Compare trending behavior across countries
- Study time taken for videos to trend
- Build interactive dashboards for insights

🛠️ Tools & Technologies
- Python (Pandas, Matplotlib, Seaborn)
- SQL (MySQL for data analysis)
- Power BI (Dashboard visualization)

📂 Dataset Description
The dataset contains YouTube trending video data from multiple countries with the following key features:
- video_id – Unique video identifier
- title – Video title
- channel_title – Channel name
- country – Country code
- views, likes, comments – Engagement metrics
- published_at, trending_date – Dates
- engagement_rate – Calculated metric
- days_to_trend – Time taken to trend
- category – Video category
- sentiment – Positive / Neutral / Negative

⚙️ Project Workflow

1️⃣ Data Cleaning & Preprocessing
- Removed missing values
- Standardized date formats
- Cleaned text data (titles, channels)

2️⃣ Feature Engineering
- Calculated engagement rate
- Derived days_to_trend
- Processed sentiment scores

3️⃣ Sentiment Analysis
- Applied sentiment analysis on video titles
- Classified into:
- Positive
- Neutral
- Negative

4️⃣ SQL Analysis
- Ranked categories by average views
- Country-wise category ranking
- Category vs sentiment performance
- Engagement analysis

5️⃣ Data Visualization
Built dashboards showing:
- Popular categories
- Sentiment distribution
- Engagement vs views
- Region-wise insights
- Trending behavior over time

📊 Key Insights
- Positive sentiment videos generally receive higher views and engagement
- Categories like Entertainment, Music, and Education dominate trending lists
- Most videos trend within a few days
- High views ≠ high engagement (content quality matters)
- Audience preferences vary significantly by region
