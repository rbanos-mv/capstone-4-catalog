-- CREATE DATABASE
CREATE DATABASE catalog_of_things;

-- 3 CREATE TABLE author

-- 1 CREATE TABLE label
CREATE TABLE label (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(250),
    color VARCHAR(250)
);

-- 2 CREATE TABLE genre
CREATE TABLE genre (
  id      INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name    VARCHAR(100)
);

-- 1 CREATE TABLE book
CREATE TABLE book (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
    title VARCHAR(250),
    publish_date  DATE,
    publihser VARCHAR(250),
    cover_state VARCHAR(250),
    genre_id INT,
    author_id INT,
    label_id INT,
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (label_id) REFERENCES label(id)
);

-- 3 CREATE TABLE game

-- 2 CREATE TABLE music_album
CREATE TABLE music_album(
  id            INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  publish_date  DATE,
  archived      BOOLEAN,
  author_id     INTEGER,
  genre_id      INTEGER,
  label_id      INTEGER,
  name          VARCHAR(250),
  on_spotify    BOOLEAN,

  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (label_id) REFERENCES label(id)
);

