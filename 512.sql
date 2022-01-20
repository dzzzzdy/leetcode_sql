SELECT DISTINCT player_id, 
FIRST_VALUE(device_id)OVER(PARTITION BY player_id ORDER BY event_date) AS device_id
FROM activity

SELECT 
    player_id,
    device_id
FROM activity
WHERE (player_id, event_date) in (
                                    SELECT 
                                        player_id, 
                                        MIN(event_date)
                                     FROM activity
                                     GROUP BY player_id)
