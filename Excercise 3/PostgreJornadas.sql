CREATE TABLE WorkShops (
  idWorkShops INTEGER   NOT NULL ,
  nombre_workshop VARCHAR(50)   NOT NULL ,
  tema_workshop VARCHAR(50)   NOT NULL ,
  descripcion_workshop INTEGER   NOT NULL   ,
PRIMARY KEY(idWorkShops));



CREATE TABLE Persona (
  idPersona INTEGER   NOT NULL ,
  nombre VARCHAR(50)   NOT NULL ,
  apellido VARCHAR(50)   NOT NULL ,
  edad INTEGER   NOT NULL   ,
PRIMARY KEY(idPersona));



CREATE TABLE Artículo (
  idArtículo INTEGER   NOT NULL ,
  WorkShops_idWorkShops INTEGER   NOT NULL ,
  nombre_artículo VARCHAR(50)   NOT NULL ,
  tema_artículo VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idArtículo)  ,
  FOREIGN KEY(WorkShops_idWorkShops)
    REFERENCES WorkShops(idWorkShops)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Artículo_FKIndex1 ON Artículo (WorkShops_idWorkShops);



CREATE TABLE Charlas (
  charla_id INTEGER   NOT NULL ,
  WorkShops_idWorkShops INTEGER   NOT NULL ,
  nombre_charla VARCHAR(50)   NOT NULL ,
  tema_charla VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(charla_id)  ,
  FOREIGN KEY(WorkShops_idWorkShops)
    REFERENCES WorkShops(idWorkShops)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Charlas_FKIndex1 ON Charlas (WorkShops_idWorkShops);



CREATE TABLE Escritores (
  idEscritores INTEGER   NOT NULL ,
  Persona_idPersona INTEGER   NOT NULL ,
  Artículo_idArtículo INTEGER   NOT NULL   ,
PRIMARY KEY(idEscritores)    ,
  FOREIGN KEY(Artículo_idArtículo)
    REFERENCES Artículo(idArtículo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Persona_idPersona)
    REFERENCES Persona(idPersona)
      ON UPDATE CASCADE);


CREATE INDEX Escritores_FKIndex1 ON Escritores (Artículo_idArtículo);
CREATE INDEX Escritores_FKIndex2 ON Escritores (Persona_idPersona);



CREATE TABLE Expositor (
  idExpositor INTEGER   NOT NULL ,
  Charlas_charla_id INTEGER   NOT NULL ,
  Persona_idPersona INTEGER   NOT NULL   ,
PRIMARY KEY(idExpositor)    ,
  FOREIGN KEY(Persona_idPersona)
    REFERENCES Persona(idPersona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Charlas_charla_id)
    REFERENCES Charlas(charla_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Expositor_FKIndex1 ON Expositor (Persona_idPersona);
CREATE INDEX Expositor_FKIndex2 ON Expositor (Charlas_charla_id);




