-- SQL queries for exploring Netflix titles data

-- Example: count titles by type
SELECT type, COUNT(*) AS title_count
FROM netflix_titles
GROUP BY type
ORDER BY title_count DESC;

-- Example: most common genres
SELECT listed_in, COUNT(*) AS genre_count
FROM netflix_titles
GROUP BY listed_in
ORDER BY genre_count DESC;
