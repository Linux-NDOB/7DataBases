create database if not exists series_database;

use series_database;

CREATE TABLE series (
  serie_id INTEGER UNSIGNED  NOT NULL  ,
  name VARCHAR(100)  NOT NULL  ,
  country VARCHAR(50)  NOT NULL  ,
  company VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(serie_id));



CREATE TABLE nominations (
  nomination_name VARCHAR(50)  NOT NULL  ,
  series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  nomination_academy VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(nomination_name, series_serie_id)  ,
INDEX nominations_FKIndex1(series_serie_id),
  FOREIGN KEY(series_serie_id)
    REFERENCES series(serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE season (
  season_number INTEGER UNSIGNED  NOT NULL  ,
  series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  season_chapters INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(season_number, series_serie_id)  ,
INDEX season_FKIndex1(series_serie_id),
  FOREIGN KEY(series_serie_id)
    REFERENCES series(serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE awards (
  award_name VARCHAR(50)  NOT NULL  ,
  series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  academy_name VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(award_name, series_serie_id)  ,
INDEX awards_FKIndex1(series_serie_id),
  FOREIGN KEY(series_serie_id)
    REFERENCES series(serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE episodes (
  episode_number VARCHAR(50)  NOT NULL  ,
  season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  season_number INTEGER UNSIGNED  NOT NULL  ,
  episode_name VARCHAR(50)  NOT NULL  ,
  espisode_minutes INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(episode_number, season_series_serie_id, season_number)  ,
INDEX episodes_FKIndex1(season_number, season_series_serie_id),
  FOREIGN KEY(season_number, season_series_serie_id)
    REFERENCES season(season_number, series_serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE categories (
  categories_name VARCHAR(100)  NOT NULL  ,
  series_serie_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(categories_name, series_serie_id)  ,
INDEX categories_FKIndex1(series_serie_id),
  FOREIGN KEY(series_serie_id)
    REFERENCES series(serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE episode_tech_specs (
  episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  episodes_episode_number VARCHAR(50)  NOT NULL  ,
  episode_minutes INTEGER UNSIGNED  NOT NULL  ,
  episode_sound_mix VARCHAR(50)  NOT NULL  ,
  episode_format VARCHAR(50)  NOT NULL  ,
  aspect_ratio VARCHAR(50)  NOT NULL    ,
INDEX episode_tech_specs_FKIndex1(episodes_episode_number, episodes_season_series_serie_id, episodes_season_number),
  FOREIGN KEY(episodes_episode_number, episodes_season_series_serie_id, episodes_season_number)
    REFERENCES episodes(episode_number, season_series_serie_id, season_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE episode_release_date (
  episodes_episode_number VARCHAR(50)  NOT NULL  ,
  episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  episode_release_hour INTEGER UNSIGNED  NOT NULL  ,
  releaseDay INTEGER UNSIGNED  NOT NULL  ,
  releaseWeek INTEGER UNSIGNED  NOT NULL  ,
  releaseMonth INTEGER UNSIGNED  NOT NULL  ,
  releaseYear INTEGER UNSIGNED  NOT NULL  ,
  releaseCentury INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(episodes_episode_number, episodes_season_number, episodes_season_series_serie_id)  ,
INDEX episode_release_date_FKIndex1(episodes_episode_number, episodes_season_series_serie_id, episodes_season_number),
  FOREIGN KEY(episodes_episode_number, episodes_season_series_serie_id, episodes_season_number)
    REFERENCES episodes(episode_number, season_series_serie_id, season_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Person (
  idPerson INTEGER UNSIGNED  NOT NULL  ,
  episodes_episode_number VARCHAR(50)  NOT NULL  ,
  firstName VARCHAR(50)  NOT NULL  ,
  firstLastName VARCHAR(50)  NOT NULL  ,
  lastName VARCHAR(50)  NOT NULL  ,
  secondLastName VARCHAR(50)  NOT NULL  ,
  episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idPerson, episodes_episode_number, firstName, firstLastName, lastName, secondLastName, episodes_season_number, episodes_season_series_serie_id)  ,
INDEX Person_FKIndex1(episodes_episode_number, episodes_season_series_serie_id, episodes_season_number),
  FOREIGN KEY(episodes_episode_number, episodes_season_series_serie_id, episodes_season_number)
    REFERENCES episodes(episode_number, season_series_serie_id, season_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE episode_filiming_locations (
  localId INTEGER UNSIGNED  NOT NULL  ,
  episodes_episode_number VARCHAR(50)  NOT NULL  ,
  episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  country VARCHAR(50)  NOT NULL  ,
  city VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(localId, episodes_episode_number, episodes_season_number, episodes_season_series_serie_id)  ,
INDEX episode_filming_locations_FKIndex1(episodes_episode_number, episodes_season_series_serie_id, episodes_season_number),
  FOREIGN KEY(episodes_episode_number, episodes_season_series_serie_id, episodes_season_number)
    REFERENCES episodes(episode_number, season_series_serie_id, season_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Actors (
  Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Person_episodes_episode_number VARCHAR(50)  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL  ,
  Person_episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  Person_episodes_season_number INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Person_idPerson, Person_episodes_episode_number, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName, Person_episodes_season_series_serie_id, Person_episodes_season_number)  ,
INDEX Actors_FKIndex1(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id),
  FOREIGN KEY(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id)
    REFERENCES Person(idPerson, episodes_episode_number, firstName, firstLastName, lastName, secondLastName, episodes_season_number, episodes_season_series_serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE actor_awards (
  CateogryWon VARCHAR(50)  NOT NULL  ,
  Actors_Person_episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_lastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_episodes_episode_number VARCHAR(50)  NOT NULL  ,
  Actors_Person_idPerson INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(CateogryWon, Actors_Person_episodes_season_number, Actors_Person_episodes_season_series_serie_id, Actors_Person_lastName, Actors_Person_secondLastName, Actors_Person_firstName, Actors_Person_firstLastName, Actors_Person_episodes_episode_number, Actors_Person_idPerson)  ,
INDEX actor_awards_FKIndex1(Actors_Person_idPerson, Actors_Person_episodes_episode_number, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName, Actors_Person_episodes_season_series_serie_id, Actors_Person_episodes_season_number),
  FOREIGN KEY(Actors_Person_idPerson, Actors_Person_episodes_episode_number, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName, Actors_Person_episodes_season_series_serie_id, Actors_Person_episodes_season_number)
    REFERENCES Actors(Person_idPerson, Person_episodes_episode_number, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName, Person_episodes_season_series_serie_id, Person_episodes_season_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE directors (
  Person_episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  Person_episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_episodes_episode_number VARCHAR(50)  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL    ,
INDEX directors_FKIndex1(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id),
  FOREIGN KEY(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id)
    REFERENCES Person(idPerson, episodes_episode_number, firstName, firstLastName, lastName, secondLastName, episodes_season_number, episodes_season_series_serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE writters (
  Person_episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  Person_episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_episodes_episode_number VARCHAR(50)  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL    ,
INDEX writters_FKIndex1(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id),
  FOREIGN KEY(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id)
    REFERENCES Person(idPerson, episodes_episode_number, firstName, firstLastName, lastName, secondLastName, episodes_season_number, episodes_season_series_serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Characters (
  Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Person_episodes_episode_number VARCHAR(50)  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL  ,
  Person_episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  Person_episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_lastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_episodes_episode_number VARCHAR(50)  NOT NULL  ,
  Actors_Person_idPerson INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Person_idPerson, Person_episodes_episode_number, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName, Person_episodes_season_series_serie_id, Person_episodes_season_number)  ,
INDEX Characters_FKIndex1(Actors_Person_idPerson, Actors_Person_episodes_episode_number, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName, Actors_Person_episodes_season_series_serie_id, Actors_Person_episodes_season_number)  ,
INDEX Characters_FKIndex2(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id),
  FOREIGN KEY(Actors_Person_idPerson, Actors_Person_episodes_episode_number, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName, Actors_Person_episodes_season_series_serie_id, Actors_Person_episodes_season_number)
    REFERENCES Actors(Person_idPerson, Person_episodes_episode_number, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName, Person_episodes_season_series_serie_id, Person_episodes_season_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id)
    REFERENCES Person(idPerson, episodes_episode_number, firstName, firstLastName, lastName, secondLastName, episodes_season_number, episodes_season_series_serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE users (
  user_name VARCHAR(50)  NOT NULL  ,
  Person_episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  Person_episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_episodes_episode_number VARCHAR(50)  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  user_email VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(user_name)  ,
INDEX users_FKIndex1(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id),
  FOREIGN KEY(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id)
    REFERENCES Person(idPerson, episodes_episode_number, firstName, firstLastName, lastName, secondLastName, episodes_season_number, episodes_season_series_serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE producers (
  Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Person_episodes_episode_number VARCHAR(50)  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL  ,
  Person_episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  Person_episodes_season_number INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Person_idPerson, Person_episodes_episode_number, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName, Person_episodes_season_series_serie_id, Person_episodes_season_number)  ,
INDEX Producers_FKIndex1(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id),
  FOREIGN KEY(Person_idPerson, Person_episodes_episode_number, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName, Person_episodes_season_number, Person_episodes_season_series_serie_id)
    REFERENCES Person(idPerson, episodes_episode_number, firstName, firstLastName, lastName, secondLastName, episodes_season_number, episodes_season_series_serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE actor_nominations (
  categoriesNominated VARCHAR(50)  NOT NULL  ,
  Actors_Person_episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_lastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_episodes_episode_number VARCHAR(50)  NOT NULL  ,
  Actors_Person_idPerson INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(categoriesNominated, Actors_Person_episodes_season_number, Actors_Person_episodes_season_series_serie_id, Actors_Person_lastName, Actors_Person_secondLastName, Actors_Person_firstName, Actors_Person_firstLastName, Actors_Person_episodes_episode_number, Actors_Person_idPerson)  ,
INDEX actor_nominations_FKIndex1(Actors_Person_idPerson, Actors_Person_episodes_episode_number, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName, Actors_Person_episodes_season_series_serie_id, Actors_Person_episodes_season_number),
  FOREIGN KEY(Actors_Person_idPerson, Actors_Person_episodes_episode_number, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName, Actors_Person_episodes_season_series_serie_id, Actors_Person_episodes_season_number)
    REFERENCES Actors(Person_idPerson, Person_episodes_episode_number, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName, Person_episodes_season_series_serie_id, Person_episodes_season_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE serie_ratings (
  serie_rating_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  users_user_name VARCHAR(50)  NOT NULL  ,
  serie_rating_stars INTEGER UNSIGNED  NOT NULL  ,
  serie_rating_text VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(serie_rating_id, series_serie_id)  ,
INDEX serie_ratings_FKIndex1(series_serie_id)  ,
INDEX serie_ratings_FKIndex2(users_user_name),
  FOREIGN KEY(series_serie_id)
    REFERENCES series(serie_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(users_user_name)
    REFERENCES users(user_name)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE episode_rating (
  episode_rating_id INTEGER UNSIGNED  NOT NULL  ,
  episodes_episode_number VARCHAR(50)  NOT NULL  ,
  episodes_season_number INTEGER UNSIGNED  NOT NULL  ,
  episodes_season_series_serie_id INTEGER UNSIGNED  NOT NULL  ,
  users_user_name VARCHAR(50)  NOT NULL  ,
  episode_rating_text VARCHAR(50)  NOT NULL  ,
  espisode_stars INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(episode_rating_id, episodes_episode_number, episodes_season_number, episodes_season_series_serie_id)  ,
INDEX episode_rating_FKIndex1(users_user_name)  ,
INDEX episode_rating_FKIndex2(episodes_episode_number, episodes_season_series_serie_id, episodes_season_number),
  FOREIGN KEY(users_user_name)
    REFERENCES users(user_name)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(episodes_episode_number, episodes_season_series_serie_id, episodes_season_number)
    REFERENCES episodes(episode_number, season_series_serie_id, season_number)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);

--insertions

insert into series (serie_id, name, country, company) values (1, 'All the Way Home', 'Estonia', 'Rogahn Inc');
insert into series (serie_id, name, country, company) values (2, 'Jack the Giant Killer', 'Bosnia and Herzegovina', 'Conroy Inc');
insert into series (serie_id, name, country, company) values (3, 'Palindromes', 'Guatemala', 'Jakubowski-Berge');
insert into series (serie_id, name, country, company) values (4, 'Dorm Daze (National Lampoon Presents Dorm Daze)', 'China', 'Kilback and Sons');
insert into series (serie_id, name, country, company) values (5, 'Eight Deadly Shots (Kahdeksan surmanluotia)', 'New Zealand', 'Kerluke, Leuschke and Kirlin');
insert into series (serie_id, name, country, company) values (6, 'Before Your Eyes (Min Dit: The Children of Diyarbakir)', 'Argentina', 'Erdman-Windler');
insert into series (serie_id, name, country, company) values (7, 'Monty Python: Almost the Truth - Lawyers Cut', 'Indonesia', 'Lockman and Sons');
insert into series (serie_id, name, country, company) values (8, 'Only Angels Have Wings', 'Indonesia', 'Leffler, Russel and Jacobi');
insert into series (serie_id, name, country, company) values (9, 'Apartment 1303 3D', 'Argentina', 'Schuster-Kertzmann');
insert into series (serie_id, name, country, company) values (10, 'Mobsters', 'China', 'Dach, Hessel and Roob');




