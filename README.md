# Intro-to-SQL-Course
# Lesson 1: Getting Started With SQL and BigQuery

This introductory module covers the fundamentals of accessing, navigating, and inspecting large-scale public datasets hosted on Google BigQuery using Python and SQL. Rather than querying raw local databases, this lesson focuses on cloud data architecture, structural data hierarchies, and schema exploration using the Google Cloud BigQuery API client.

Key Concepts & Technical Architecture
1. BigQuery Data Organization Hierarchy
Data in BigQuery is organized in a strict 4-tier structural hierarchy:

Client Object: The main entry point in Python (bigquery.Client()) used to manage connections and handle API calls to the service.

Project: The overarching container housing datasets and billing/resource tracking (e.g., bigquery-public-data).

Dataset: A collection of related tables grouped logically (e.g., hacker_news or chicago_crime).

Tables: The individual data structures containing actual rows and columns.

2. Python SDK Workflow & API Requests
Interacting with BigQuery via Python follows an explicit reference-and-fetch pipeline to minimize network overhead:

Constructing References: Functions like dataset_ref or table_ref build an address pointer to the target dataset or table without downloading actual data.

Executing API Calls: Functions like client.get_dataset() or client.get_table() send an explicit network request to fetch metadata.

3. Table Schema Inspection
Before running queries, inspecting the table schema is critical to understanding column names, data types, and field descriptions.

A schema consists of a list of SchemaField objects.

Each field provides structural metadata:

name: The column name.

field_type: The SQL data type stored (e.g., STRING, INTEGER, TIMESTAMP).

mode: Field nullability constraints (e.g., NULLABLE or REQUIRED).

description: A human-readable summary of what the column represents.
