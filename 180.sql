# Write your MySQL query statement below
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM logs l1 JOIN logs l2
ON l1.id+1=l2.id
JOIN logs l3
ON l1.id+2=l3.id
WHERE l1.num=l2.num AND l2.num=l3.num;


SELECT DISTINCT t1.num AS ConsecutiveNums
FROM(
  SELECT
      num,
      LEAD(num,1) OVER() AS l2num,
      LEAD(NUM,2) OVER() AS l3num
  FROM logs) AS t1
WHERE t1.num=t1.l2num AND t1.l2num=t1.l3num
    
