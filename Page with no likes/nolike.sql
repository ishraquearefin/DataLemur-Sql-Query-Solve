SELECT 
  pg.page_id 
FROM 
  pages AS pg 
  LEFT JOIN page_likes AS pgl ON pg.page_id = pgl.page_id 
WHERE 
  pgl.liked_date IS NULL 
ORDER BY 
  pg.page_id;
