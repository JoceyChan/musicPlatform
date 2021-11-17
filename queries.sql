-- 1
INSERT INTO music(m_songName, m_albumName, m_artistName, m_duration)
VALUES('happier', 'SOUR', 'Olivia Rodrigo', '2:55');

-- 2 
INSERT INTO user(u_userkey, u_userName, u_passcode, u_email, u_nationkey)
VALUES 
(017, 'christBeanie', 1235, 'christineBeanie@gmail.com', 01),
(018, 'jocey chan', 9429, 'joceychan331718@gmail.com', 01);

-- 3
UPDATE user
SET u_userName = 'christineBeanie', u_passcode = 1230
WHERE u_userkey = 017;

-- 4 
INSERT INTO userProfile(upr_profileKey, upr_userKey, upr_nationkey)
VALUES 
(21, 017, 01),
(05, 018, 01);

-- 5
INSERT INTO music(m_songName, m_albumName, m_artistName, m_duration)
VALUES
('jealousy, jealousy', 'SOUR', 'Olivia Rodrigo', '2:53'),
('Kiwi', 'Harry Styles', 'Harry Styles', '2:56'),
('Fantasma', 'Garden of Lucid', 'Ambar Lucid', '3:34'),
('Linda', ' ', 'Tokischa & Rosalia', '2:53'),
('Ribs', 'Pure Heroine', 'Lorde', '4:18'),
('Break It Off', 'to hell with it', 'PinkPantheress', '1:35'),
('Pain', 'to hell with it', 'PinkPantheress', '1:39'),
('Attracted To You', 'to hell with it', 'PinkPantheress', '1:08'),
('Coaster', 'American Teen', 'Khalid', '3:19'),
('Another Sad Love Song', 'American Teen', 'Khalid', '4:04'),
('Bluffin', 'Free Spirit', 'Khalid', '3:19'),
('Self', 'Free Spirit', 'Khalid', '3:49'),
('Keep the Family Close', 'Views', 'Drake', '5:29'),
('Bohemian Rhapsody', 'Greatest Hits', 'Queen', '5:55'),
('You Do not Fool me', 'Greatest Hits', 'Queen', '5:22'),
('La Noche De Anoche', 'El Ultimo Tour Del Mundo', 'Bad Bunny & Rosalia', '3:23'),
('Stole the Show', 'Cloud Nine', 'Kygo', '3:43'),
('Malamente', 'El Mal Querer', 'Rosalia', '2:30'),
('Faded', 'Different World', 'Alan Walker', '3:32'),
('Colapso', 'Hasta el Fin del Mundo', 'Kevin Kaarl', '3:55'),
('Think About It', 'My Head is a Moshpit', 'Verzache', '2:22'),
('Crash My Car', 'Dreamland', 'COIN', '3:08'),
('Save Your Tears', 'After Hours', 'The Weeknd', '3:36');

-- 6
UPDATE artist 
SET a_email = 'BFaiyaz@gmail.com', a_passcode = 9043
WHERE a_artistkey = 012;

-- 7 
DELETE FROM music 
WHERE m_songName = 'Turning Page'; 

-- 8 
UPDATE playlist 
SET p_songName = 'May I Ask, Easy', p_artistName = 'Luke Chiang, Mac Ayres'
WHERE p_playlistName= 'Goodsong'; 

-- 9
DELETE from user
WHERE u_nationkey BETWEEN 02 AND 05;

-- 10 
UPDATE sharing 
SET s_playlistName = 'rainydays' 
WHERE s_profileKey = 10;

-- 11
UPDATE music 
SET m_albumName = ' '
WHERE m_albumName = m_songName;

-- 12
DELETE FROM music 
WHERE m_duration >= '5:00' OR 
m_artistName IN 
(SELECT m_artistName
FROM music
INNER JOIN artist
ON artist.a_artistName = music.m_artistName 
INNER JOIN nation
ON nation.n_nationkey = a_nationkey
WHERE n_name != 'UNITED STATES');

-- 13
INSERT INTO artist (a_artistkey, a_artistName, a_passcode, a_email, a_nationkey)
VALUES (016, 'Olivia Rodrigo' , 0294, 'ORodrigo@gmail.com', 01), 
(017, 'Harry Styles', 0819, 'HStyles@gmail.com', 05), 
(018, 'Ambar Lucid' , 8462, 'AmbarLucid@gmail.com', 01),
(019, 'Tokishca', 3021, 'Tokishca@gmail.com', 04), 
(021, 'Lorde' , 2029, 'Lorde@gmail.com', 05), 
(022, 'PinkPantheress' , 5592, 'PinkPantheress@gmail.com', 01),
(023, 'Drake' , 2012, 'Drake@gmail.com', 04), 
(024, 'Queen' , 1029, 'Queen@gmail.com', 05),
(025, 'Bad Bunny', 2038, 'BadBunny@gmail.com', 01),
(026, 'Kygo', 1039, 'Kygo@gmail.com', 05),
(027, 'Rosalia', 1193, 'Roasalia@gmail.com', 01),
(028, 'Alan Walker', 2104, 'AlanWalker@gmail.com', 05),
(029, 'Kevin Kaarl', 2931, 'KevinKaarl@gmail.com', 01),
(030, 'Verzache' , 5739, 'Verzache@gmail.com', 04);

-- 14
UPDATE playlist
SET p_playlistKey = (p_playlistKey*2)
WHERE p_playlistKey IN
(SELECT p_playlistKey
FROM playlist
INNER JOIN sharing
ON s_playlistName = p_playlistName
WHERE s_profileKey < 2);

-- 15
DELETE FROM playlist 
WHERE length(p_songName) >= 16 OR p_artistName IN 
(SELECT p_artistName 
FROM playlist 
INNER JOIN sharing 
ON s_songName = p_songName
JOIN user 
ON u_userkey = s_profileKey
WHERE s_profileKey = 1) OR p_artistName IN 
(SELECT m_artistName
FROM music
INNER JOIN playlist
ON p_artistName = m_artistName
GROUP BY p_artistName
HAVING COUNT(m_artistName) > 3);
