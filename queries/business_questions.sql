-- SQL REQUEST to get the countries with more than 10M inhabitants and more than 100Bn GDP in USD 
-- Order by lowest population and bigest GDP


SELECT DISTINCT c.countryId, c.name, pop.metricValue AS "Population (M)", cm.metricValue AS "GDP (bn)"
FROM country c
INNER JOIN continent ct 
ON ct.continentId = c.continentId
INNER JOIN country_metrics cm
ON c.countryId = cm.countryId
INNER JOIN country_metrics pop
ON pop.countryId = c.countryId
WHERE cm.metricId = 4 
AND cm.metricValue > 100 
AND cm.metricYear = 2022
AND pop.metricId = 1
AND pop.metricValue > 10
AND pop.metricYear = 2022
AND c.countryId IN (
    
SELECT DISTINCT c.countryId FROM country c
INNER JOIN continent ct
ON ct.continentId = c.continentId
INNER JOIN country_metrics cm
ON c.countryId = cm.countryId
WHERE cm.metricId = 1
AND cm.metricValue > 10
AND cm.metricYear = 2022

)
ORDER BY cm.metricValue DESC, pop.metricValue ASC
;
