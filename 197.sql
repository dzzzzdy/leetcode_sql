SELECT w1.id
FROM weather w1 JOIN weather w2 
ON DATEDIFF(w1.recorddate, w2.recorddate)=1
WHERE w1.temperature>w2.temperature;

SELECT w1.id
FROM weather w1 JOIN weather w2 
ON W1.recorddate=DATE_ADD(w2.recorddate,INTERVAL 1 day)
WHERE w1.temperature>w2.temperature
