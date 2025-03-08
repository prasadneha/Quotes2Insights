# Quotes2Insights

Quotes2Insights is a project that demonstrates the end-to-end process of extracting, cleaning, and analyzing web data. In this project, we scraped quotes from the website Quotes to Scrape, stored the data in CSV files, derived insights using SQL, and performed exploratory data analysis and visualizations using Python.

### Project Overview & Objective:

The objective of this project is to show how raw web data can be transformed into actionable insights. We accomplished this by:

- Web Scraping: Extracting quotes, authors, and tags from the website.
- SQL Insights: Loading the scraped data into a SQL database and answering key analytical questions (e.g., most quoted authors, top tags).
- Exploratory Data Analysis & Visualization: Using Python (Pandas, Matplotlib, Seaborn, and WordCloud) to analyze and visualize the data.
This process demonstrates the full pipeline—from data collection, cleaning, and normalization to drawing meaningful insights—crucial for data-driven decision-making.

### Files in the Repository:
- Web Scrapping.ipynb
Contains the Python script that scrapes the website, extracts the author, quote, and tag names, cleans the quote text, and saves the raw data as a CSV file (quotes_data.csv).

- quotes_data.csv
The CSV file generated from the web scraping process. It contains the raw scraped data with columns for the author, quote, and tag names.

- SQL_Insights.sql
Contains SQL queries and commands used to load the data into a SQL database, create normalized tables, and derive insights such as the number of quotes per author, top tags, and other key statistics.

- cleaned_dataset.csv
A cleaned version of the dataset generated in the EDA phase. In this file, missing values have been imputed and the data has been prepared for further analysis and visualization.

- EDA & Visualizations.ipynb
A Jupyter Notebook that performs exploratory data analysis and generates visualizations—including bar charts, word clouds, and pie charts—using the cleaned dataset.

### How to Run the Project:
1. Web Scraping:
Open and run Web Scrapping.ipynb in Jupyter Notebook to scrape the website and generate quotes_data.csv.

2. SQL Insights:
Load the dataset into your SQL database (e.g., MySQL) using the commands in SQL_Insights.sql to create normalized tables and derive insights.

3. Data Cleaning & EDA:
Open and run EDA & Visualizations.ipynb in Jupyter Notebook. In this notebook, missing values are imputed and the cleaned data is saved as cleaned_dataset.csv for further analysis and visualization.

### Project Team:

- Neha Prasad: Project Overview & Web Scraping 

- Nisha Kumari: SQL Insights

- Madduri Vinay Kumar: Exploratory Data Analysis & Data Visualization

### Dependencies:

- Python 3.x

- Jupyter Notebook

- Libraries: pandas, requests, BeautifulSoup, matplotlib, seaborn, wordcloud, and others as required.

- SQL Database: MySQL (or a similar database) for running SQL queries.
