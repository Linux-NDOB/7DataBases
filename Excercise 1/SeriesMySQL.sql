CREATE TABLE actor_nominations (
  categoriesNominated VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(categoriesNominated));



CREATE TABLE categories (
  categories_name VARCHAR(100)  NOT NULL    ,
PRIMARY KEY(categories_name));



CREATE TABLE nominations (
  nomination_name VARCHAR(50)  NOT NULL  ,
  nomination_academy VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(nomination_name));



CREATE TABLE series (
  serie_id INTEGER UNSIGNED  NOT NULL  ,
  name VARCHAR(100)  NOT NULL  ,
  country VARCHAR(50)  NOT NULL  ,
  company VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(serie_id));



CREATE TABLE season (
  season_number INTEGER UNSIGNED  NOT NULL  ,
  series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  season_chapters INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(season_number)  ,
INDEX season_FKIndex1(series_serie_id),
  FOREIGN KEY(series_serie_id)
    REFERENCES series(serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE awards (
  award_name VARCHAR(50)  NOT NULL  ,
  series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  academy_name VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(award_name)  ,
INDEX awards_FKIndex1(series_serie_id),
  FOREIGN KEY(series_serie_id)
    REFERENCES series(serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE episodes (
  episode_number VARCHAR(50)  NOT NULL  ,
  season_number INTEGER UNSIGNED  NOT NULL  ,
  episode_name VARCHAR(50)  NOT NULL  ,
  espisode_minutes INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(episode_number)  ,
INDEX episodes_FKIndex1(season_number),
  FOREIGN KEY(season_number)
    REFERENCES season(season_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE series_has_categories (
  series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  categories_name VARCHAR(100)  NOT NULL    ,
PRIMARY KEY(series_serie_id, categories_name)  ,
INDEX series_has_categories_FKIndex1(series_serie_id)  ,
INDEX series_has_categories_FKIndex2(categories_name),
  FOREIGN KEY(series_serie_id)
    REFERENCES series(serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(categories_name)
    REFERENCES categories(categories_name)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE series_has_nominations (
  series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  nominations_nomination_name VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(series_serie_id, nominations_nomination_name)  ,
INDEX series_has_nominations_FKIndex1(series_serie_id)  ,
INDEX series_has_nominations_FKIndex2(nominations_nomination_name),
  FOREIGN KEY(series_serie_id)
    REFERENCES series(serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(nominations_nomination_name)
    REFERENCES nominations(nomination_name)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE episode_tech_specs (
  episodes_episode_number VARCHAR(50)  NOT NULL  ,
  episode_minutes INTEGER UNSIGNED  NOT NULL  ,
  episode_sound_mix VARCHAR(50)  NOT NULL  ,
  episode_format VARCHAR(50)  NOT NULL  ,
  aspect_ratio VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(episodes_episode_number)  ,
INDEX episode_tech_specs_FKIndex1(episodes_episode_number),
  FOREIGN KEY(episodes_episode_number)
    REFERENCES episodes(episode_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE episode_release_date (
  episodes_episode_number VARCHAR(50)  NOT NULL  ,
  release_day INTEGER UNSIGNED  NOT NULL  ,
  release_month INTEGER UNSIGNED  NOT NULL  ,
  release_year INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(episodes_episode_number)  ,
INDEX episode_release_date_FKIndex1(episodes_episode_number),
  FOREIGN KEY(episodes_episode_number)
    REFERENCES episodes(episode_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Person (
  idPerson INTEGER UNSIGNED  NOT NULL  ,
  episodes_episode_number VARCHAR(50)  NOT NULL  ,
  firstName VARCHAR(50)  NOT NULL  ,
  lastName VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idPerson)  ,
INDEX Person_FKIndex1(episodes_episode_number),
  FOREIGN KEY(episodes_episode_number)
    REFERENCES episodes(episode_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE users (
  user_name VARCHAR(50)  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  user_email VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(user_name)  ,
INDEX users_FKIndex1(Person_idPerson),
  FOREIGN KEY(Person_idPerson)
    REFERENCES Person(idPerson)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE producers (
  producer_id INTEGER UNSIGNED  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(producer_id)  ,
INDEX producers_FKIndex1(Person_idPerson),
  FOREIGN KEY(Person_idPerson)
    REFERENCES Person(idPerson)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Actors (
  actor_id INTEGER UNSIGNED  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(actor_id)  ,
INDEX Actors_FKIndex1(Person_idPerson),
  FOREIGN KEY(Person_idPerson)
    REFERENCES Person(idPerson)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE actor_awards (
  CateogryWon VARCHAR(50)  NOT NULL  ,
  Actors_actor_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(CateogryWon)  ,
INDEX actor_awards_FKIndex1(Actors_actor_id),
  FOREIGN KEY(Actors_actor_id)
    REFERENCES Actors(actor_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE episode_filiming_locations (
  localId INTEGER UNSIGNED  NOT NULL  ,
  episodes_episode_number VARCHAR(50)  NOT NULL  ,
  country VARCHAR(50)  NOT NULL  ,
  city VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(localId)  ,
INDEX episode_filiming_locations_FKIndex1(episodes_episode_number),
  FOREIGN KEY(episodes_episode_number)
    REFERENCES episodes(episode_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE directors (
  director_id INTEGER UNSIGNED  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(director_id)  ,
INDEX directors_FKIndex1(Person_idPerson),
  FOREIGN KEY(Person_idPerson)
    REFERENCES Person(idPerson)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Actors_has_actor_nominations (
  actor_nominations_categoriesNominated VARCHAR(50)  NOT NULL  ,
  Actors_actor_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(actor_nominations_categoriesNominated, Actors_actor_id)  ,
INDEX Actors_has_actor_nominations_FKIndex2(actor_nominations_categoriesNominated)  ,
INDEX Actors_has_actor_nominations_FKIndex2(Actors_actor_id),
  FOREIGN KEY(actor_nominations_categoriesNominated)
    REFERENCES actor_nominations(categoriesNominated)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Actors_actor_id)
    REFERENCES Actors(actor_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE episode_rating (
  episode_rating_id INTEGER UNSIGNED  NOT NULL  ,
  episodes_episode_number VARCHAR(50)  NOT NULL  ,
  users_user_name VARCHAR(50)  NOT NULL  ,
  episode_rating_text VARCHAR(50)  NOT NULL  ,
  espisode_stars INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(episode_rating_id)  ,
INDEX episode_rating_FKIndex1(users_user_name)  ,
INDEX episode_rating_FKIndex2(episodes_episode_number),
  FOREIGN KEY(users_user_name)
    REFERENCES users(user_name)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(episodes_episode_number)
    REFERENCES episodes(episode_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE serie_ratings (
  serie_rating_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  users_user_name VARCHAR(50)  NOT NULL  ,
  serie_rating_stars INTEGER UNSIGNED  NOT NULL  ,
  serie_rating_text VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(serie_rating_id)  ,
INDEX serie_ratings_FKIndex2(users_user_name)  ,
INDEX serie_ratings_FKIndex2(series_serie_id),
  FOREIGN KEY(users_user_name)
    REFERENCES users(user_name)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(series_serie_id)
    REFERENCES series(serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE writters (
  writter_id INTEGER UNSIGNED  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(writter_id)  ,
INDEX writters_FKIndex1(Person_idPerson),
  FOREIGN KEY(Person_idPerson)
    REFERENCES Person(idPerson)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Characters (
  character_id INTEGER UNSIGNED  NOT NULL  ,
  Actors_actor_id INTEGER UNSIGNED  NOT NULL  ,
  character_name VARCHAR(50)  NOT NULL  ,
  character_lastname VARCHAR(50)  NULL    ,
PRIMARY KEY(character_id)  ,
INDEX Characters_FKIndex1(Actors_actor_id),
  FOREIGN KEY(Actors_actor_id)
    REFERENCES Actors(actor_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




