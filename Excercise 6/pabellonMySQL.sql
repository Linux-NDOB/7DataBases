CREATE TABLE Pabellones (
  numero_pabellon INTEGER UNSIGNED  NOT NULL  ,
  bloque INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(50)  NOT NULL  ,
  pisos INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(numero_pabellon));



CREATE TABLE Personas (
  id_persona INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(50)  NOT NULL  ,
  apellido VARCHAR(50)  NOT NULL  ,
  edad VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(id_persona));



CREATE TABLE Realizadas (
  idRealizadas INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idRealizadas));



CREATE TABLE Horarios (
  Pabellones_numero_pabellon INTEGER UNSIGNED  NOT NULL  ,
  hora INTEGER UNSIGNED  NOT NULL  ,
  dia INTEGER UNSIGNED  NOT NULL  ,
  mes INTEGER UNSIGNED  NOT NULL  ,
  semana INTEGER UNSIGNED  NOT NULL  ,
  estado VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(Pabellones_numero_pabellon)  ,
INDEX Horarios_FKIndex1(Pabellones_numero_pabellon),
  FOREIGN KEY(Pabellones_numero_pabellon)
    REFERENCES Pabellones(numero_pabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE M�dulo (
  idM�dulo INTEGER UNSIGNED  NOT NULL  ,
  Pabellones_numero_pabellon INTEGER UNSIGNED  NOT NULL  ,
  nombre_m�dulo INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idM�dulo)  ,
INDEX M�dulo_FKIndex1(Pabellones_numero_pabellon),
  FOREIGN KEY(Pabellones_numero_pabellon)
    REFERENCES Pabellones(numero_pabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE M�dicos (
  id_profesional INTEGER UNSIGNED  NOT NULL  ,
  Personas_id_persona INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(id_profesional)  ,
INDEX M�dicos_FKIndex1(Personas_id_persona),
  FOREIGN KEY(Personas_id_persona)
    REFERENCES Personas(id_persona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Insumos (
  idInsumos INTEGER UNSIGNED  NOT NULL  ,
  M�dulo_idM�dulo INTEGER UNSIGNED  NOT NULL  ,
  nombre_insumo VARCHAR(50)  NOT NULL  ,
  tiepo_insumo VARCHAR(50)  NOT NULL  ,
  p_unidad FLOAT  NOT NULL  ,
  cantidad_insumo INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idInsumos)  ,
INDEX Insumos_FKIndex1(M�dulo_idM�dulo),
  FOREIGN KEY(M�dulo_idM�dulo)
    REFERENCES M�dulo(idM�dulo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Equipo_medico (
  idEquipo_medico INTEGER UNSIGNED  NOT NULL  ,
  M�dulo_idM�dulo INTEGER UNSIGNED  NOT NULL  ,
  nombre_equipo VARCHAR(50)  NOT NULL  ,
  funcion_equipo VARCHAR(50)  NOT NULL  ,
  tipo_equipo VARCHAR(50)  NOT NULL  ,
  descripcion_equipo VARCHAR(100)  NOT NULL    ,
PRIMARY KEY(idEquipo_medico)  ,
INDEX Equipo_medico_FKIndex1(M�dulo_idM�dulo),
  FOREIGN KEY(M�dulo_idM�dulo)
    REFERENCES M�dulo(idM�dulo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Arsenalero (
  idArsenalero INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  M�dicos_id_profesional INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idArsenalero)  ,
INDEX Arsenalero_FKIndex1(M�dicos_id_profesional),
  FOREIGN KEY(M�dicos_id_profesional)
    REFERENCES M�dicos(id_profesional)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Anestesista (
  idAnestesista INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  M�dicos_id_profesional INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idAnestesista)  ,
INDEX Anestesista_FKIndex1(M�dicos_id_profesional),
  FOREIGN KEY(M�dicos_id_profesional)
    REFERENCES M�dicos(id_profesional)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Pacientes (
  idPaciente INTEGER UNSIGNED  NOT NULL  ,
  Personas_id_persona INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idPaciente)  ,
INDEX Pacientes_FKIndex1(Personas_id_persona),
  FOREIGN KEY(Personas_id_persona)
    REFERENCES Personas(id_persona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Cirujano (
  idCirujano INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  M�dicos_id_profesional INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idCirujano)  ,
INDEX Cirujano_FKIndex1(M�dicos_id_profesional),
  FOREIGN KEY(M�dicos_id_profesional)
    REFERENCES M�dicos(id_profesional)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Historial_cirug�as (
  idHistorial_cirug�as INTEGER UNSIGNED  NOT NULL  ,
  Realizadas_idRealizadas INTEGER UNSIGNED  NOT NULL  ,
  Pacientes_idPaciente INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idHistorial_cirug�as)  ,
INDEX Historial_cirug�as_FKIndex1(Pacientes_idPaciente)  ,
INDEX Historial_cirug�as_FKIndex2(Realizadas_idRealizadas),
  FOREIGN KEY(Pacientes_idPaciente)
    REFERENCES Pacientes(idPaciente)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Realizadas_idRealizadas)
    REFERENCES Realizadas(idRealizadas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Cirug�as (
  idCirug�as INTEGER UNSIGNED  NOT NULL  ,
  Equipo_medico_idEquipo_medico INTEGER UNSIGNED  NOT NULL  ,
  Insumos_idInsumos INTEGER UNSIGNED  NOT NULL  ,
  M�dulo_idM�dulo INTEGER UNSIGNED  NOT NULL  ,
  nombre_cirugia VARCHAR(50)  NOT NULL  ,
  descripcion_cirugia VARCHAR(100)  NOT NULL  ,
  finalidad_cirugia VARCHAR(100)  NOT NULL  ,
  duraci�n_minutos INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idCirug�as)  ,
INDEX Cirug�as_FKIndex1(M�dulo_idM�dulo)  ,
INDEX Cirug�as_FKIndex2(Insumos_idInsumos)  ,
INDEX Cirug�as_FKIndex3(Equipo_medico_idEquipo_medico),
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



CREATE TABLE Agendar_cirug�a (
  idAgenda INTEGER UNSIGNED  NOT NULL  ,
  Arsenalero_idArsenalero INTEGER UNSIGNED  NOT NULL  ,
  Anestesista_idAnestesista INTEGER UNSIGNED  NOT NULL  ,
  Cirujano_idCirujano INTEGER UNSIGNED  NOT NULL  ,
  Horarios_Pabellones_numero_pabellon INTEGER UNSIGNED  NOT NULL  ,
  Cirug�as_idCirug�as INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idAgenda)  ,
INDEX Cirug�a_agendada_FKIndex1(Cirug�as_idCirug�as)  ,
INDEX Cirug�a_agendada_FKIndex3(Horarios_Pabellones_numero_pabellon)  ,
INDEX Agendar_cirug�a_FKIndex4(Cirujano_idCirujano)  ,
INDEX Agendar_cirug�a_FKIndex5(Anestesista_idAnestesista)  ,
INDEX Agendar_cirug�a_FKIndex6(Arsenalero_idArsenalero),
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



CREATE TABLE En_pabellon (
  idEn_pabellon INTEGER UNSIGNED  NOT NULL  ,
  Agendar_cirug�a_idAgenda INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idEn_pabellon)  ,
INDEX En_pabellon_FKIndex1(Agendar_cirug�a_idAgenda),
  FOREIGN KEY(Agendar_cirug�a_idAgenda)
    REFERENCES Agendar_cirug�a(idAgenda)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Agendar_cirug�a_has_Realizadas (
  Realizadas_idRealizadas INTEGER UNSIGNED  NOT NULL  ,
  Agendar_cirug�a_idAgenda INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Realizadas_idRealizadas, Agendar_cirug�a_idAgenda)  ,
INDEX Agendar_cirug�a_has_Realizadas_FKIndex2(Realizadas_idRealizadas)  ,
INDEX Agendar_cirug�a_has_Realizadas_FKIndex2(Agendar_cirug�a_idAgenda),
  FOREIGN KEY(Realizadas_idRealizadas)
    REFERENCES Realizadas(idRealizadas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Agendar_cirug�a_idAgenda)
    REFERENCES Agendar_cirug�a(idAgenda)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Instrumentos (
  idInstrumentos INTEGER UNSIGNED  NOT NULL  ,
  Cirug�as_idCirug�as INTEGER UNSIGNED  NOT NULL  ,
  M�dulo_idM�dulo INTEGER UNSIGNED  NOT NULL  ,
  nombre_instrumento VARCHAR(50)  NOT NULL  ,
  uso_instrumento VARCHAR(100)  NOT NULL  ,
  p_hora FLOAT  NOT NULL    ,
PRIMARY KEY(idInstrumentos)  ,
INDEX Instrumentos_FKIndex2(M�dulo_idM�dulo)  ,
INDEX Instrumentos_FKIndex3(Cirug�as_idCirug�as),
  FOREIGN KEY(M�dulo_idM�dulo)
    REFERENCES M�dulo(idM�dulo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Cirug�as_idCirug�as)
    REFERENCES Cirug�as(idCirug�as)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




