SELECT  
a_artistName	
FROM artist 
INNER JOIN music
ON music.m_artistName = artist.a_artistName
GROUP BY a_artistName
HAVING COUNT(m_artistName) > 1;
