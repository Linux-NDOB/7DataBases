CREATE DATABASE Hotel;

USE Hotel;

CREATE TABLE Fecha (
  id_fecha INTEGER UNSIGNED  NOT NULL  ,
  dia INTEGER UNSIGNED  NOT NULL  ,
  mes INTEGER UNSIGNED  NOT NULL  ,
  a�o INTEGER UNSIGNED  NOT NULL  ,
  semana INTEGER UNSIGNED  NOT NULL  ,
  hora INTEGER UNSIGNED ZEROFILL  NOT NULL    ,
PRIMARY KEY(id_fecha));



CREATE TABLE Persona (
  dni VARCHAR(100)  NOT NULL  ,
  nombre INTEGER UNSIGNED  NOT NULL  ,
  apellido INTEGER UNSIGNED  NOT NULL  ,
  telefono VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(dni));



CREATE TABLE Piso (
  numero_piso INTEGER UNSIGNED  NOT NULL  ,
  cantidad_habitaciones INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(numero_piso));



CREATE TABLE Habitaciones (
  nro_habitacion INTEGER UNSIGNED  NOT NULL  ,
  Piso_numero_piso INTEGER UNSIGNED  NOT NULL  ,
  tipo_habitacion INTEGER UNSIGNED  NOT NULL  ,
  precio_habitacion INTEGER UNSIGNED  NOT NULL  ,
  temporada INTEGER UNSIGNED  NOT NULL  ,
  estado_habitacion INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(nro_habitacion)  ,
INDEX Habitaciones_FKIndex1(Piso_numero_piso),
  FOREIGN KEY(Piso_numero_piso)
    REFERENCES Piso(numero_piso)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Clientes (
  idClientes INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Persona_dni VARCHAR(100)  NOT NULL    ,
PRIMARY KEY(idClientes)  ,
INDEX Clientes_FKIndex1(Persona_dni),
  FOREIGN KEY(Persona_dni)
    REFERENCES Persona(dni)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Gastos (
  idGastos INTEGER UNSIGNED  NOT NULL  ,
  Habitaciones_nro_habitacion INTEGER UNSIGNED  NOT NULL  ,
  concepto VARCHAR(100)  NOT NULL  ,
  valor FLOAT  NOT NULL    ,
PRIMARY KEY(idGastos)  ,
INDEX Gastos_FKIndex1(Habitaciones_nro_habitacion),
  FOREIGN KEY(Habitaciones_nro_habitacion)
    REFERENCES Habitaciones(nro_habitacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Responsable (
  idResponsable INTEGER UNSIGNED  NOT NULL  ,
  Habitaciones_nro_habitacion INTEGER UNSIGNED  NOT NULL  ,
  Persona_dni VARCHAR(100)  NOT NULL    ,
PRIMARY KEY(idResponsable)  ,
INDEX Responsable_FKIndex1(Persona_dni)  ,
INDEX Responsable_FKIndex2(Habitaciones_nro_habitacion),
  FOREIGN KEY(Persona_dni)
    REFERENCES Persona(dni)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Habitaciones_nro_habitacion)
    REFERENCES Habitaciones(nro_habitacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Reservas (
  idReservas INTEGER UNSIGNED  NOT NULL  ,
  Fecha_id_fecha INTEGER UNSIGNED  NOT NULL  ,
  Habitaciones_nro_habitacion INTEGER UNSIGNED  NOT NULL  ,
  Clientes_idClientes INTEGER UNSIGNED  NOT NULL  ,
  validez_horas INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idReservas)  ,
INDEX Reservas_FKIndex1(Clientes_idClientes)  ,
INDEX Reservas_FKIndex2(Habitaciones_nro_habitacion)  ,
INDEX Reservas_FKIndex3(Fecha_id_fecha),
  FOREIGN KEY(Clientes_idClientes)
    REFERENCES Clientes(idClientes)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Habitaciones_nro_habitacion)
    REFERENCES Habitaciones(nro_habitacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Fecha_id_fecha)
    REFERENCES Fecha(id_fecha)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Registro (
  idRegistro INTEGER UNSIGNED  NOT NULL  ,
  Reservas_idReservas INTEGER UNSIGNED  NOT NULL  ,
  estado VARCHAR(50)  NULL    ,
PRIMARY KEY(idRegistro)  ,
INDEX Registro_FKIndex1(Reservas_idReservas),
  FOREIGN KEY(Reservas_idReservas)
    REFERENCES Reservas(idReservas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE Factura (
  idFactura INTEGER UNSIGNED  NOT NULL  ,
  Responsable_idResponsable INTEGER UNSIGNED  NOT NULL  ,
  total_gasto FLOAT  NOT NULL  ,
  nombre_otro VARCHAR(50)  NOT NULL  ,
  nid_otro VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idFactura)  ,
INDEX Factura_FKIndex1(Responsable_idResponsable),
  FOREIGN KEY(Responsable_idResponsable)
    REFERENCES Responsable(idResponsable)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




