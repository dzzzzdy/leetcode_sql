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
  FROM employee)
