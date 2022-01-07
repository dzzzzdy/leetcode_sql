SELECT
    rank_table.Department,
    rank_table.Employee,
    rank_table.Salary
FROM 
(SELECT 
    d.name as Department,
    e.name as Employee,
    e.salary as Salary,
    DENSE_RANK() OVER(
                    PARTITION BY e.departmentid
                    ORDER BY salary DESC) as ranking
FROM employee e JOIN department d
ON e.departmentid=d.id)AS rank_table
WHERE rank_table.ranking in(1,2,3)
