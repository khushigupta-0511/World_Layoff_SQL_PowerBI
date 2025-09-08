USE world_layoff;

SELECT * FROM layoffs;

CREATE TABLE layoff_staging
LIKE layoffs;

SELECT * FROM layoff_staging;

-- REMOVING DUPLICATES
-- STANDARDIZE THE DATA 
-- NULL VALUES OR BLANK VALUES 
-- REMOVE ANY COLUMNS 

INSERT layoff_staging
SELECT * 
FROM layoffs;

WITH duplicate_cte AS
(
SELECT *, 
ROW_NUMBER() OVER( 
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoff_staging
)
SELECT *
FROM duplicate_cte 
WHERE row_num > 1;

select * from layoff_staging 
where company = 'Airbnb';


CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * 
FROM layoff_staging2;

INSERT INTO layoff_staging2
SELECT *, 
ROW_NUMBER() OVER( 
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoff_staging;

DELETE
FROM layoff_staging2
WHERE row_num > 1;

SET SQL_SAFE_UPDATES = 0;

SELECT *
FROM layoff_staging2 
WHERE row_num > 1;

ALTER TABLE layoff_staging2
DROP COLUMN row_num;

-- STANDARDIZE THE DATA 

UPDATE layoff_staging2 
SET company = TRIM(company);

UPDATE layoff_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT industry 
FROM layoff_staging2 
ORDER BY industry;

SELECT * 
FROM layoff_staging2;

UPDATE layoff_staging2
SET country = 'United States'
WHERE country LIKE 'United States%';

select `date`
from layoff_staging2; 

UPDATE layoff_staging2
SET `date` = STR_TO_DATE(REPLACE(REPLACE(`date`, '/', '-'), '--', '-'), '%m-%d-%Y');

ALTER TABLE layoff_staging2 
MODIFY COLUMN `date` DATE;

-- NULL VALUES OR BLANK VALUES 

SELECT *
FROM layoff_staging2
WHERE industry IS NULL 
OR industry = '';

SELECT *
FROM layoff_staging2
WHERE company = "Bally's Interactive";

SELECT *
FROM layoff_staging2 t1
JOIN layoff_staging2 t2
	ON t1.company = t2.company 
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

UPDATE layoff_staging2 t1
JOIN layoff_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry 
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

SELECT DISTINCT industry
FROM layoff_staging2
ORDER BY 1;

UPDATE layoff_staging2 
SET industry = NULL 
WHERE industry = '';

SELECT * 
FROM layoff_staging2 
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

DELETE 
FROM layoff_staging2 
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

SELECT * FROM layoff_staging2;

-- EDA 

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoff_staging2;

SELECT * 
FROM layoff_staging2
WHERE percentage_laid_off = 1;

SELECT company, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`), MAX(`date`)
FROM layoff_staging2;

SELECT industry, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY industry 
ORDER BY 2 DESC;


SELECT country, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY country 
ORDER BY 2 DESC;

SELECT DATE_FORMAT(`date`, '%Y-%m') AS month, SUM(total_laid_off) AS monthly_layoff
FROM layoff_staging2
GROUP BY month
ORDER BY 1;

SELECT DATE_FORMAT(`date`, '%Y') AS	year, SUM(total_laid_off) AS yearly_layoff
FROM layoff_staging2
GROUP BY year 
ORDER BY year;

DELETE 
FROM layoff_staging2 
WHERE company = "Bally's Interactive";

SELECT *
FROM layoff_staging2
WHERE industry IS NULL;

-- ROLLING TOTAL
WITH Rolling_Total AS 
(
SELECT DATE_FORMAT(`date`, '%Y-%m') AS month, SUM(total_laid_off) AS monthly_layoff
FROM layoff_staging2
GROUP BY month
ORDER BY 1
)
SELECT month, monthly_layoff,
SUM(monthly_layoff) OVER(ORDER BY month) AS rolling_total 
FROM Rolling_Total;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoff_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

WITH company_year (company, years, total_laid_off)








