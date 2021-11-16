SELECT "1----------";
.headers on

CREATE TABLE region (
    r_regionkey decimal(2,0) not null,
    r_name char(25) not null
);
CREATE TABLE nation (
    n_nationkey decimal(2,0) not null,
    n_name char(25) not null,
    n_regionkey decimal(2,0) not null
);
CREATE TABLE user(
    u_userkey decimal(3,0) not null, 
    u_userName char(25) not null, 
    u_passcode decimal(4,0) not null,
    u_email char(25) not null,           -- char or #?
    u_nationkey decimal(3,0) not null
);
CREATE TABLE artist(
    a_artistkey decimal(3,0) not null, 
    a_artistName char(25) not null, 
    a_passcode decimal(4,0) not null,
    a_email char(25) not null,           -- char or #?
    a_nationkey decimal(3,0) not null
);
CREATE TABLE music (
    m_songName char(25) not null,
    m_albumName char(25) not null,
    m_artistName char(25) not null,
    m_duration char(25) not null
);
CREATE TABLE playlist (
    p_playlistName char(25) not null,
    p_playlistKey decimal(3, 0) not null, 
    p_songName char(25) not null, 
    p_artistName char(25) not null
);
CREATE TABLE sharing(
    s_profileKey decimal (3,0) not null, 
    s_playlistName char(25) not null ,
    a_albumName char(25) not null, 
    s_songName char(25) not null
);
CREATE TABLE profile(
    pr_profileKey decimal (3,0) not null, 
    pr_userKey decimal (3,0) not null, 
    pr_artistKey decimal (3,0) not null, 
    pr_nationkey decimal (3,0) not null
);
;
.headers off

SELECT "2----------";
.headers on
DELETE FROM music;

INSERT INTO music VALUES ('May I Ask', 'May I Ask', 'Luke Chiang', '3:51');
INSERT INTO music VALUES ('4EVER', '4EVER', 'Clario', '2:40');
INSERT INTO music VALUES ('POPULAR MONSTER', 'POPULAR MONSTER', 'FALLING IN REVERSE', '3:41');
INSERT INTO music VALUES('Beside You','Beside You', 'Keshi', '2:41');
INSERT INTO music VALUES('Saved', 'American Teen', 'Kalid', '3:26');
INSERT INTO music VALUES('Die for You', 'Starboy', 'The Weeknd', '4:20');
INSERT INTO music VALUES('Sanctuary', 'Nectar', 'Joji', '3:00');
INSERT INTO music VALUES ('Malibu Nights', 'Malibu Nights', 'LANY', '4:47');
INSERT INTO music VALUES ('Yellow', 'Parachutes', 'Coldplay', '4:27');
INSERT INTO music VALUES('Aurora', 'Aurora', 'K-391 & RØRY', '2:44');
INSERT INTO music VALUES('Big Poppa', 'Greatest hits', 'Notorious B.I.G.', '4:10');
INSERT INTO music VALUES('Gang Over Luv', 'Sonder Son', 'Brent Faiyaz', '3:24');
INSERT INTO music VALUES('True Love', 'American Love Call', 'Durand Jones and the Indications', '3:42');
INSERT INTO music VALUES('Turning Page', 'Turning Page', 'Sleeping at Last', '4:16');
INSERT INTO music VALUES('SAD GIRLZ LUV MONEY remix', 'SAD GIRLZ LUV MONEY remix', 'Amaarae ft. Kali Uchis', '3:25'); 


;
.headers off