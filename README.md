<div align="center">

![Swiggy Restaurant Analytics](https://capsule-render.vercel.app/api?type=waving&color=0:fc8019,50:f97316,100:2563eb&height=220&section=header&text=Swiggy%20Restaurant%20Analytics&fontSize=38&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=Advanced%20SQL%20Analytics%20Portfolio%20Project&descAlignY=58&descSize=18)

[![Typing SVG](https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=600&size=22&duration=2500&pause=700&color=FC8019&center=true&vCenter=true&width=900&lines=61K%2B+Swiggy+Restaurants+Analyzed;Advanced+SQL+%2B+Interactive+Web+Dashboard;Cuisine+Demand+%7C+Pricing+%7C+City+Insights;Built+by+Ambrish+Mishra)](https://git.io/typing-svg)

![SQL](https://img.shields.io/badge/SQL-MySQL-f97316?style=for-the-badge&logo=mysql&logoColor=white)
![Data Analytics](https://img.shields.io/badge/Data-Analytics-2563eb?style=for-the-badge&logo=databricks&logoColor=white)
![Dashboard](https://img.shields.io/badge/Web-Dashboard-fc8019?style=for-the-badge&logo=react&logoColor=white)
![Status](https://img.shields.io/badge/Project-Completed-16a34a?style=for-the-badge)

</div>

---

## Project Snapshot

This project analyzes **61,425 Swiggy restaurant records** using MySQL and presents the analysis through an interactive portfolio-style web dashboard. It focuses on restaurant density, cuisine demand, customer ratings, pricing patterns, customer engagement, and city-level expansion opportunities.

The project follows a complete analytics workflow from database setup and data cleaning to exploratory analysis, business analysis, advanced SQL, optimization, and dashboard presentation.

---

## Interactive Web Dashboard

The project includes a browser-based dashboard built from the SQL analysis.

### Dashboard Highlights

- Landing page with project intro and animated transition
- Full CSV integration with **61,425 restaurant records**
- Summary cards for total restaurants, average rating, top city, and top cuisine
- Filters for city, cuisine, cost segment, and rating segment
- Charts for city density, cuisine distribution, and price-band ratings
- SQL query runner with highlighted SQL preview
- Export query results as CSV
- Mobile-friendly layout with scroll support

> Open `index.html` in the project folder or run a local server to view the dashboard.

---

## Dataset Overview

| Column | Description |
|---|---|
| `id` | Unique restaurant identifier |
| `name` | Restaurant name |
| `city` | City where the restaurant operates |
| `rating` | Customer rating |
| `rating_count` | Number of customer ratings or reviews |
| `cuisine` | Primary cuisine category |
| `cost` | Approximate restaurant cost |
| `link` | Swiggy restaurant page link |

---

## Key Metrics

| Metric | Value |
|---|---:|
| Total Records | **61,425** |
| Average Rating | **3.89** |
| Average Cost | **₹298** |
| City With Most Restaurants | **Bangalore** |
| Most Common Cuisine | **North Indian** |
| Top Restaurant by Rating Confidence | **SUNSHINE SHAKE, Rohtak** |

---

## Insights at a Glance

<details open>
<summary><b>Restaurant Network</b></summary>

- Bangalore has the largest restaurant network with **6,580 restaurants**.
- Chennai, Delhi, Hyderabad, and Pune also show strong restaurant density.
- City-wise analysis helps identify saturated markets and expansion opportunities.

</details>

<details>
<summary><b>Top Cities by Restaurant Count</b></summary>

| Rank | City | Restaurants |
|---:|---|---:|
| 1 | Bangalore | 6,580 |
| 2 | Chennai | 4,849 |
| 3 | Delhi | 4,592 |
| 4 | Hyderabad | 4,489 |
| 5 | Pune | 3,765 |

</details>

<details>
<summary><b>Top Cuisines by Restaurant Count</b></summary>

| Rank | Cuisine | Restaurants |
|---:|---|---:|
| 1 | North Indian | 10,485 |
| 2 | Chinese | 6,465 |
| 3 | Indian | 5,789 |
| 4 | Biryani | 4,637 |
| 5 | South Indian | 4,387 |

</details>

<details>
<summary><b>Pricing and Customer Value</b></summary>

- Premium restaurants generally achieve stronger average customer ratings.
- Several affordable restaurants deliver high ratings at lower cost.
- Custom KPIs such as Customer Value Index and Budget Champion Score reveal insights beyond raw ratings.

</details>

---

## SQL Analysis Covered

### Basic SQL

- Retrieve all restaurant records
- Sort restaurants by rating and cost
- Filter restaurants by city, cuisine, rating, and cost
- Find unique cities and cuisine categories

### Intermediate SQL

- Restaurant count by city
- Cuisine popularity analysis
- Rating and cost distribution
- Premium vs budget restaurant comparison
- Underrated and overpriced restaurant detection
- City-level expansion opportunity scoring

### Advanced SQL

- Common Table Expressions
- Correlated subqueries
- Window functions
- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `LAG()`
- `LEAD()`
- `NTILE()`
- Running averages

### Optimization SQL

- Views
- Stored procedures
- Single-column indexes
- Composite indexes
- Query optimization with `EXPLAIN`

---

## Business KPIs Designed

### Customer Value Index

Measures restaurant value by balancing customer rating, review confidence, and cost.

```sql
SELECT
    name,
    city,
    rating,
    rating_count,
    cost,
    ROUND((rating * LN(rating_count + 1)) / cost, 5) AS customer_value_index
FROM restaurant
ORDER BY customer_value_index DESC;
```

### Popularity Score

Measures restaurant popularity using customer rating and rating count.

```sql
SELECT
    name,
    city,
    rating,
    rating_count,
    ROUND(rating * rating_count, 2) AS popularity_score
FROM restaurant
ORDER BY popularity_score DESC;
```

### Budget Champion Score

Identifies restaurants delivering high customer satisfaction at affordable prices.

```sql
SELECT
    name,
    rating,
    cost,
    ROUND(rating / cost, 5) AS budget_score
FROM restaurant
WHERE cost > 30
ORDER BY budget_score DESC;
```

---

## Sample Business Query

```sql
SELECT
    city,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(cost), 2) AS avg_cost,
    ROUND(AVG(rating) / AVG(cost), 5) AS value_score
FROM restaurant
GROUP BY city
HAVING COUNT(*) >= 20
ORDER BY value_score DESC;
```

---

## Project Files

| File | Purpose |
|---|---|
| `01_database_setup.sql` | Database creation, table creation, and import checks |
| `02_data_cleaning.sql` | Duplicate checks, missing values, invalid ratings, and cost validation |
| `03_exploratory_analysis.sql` | Rating, city, cuisine, cost, and popularity exploration |
| `04_business_analysis.sql` | Business-focused SQL questions and insight generation |
| `05_advanced_analysis.sql` | CTEs, subqueries, window functions, and custom KPIs |
| `06_optimization_views.sql` | Views, indexes, stored procedures, and query optimization |
| `restaurant.csv` | Raw Swiggy restaurant dataset |
| `swiggy_data.js` | Browser-ready dataset generated from the CSV |
| `index.html` | Interactive SQL portfolio dashboard |
| `README.md` | Project documentation and GitHub presentation |

---

## Required File Structure

Keep these files together in the same project folder so the dashboard and SQL project work correctly.

```text
Swiggy-SQL-analytics-main/
|
|-- README.md
|-- index.html
|-- swiggy_data.js
|-- restaurant.csv
|-- 01_database_setup.sql
|-- 02_data_cleaning.sql
|-- 03_exploratory_analysis.sql
|-- 04_business_analysis.sql
|-- 05_advanced_analysis.sql
|-- 06_optimization_views.sql
```

### Why Each File Is Needed

| Required File | Needed For |
|---|---|
| `index.html` | Main interactive dashboard and SQL portfolio |
| `swiggy_data.js` | Loads the full CSV dataset into the browser dashboard |
| `restaurant.csv` | Original source dataset |
| SQL files | Database setup, cleaning, analysis, advanced SQL, and optimization |
| `README.md` | Project explanation, documentation, and GitHub presentation |

> Important: `index.html` depends on `swiggy_data.js`, so both files must stay in the same folder.

---

## Tools and Technologies

<div align="center">

| Tool | Use |
|---|---|
| MySQL | SQL analysis and query writing |
| MySQL Workbench | Query execution and database workflow |
| CSV | Raw dataset storage |
| HTML, CSS, JavaScript | Dashboard structure and interactivity |
| React CDN | Browser-based UI rendering |
| AlaSQL | In-browser SQL execution |
| Tailwind CSS | Responsive dashboard styling |
| Git and GitHub | Version control and project publishing |

</div>

---

## Business Value

This project shows how SQL can support restaurant marketplace decisions by:

- Identifying high-density restaurant cities
- Measuring cuisine demand and category strength
- Comparing premium, mid-range, and budget restaurant performance
- Finding underrated restaurants worth promoting
- Detecting overpriced restaurants with weak customer satisfaction
- Designing custom KPIs for restaurant value and popularity
- Supporting city-level expansion decisions

---

## Learning Outcomes

Through this project, I practiced:

- Writing structured SQL analysis from raw data
- Cleaning and validating real-world restaurant data
- Building reusable business KPIs
- Applying advanced SQL concepts to business problems
- Using views, indexes, stored procedures, and `EXPLAIN`
- Turning SQL results into an interactive portfolio dashboard

---

## How to Run

### Option 1: Open Directly

Open `index.html` in your browser.

### Option 2: Run With Local Server

```bash
python -m http.server 8765
```

Then open:

```text
http://127.0.0.1:8765/index.html
```

---

## Make It Live With GitHub Pages

After uploading this project to GitHub:

1. Open your repository on GitHub.
2. Go to `Settings`.
3. Open `Pages` from the left sidebar.
4. Under `Build and deployment`, choose:
   - Source: `Deploy from a branch`
   - Branch: `main`
   - Folder: `/root`
5. Click `Save`.

Your live project link will look like this:

```text
https://your-github-username.github.io/your-repository-name/
```

For this project:

```text
https://ambrishmishra847.github.io/Swiggy-SQL-analytics-main/
```

---

## Author

<div align="center">

### Ambrish Mishra

Bachelor of Technology in Computer Science and Engineering  
Greater Noida Institute of Technology, 2022-2026

[![GitHub](https://img.shields.io/badge/GitHub-ambrishmishra847-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ambrishmishra847)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Ambrish%20Mishra-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ambrishmishra847)
[![Email](https://img.shields.io/badge/Email-ambrishmishra847%40gmail.com-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:ambrishmishra847@gmail.com)

</div>

---

<div align="center">

### If you like this project, consider giving it a star.

![Footer](https://capsule-render.vercel.app/api?type=waving&color=0:2563eb,50:f97316,100:fc8019&height=120&section=footer)

</div>
