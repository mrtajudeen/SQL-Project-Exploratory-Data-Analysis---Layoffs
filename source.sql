-- Exploratory Data Analysis

SELECT * 
FROM layoffs_staging2;


-- Maximum lay offs in one day
SELECT MAX(total_laid_off)
FROM layoffs_staging2; -- 12000 That;s a lot in one day

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2; --  1, That literally means the whole company went under


-- Lets see which companies are those
-- These are companies that completely went under
SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off desc; -- 116 rows returned


-- Lets order by the amount of funding
SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions desc; 
-- That's a lot of funds raised, 2.4 billions just to loose it all


-- check total number of people laidoff across the companies
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP by company
ORDER BY 2 DESC;
-- Of course it had to be Amazon at the top. (18150)


-- Lets check our date range
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2; -- FROM 2020 to 2023


-- Lets check th industry to see what industry was affected the most
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP by industry
ORDER BY 2 DESC;
-- yh, transportation was gonna be up there because covid hit and everyone was at home.
-- And of course consumer and retail indsutry.
-- By manufacturing was still running good.


-- Lets check the country
-- I can already guess this.
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP by country
ORDER BY 2 DESC;
-- My beliefs confirmed, its United states at the top, 256k lost their jobs in 3 years



-- Lets check the date by year
SELECT 	YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP by 1
ORDER BY 1 DESC; -- The most layoff happened in 2022, then 2023



-- Lets check the stage
SELECT 	stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP by 1
ORDER BY 2 DESC; 


-- Lets check Rolling Total layoffs

SELECT substring(`date`, 1, 7) AS MONTH, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY 1
ORDER BY 1;

WITH Rolling_total AS (
SELECT substring(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY 1
ORDER BY 1
)
SELECT `MONTH`, 
total_off, 
SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_total;

-- That looks good. We see the progession of layoffs from 2020 month by month


-- Now lets check the companies
-- To see how the companies rank year by year in terms of layoffs 
-- and which companies had the highest layoffs in each year
-- we check the first 5 ranks for each year
-- we had some ties for some companies in some years

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP by 1, 2
ORDER BY 1;  
-- 1. First we check the companies and their total lay offs per year

WITH company_year (company, years, total_laid_off) AS (
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP by 1, 2
ORDER BY 1, 3
-- 2. Then we create a cte for that to query off it for ranking
), Company_Year_Rank AS (
SELECT *, 
dense_rank() OVER(PARTITION BY years order by total_laid_off desc) AS ranking
FROM company_year
WHERE years is not null
-- 3. We Rank to see the companies with the highest lay offs per year
)
SELECT * 
FROM Company_Year_Rank
WHERE ranking <= 5
-- 4. Finally we want to filter to see only the first 5 ranks for each year

-- This is really interesting was really intense.
-- We are done for now.
