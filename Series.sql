CREATE DATABASE IF NOT EXISTS MySeries;

CREATE TABLE IF NOT EXISTS Serie (
  idSerie INTEGER UNSIGNED  NOT NULL  ,
  Name VARCHAR(100)  NOT NULL  ,
  Studio VARCHAR(50)  NOT NULL  ,
  OriginalCountry VARCHAR(50)  NOT NULL  ,
  ProductionCompany VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idSerie));



CREATE TABLE IF NOT EXISTS Season (
  numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  numerChapters INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(numberSeason, Serie_idSerie)  ,
INDEX Season_FKIndex1(Serie_idSerie),
  FOREIGN KEY(Serie_idSerie)
    REFERENCES Serie(idSerie)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS Nomination (
  ANominationName VARCHAR(50)  NOT NULL  ,
  Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Academy VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(ANominationName, Serie_idSerie)  ,
INDEX Nomination_FKIndex1(Serie_idSerie),
  FOREIGN KEY(Serie_idSerie)
    REFERENCES Serie(idSerie)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS Category (
  categoryName VARCHAR(100)  NOT NULL  ,
  Serie_idSerie INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(categoryName, Serie_idSerie)  ,
INDEX Category_FKIndex1(Serie_idSerie),
  FOREIGN KEY(Serie_idSerie)
    REFERENCES Serie(idSerie)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS Awards (
  AName VARCHAR(50)  NOT NULL  ,
  Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Academy VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(AName, Serie_idSerie)  ,
INDEX Awards_FKIndex1(Serie_idSerie),
  FOREIGN KEY(Serie_idSerie)
    REFERENCES Serie(idSerie)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS Episode (
  numberEpisode VARCHAR(50)  NOT NULL  ,
  Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Name VARCHAR(50)  NOT NULL  ,
  Duration INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(numberEpisode, Season_Serie_idSerie, Season_numberSeason)  ,
INDEX Episode_FKIndex1(Season_numberSeason, Season_Serie_idSerie),
  FOREIGN KEY(Season_numberSeason, Season_Serie_idSerie)
    REFERENCES Season(numberSeason, Serie_idSerie)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS FilmingLocations (
  Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  localId INTEGER UNSIGNED  NOT NULL  ,
  country VARCHAR(50)  NOT NULL  ,
  city VARCHAR(50)  NOT NULL  ,
  neighborhood VARCHAR(50)  NOT NULL  ,
  street INTEGER UNSIGNED  NOT NULL  ,
  block INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Episode_Season_numberSeason, Episode_Season_Serie_idSerie, Episode_numberEpisode, localId)  ,
INDEX FilmingLocations_FKIndex1(Episode_numberEpisode, Episode_Season_Serie_idSerie, Episode_Season_numberSeason),
  FOREIGN KEY(Episode_numberEpisode, Episode_Season_Serie_idSerie, Episode_Season_numberSeason)
    REFERENCES Episode(numberEpisode, Season_Serie_idSerie, Season_numberSeason)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS ReleaseDate (
  Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  releaseHour INTEGER UNSIGNED  NOT NULL  ,
  releaseDay INTEGER UNSIGNED  NOT NULL  ,
  releaseWeek INTEGER UNSIGNED  NOT NULL  ,
  releaseMonth INTEGER UNSIGNED  NOT NULL  ,
  releaseYear INTEGER UNSIGNED  NOT NULL  ,
  releaseCentury INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Episode_Season_numberSeason, Episode_Season_Serie_idSerie, Episode_numberEpisode)  ,
INDEX ReleaseDate_FKIndex1(Episode_numberEpisode, Episode_Season_Serie_idSerie, Episode_Season_numberSeason),
  FOREIGN KEY(Episode_numberEpisode, Episode_Season_Serie_idSerie, Episode_Season_numberSeason)
    REFERENCES Episode(numberEpisode, Season_Serie_idSerie, Season_numberSeason)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS Person (
  idPerson INTEGER UNSIGNED  NOT NULL  ,
  Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  firstName VARCHAR(50)  NOT NULL  ,
  firstLastName VARCHAR(50)  NOT NULL  ,
  lastName VARCHAR(50)  NOT NULL  ,
  secondLastName VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idPerson, Episode_Season_numberSeason, Episode_Season_Serie_idSerie, Episode_numberEpisode, firstName, firstLastName, lastName, secondLastName)  ,
INDEX Person_FKIndex1(Episode_numberEpisode, Episode_Season_Serie_idSerie, Episode_Season_numberSeason),
  FOREIGN KEY(Episode_numberEpisode, Episode_Season_Serie_idSerie, Episode_Season_numberSeason)
    REFERENCES Episode(numberEpisode, Season_Serie_idSerie, Season_numberSeason)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS Producers (
  Person_Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  Person_Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Person_Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(Person_Episode_numberEpisode, Person_Episode_Season_Serie_idSerie, Person_Episode_Season_numberSeason, Person_idPerson, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName)  ,
INDEX Producers_FKIndex1(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName),
  FOREIGN KEY(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName)
    REFERENCES Person(idPerson, Episode_Season_numberSeason, Episode_Season_Serie_idSerie, Episode_numberEpisode, firstName, firstLastName, lastName, secondLastName)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS TechSpecsList (
  chapterDuration INTEGER UNSIGNED  NOT NULL  ,
  Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  soundMix VARCHAR(50)  NOT NULL  ,
  format VARCHAR(50)  NOT NULL  ,
  aspectRatio VARCHAR(50)  NOT NULL    ,
INDEX TechSpecsList_FKIndex1(Episode_numberEpisode, Episode_Season_Serie_idSerie, Episode_Season_numberSeason),
  FOREIGN KEY(Episode_numberEpisode, Episode_Season_Serie_idSerie, Episode_Season_numberSeason)
    REFERENCES Episode(numberEpisode, Season_Serie_idSerie, Season_numberSeason)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS Writters (
  Person_Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  Person_Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Person_Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(Person_Episode_numberEpisode, Person_Episode_Season_Serie_idSerie, Person_Episode_Season_numberSeason, Person_idPerson, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName)  ,
INDEX Writters_FKIndex1(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName),
  FOREIGN KEY(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName)
    REFERENCES Person(idPerson, Episode_Season_numberSeason, Episode_Season_Serie_idSerie, Episode_numberEpisode, firstName, firstLastName, lastName, secondLastName)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS Actors (
  Person_Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  Person_Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Person_Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(Person_Episode_numberEpisode, Person_Episode_Season_Serie_idSerie, Person_Episode_Season_numberSeason, Person_idPerson, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName)  ,
INDEX Actors_FKIndex1(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName),
  FOREIGN KEY(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName)
    REFERENCES Person(idPerson, Episode_Season_numberSeason, Episode_Season_Serie_idSerie, Episode_numberEpisode, firstName, firstLastName, lastName, secondLastName)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS Directors (
  Person_Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  Person_Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Person_Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(Person_Episode_numberEpisode, Person_Episode_Season_Serie_idSerie, Person_Episode_Season_numberSeason, Person_idPerson, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName)  ,
INDEX Directors_2_FKIndex1(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName),
  FOREIGN KEY(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName)
    REFERENCES Person(idPerson, Episode_Season_numberSeason, Episode_Season_Serie_idSerie, Episode_numberEpisode, firstName, firstLastName, lastName, secondLastName)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS Characters (
  idCharacters INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Person_Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  Person_Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Person_Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_lastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  cNAme VARCHAR(50)  NOT NULL  ,
  csName VARCHAR(50)  NULL  ,
  clNAme VARCHAR(50)  NULL  ,
  cslName VARCHAR(50)  NULL    ,
PRIMARY KEY(idCharacters, Person_Episode_numberEpisode, Person_Episode_Season_Serie_idSerie, Person_Episode_Season_numberSeason, Person_idPerson, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName)  ,
INDEX Characters_FKIndex1(Actors_Person_Episode_numberEpisode, Actors_Person_Episode_Season_Serie_idSerie, Actors_Person_Episode_Season_numberSeason, Actors_Person_idPerson, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName)  ,
INDEX Characters_FKIndex2(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName),
  FOREIGN KEY(Actors_Person_Episode_numberEpisode, Actors_Person_Episode_Season_Serie_idSerie, Actors_Person_Episode_Season_numberSeason, Actors_Person_idPerson, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName)
    REFERENCES Actors(Person_Episode_numberEpisode, Person_Episode_Season_Serie_idSerie, Person_Episode_Season_numberSeason, Person_idPerson, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName)
    REFERENCES Person(idPerson, Episode_Season_numberSeason, Episode_Season_Serie_idSerie, Episode_numberEpisode, firstName, firstLastName, lastName, secondLastName)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS RegisteredUser (
  username VARCHAR(50)  NOT NULL  ,
  Person_Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  Person_Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Person_Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Person_firstName VARCHAR(50)  NOT NULL  ,
  Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Person_lastName VARCHAR(50)  NOT NULL  ,
  email VARCHAR(50)  NOT NULL  ,
  RUPassword VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(username, Person_Episode_numberEpisode, Person_Episode_Season_Serie_idSerie, Person_Episode_Season_numberSeason, Person_idPerson, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName)  ,
INDEX RegisteredUser_FKIndex1(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName),
  FOREIGN KEY(Person_idPerson, Person_Episode_Season_numberSeason, Person_Episode_Season_Serie_idSerie, Person_Episode_numberEpisode, Person_firstName, Person_firstLastName, Person_lastName, Person_secondLastName)
    REFERENCES Person(idPerson, Episode_Season_numberSeason, Episode_Season_Serie_idSerie, Episode_numberEpisode, firstName, firstLastName, lastName, secondLastName)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS SerieAwards (
  CategoryNominated VARCHAR(50)  NOT NULL  ,
  Actors_Person_lastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_Episode_numberEpisode VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(CategoryNominated)  ,
INDEX SerieAwards_FKIndex1(Actors_Person_Episode_numberEpisode, Actors_Person_Episode_Season_Serie_idSerie, Actors_Person_Episode_Season_numberSeason, Actors_Person_idPerson, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName),
  FOREIGN KEY(Actors_Person_Episode_numberEpisode, Actors_Person_Episode_Season_Serie_idSerie, Actors_Person_Episode_Season_numberSeason, Actors_Person_idPerson, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName)
    REFERENCES Actors(Person_Episode_numberEpisode, Person_Episode_Season_Serie_idSerie, Person_Episode_Season_numberSeason, Person_idPerson, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS BySerieAwards (
  CateogryWon VARCHAR(50)  NOT NULL  ,
  Actors_Person_lastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_secondLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstName VARCHAR(50)  NOT NULL  ,
  Actors_Person_firstLastName VARCHAR(50)  NOT NULL  ,
  Actors_Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Actors_Person_Episode_numberEpisode VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(CateogryWon)  ,
INDEX BySerieAwards_FKIndex1(Actors_Person_Episode_numberEpisode, Actors_Person_Episode_Season_Serie_idSerie, Actors_Person_Episode_Season_numberSeason, Actors_Person_idPerson, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName),
  FOREIGN KEY(Actors_Person_Episode_numberEpisode, Actors_Person_Episode_Season_Serie_idSerie, Actors_Person_Episode_Season_numberSeason, Actors_Person_idPerson, Actors_Person_firstLastName, Actors_Person_firstName, Actors_Person_secondLastName, Actors_Person_lastName)
    REFERENCES Actors(Person_Episode_numberEpisode, Person_Episode_Season_Serie_idSerie, Person_Episode_Season_numberSeason, Person_idPerson, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS EpisodeScore (
  EpisodeScorePoints INTEGER UNSIGNED  NOT NULL  ,
  RegisteredUser_username VARCHAR(50)  NOT NULL  ,
  Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  RegisteredUser_Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  RegisteredUser_Person_Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  RegisteredUser_Person_Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  RegisteredUser_Person_Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  RegisteredUser_Person_firstName VARCHAR(50)  NOT NULL  ,
  RegisteredUser_Person_firstLastName VARCHAR(50)  NOT NULL  ,
  RegisteredUser_Person_lastName VARCHAR(50)  NOT NULL  ,
  RegisteredUser_Person_secondLastName VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(EpisodeScorePoints, RegisteredUser_username, Episode_Season_numberSeason, Episode_Season_Serie_idSerie, Episode_numberEpisode, RegisteredUser_Person_idPerson, RegisteredUser_Person_Episode_Season_numberSeason, RegisteredUser_Person_Episode_Season_Serie_idSerie, RegisteredUser_Person_Episode_numberEpisode, RegisteredUser_Person_firstName, RegisteredUser_Person_firstLastName, RegisteredUser_Person_lastName, RegisteredUser_Person_secondLastName)  ,
INDEX EpisodeScore_FKIndex1(RegisteredUser_username, RegisteredUser_Person_Episode_numberEpisode, RegisteredUser_Person_Episode_Season_Serie_idSerie, RegisteredUser_Person_Episode_Season_numberSeason, RegisteredUser_Person_idPerson, RegisteredUser_Person_firstLastName, RegisteredUser_Person_firstName, RegisteredUser_Person_secondLastName, RegisteredUser_Person_lastName)  ,
INDEX EpisodeScore_FKIndex2(Episode_numberEpisode, Episode_Season_Serie_idSerie, Episode_Season_numberSeason),
  FOREIGN KEY(RegisteredUser_username, RegisteredUser_Person_Episode_numberEpisode, RegisteredUser_Person_Episode_Season_Serie_idSerie, RegisteredUser_Person_Episode_Season_numberSeason, RegisteredUser_Person_idPerson, RegisteredUser_Person_firstLastName, RegisteredUser_Person_firstName, RegisteredUser_Person_secondLastName, RegisteredUser_Person_lastName)
    REFERENCES RegisteredUser(username, Person_Episode_numberEpisode, Person_Episode_Season_Serie_idSerie, Person_Episode_Season_numberSeason, Person_idPerson, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Episode_numberEpisode, Episode_Season_Serie_idSerie, Episode_Season_numberSeason)
    REFERENCES Episode(numberEpisode, Season_Serie_idSerie, Season_numberSeason)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE IF NOT EXISTS Rating (
  ValorationId INTEGER UNSIGNED  NOT NULL  ,
  Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  RegisteredUser_Person_lastName VARCHAR(50)  NOT NULL  ,
  RegisteredUser_Person_secondLastName VARCHAR(50)  NOT NULL  ,
  RegisteredUser_Person_firstName VARCHAR(50)  NOT NULL  ,
  RegisteredUser_Person_firstLastName VARCHAR(50)  NOT NULL  ,
  RegisteredUser_Person_idPerson INTEGER UNSIGNED  NOT NULL  ,
  RegisteredUser_Person_Episode_Season_numberSeason INTEGER UNSIGNED  NOT NULL  ,
  RegisteredUser_Person_Episode_Season_Serie_idSerie INTEGER UNSIGNED  NOT NULL  ,
  RegisteredUser_Person_Episode_numberEpisode VARCHAR(50)  NOT NULL  ,
  RegisteredUser_username VARCHAR(50)  NOT NULL  ,
  RatingSatrs INTEGER UNSIGNED  NOT NULL  ,
  SerieScoreValue VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(ValorationId)  ,
INDEX Rating_FKIndex1(RegisteredUser_username, RegisteredUser_Person_Episode_numberEpisode, RegisteredUser_Person_Episode_Season_Serie_idSerie, RegisteredUser_Person_Episode_Season_numberSeason, RegisteredUser_Person_idPerson, RegisteredUser_Person_firstLastName, RegisteredUser_Person_firstName, RegisteredUser_Person_secondLastName, RegisteredUser_Person_lastName)  ,
INDEX Rating_FKIndex2(Serie_idSerie),
  FOREIGN KEY(RegisteredUser_username, RegisteredUser_Person_Episode_numberEpisode, RegisteredUser_Person_Episode_Season_Serie_idSerie, RegisteredUser_Person_Episode_Season_numberSeason, RegisteredUser_Person_idPerson, RegisteredUser_Person_firstLastName, RegisteredUser_Person_firstName, RegisteredUser_Person_secondLastName, RegisteredUser_Person_lastName)
    REFERENCES RegisteredUser(username, Person_Episode_numberEpisode, Person_Episode_Season_Serie_idSerie, Person_Episode_Season_numberSeason, Person_idPerson, Person_firstLastName, Person_firstName, Person_secondLastName, Person_lastName)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Serie_idSerie)
    REFERENCES Serie(idSerie)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




