CREATE TABLE Personas (
  idPersona INTEGER   NOT NULL ,
  nombre VARCHAR(50)   NOT NULL ,
  apellido VARCHAR(50)   NOT NULL ,
  edad VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idPersona));



CREATE TABLE Países (
  idPaís INTEGER   NOT NULL ,
  nombre_país VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idPaís));



CREATE TABLE Locales (
  idLocal INTEGER   NOT NULL ,
  Países_idPaís INTEGER   NOT NULL ,
  nombre_local VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idLocal)  ,
  FOREIGN KEY(Países_idPaís)
    REFERENCES Países(idPaís)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Locales_FKIndex1 ON Locales (Países_idPaís);



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



CREATE TABLE Películas (
  idPelículas INTEGER   NOT NULL ,
  Locales_idLocal INTEGER   NOT NULL ,
  nombre_película VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idPelículas)  ,
  FOREIGN KEY(Locales_idLocal)
    REFERENCES Locales(idLocal)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Películas_FKIndex1 ON Películas (Locales_idLocal);



CREATE TABLE Categorias (
  nombre_categoría VARCHAR(50)   NOT NULL ,
  Películas_idPelículas INTEGER   NOT NULL   ,
PRIMARY KEY(nombre_categoría)  ,
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Categoria_principal_FKIndex1 ON Categorias (Películas_idPelículas);



CREATE TABLE Actor (
  id_actor SERIAL  NOT NULL ,
  Películas_idPelículas INTEGER   NOT NULL ,
  Personas_idPersona INTEGER   NOT NULL   ,
PRIMARY KEY(id_actor)    ,
  FOREIGN KEY(Personas_idPersona)
    REFERENCES Personas(idPersona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Actor_FKIndex1 ON Actor (Personas_idPersona);
CREATE INDEX Actor_FKIndex2 ON Actor (Películas_idPelículas);



CREATE TABLE Actor_principal (
  Actor_id_actor INTEGER   NOT NULL ,
  Películas_idPelículas INTEGER   NOT NULL   ,
PRIMARY KEY(Actor_id_actor)    ,
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Actor_id_actor)
    REFERENCES Actor(id_actor)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Actor_principal_FKIndex1 ON Actor_principal (Películas_idPelículas);
CREATE INDEX Actor_principal_FKIndex2 ON Actor_principal (Actor_id_actor);



CREATE TABLE Inventario (
  idInventario INTEGER   NOT NULL ,
  Locales_idLocal INTEGER   NOT NULL ,
  Películas_idPelículas INTEGER   NOT NULL ,
  cantidad_pelicula INTEGER   NOT NULL ,
  precio_arriendo FLOAT   NOT NULL   ,
PRIMARY KEY(idInventario)  ,
  FOREIGN KEY(Locales_idLocal)
    REFERENCES Locales(idLocal)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Inventario_FKIndex2 ON Inventario (Películas_idPelículas);



CREATE TABLE Categoría_principal (
  Categorias_nombre_categoría VARCHAR(50)   NOT NULL ,
  Películas_idPelículas INTEGER   NOT NULL   ,
PRIMARY KEY(Categorias_nombre_categoría)    ,
  FOREIGN KEY(Categorias_nombre_categoría)
    REFERENCES Categorias(nombre_categoría)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Categoría_principal_FKIndex1 ON Categoría_principal (Categorias_nombre_categoría);
CREATE INDEX Categoría_principal_FKIndex2 ON Categoría_principal (Películas_idPelículas);



CREATE TABLE Arriendos (
  id_arriendo INTEGER   NOT NULL ,
  Películas_idPelículas INTEGER   NOT NULL ,
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
  FOREIGN KEY(Películas_idPelículas)
    REFERENCES Películas(idPelículas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Table_17_FKIndex1 ON Arriendos (Trabajadores_idTrabajadores);
CREATE INDEX Table_17_FKIndex2 ON Arriendos (Usuarios_n_unico);
CREATE INDEX Table_17_FKIndex3 ON Arriendos (Locales_idLocal);
CREATE INDEX Table_17_FKIndex4 ON Arriendos (Películas_idPelículas);




