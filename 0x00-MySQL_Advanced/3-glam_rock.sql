-- Import the band data if not already done
-- source /path/to/metal_bands.sql

-- Ensure the SQL mode allows zero dates
SET sql_mode = '';

-- Select bands with Glam rock as their main style and compute lifespan
SELECT
    band_name,
    TIMESTAMPDIFF(YEAR, formed, IFNULL(split, '2022-01-01')) AS lifespan
FROM
    bands
WHERE
    band_name IN (SELECT band_name FROM styles WHERE style = 'Glam rock')
ORDER BY
    lifespan DESC;
