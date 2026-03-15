# World Layoffs Analysis - SQL and Power BI 

## Project Overview
This project analyzes global layoff trends using SQL for data cleaning and exploratory analysis and Power BI for interactive visualization. The objective was to transform a raw dataset into structured insights that reveal patterns in layoffs across companies, industries, countries and time periods.

The project began as a SQL data cleaning exercise and was later extended to include advanced SQL-based exploratory analysis and a business-oriented dashboard, demonstrating how raw datasets can be converted into actionable insights for decision-making.

## Objectives
- Clean and standardize a large layoff dataset using SQL.
- Performing **exploratory data analysis (EDA)** to uncover trends and patterns.
- Identify **key drives of layoffs** across industries and regions.
- Build a **Power BI dashboard** to communicate insights through visual storytelling.
- Demonstrate a complete analytics worflow: **Data cleaning - Analysis - Visualization**.

## Tools 
- MySQL- Data cleaning, transformation and analysis
- SQL Workbench- Data manipulation, aggregation and trend analysis
- Excel- Initial dataset inspection
- Power BI- Interactive dashboard and visualization

## Dataset Overview

The dataset contains records of layoffs across global companies.

Key attributes include:
-Company
-Industry
-Country
-Date
-Total Laid Off
-Percentage Laid Off
-Funding Stage
-Funds Raised

## Data Preparation
The dataset was cleaned and standardized using MySQL to ensure accuracy for analysis.

Key steps included:
- Removing duplicate records
- Handling missing and NULL values
- Standardizing company and industry names
- Converting and formatting date fields
- Creating structure tables for analysis

SQL techniques used:
- Common Table Expressions(CTEs)
- Window Functions
- Conditional logic (CASE WHEN)
- Aggregation (GROUP BY, COUNT, SUM)
- Data validation using IS NULL

 ## Exploratory Data Analysis 
 Using SQL, several analytical queries were performed to identify key trends:

**Analysis Performed**
- Total layoffs by company
- Layoffs distribution by industry
- Layoffs by country
- Yearly and monthly layoff trends
- Companies with the highest layoffs
- Layoffs by funding stage

**This helped uncover patterns such as:**
- Which industries were most affected
- How layoffs changed across different years
- Geographic concentration of layoffs

## Power BI Dashboard 
An interactive dashboard to visualize the insights.

**Key Dashboard Metrics (KPIs)**

- Total Layoffs
- Layoffs by Industry 
- Layoffs by Country
- Layoffs Trend Over Time
- Top Companies by Layoffs

**Features:**
- Interactive filters for Stage, Company, and Industry
- Cross-filtering across visuals
- Time-series and geographic analysis

## Key Insights

The analysis revealed several important patterns:

- A small number of companies contributed to a significant proportion of total layoffs
- Certain industries experienced substantially higher layoffs during economic slowdowns
- Layoff activity showed clear spikes during specific time periods, indicating macroeconomic influence
- Technology and startup ecosystems were particularly affected by workforce reductions

These insights highlight how economic cycles and funding environments influence employment stability across industries.

## Author
Khushi Gupta 




  
