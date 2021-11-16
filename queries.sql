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
