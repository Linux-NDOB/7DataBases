CREATE TABLE Lugar (
  id_lugar INTEGER   NOT NULL ,
  nombre_lugar VARCHAR(50)      ,
PRIMARY KEY(id_lugar));



CREATE TABLE Reuniones (
  id_reunion INTEGER   NOT NULL ,
  Lugar_id_lugar INTEGER   NOT NULL ,
  tema_reunion VARCHAR(50)   NOT NULL ,
  numero_invitados INTEGER   NOT NULL   ,
PRIMARY KEY(id_reunion)  ,
  FOREIGN KEY(Lugar_id_lugar)
    REFERENCES Lugar(id_lugar)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Reuniones_FKIndex1 ON Reuniones (Lugar_id_lugar);



CREATE TABLE Recursos (
  id_recurso INTEGER   NOT NULL ,
  Lugar_id_lugar INTEGER   NOT NULL ,
  nombre_recurso VARCHAR(50)   NOT NULL ,
  tipo_recurso VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(id_recurso)  ,
  FOREIGN KEY(Lugar_id_lugar)
    REFERENCES Lugar(id_lugar)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Recursos_FKIndex1 ON Recursos (Lugar_id_lugar);



CREATE TABLE Invitados (
  id_persona INTEGER   NOT NULL ,
  Reuniones_id_reunion INTEGER   NOT NULL ,
  nombre VARCHAR(50)   NOT NULL ,
  apellido VARCHAR(50)   NOT NULL ,
  edad INTEGER   NOT NULL ,
  cargo VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(id_persona)  ,
  FOREIGN KEY(Reuniones_id_reunion)
    REFERENCES Reuniones(id_reunion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Invitados_FKIndex1 ON Invitados (Reuniones_id_reunion);




