-- ============================================================
-- Kaggle: Intro to SQL Course Solutions
-- Author: Jonatas Figueiredo
-- Target Database: Google BigQuery Public Datasets
-- ============================================================
/*
============================================================
BigQuery Python SDK Setup & Query Execution Example
============================================================
This snippet demonstrates how BigQuery queries are initialized,
configured with safety thresholds, and executed via Python.


from google.cloud import bigquery

# 1. Initialize BigQuery Client
client = bigquery.Client()

# 2. Define Query (Example: Aggregating Stack Overflow Answers)
sql_query = """
SELECT 
    a.owner_user_id AS user_id, 
    COUNT(1) AS number_of_answers
FROM `bigquery-public-data.stackoverflow.posts_answers` AS a
INNER JOIN `bigquery-public-data.stackoverflow.posts_questions` AS q
    ON q.id = a.parent_id
WHERE q.tags LIKE '%bigquery%'
GROUP BY user_id
ORDER BY number_of_answers DESC
"""

# 3. Configure Query Safety Limits (Prevent queries > 10GB from running)
safe_config = bigquery.QueryJobConfig(maximum_bytes_billed=10**10)

# 4. Submit Query Job to BigQuery Cloud Engine
query_job = client.query(sql_query, job_config=safe_config)

# 5. Fetch Results into a Pandas DataFrame
results_df = query_job.to_dataframe()

# Preview Top 5 Rows
print(results_df.head())
*/


-- ------------------------------------------------------------
-- Concept: Data Summarization & Group Filtering (HAVING)
-- Dataset: Hacker News 
-- ------------------------------------------------------------
SELECT `by` AS author, COUNT(*) AS NumPosts
        FROM `bigquery-public-data.hacker_news.full`
        GROUP BY author
        HAVING COUNT(*) > 10000;

-- ------------------------------------------------------------
-- Filtering Raw vs. Aggregated Data (WHERE & HAVING)
-- Dataset: World Bank International Education
-- ------------------------------------------------------------
SELECT indicator_code, indicator_name, COUNT(*) AS num_rows
        FROM `bigquery-public-data.world_bank_intl_education.international_education`
        WHERE year = 2016
        GROUP BY indicator_code, indicator_name
        HAVING num_rows >= 175
        ORDER BY indicator_name DESC;

---------------------------------------------------------------
-- Concept: Modular CTEs & Temporal Aggregations (EXTRACT)
-- Dataset: Chicago Taxi Trips
-- ------------------------------------------------------------
WITH RelevantRides AS
    (
        SELECT EXTRACT(HOUR FROM trip_start_timestamp) AS hour_of_day, 
        trip_seconds, trip_miles
        FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
        WHERE trip_start_timestamp > '2016-01-01' 
        AND  trip_start_timestamp < '2016-04-01' 
        AND trip_seconds > 0 AND trip_miles > 0
    )
        SELECT hour_of_day, COUNT(*) AS num_trips, 
        3600 * SUM(trip_miles) / SUM(trip_seconds) AS avg_mph
        FROM RelevantRides
        GROUP BY hour_of_day
        ORDER BY hour_of_day ASC;

-- ------------------------------------------------------------
-- Concept: Multi-Table Relational Join (INNER JOIN)
-- Dataset: Stack Overflow
-- ------------------------------------------------------------
SELECT a.owner_user_id AS user_id, COUNT(*) AS number_of_answers
        FROM `bigquery-public-data.stackoverflow.posts_answers` AS a
        INNER JOIN `bigquery-public-data.stackoverflow.posts_questions` AS q
        ON q.id = a.parent_id
        WHERE q.tags LIKE '%bigquery%'
        GROUP BY user_id
        ORDER BY number_of_answers DESC;
