CREATE TABLE Personas (
  idPersona INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(50)  NOT NULL  ,
  apellido VARCHAR(50)  NOT NULL  ,
  edad VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idPersona));



CREATE TABLE Países (
  idPaís INTEGER UNSIGNED  NOT NULL  ,
  nombre_país VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idPaís));



CREATE TABLE Locales (
  idLocal INTEGER  NOT NULL  ,
  Países_idPaís INTEGER UNSIGNED  NOT NULL  ,
  nombre_local VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idLocal)  ,
INDEX Locales_FKIndex1(Países_idPaís),
  FOREIGN KEY(Países_idPaís)
    REFERENCES Países(idPaís)
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



CREATE TABLE Películas (
  idPelículas INTEGER UNSIGNED  NOT NULL  ,
  Locales_idLocal INTEGER  NOT NULL  ,
  nombre_película VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idPelículas)  ,
INDEX Películas_FKIndex1(Locales_idLocal),
  FOREIGN KEY(Locales_idLocal)
    REFERENCES Locales(idLocal)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Categorias (
  nombre_categoría VARCHAR(50)  NOT NULL  ,
  Películas_idPelículas INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(nombre_categoría)  ,
INDEX Categoria_principal_FKIndex1(Películas_idPelículas),
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Actor (
  id_actor INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Películas_idPelículas INTEGER UNSIGNED  NOT NULL  ,
  Personas_idPersona INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(id_actor)  ,
INDEX Actor_FKIndex1(Personas_idPersona)  ,
INDEX Actor_FKIndex2(Películas_idPelículas),
  FOREIGN KEY(Personas_idPersona)
    REFERENCES Personas(idPersona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Actor_principal (
  Actor_id_actor INTEGER UNSIGNED  NOT NULL  ,
  Películas_idPelículas INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Actor_id_actor)  ,
INDEX Actor_principal_FKIndex1(Películas_idPelículas)  ,
INDEX Actor_principal_FKIndex2(Actor_id_actor),
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Actor_id_actor)
    REFERENCES Actor(id_actor)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Inventario (
  idInventario INTEGER UNSIGNED  NOT NULL  ,
  Locales_idLocal INTEGER  NOT NULL  ,
  Películas_idPelículas INTEGER UNSIGNED  NOT NULL  ,
  cantidad_pelicula INTEGER UNSIGNED  NOT NULL  ,
  precio_arriendo FLOAT  NOT NULL    ,
PRIMARY KEY(idInventario)  ,
INDEX Inventario_FKIndex2(Películas_idPelículas),
  FOREIGN KEY(Locales_idLocal)
    REFERENCES Locales(idLocal)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Categoría_principal (
  Categorias_nombre_categoría VARCHAR(50)  NOT NULL  ,
  Películas_idPelículas INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Categorias_nombre_categoría)  ,
INDEX Categoría_principal_FKIndex1(Categorias_nombre_categoría)  ,
INDEX Categoría_principal_FKIndex2(Películas_idPelículas),
  FOREIGN KEY(Categorias_nombre_categoría)
    REFERENCES Categorias(nombre_categoría)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Arriendos (
  id_arriendo INTEGER UNSIGNED  NOT NULL  ,
  Películas_idPelículas INTEGER UNSIGNED  NOT NULL  ,
  Locales_idLocal INTEGER  NOT NULL  ,
  Usuarios_n_unico INTEGER UNSIGNED  NOT NULL  ,
  Trabajadores_idTrabajadores INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(id_arriendo)  ,
INDEX Table_17_FKIndex1(Trabajadores_idTrabajadores)  ,
INDEX Table_17_FKIndex2(Usuarios_n_unico)  ,
INDEX Table_17_FKIndex3(Locales_idLocal)  ,
INDEX Table_17_FKIndex4(Películas_idPelículas),
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
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




