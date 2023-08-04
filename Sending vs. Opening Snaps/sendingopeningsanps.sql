SELECT 
  ab.age_bucket, 
  ROUND(
    100 * SUM(ac.time_spent) FILTER (
      WHERE 
        ac.activity_type = 'send'
    )/ SUM(ac.time_spent), 
    2
  ) AS send_perc, 
  ROUND(
    100 * SUM(ac.time_spent) FILTER (
      WHERE 
        ac.activity_type = 'open'
    )/ SUM(ac.time_spent), 
    2
  ) AS open_perc 
FROM 
  activities AS ac 
  JOIN age_breakdown AS ab ON ab.user_id = ac.user_id 
WHERE 
  ac.activity_type = 'open' 
  OR ac.activity_type = 'send' 
GROUP BY 
  ab.age_bucket;
