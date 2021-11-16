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
    s_albumName char(25) not null, 
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
DELETE FROM region;
DELETE FROM nation;
DELETE FROM user;
DELETE FROM artist;
DELETE FROM music;

INSERT INTO region VALUES(01, 'AMERICA'); 
INSERT INTO region VALUES(02, 'ASIA'); 
INSERT INTO region VALUES(03, 'MIDDLE EAST'); 
INSERT INTO region VALUES(04, 'EUROPE'); 

INSERT INTO nation VALUES(01, 'UNITED STATES', 01);
INSERT INTO nation VALUES(04, 'JAPAN', 02);
INSERT INTO nation VALUES(03, 'KOREA', 02);
INSERT INTO nation VALUES(04, 'CANADA', 04);
INSERT INTO nation VALUES(05, 'UNITED KINGDOM', 04);
INSERT INTO nation VALUES(06, 'SAUDI ARABIA', 03);
INSERT INTO nation VALUES(07, 'IRAQ', 03);
INSERT INTO nation VALUES(08, 'INDIA', 02);
INSERT INTO nation VALUES(09, 'TAIWAN', 02);

INSERT INTO user VALUES(001, 'duyducdo', 8996, 'iduydo@gmail.com', 01);
INSERT INTO user VALUES(002, 'experiment0_625', 4462, 'bavila24@ucmerced.edu', 01);
INSERT INTO user VALUES(003, 'sreeda007', 3299, 'vemuri.sreeda@gmail.com', 01);
INSERT INTO user VALUES(004, 'butimarnold', 5693, 'akhampaseut@ucmerced.edu', 02);
INSERT INTO user VALUES(005, 'Ishpatel77', 7723, 'ishpatel77@gmail.com', 08);
INSERT INTO user VALUES(006, 'iamsandyh', 9346, 'shernandezgonzalez@ucmerced.edu', 02);
INSERT INTO user VALUES(007, 'jjohnson', 9876, 'inkfirejj@gmail.com', 04);
INSERT INTO user VALUES(008, 'lorenzo.scaturchio', 5532, 'lorenzosca7@gmail.com', 04);
INSERT INTO user VALUES(009, 'hvillasin', 2788, 'hvillasin@ucmerced.edu', 04);
INSERT INTO user VALUES(010, 'jaqui.sm', 5572, 'jaqui.sm5@gmail.com', 03);
INSERT INTO user VALUES(011, 'zbai6', 6694, 'zbai6@ucmerced.edu', 09);
INSERT INTO user VALUES(012, 'Am_santi', 7625, 'svazquezgarcia@ucmerced.edu', 02);
INSERT INTO user VALUES(013, '_sarahtonin_._', 6633, 'sarahacuna12@gmail.com', 08);
INSERT INTO user VALUES(014, 'Carmen_bee22' , 7364, 'cbribiesca22@gmail.com', 06);
INSERT INTO user VALUES(015, 'Mynamesjustice_', 3578, 'jdhogan0@gmail.com', 07);
INSERT INTO user VALUES(016, 'destineemarian', 2527, 'destineemarian@gmail.com', 05);

INSERT INTO artist VALUES(001, 'Luke Chiang', 9622, 'LChiang@gmail.com', 09); 
INSERT INTO artist VALUES(002, 'Clario', 7999, 'Clario@gmail.com', 01); 
INSERT INTO artist VALUES(003, 'FALLING IN REVERSE', 4966, 'FALLINGINREVERSE@gmail.com', 02);
INSERT INTO artist VALUES(004, 'Keshi', 8395, 'Keshi@gmail.com', 03); 
INSERT INTO artist VALUES(005, 'Khalid', 9241, 'Khalid@gmail.com', 01); 
INSERT INTO artist VALUES(006, 'The Weeknd', 8395, 'theWeeknd@gmail.com', 01); 
INSERT INTO artist VALUES(007, 'Joji', 8395, 'Joji@gmail.com', 01); 
INSERT INTO artist VALUES(008, 'LANY', 2942, 'LANY@gmail.com', 04); 
INSERT INTO artist VALUES(009, 'Coldplay', 0482, 'Coldplay@gmail.com', 04); 
INSERT INTO artist VALUES(010, 'K-391', 4903, 'K391@gmail.com', 08); 
INSERT INTO artist VALUES(011, 'Notorious B.I.G.', 8395, 'NotoriousB.I.G.@gmail.com', 07); 
INSERT INTO artist VALUES(012, 'Brent Faiyaz', 0284, 'Brent Faiyaz@gmail.com', 06); 
INSERT INTO artist VALUES(013, 'Durand Jones and the Indications', 0284, 'DurandJones@gmail.com', 05);
INSERT INTO artist VALUES(014, 'Sleeping at Last', 7832, 'SleepingAtLast@gmail.com', 06); 
INSERT INTO artist VALUES(015, 'Amaarae', 2983, 'Amaarae@gmail.com', 09); 

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