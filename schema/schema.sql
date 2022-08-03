-- CREATE DATABASE
CREATE DATABASE catalog_of_things;

-- 3 CREATE TABLE author

-- 1 CREATE TABLE label
CREATE TABLE label (
    id INT GENERATED ALWAYS AS IDENTITY,
    title TEXT,
    color TEXT
);

-- 2 CREATE TABLE genre
CREATE TABLE genre (
  id      INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name    VARCHAR(100)
);

-- 1 CREATE TABLE book
CREATE TABLE book (
    id INT,
    title TEXT,
    publish_date  DATE,
    publihser TEXT,
    cover_state TEXT,
    FOREIGN KEY (id) REFERENCES items (id)
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

  FOREIGN KEY (genre_id) REFERENCES genre(id)
  FOREIGN KEY (author_id) REFERENCES author(id)
  FOREIGN KEY (label_id) REFERENCES label(id)
);

