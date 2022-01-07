CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select DISTINCT salary AS getNthHighestSalary from
(select id,salary,DENSE_RANK() over (order by salary desc)AS ranking from Employee ) as rank_table
     WHERE rank_table.ranking=N
  );
END
