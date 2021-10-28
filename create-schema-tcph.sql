CREATE TABLE region (
    r_regionkey decimal(2,0) not null,
    r_name char(25) not null
);
CREATE TABLE nation (
    n_nationkey decimal(3,0) not null,
    n_name char(25) not null,
    n_regionkey decimal(2,0) not null
);
CREATE TABLE user(
    u_userkey decimal(3,0) not null, 
    u_userName char(25) not null, 
    u_passcode decimal(3,0) not null,
    u_email char(25) not null,           -- char or #?
    u_nationkey decimal(3,0) not null
);
CREATE TABLE artist(
    a_artistkey decimal(3,0) not null, 
    a_artistName char(25) not null, 
    a_passcode decimal(3,0) not null,
    a_email char(25) not null,           -- char or #?
    a_nationkey decimal(3,0) not null
);
CREATE TABLE music (
m_songName char(25) not null,
m_albumName char(25) not null,
m_artistName char(25) not null,
m_duration decimal(3,0) not null
);
CREATE TABLE playlist (
p_playlistName char(25) not null,
p_playlistKey decimal(3, 0) not null, 
p_songName char(25) not null, 
p_artistName char(25) not null
);
