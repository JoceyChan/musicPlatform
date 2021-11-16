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
INSERT INTO artist VALUES
