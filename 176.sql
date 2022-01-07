SELECT 
IFNULL(
  (SELECT DISTINCT salary 
  FROM employee
  ORDER BY salary DESC 
  LIMIT 1 
  OFFSET 1),
  null)AS SecondHighestSalary;
  
  
  SELECT MAX(salary) AS SecondHighestSalary
FROM employee
WHERE salary<(
  SELECT MAX(salary)
  FROM employee);
  
SELECT IFNULL(
  (SELECT distinct salary 
   FROM(
    SELECT 
      salary,
      RANK()OVER(ORDER BY salary DESC) as ranking
    FROM employee) as rank_table 
    WHERE rank_table.ranking=2) 
    ,null) AS SecondHighestSalary
