DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    id INT PRIMARY KEY AUTO_INCREMENT,
    plan_value DECIMAL(5, 3) NOT NULL,
    plan_name VARCHAR(45) NOT NULL
);

CREATE TABLE SpotifyClone.artist(
     id INT PRIMARY KEY AUTO_INCREMENT,
     artist_name VARCHAR(50) NOT NULL
);

CREATE TABLE SpotifyClone.albums(
    id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(45) NOT NULL,
    artist_id INT NOT NULL,
    launch_date INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist(id)
);

CREATE TABLE SpotifyClone.songs(
    id INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(45) NOT NULL,
    song_duration DECIMAL(5, 2) NOT NULL,
    albums_id INT NOT NULL,
    FOREIGN KEY (albums_id) REFERENCES albums(id)
);

CREATE TABLE SpotifyClone.users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    user_age INT NOT NULL,
    date_plan DATE NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plans(id)
);

CREATE TABLE SpotifyClone.artist_followers(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT id PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (artist_id) REFERENCES artist(id)
);

CREATE TABLE SpotifyClone.historic_reproduction(
    date_historic DATETIME NOT NULL,
    music_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (music_id, user_id),
    FOREIGN KEY (music_id) REFERENCES songs(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO SpotifyClone.plans (plan_value, plan_name)
    VALUES
        (0, 'gratuito'),
        (7.99, 'familiar'),
        (5.99, 'universitário'),
        (6.99, 'pessoal');

INSERT INTO SpotifyClone.artist (artist_name)
VALUES
        ('Elis Regina'),
        ('Baco Exu do Blues'),
        ('Blind Guardian'),
        ('Nina Simone'),
        ('Beyoncé'),
        ('Queen');
    
INSERT INTO SpotifyClone.albums (album_name, artist_id, launch_date)
    VALUES
        ('Falso Brilhante', 1, 1998),
        ('Vento de Maio', 1, 2001),
        ('QVVJFA?', 2, 2003),
        ('Somewhere Far Beyond', 3, 2007),
        ('I Put A Spell On You', 4, 2012),
        ('Renaissance', 5, 2022),
        ('Jazz', 6, 1978),
        ('Hot Space', 6, 1982);

INSERT INTO SpotifyClone.songs (song_name, song_duration, albums_id)
    VALUES
        ('BREAK MY SOUL', 279, 6),
        ("VIRGO'S GROOVE", 369, 6),
        ('ALIEN SUPERSTAR', 116, 6),
        ("Don't Stop Me Now", 203, 7),
        ('Under Pressure', 152, 8),
        ('Como Nossos Pais', 105, 1),
        ('O Medo de Amar é o Medo de Ser Livre', 207, 2),
        ('Samba em Paris', 267, 3),
        ("The Bard's Song",	244, 4),
        ('Feeling Good', 100, 5);

INSERT INTO SpotifyClone.users (user_name, user_age, date_plan, plan_id)
    VALUES
        ('Barbara Liskov', 82, '2019-10-20', 1),
        ('Robert Cecil Martin', 58, '2017-01-06', 1),
        ('Ada Lovelace', 37, '2017-12-30', 2),
        ('Martin Fowler', 46, '2017-01-17', 2),
        ('Sandi Metz', 58, '2018-04-29', 2),
        ('Paulo Freire', 19, '2018-02-14', 3),
        ('Bell Hooks', 26, '2018-01-05', 3),
        ('Christopher Alexander', 85, '2019-06-05', 4),
        ('Judith Butler', 45, '2020-05-13', 4),
        ('Jorge Amado', 58, '2017-02-17', 4);
    
INSERT INTO SpotifyClone.artist_followers (user_id, artist_id)
    VALUES
        (1, 5),
        (1, 6),
        (1, 1),
        (2, 5),
        (2, 1),
        (3, 6),
        (4, 2),
        (5, 3),
        (5, 4),
        (6, 4),
        (6, 5),
        (7, 4),
        (9, 1),
        (10, 6);

INSERT INTO SpotifyClone.historic_reproduction (date_historic, music_id, user_id)
    VALUES
        ("2022-02-28 10:45:55", 8, 1),
        ("2020-05-02 05:30:35", 2, 1),
        ("2020-03-06 11:22:33", 10, 1),
        ("2022-08-05 08:05:17", 10, 2),
        ("2020-01-02 07:40:33", 7, 2),
        ("2020-11-13 16:55:13", 10, 3),
        ("2020-12-05 18:38:30", 2, 3),
        ("2021-08-15 17:10:10", 8, 4),
        ("2022-01-09 01:44:33", 8, 5),
        ("2020-08-06 15:23:43", 5, 5),
        ("2017-01-24 00:31:17", 7, 6),
        ("2017-10-12 12:35:20", 1, 6),
        ("2011-12-15 22:30:49", 4, 7),
        ("2012-03-17 14:56:41", 4, 8),
        ("2022-02-24 21:14:22", 9, 9),
        ("2015-12-13 08:30:22", 3, 10);
