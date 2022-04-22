CREATE TABLE Personas (
  idPersona INTEGER   NOT NULL ,
  nombre VARCHAR(50)   NOT NULL ,
  apellido VARCHAR(50)   NOT NULL ,
  edad VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idPersona));



CREATE TABLE Pa�ses (
  idPa�s INTEGER   NOT NULL ,
  nombre_pa�s VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idPa�s));



CREATE TABLE Locales (
  idLocal INTEGER   NOT NULL ,
  Pa�ses_idPa�s INTEGER   NOT NULL ,
  nombre_local VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idLocal)  ,
  FOREIGN KEY(Pa�ses_idPa�s)
    REFERENCES Pa�ses(idPa�s)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Locales_FKIndex1 ON Locales (Pa�ses_idPa�s);



CREATE TABLE Usuarios (
  n_unico INTEGER   NOT NULL ,
  Personas_idPersona INTEGER   NOT NULL   ,
PRIMARY KEY(n_unico)  ,
  FOREIGN KEY(Personas_idPersona)
    REFERENCES Personas(idPersona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Usuarios_FKIndex1 ON Usuarios (Personas_idPersona);



CREATE TABLE Trabajadores (
  idTrabajadores SERIAL  NOT NULL ,
  Personas_idPersona INTEGER   NOT NULL   ,
PRIMARY KEY(idTrabajadores)  ,
  FOREIGN KEY(Personas_idPersona)
    REFERENCES Personas(idPersona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Trabajadores_FKIndex1 ON Trabajadores (Personas_idPersona);



CREATE TABLE Pel�culas (
  idPel�culas INTEGER   NOT NULL ,
  Locales_idLocal INTEGER   NOT NULL ,
  nombre_pel�cula VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idPel�culas)  ,
  FOREIGN KEY(Locales_idLocal)
    REFERENCES Locales(idLocal)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Pel�culas_FKIndex1 ON Pel�culas (Locales_idLocal);



CREATE TABLE Categorias (
  nombre_categor�a VARCHAR(50)   NOT NULL ,
  Pel�culas_idPel�culas INTEGER   NOT NULL   ,
PRIMARY KEY(nombre_categor�a)  ,
  FOREIGN KEY(Pel�culas_idPel�culas)
    REFERENCES Pel�culas(idPel�culas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Categoria_principal_FKIndex1 ON Categorias (Pel�culas_idPel�culas);



CREATE TABLE Actor (
  id_actor SERIAL  NOT NULL ,
  Pel�culas_idPel�culas INTEGER   NOT NULL ,
  Personas_idPersona INTEGER   NOT NULL   ,
PRIMARY KEY(id_actor)    ,
  FOREIGN KEY(Personas_idPersona)
    REFERENCES Personas(idPersona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Pel�culas_idPel�culas)
    REFERENCES Pel�culas(idPel�culas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Actor_FKIndex1 ON Actor (Personas_idPersona);
CREATE INDEX Actor_FKIndex2 ON Actor (Pel�culas_idPel�culas);



CREATE TABLE Actor_principal (
  Actor_id_actor INTEGER   NOT NULL ,
  Pel�culas_idPel�culas INTEGER   NOT NULL   ,
PRIMARY KEY(Actor_id_actor)    ,
  FOREIGN KEY(Pel�culas_idPel�culas)
    REFERENCES Pel�culas(idPel�culas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Actor_id_actor)
    REFERENCES Actor(id_actor)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Actor_principal_FKIndex1 ON Actor_principal (Pel�culas_idPel�culas);
CREATE INDEX Actor_principal_FKIndex2 ON Actor_principal (Actor_id_actor);



CREATE TABLE Inventario (
  idInventario INTEGER   NOT NULL ,
  Locales_idLocal INTEGER   NOT NULL ,
  Pel�culas_idPel�culas INTEGER   NOT NULL ,
  cantidad_pelicula INTEGER   NOT NULL ,
  precio_arriendo FLOAT   NOT NULL   ,
PRIMARY KEY(idInventario)  ,
  FOREIGN KEY(Locales_idLocal)
    REFERENCES Locales(idLocal)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Pel�culas_idPel�culas)
    REFERENCES Pel�culas(idPel�culas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Inventario_FKIndex2 ON Inventario (Pel�culas_idPel�culas);



CREATE TABLE Categor�a_principal (
  Categorias_nombre_categor�a VARCHAR(50)   NOT NULL ,
  Pel�culas_idPel�culas INTEGER   NOT NULL   ,
PRIMARY KEY(Categorias_nombre_categor�a)    ,
  FOREIGN KEY(Categorias_nombre_categor�a)
    REFERENCES Categorias(nombre_categor�a)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Pel�culas_idPel�culas)
    REFERENCES Pel�culas(idPel�culas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Categor�a_principal_FKIndex1 ON Categor�a_principal (Categorias_nombre_categor�a);
CREATE INDEX Categor�a_principal_FKIndex2 ON Categor�a_principal (Pel�culas_idPel�culas);



CREATE TABLE Arriendos (
  id_arriendo INTEGER   NOT NULL ,
  Pel�culas_idPel�culas INTEGER   NOT NULL ,
  Locales_idLocal INTEGER   NOT NULL ,
  Usuarios_n_unico INTEGER   NOT NULL ,
  Trabajadores_idTrabajadores INTEGER   NOT NULL   ,
PRIMARY KEY(id_arriendo)        ,
  FOREIGN KEY(Trabajadores_idTrabajadores)
    REFERENCES Trabajadores(idTrabajadores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Usuarios_n_unico)
    REFERENCES Usuarios(n_unico)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Locales_idLocal)
    REFERENCES Locales(idLocal)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Pel�culas_idPel�culas)
    REFERENCES Pel�culas(idPel�culas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Table_17_FKIndex1 ON Arriendos (Trabajadores_idTrabajadores);
CREATE INDEX Table_17_FKIndex2 ON Arriendos (Usuarios_n_unico);
CREATE INDEX Table_17_FKIndex3 ON Arriendos (Locales_idLocal);
CREATE INDEX Table_17_FKIndex4 ON Arriendos (Pel�culas_idPel�culas);




