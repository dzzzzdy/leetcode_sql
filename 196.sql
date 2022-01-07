DELETE FROM person
WHERE id NOT IN(
SELECT rank_table.id FROM(
  SELECT 
      id,
      ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) as ranking
  FROM person) AS rank_table
WHERE rank_table.ranking=1)
