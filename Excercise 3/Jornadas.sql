CREATE TABLE WorkShops (
  idWorkShops INTEGER UNSIGNED  NOT NULL  ,
  nombre_workshop VARCHAR(50)  NOT NULL  ,
  tema_workshop VARCHAR(50)  NOT NULL  ,
  descripcion_workshop INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idWorkShops));



CREATE TABLE Persona (
  idPersona INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(50)  NOT NULL  ,
  apellido VARCHAR(50)  NOT NULL  ,
  edad INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idPersona));



CREATE TABLE Artículo (
  idArtículo INTEGER UNSIGNED  NOT NULL  ,
  WorkShops_idWorkShops INTEGER UNSIGNED  NOT NULL  ,
  nombre_artículo VARCHAR(50)  NOT NULL  ,
  tema_artículo VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idArtículo)  ,
INDEX Artículo_FKIndex1(WorkShops_idWorkShops),
  FOREIGN KEY(WorkShops_idWorkShops)
    REFERENCES WorkShops(idWorkShops)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Charlas (
  charla_id INTEGER UNSIGNED  NOT NULL  ,
  WorkShops_idWorkShops INTEGER UNSIGNED  NOT NULL  ,
  nombre_charla VARCHAR(50)  NOT NULL  ,
  tema_charla VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(charla_id)  ,
INDEX Charlas_FKIndex1(WorkShops_idWorkShops),
  FOREIGN KEY(WorkShops_idWorkShops)
    REFERENCES WorkShops(idWorkShops)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Escritores (
  idEscritores INTEGER UNSIGNED  NOT NULL  ,
  Persona_idPersona INTEGER UNSIGNED  NOT NULL  ,
  Artículo_idArtículo INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idEscritores)  ,
INDEX Escritores_FKIndex1(Artículo_idArtículo)  ,
INDEX Escritores_FKIndex2(Persona_idPersona),
  FOREIGN KEY(Artículo_idArtículo)
    REFERENCES Artículo(idArtículo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Persona_idPersona)
    REFERENCES Persona(idPersona)
      ON DELETE NO ACTION
      ON UPDATE CASCADE);



CREATE TABLE Expositor (
  idExpositor INTEGER UNSIGNED  NOT NULL  ,
  Charlas_charla_id INTEGER UNSIGNED  NOT NULL  ,
  Persona_idPersona INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idExpositor)  ,
INDEX Expositor_FKIndex1(Persona_idPersona)  ,
INDEX Expositor_FKIndex2(Charlas_charla_id),
  FOREIGN KEY(Persona_idPersona)
    REFERENCES Persona(idPersona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Charlas_charla_id)
    REFERENCES Charlas(charla_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




