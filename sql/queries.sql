# Query 1 - Jumlah Ikan per Spesies
SELECT
    Species,
    COUNT(*) AS Total_Fish
FROM fish_market_data
GROUP BY Species
ORDER BY Total_Fish DESC;

# Query 2 - Berat Rata-rata per Spesies
SELECT
    Species,
    ROUND(AVG(Weight),2) AS Avg_Weight
FROM fish_market_data
GROUP BY Species
ORDER BY Avg_Weight DESC;

# Query 3 - Ikan Terberat
SELECT *
FROM fish_market_data
ORDER BY Weight DESC
LIMIT 10;

# Query 4 - Panjang Rata-rata per Spesies
SELECT
    Species,
    ROUND(AVG(Length3),2) AS Avg_Length
FROM fish_market_data
GROUP BY Species
ORDER BY Avg_Length DESC;

# Query 5 - Klasifikasi Berat
SELECT
    Species,
    Weight,
    CASE
        WHEN Weight < 300 THEN 'Small'
        WHEN Weight < 700 THEN 'Medium'
        ELSE 'Large'
    END AS Size_Category
FROM fish_market_data;

# Query 6 - Statistik Spesies
SELECT
    Species,
    COUNT(*) AS Total_Fish,
    ROUND(AVG(Weight),2) AS Avg_Weight,
    ROUND(MAX(Weight),2) AS Max_Weight,
    ROUND(MIN(Weight),2) AS Min_Weight
FROM fish_market_data
GROUP BY Species;

# Query 7 - Ranking Berat
SELECT
    Species,
    Weight,
    RANK() OVER (
        PARTITION BY Species
        ORDER BY Weight DESC
    ) AS Weight_Rank
FROM fish_market_data;
