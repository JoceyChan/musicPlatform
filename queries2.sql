--1
UPDATE artist 
SET a_email = 'BFaiyaz@gmail.com', a_passcode = 9043
WHERE a_artistkey = 012

--2 
DELETE FROM music 
WHERE m_songName = 'Turning Page' 

--3 
UPDATE playlist 
SET p_songName = 'May I Ask, Easy', p_artistName = 'Luke Chiang, Mac Ayres'
WHERE p_playlistName= 'Goodsong' 

--4
DELETE from user
WHERE u_nationkey BETWEEN 02 AND 05;

--5 
UPDATE sharing 
SET s_playlistName = 'rainydays' 
WHERE s_profileKey = 10

--6 
DELETE FROM sharing 
where s_profileKey = 01  IN (
SELECT u_userkey 
FROM USER 
WHERE u_nationkey > 01);

--7 
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

--8 



