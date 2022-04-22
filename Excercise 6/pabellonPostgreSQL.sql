CREATE TABLE Pabellones (
  numero_pabellon INTEGER   NOT NULL ,
  bloque INTEGER   NOT NULL ,
  nombre VARCHAR(50)   NOT NULL ,
  pisos INTEGER   NOT NULL   ,
PRIMARY KEY(numero_pabellon));



CREATE TABLE Personas (
  id_persona INTEGER   NOT NULL ,
  nombre VARCHAR(50)   NOT NULL ,
  apellido VARCHAR(50)   NOT NULL ,
  edad VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(id_persona));



CREATE TABLE Realizadas (
  idRealizadas INTEGER   NOT NULL   ,
PRIMARY KEY(idRealizadas));



CREATE TABLE Horarios (
  Pabellones_numero_pabellon INTEGER   NOT NULL ,
  hora INTEGER   NOT NULL ,
  dia INTEGER   NOT NULL ,
  mes INTEGER   NOT NULL ,
  semana INTEGER   NOT NULL ,
  estado VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(Pabellones_numero_pabellon)  ,
  FOREIGN KEY(Pabellones_numero_pabellon)
    REFERENCES Pabellones(numero_pabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Horarios_FKIndex1 ON Horarios (Pabellones_numero_pabellon);



CREATE TABLE M�dulo (
  idM�dulo INTEGER   NOT NULL ,
  Pabellones_numero_pabellon INTEGER   NOT NULL ,
  nombre_m�dulo INTEGER   NOT NULL   ,
PRIMARY KEY(idM�dulo)  ,
  FOREIGN KEY(Pabellones_numero_pabellon)
    REFERENCES Pabellones(numero_pabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX M�dulo_FKIndex1 ON M�dulo (Pabellones_numero_pabellon);



CREATE TABLE M�dicos (
  id_profesional INTEGER   NOT NULL ,
  Personas_id_persona INTEGER   NOT NULL   ,
PRIMARY KEY(id_profesional)  ,
  FOREIGN KEY(Personas_id_persona)
    REFERENCES Personas(id_persona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX M�dicos_FKIndex1 ON M�dicos (Personas_id_persona);



CREATE TABLE Insumos (
  idInsumos INTEGER   NOT NULL ,
  M�dulo_idM�dulo INTEGER   NOT NULL ,
  nombre_insumo VARCHAR(50)   NOT NULL ,
  tiepo_insumo VARCHAR(50)   NOT NULL ,
  p_unidad FLOAT   NOT NULL ,
  cantidad_insumo INTEGER   NOT NULL   ,
PRIMARY KEY(idInsumos)  ,
  FOREIGN KEY(M�dulo_idM�dulo)
    REFERENCES M�dulo(idM�dulo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Insumos_FKIndex1 ON Insumos (M�dulo_idM�dulo);



CREATE TABLE Equipo_medico (
  idEquipo_medico INTEGER   NOT NULL ,
  M�dulo_idM�dulo INTEGER   NOT NULL ,
  nombre_equipo VARCHAR(50)   NOT NULL ,
  funcion_equipo VARCHAR(50)   NOT NULL ,
  tipo_equipo VARCHAR(50)   NOT NULL ,
  descripcion_equipo VARCHAR(100)   NOT NULL   ,
PRIMARY KEY(idEquipo_medico)  ,
  FOREIGN KEY(M�dulo_idM�dulo)
    REFERENCES M�dulo(idM�dulo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Equipo_medico_FKIndex1 ON Equipo_medico (M�dulo_idM�dulo);



CREATE TABLE Arsenalero (
  idArsenalero SERIAL  NOT NULL ,
  M�dicos_id_profesional INTEGER   NOT NULL   ,
PRIMARY KEY(idArsenalero)  ,
  FOREIGN KEY(M�dicos_id_profesional)
    REFERENCES M�dicos(id_profesional)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Arsenalero_FKIndex1 ON Arsenalero (M�dicos_id_profesional);



CREATE TABLE Anestesista (
  idAnestesista SERIAL  NOT NULL ,
  M�dicos_id_profesional INTEGER   NOT NULL   ,
PRIMARY KEY(idAnestesista)  ,
  FOREIGN KEY(M�dicos_id_profesional)
    REFERENCES M�dicos(id_profesional)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Anestesista_FKIndex1 ON Anestesista (M�dicos_id_profesional);



CREATE TABLE Pacientes (
  idPaciente INTEGER   NOT NULL ,
  Personas_id_persona INTEGER   NOT NULL   ,
PRIMARY KEY(idPaciente)  ,
  FOREIGN KEY(Personas_id_persona)
    REFERENCES Personas(id_persona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Pacientes_FKIndex1 ON Pacientes (Personas_id_persona);



CREATE TABLE Cirujano (
  idCirujano SERIAL  NOT NULL ,
  M�dicos_id_profesional INTEGER   NOT NULL   ,
PRIMARY KEY(idCirujano)  ,
  FOREIGN KEY(M�dicos_id_profesional)
    REFERENCES M�dicos(id_profesional)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Cirujano_FKIndex1 ON Cirujano (M�dicos_id_profesional);



CREATE TABLE Historial_cirug�as (
  idHistorial_cirug�as INTEGER   NOT NULL ,
  Realizadas_idRealizadas INTEGER   NOT NULL ,
  Pacientes_idPaciente INTEGER   NOT NULL   ,
PRIMARY KEY(idHistorial_cirug�as)    ,
  FOREIGN KEY(Pacientes_idPaciente)
    REFERENCES Pacientes(idPaciente)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Realizadas_idRealizadas)
    REFERENCES Realizadas(idRealizadas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Historial_cirug�as_FKIndex1 ON Historial_cirug�as (Pacientes_idPaciente);
CREATE INDEX Historial_cirug�as_FKIndex2 ON Historial_cirug�as (Realizadas_idRealizadas);



CREATE TABLE Cirug�as (
  idCirug�as INTEGER   NOT NULL ,
  Equipo_medico_idEquipo_medico INTEGER   NOT NULL ,
  Insumos_idInsumos INTEGER   NOT NULL ,
  M�dulo_idM�dulo INTEGER   NOT NULL ,
  nombre_cirugia VARCHAR(50)   NOT NULL ,
  descripcion_cirugia VARCHAR(100)   NOT NULL ,
  finalidad_cirugia VARCHAR(100)   NOT NULL ,
  duraci�n_minutos INTEGER   NOT NULL   ,
PRIMARY KEY(idCirug�as)      ,
  FOREIGN KEY(M�dulo_idM�dulo)
    REFERENCES M�dulo(idM�dulo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Insumos_idInsumos)
    REFERENCES Insumos(idInsumos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Equipo_medico_idEquipo_medico)
    REFERENCES Equipo_medico(idEquipo_medico)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Cirug�as_FKIndex1 ON Cirug�as (M�dulo_idM�dulo);
CREATE INDEX Cirug�as_FKIndex2 ON Cirug�as (Insumos_idInsumos);
CREATE INDEX Cirug�as_FKIndex3 ON Cirug�as (Equipo_medico_idEquipo_medico);



CREATE TABLE Agendar_cirug�a (
  idAgenda INTEGER   NOT NULL ,
  Arsenalero_idArsenalero INTEGER   NOT NULL ,
  Anestesista_idAnestesista INTEGER   NOT NULL ,
  Cirujano_idCirujano INTEGER   NOT NULL ,
  Horarios_Pabellones_numero_pabellon INTEGER   NOT NULL ,
  Cirug�as_idCirug�as INTEGER   NOT NULL   ,
PRIMARY KEY(idAgenda)          ,
  FOREIGN KEY(Cirug�as_idCirug�as)
    REFERENCES Cirug�as(idCirug�as)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Horarios_Pabellones_numero_pabellon)
    REFERENCES Horarios(Pabellones_numero_pabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Cirujano_idCirujano)
    REFERENCES Cirujano(idCirujano)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Anestesista_idAnestesista)
    REFERENCES Anestesista(idAnestesista)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Arsenalero_idArsenalero)
    REFERENCES Arsenalero(idArsenalero)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Cirug�a_agendada_FKIndex1 ON Agendar_cirug�a (Cirug�as_idCirug�as);
CREATE INDEX Cirug�a_agendada_FKIndex3 ON Agendar_cirug�a (Horarios_Pabellones_numero_pabellon);
CREATE INDEX Agendar_cirug�a_FKIndex4 ON Agendar_cirug�a (Cirujano_idCirujano);
CREATE INDEX Agendar_cirug�a_FKIndex5 ON Agendar_cirug�a (Anestesista_idAnestesista);
CREATE INDEX Agendar_cirug�a_FKIndex6 ON Agendar_cirug�a (Arsenalero_idArsenalero);



CREATE TABLE En_pabellon (
  idEn_pabellon INTEGER   NOT NULL ,
  Agendar_cirug�a_idAgenda INTEGER   NOT NULL   ,
PRIMARY KEY(idEn_pabellon)  ,
  FOREIGN KEY(Agendar_cirug�a_idAgenda)
    REFERENCES Agendar_cirug�a(idAgenda)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX En_pabellon_FKIndex1 ON En_pabellon (Agendar_cirug�a_idAgenda);



CREATE TABLE Agendar_cirug�a_has_Realizadas (
  Realizadas_idRealizadas INTEGER   NOT NULL ,
  Agendar_cirug�a_idAgenda INTEGER   NOT NULL   ,
PRIMARY KEY(Realizadas_idRealizadas, Agendar_cirug�a_idAgenda)    ,
  FOREIGN KEY(Realizadas_idRealizadas)
    REFERENCES Realizadas(idRealizadas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Agendar_cirug�a_idAgenda)
    REFERENCES Agendar_cirug�a(idAgenda)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Agendar_cirug�a_has_Realizadas_FKIndex2 ON Agendar_cirug�a_has_Realizadas (Realizadas_idRealizadas);
CREATE INDEX Agendar_cirug�a_has_Realizadas_FKIndex2 ON Agendar_cirug�a_has_Realizadas (Agendar_cirug�a_idAgenda);



CREATE TABLE Instrumentos (
  idInstrumentos INTEGER   NOT NULL ,
  Cirug�as_idCirug�as INTEGER   NOT NULL ,
  M�dulo_idM�dulo INTEGER   NOT NULL ,
  nombre_instrumento VARCHAR(50)   NOT NULL ,
  uso_instrumento VARCHAR(100)   NOT NULL ,
  p_hora FLOAT   NOT NULL   ,
PRIMARY KEY(idInstrumentos)    ,
  FOREIGN KEY(M�dulo_idM�dulo)
    REFERENCES M�dulo(idM�dulo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Cirug�as_idCirug�as)
    REFERENCES Cirug�as(idCirug�as)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Instrumentos_FKIndex2 ON Instrumentos (M�dulo_idM�dulo);
CREATE INDEX Instrumentos_FKIndex3 ON Instrumentos (Cirug�as_idCirug�as);




