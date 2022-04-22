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



CREATE TABLE Módulo (
  idMódulo INTEGER   NOT NULL ,
  Pabellones_numero_pabellon INTEGER   NOT NULL ,
  nombre_módulo INTEGER   NOT NULL   ,
PRIMARY KEY(idMódulo)  ,
  FOREIGN KEY(Pabellones_numero_pabellon)
    REFERENCES Pabellones(numero_pabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Módulo_FKIndex1 ON Módulo (Pabellones_numero_pabellon);



CREATE TABLE Médicos (
  id_profesional INTEGER   NOT NULL ,
  Personas_id_persona INTEGER   NOT NULL   ,
PRIMARY KEY(id_profesional)  ,
  FOREIGN KEY(Personas_id_persona)
    REFERENCES Personas(id_persona)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Médicos_FKIndex1 ON Médicos (Personas_id_persona);



CREATE TABLE Insumos (
  idInsumos INTEGER   NOT NULL ,
  Módulo_idMódulo INTEGER   NOT NULL ,
  nombre_insumo VARCHAR(50)   NOT NULL ,
  tiepo_insumo VARCHAR(50)   NOT NULL ,
  p_unidad FLOAT   NOT NULL ,
  cantidad_insumo INTEGER   NOT NULL   ,
PRIMARY KEY(idInsumos)  ,
  FOREIGN KEY(Módulo_idMódulo)
    REFERENCES Módulo(idMódulo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Insumos_FKIndex1 ON Insumos (Módulo_idMódulo);



CREATE TABLE Equipo_medico (
  idEquipo_medico INTEGER   NOT NULL ,
  Módulo_idMódulo INTEGER   NOT NULL ,
  nombre_equipo VARCHAR(50)   NOT NULL ,
  funcion_equipo VARCHAR(50)   NOT NULL ,
  tipo_equipo VARCHAR(50)   NOT NULL ,
  descripcion_equipo VARCHAR(100)   NOT NULL   ,
PRIMARY KEY(idEquipo_medico)  ,
  FOREIGN KEY(Módulo_idMódulo)
    REFERENCES Módulo(idMódulo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Equipo_medico_FKIndex1 ON Equipo_medico (Módulo_idMódulo);



CREATE TABLE Arsenalero (
  idArsenalero SERIAL  NOT NULL ,
  Médicos_id_profesional INTEGER   NOT NULL   ,
PRIMARY KEY(idArsenalero)  ,
  FOREIGN KEY(Médicos_id_profesional)
    REFERENCES Médicos(id_profesional)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Arsenalero_FKIndex1 ON Arsenalero (Médicos_id_profesional);



CREATE TABLE Anestesista (
  idAnestesista SERIAL  NOT NULL ,
  Médicos_id_profesional INTEGER   NOT NULL   ,
PRIMARY KEY(idAnestesista)  ,
  FOREIGN KEY(Médicos_id_profesional)
    REFERENCES Médicos(id_profesional)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Anestesista_FKIndex1 ON Anestesista (Médicos_id_profesional);



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
  Médicos_id_profesional INTEGER   NOT NULL   ,
PRIMARY KEY(idCirujano)  ,
  FOREIGN KEY(Médicos_id_profesional)
    REFERENCES Médicos(id_profesional)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Cirujano_FKIndex1 ON Cirujano (Médicos_id_profesional);



CREATE TABLE Historial_cirugías (
  idHistorial_cirugías INTEGER   NOT NULL ,
  Realizadas_idRealizadas INTEGER   NOT NULL ,
  Pacientes_idPaciente INTEGER   NOT NULL   ,
PRIMARY KEY(idHistorial_cirugías)    ,
  FOREIGN KEY(Pacientes_idPaciente)
    REFERENCES Pacientes(idPaciente)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Realizadas_idRealizadas)
    REFERENCES Realizadas(idRealizadas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Historial_cirugías_FKIndex1 ON Historial_cirugías (Pacientes_idPaciente);
CREATE INDEX Historial_cirugías_FKIndex2 ON Historial_cirugías (Realizadas_idRealizadas);



CREATE TABLE Cirugías (
  idCirugías INTEGER   NOT NULL ,
  Equipo_medico_idEquipo_medico INTEGER   NOT NULL ,
  Insumos_idInsumos INTEGER   NOT NULL ,
  Módulo_idMódulo INTEGER   NOT NULL ,
  nombre_cirugia VARCHAR(50)   NOT NULL ,
  descripcion_cirugia VARCHAR(100)   NOT NULL ,
  finalidad_cirugia VARCHAR(100)   NOT NULL ,
  duración_minutos INTEGER   NOT NULL   ,
PRIMARY KEY(idCirugías)      ,
  FOREIGN KEY(Módulo_idMódulo)
    REFERENCES Módulo(idMódulo)
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


CREATE INDEX Cirugías_FKIndex1 ON Cirugías (Módulo_idMódulo);
CREATE INDEX Cirugías_FKIndex2 ON Cirugías (Insumos_idInsumos);
CREATE INDEX Cirugías_FKIndex3 ON Cirugías (Equipo_medico_idEquipo_medico);



CREATE TABLE Agendar_cirugía (
  idAgenda INTEGER   NOT NULL ,
  Arsenalero_idArsenalero INTEGER   NOT NULL ,
  Anestesista_idAnestesista INTEGER   NOT NULL ,
  Cirujano_idCirujano INTEGER   NOT NULL ,
  Horarios_Pabellones_numero_pabellon INTEGER   NOT NULL ,
  Cirugías_idCirugías INTEGER   NOT NULL   ,
PRIMARY KEY(idAgenda)          ,
  FOREIGN KEY(Cirugías_idCirugías)
    REFERENCES Cirugías(idCirugías)
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


CREATE INDEX Cirugía_agendada_FKIndex1 ON Agendar_cirugía (Cirugías_idCirugías);
CREATE INDEX Cirugía_agendada_FKIndex3 ON Agendar_cirugía (Horarios_Pabellones_numero_pabellon);
CREATE INDEX Agendar_cirugía_FKIndex4 ON Agendar_cirugía (Cirujano_idCirujano);
CREATE INDEX Agendar_cirugía_FKIndex5 ON Agendar_cirugía (Anestesista_idAnestesista);
CREATE INDEX Agendar_cirugía_FKIndex6 ON Agendar_cirugía (Arsenalero_idArsenalero);



CREATE TABLE En_pabellon (
  idEn_pabellon INTEGER   NOT NULL ,
  Agendar_cirugía_idAgenda INTEGER   NOT NULL   ,
PRIMARY KEY(idEn_pabellon)  ,
  FOREIGN KEY(Agendar_cirugía_idAgenda)
    REFERENCES Agendar_cirugía(idAgenda)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX En_pabellon_FKIndex1 ON En_pabellon (Agendar_cirugía_idAgenda);



CREATE TABLE Agendar_cirugía_has_Realizadas (
  Realizadas_idRealizadas INTEGER   NOT NULL ,
  Agendar_cirugía_idAgenda INTEGER   NOT NULL   ,
PRIMARY KEY(Realizadas_idRealizadas, Agendar_cirugía_idAgenda)    ,
  FOREIGN KEY(Realizadas_idRealizadas)
    REFERENCES Realizadas(idRealizadas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Agendar_cirugía_idAgenda)
    REFERENCES Agendar_cirugía(idAgenda)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Agendar_cirugía_has_Realizadas_FKIndex2 ON Agendar_cirugía_has_Realizadas (Realizadas_idRealizadas);
CREATE INDEX Agendar_cirugía_has_Realizadas_FKIndex2 ON Agendar_cirugía_has_Realizadas (Agendar_cirugía_idAgenda);



CREATE TABLE Instrumentos (
  idInstrumentos INTEGER   NOT NULL ,
  Cirugías_idCirugías INTEGER   NOT NULL ,
  Módulo_idMódulo INTEGER   NOT NULL ,
  nombre_instrumento VARCHAR(50)   NOT NULL ,
  uso_instrumento VARCHAR(100)   NOT NULL ,
  p_hora FLOAT   NOT NULL   ,
PRIMARY KEY(idInstrumentos)    ,
  FOREIGN KEY(Módulo_idMódulo)
    REFERENCES Módulo(idMódulo)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Cirugías_idCirugías)
    REFERENCES Cirugías(idCirugías)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX Instrumentos_FKIndex2 ON Instrumentos (Módulo_idMódulo);
CREATE INDEX Instrumentos_FKIndex3 ON Instrumentos (Cirugías_idCirugías);




