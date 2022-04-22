CREATE TABLE Personas (
  idPersona INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(50)  NOT NULL  ,
  apellido VARCHAR(50)  NOT NULL  ,
  edad VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idPersona));



CREATE TABLE Pa�ses (
  idPa�s INTEGER UNSIGNED  NOT NULL  ,
  nombre_pa�s VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idPa�s));



CREATE TABLE Locales (
  idLocal INTEGER  NOT NULL  ,
  Pa�ses_idPa�s INTEGER UNSIGNED  NOT NULL  ,
  nombre_local VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idLocal)  ,
INDEX Locales_FKIndex1(Pa�ses_idPa�s),
  FOREIGN KEY(Pa�ses_idPa�s)
    REFERENCES Pa�ses(idPa�s)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Usuarios (
  n_unico INTEGER UNSIGNED  NOT NULL  ,
  Personas_idPersona INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(n_unico)  ,
INDEX Usuarios_FKIndex1(Personas_idPersona),
  FOREIGN KEY(Personas_idPersona)
    REFERENCES Personas(idPersona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Trabajadores (
  idTrabajadores INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Personas_idPersona INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idTrabajadores)  ,
INDEX Trabajadores_FKIndex1(Personas_idPersona),
  FOREIGN KEY(Personas_idPersona)
    REFERENCES Personas(idPersona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Pel�culas (
  idPel�culas INTEGER UNSIGNED  NOT NULL  ,
  Locales_idLocal INTEGER  NOT NULL  ,
  nombre_pel�cula VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idPel�culas)  ,
INDEX Pel�culas_FKIndex1(Locales_idLocal),
  FOREIGN KEY(Locales_idLocal)
    REFERENCES Locales(idLocal)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Categorias (
  nombre_categor�a VARCHAR(50)  NOT NULL  ,
  Pel�culas_idPel�culas INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(nombre_categor�a)  ,
INDEX Categoria_principal_FKIndex1(Pel�culas_idPel�culas),
  FOREIGN KEY(Pel�culas_idPel�culas)
    REFERENCES Pel�culas(idPel�culas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Actor (
  id_actor INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Pel�culas_idPel�culas INTEGER UNSIGNED  NOT NULL  ,
  Personas_idPersona INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(id_actor)  ,
INDEX Actor_FKIndex1(Personas_idPersona)  ,
INDEX Actor_FKIndex2(Pel�culas_idPel�culas),
  FOREIGN KEY(Personas_idPersona)
    REFERENCES Personas(idPersona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Pel�culas_idPel�culas)
    REFERENCES Pel�culas(idPel�culas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Actor_principal (
  Actor_id_actor INTEGER UNSIGNED  NOT NULL  ,
  Pel�culas_idPel�culas INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Actor_id_actor)  ,
INDEX Actor_principal_FKIndex1(Pel�culas_idPel�culas)  ,
INDEX Actor_principal_FKIndex2(Actor_id_actor),
  FOREIGN KEY(Pel�culas_idPel�culas)
    REFERENCES Pel�culas(idPel�culas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Actor_id_actor)
    REFERENCES Actor(id_actor)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Inventario (
  idInventario INTEGER UNSIGNED  NOT NULL  ,
  Locales_idLocal INTEGER  NOT NULL  ,
  Pel�culas_idPel�culas INTEGER UNSIGNED  NOT NULL  ,
  cantidad_pelicula INTEGER UNSIGNED  NOT NULL  ,
  precio_arriendo FLOAT  NOT NULL    ,
PRIMARY KEY(idInventario)  ,
INDEX Inventario_FKIndex2(Pel�culas_idPel�culas),
  FOREIGN KEY(Locales_idLocal)
    REFERENCES Locales(idLocal)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Pel�culas_idPel�culas)
    REFERENCES Pel�culas(idPel�culas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Categor�a_principal (
  Categorias_nombre_categor�a VARCHAR(50)  NOT NULL  ,
  Pel�culas_idPel�culas INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Categorias_nombre_categor�a)  ,
INDEX Categor�a_principal_FKIndex1(Categorias_nombre_categor�a)  ,
INDEX Categor�a_principal_FKIndex2(Pel�culas_idPel�culas),
  FOREIGN KEY(Categorias_nombre_categor�a)
    REFERENCES Categorias(nombre_categor�a)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Pel�culas_idPel�culas)
    REFERENCES Pel�culas(idPel�culas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Arriendos (
  id_arriendo INTEGER UNSIGNED  NOT NULL  ,
  Pel�culas_idPel�culas INTEGER UNSIGNED  NOT NULL  ,
  Locales_idLocal INTEGER  NOT NULL  ,
  Usuarios_n_unico INTEGER UNSIGNED  NOT NULL  ,
  Trabajadores_idTrabajadores INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(id_arriendo)  ,
INDEX Table_17_FKIndex1(Trabajadores_idTrabajadores)  ,
INDEX Table_17_FKIndex2(Usuarios_n_unico)  ,
INDEX Table_17_FKIndex3(Locales_idLocal)  ,
INDEX Table_17_FKIndex4(Pel�culas_idPel�culas),
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




