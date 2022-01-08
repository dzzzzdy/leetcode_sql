SELECT 
a.Day,
ROUND((a.num_of_cancal/a.total),2) AS `Cancellation Rate`
FROM
(SELECT Request_at Day,
    COUNT(*) AS total,
    SUM(CASE WHEN status LIKE "cancell%" THEN 1
    ELSE 0
    END) AS num_of_cancal
FROM Trips where 
Client_Id IN (SELECT Users_Id from Users WHERE Banned='No') 
AND Driver_Id IN (SELECT Users_Id FROM Users WHERE Banned='No')
GROUP BY Request_at
HAVING Request_at between '2013-10-01' AND '2013-10-03')AS a
