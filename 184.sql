SELECT 
    rank_table.Department,
    rank_table.Employee,
    rank_table.Salary
FROM(    
  SELECT
      d.name AS Department,
      e.name AS Employee,
      e.salary,
      RANK() OVER(
              PARTITION BY e.departmentid 
              ORDER BY e.salary DESC) AS ranking
  FROM employee e JOIN department d
  ON e.departmentid=d.id) AS rank_table
WHERE rank_table.ranking=1
