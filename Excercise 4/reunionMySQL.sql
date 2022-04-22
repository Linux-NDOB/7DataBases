CREATE TABLE Lugar (
  id_lugar INTEGER UNSIGNED  NOT NULL  ,
  nombre_lugar VARCHAR(50)  NULL    ,
PRIMARY KEY(id_lugar));



CREATE TABLE Reuniones (
  id_reunion INTEGER UNSIGNED  NOT NULL  ,
  Lugar_id_lugar INTEGER UNSIGNED  NOT NULL  ,
  tema_reunion VARCHAR(50)  NOT NULL  ,
  numero_invitados INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(id_reunion)  ,
INDEX Reuniones_FKIndex1(Lugar_id_lugar),
  FOREIGN KEY(Lugar_id_lugar)
    REFERENCES Lugar(id_lugar)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Recursos (
  id_recurso INTEGER UNSIGNED  NOT NULL  ,
  Lugar_id_lugar INTEGER UNSIGNED  NOT NULL  ,
  nombre_recurso VARCHAR(50)  NOT NULL  ,
  tipo_recurso VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(id_recurso)  ,
INDEX Recursos_FKIndex1(Lugar_id_lugar),
  FOREIGN KEY(Lugar_id_lugar)
    REFERENCES Lugar(id_lugar)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Invitados (
  id_persona INTEGER UNSIGNED  NOT NULL  ,
  Reuniones_id_reunion INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(50)  NOT NULL  ,
  apellido VARCHAR(50)  NOT NULL  ,
  edad INTEGER UNSIGNED  NOT NULL  ,
  cargo VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(id_persona)  ,
INDEX Invitados_FKIndex1(Reuniones_id_reunion),
  FOREIGN KEY(Reuniones_id_reunion)
    REFERENCES Reuniones(id_reunion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




