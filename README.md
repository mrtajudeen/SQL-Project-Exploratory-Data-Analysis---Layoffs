# 📊 Layoffs Data Exploration Project (SQL)

Welcome to the **Layoffs SQL Data Exploration Project**, where we analyze real-world layoff data to uncover insights into global workforce reductions between 2020 and 2023. This project follows the data cleaning phase and focuses purely on understanding the patterns behind layoffs across companies, industries, countries, and time.

---

## 🧠 Project Objective

The goal of this project is to perform **exploratory data analysis (EDA)** on a cleaned dataset of company layoffs. Using SQL, we extract high-level trends, identify key players in mass layoffs, and observe the progression of layoffs over time.

---

## 📦 Dataset

- **Source:** [Kaggle - Layoffs 2022 Dataset](https://www.kaggle.com/datasets/swaptr/layoffs-2022)  
- **Time Range:** 2020 to 2023  
- **Fields:** Company, Industry, Country, Stage, Total Laid Off, Percentage Laid Off, Funds Raised, Date, etc.

---

## ⚙️ Tools & Skills Used

- **MySQL** for querying and data manipulation  
- **SQL Window Functions** (e.g., `DENSE_RANK`, `ROW_NUMBER`, `OVER`)  
- **Aggregate Functions** (`SUM`, `MAX`, etc.)  
- **CTEs** (Common Table Expressions) for modular querying  
- **Date Functions** and string formatting for time-based analysis

---

## 🔍 Key Insights Explored

### 📅 Timeline Analysis
- Identified the **peak layoff year** (2022) and observed how layoffs evolved **month-by-month** from 2020 to 2023.
- Created a **rolling total of layoffs**, showing cumulative trends over time.

### 🏢 Company Analysis
- Determined which companies laid off the most employees.
- Ranked top 5 companies with highest layoffs **year-by-year**.
- Found companies that **shut down entirely** (100% layoffs).

### 🌍 Country & Industry Breakdown
- Discovered the **United States** had the highest number of layoffs.
- Identified **Transportation, Retail, and Consumer industries** as the most affected sectors.

### 🚀 Funding & Stage Impact
- Analyzed layoffs relative to the **funds raised** and company **funding stage** (e.g., Series A, B, IPO).
- Noted surprising cases of large layoffs despite massive capital investments.

---

## ✅ Results

- The data was transformed into an **insight-rich** structure.
- Observed **temporal, geographical, and industry-based patterns** in layoffs.
- Highlighted **business lifecycle impact** on workforce cuts.

---

## 🧭 Next Steps

- Perform visualization in tools like **Power BI** or **Tableau**  
- Combine this dataset with **macroeconomic indicators** (e.g., inflation, unemployment)  
- Build a **dashboard** for real-time layoff trends  
- Predict future layoff trends using **ML models** (optional)

---

## 🤝 Contributions & Feedback

Want to add charts, extend queries, or suggest improvements?  
Feel free to fork the repository, submit a pull request, or open an issue. Contributions are always welcome!

---

## 🏷️ Tags

`#SQL` `#DataExploration` `#MySQL` `#Layoffs` `#KaggleProject` `#EDA` `#BusinessAnalytics`
