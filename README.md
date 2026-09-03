# Intro to SQL & BigQuery Analytics

[_🇧🇷 Clique aqui para ler a versão em português 🇧🇷_](https://github.com/jon-fig/Intro-to-SQL-Course/blob/main/README_PT.md)
# Summary
I first studied SQL a few years ago, learning the core principles, tinkering in MySQL, and starting projects that never quite saw the light of day. Taking this course allowed me to reconnect with that foundation, build deeper technical knowledge, and test my skills against real-world datasets—which made me appreciate SQL so much more.

I’ve always been someone who learns by doing rather than consuming pure theory. Hands-on practice in the notebook editor forced me to really look under the hood and make sense of query execution—like realizing how aggregations create calculated columns that need to be explicitly referenced, or mastering the exact logic behind HAVING vs. WHERE.

This Kaggle course gave me a far stronger grasp of relational query logic and the basics of working with Google BigQuery data warehouses. [Link to the Kaggle Course](https://www.kaggle.com/learn/intro-to-sql/course)


# Key Takeaways & Query Logic
Since I already had a foundational understanding of core spreadsheet tools like Excel and basic database concepts (SELECT, FROM), this course focused heavily on leveling up my SQL syntax, cloud data architecture, and query optimization.

Here are the key technical concepts and "lightbulb" moments I mastered through hands-on practice in the Kaggle notebook editor:

# BigQuery Python SDK & Data Architecture:

Learned how Google BigQuery structures data hierarchically (Projects > Datasets > Tables).

Mastered the Python API workflow: initializing a bigquery.Client() object, building dataset/table references, and using API calls to inspect schemas before running expensive queries.

Learned how to preview rows using .to_dataframe() and how to configure query size limits/job configs to prevent accidental data quota overages.

# Query Mechanics & Aggregations:

Re-imprinted the simplicity of using COUNT(*) to count total rows instead of hunting down specific column names to reference.

Understood how multi-line SQL strings are structured in Python using triple quotes (""").

Filtering and Date Extraction (WHERE & EXTRACT):

Practiced filtering temporal data on the fly by using EXTRACT directly within WHERE clauses.

Learned how to chain multiple conditions together using AND inside WHERE statements.

# WHERE vs. HAVING Execution Order:

WHERE filters individual raw rows before any grouping happens.

HAVING filters aggregated data after the GROUP BY clause is executed and can only be used with aggregate columns.

# GROUP BY & ORDER BY Rules:

Learned the hard way that any non-aggregated column in your SELECT statement must be explicitly listed in your GROUP BY.

Remembered the strict clause order: GROUP BY must come before ORDER BY.

# Subqueries & CTEs (WITH):

Mastered building cleaner, modular queries using Common Table Expressions (WITH ... AS (...)) to break complex logic into digestible steps, making sure to properly reference the CTE in the subsequent SELECT statement. 

# Multi-Table Relational Logic (INNER JOIN):

Understood how SQL builds combined in-memory tables via the ON bridging key (q.id = a.parent_id).

Mastered explicit table aliasing (q. vs a.) to scope columns selectively—learning that join keys don't need to be exposed in the SELECT clause if they aren't required in the final output.
