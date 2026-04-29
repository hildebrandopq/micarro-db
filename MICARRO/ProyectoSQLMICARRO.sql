/*ESTRUCTURA*/
/*TABLAS*/
create table usuarios (
  idUsuario number,
  idPlataforma number,
  nombre varchar(50) NOT NULL,
  correo varchar(50) NOT NULL,
  telefono varchar(10) NOT NULL,
  ubicacion varchar(50)
);
create table historialPropietarios (
    idhistorial number,
    idVehiculo number,
    propietarioAnterior varchar2(100),
    fechaCambio date
);

create table empleados (
  idEmpleado number,
  idPlataforma number NOT NULL,
  nombre varchar2(100)NOT NULL,
  telefono varchar(10) NOT NULL,
  correo varchar(50) NOT NULL
);

create table vendedores (
  idUsuario number,
  idVendedor number,
  cantidadVentas number,
  reputacion number,
  respuestaPromedio varchar2(100),
  estadoCuenta varchar(20)
);


create table vehiculos (
  idVehiculo number,
  idUsuario number,
  marca varchar2(50),
  modelo varchar2(50),
  año number,
  tipo varchar(10),
  precio number(10,2),
  color varchar2(50),
  kilometraje number,
  estadoVehiculo varchar2(20),
  fechaPublicacion date
);

create table devolucionVehiculos (
  idDevolucionVehiculo number,
  idVehiculo number
);

create table devolucionRepuestos (
  idDevolucionRepuesto number,
  idRepuesto number
);

create table ofertas (
  idOferta number,
  idUsuario number,
  montoOfrecido number,
  fechaOferta date,
  estadoOferta varchar(100),
  tipoOferta varchar(100)
);

create table compras (
  idCompra number,
  idTransaccion number,
  fecha date,
  monto number,
  estado varchar2(100),
  compraAprobada varchar2(10)
);

create table compradores (
  idComprador number,
  idUsuario number,
  calificacion number,
  metodoPago varchar2(50),
  cantidadofertas number
);

create table devoluciones (
  idDevolucion number,
  idUsuario number,
  fecha date,
  motivo varchar2(255),
  estado varchar2(50),
  respuestaEmp varchar2(255),
  fecharesolucion date
);

create table seguros(
  idSeguro number,
  idVehiculo number,
  aseguradora varchar2(50),
  fechaInicio date,
  fechaFin date,
  cobertura varchar2(50),
  tipo varchar2(50)
);
  
create table reporteProblemas (
  idReporte number,
  idUsuario number
);

create table plataforma(
  idPlataforma number
);

create table transacciones(
  idTransaccion number,
  idOferta number
);

create table notificaciones(
  idNotificacion number,
  idTransaccion number,
  tipo varchar2(50),
  mensaje varchar2(50),
  motivoRechazo varchar2(200),
  fechaEnvio date,
  estado varchar2(10)
);

CREATE TABLE partesAuto (
  idPartes NUMBER,
  idOferta NUMBER,
  nombre VARCHAR2(50),          
  marca VARCHAR2(20),
  modeloCompatible VARCHAR2(50),   
  precio NUMBER,
  estado VARCHAR2(15),
  descripcion VARCHAR2(20),
  cantidadDisponible NUMBER,
  fechaPublicacion DATE
);



-------------
/*Primarias*/

ALTER TABLE plataforma ADD CONSTRAINT pkPlataforma PRIMARY KEY(idPlataforma);
ALTER TABLE usuarios ADD CONSTRAINT pkUsuarios PRIMARY KEY (idUsuario);
ALTER TABLE compradores ADD CONSTRAINT pkCompradores PRIMARY KEY (idComprador);
ALTER TABLE vehiculos ADD CONSTRAINT pkVehiculos PRIMARY KEY (idVehiculo);
ALTER TABLE historialPropietarios ADD CONSTRAINT pkHistorial PRIMARY KEY (idHistorial);
ALTER TABLE vendedores ADD CONSTRAINT pkVendedores PRIMARY KEY (idVendedor);
ALTER TABLE empleados ADD CONSTRAINT pkEmpleados PRIMARY KEY (idEmpleado);
ALTER TABLE reporteProblemas ADD CONSTRAINT pkReportes PRIMARY KEY (idReporte);
ALTER TABLE devoluciones ADD CONSTRAINT pkDevoluciones PRIMARY KEY (idDevolucion);
ALTER TABLE devolucionVehiculos ADD CONSTRAINT pkDevolucionVehiculos PRIMARY KEY (idDevolucionVehiculo);
ALTER TABLE devolucionRepuestos ADD CONSTRAINT pkDevolcucionRepuestos PRIMARY KEY (idDevolucionRepuesto);
ALTER TABLE ofertas ADD CONSTRAINT pkOfertas PRIMARY KEY (idOferta);
ALTER TABLE seguros ADD CONSTRAINT pkSeguros PRIMARY KEY (idseguro);
ALTER TABLE transacciones ADD CONSTRAINT pkTransacciones PRIMARY KEY (idTransaccion);
ALTER TABLE notificaciones ADD CONSTRAINT pkNotificaciones PRIMARY KEY (idNotificacion);
ALTER TABLE compras ADD CONSTRAINT pkCompras PRIMARY KEY (idCompra);
ALTER TABLE partesAuto ADD CONSTRAINT pkPartesAuto PRIMARY KEY(idPartes);

------------
/*Foraneas*/

alter table usuarios add constraint FK_usuarios foreign key (idPlataforma) references plataforma(idPlataforma);
alter table vendedores add constraint FK_vendedores foreign key (idVendedor) references usuarios(idUsuario);
alter table compradores add constraint FK_compradores foreign key (idComprador) references usuarios(idUsuario);
alter table empleados add constraint FK_empleados foreign key (idPlataforma) references plataforma(idPlataforma);
alter table reporteProblemas add constraint FK_reporte foreign key (idUsuario) references usuarios(idUsuario);
alter table devoluciones add constraint FK_devolucion foreign key (idUsuario) references usuarios(idUsuario);
alter table devolucionVehiculos add constraint FK_devolucionVehiculosD foreign key (idDevolucionVehiculo) references devoluciones(idDevolucion);
alter table devolucionVehiculos add constraint FK_devolucionVehiculosV foreign key (idVehiculo) references vehiculos(idVehiculo);
alter table devolucionRepuestos add constraint FK_devolucionRepuestos foreign key (idDevolucionRepuesto) references devoluciones(idDevolucion);
alter table ofertas add constraint FK_ofertas foreign key (idUsuario) references usuarios(idUsuario);
alter table vehiculos add constraint FK_vehiculos foreign key (idUsuario) references usuarios(idUsuario);
alter table historialPropietarios add constraint FK_historialPropietarios foreign key (idVehiculo) references vehiculos(idVehiculo);
alter table seguros add constraint FK_seguros foreign key (idVehiculo) references vehiculos(idVehiculo);
alter table transacciones add constraint FK_transacciones foreign key (idOferta) references ofertas(idOferta);
alter table notificaciones add constraint FK_notificaciones foreign key (idTransaccion) references transacciones(idTransaccion);
alter table compras add constraint FK_compras foreign key (idTransaccion) references transacciones(idTransaccion);
alter table partesAuto add constraint FK_partesAuto foreign key (idOferta) references ofertas(idOferta);
-------------
/*RESTRICCIONES DECLARATIVAS-PROCEDIMENTALES Y AUTOMATIZACION*/
/*ACCIONES*/
alter table seguros drop constraint FK_seguros;
alter table vendedores drop constraint FK_vendedores;
alter table compradores drop constraint FK_compradores;
alter table ofertas drop constraint FK_ofertas;
alter table devolucionVehiculos drop constraint FK_devolucionVehiculosD;
alter table devolucionRepuestos drop constraint FK_devolucionRepuestos;
alter table usuarios drop constraint FK_usuarios;
alter table empleados drop constraint FK_empleados;
alter table reporteProblemas drop constraint FK_reporte;
alter table devoluciones drop constraint FK_devolucion;
alter table vehiculos drop constraint FK_vehiculos;
alter table historialPropietarios drop constraint FK_historialPropietarios;
alter table transacciones drop constraint FK_transacciones;
alter table notificaciones drop constraint FK_notificaciones;
alter table compras drop constraint FK_compras;
alter table partesAuto drop constraint FK_partesAuto;

alter table seguros add constraint FK_seguros foreign key (idVehiculo) references vehiculos(idVehiculo) on delete cascade;
alter table vendedores add constraint FK_vendedores foreign key (idUsuario) references usuarios(idUsuario) on delete cascade;
alter table compradores add constraint FK_compradores foreign key (idUsuario) references usuarios(idUsuario) on delete cascade;
alter table ofertas add constraint FK_ofertas foreign key (idUsuario) references  usuarios(idUsuario) on delete cascade;
alter table devolucionVehiculos add constraint FK_devolucionVehiculosD foreign key (idDevolucionVehiculo) references devoluciones(idDevolucion) on delete cascade;
alter table devolucionRepuestos add constraint FK_devolucionRepuestos foreign key (idDevolucionRepuesto) references devoluciones(idDevolucion) on delete cascade;
alter table usuarios add constraint FK_usuarios foreign key (idPlataforma) references plataforma (idPlataforma) on delete cascade;
alter table empleados add constraint FK_empleados foreign key (idPlataforma) references plataforma (idPlataforma) on delete cascade;
alter table reporteProblemas add constraint FK_reporte foreign key (idUsuario) references usuarios(idUsuario) on delete cascade;
alter table devoluciones add constraint FK_devolucion foreign key (idUsuario) references usuarios(idUsuario) on delete cascade;
alter table vehiculos add constraint FK_vehiculos foreign key (idUsuario) references usuarios(idUsuario) on delete cascade;
alter table historialPropietarios add constraint FK_historial foreign key (idVehiculo) references vehiculos(idVehiculo) on delete cascade;
alter table transacciones add constraint FK_transacciones foreign key (idOferta) references oferta(idOferta) on delete cascade;
alter table notificaciones add constraint FK_notificaciones foreign key (idTransaccion) references transacciones(idTransaccion) on delete cascade;
alter table compras add constraint FK_compras foreign key (idTransaccion) references transacciones(idTransaccion) on delete cascade;
alter table partesAuto add contraint FK_partesAuto foreign key (idOferta) references ofertas(idOferta) on delete cascade;


-------------
/*TUPLAS*/
ALTER TABLE compras ADD CONSTRAINT chk_estado_compra CHECK (estado IN ('Pendiente', 'Cancelada', 'Reembolsada','En Proceso'));
ALTER TABLE compras ADD CONSTRAINT chk_compras_compraAprobada CHECK (compraAprobada IN ('TRUE','FALSE'));
ALTER TABLE ofertas ADD CONSTRAINT chk_estado_ofertas CHECK (estadoOferta IN('Enviada','Rechazada','Aprobada'));
ALTER TABLE ofertas ADD CONSTRAINT chk_tipo_ofertas CHECK (tipoOferta IN ('Fija','Negociable'));
ALTER TABLE notificaciones ADD CONSTRAINT chk_tipo_notificacion CHECK (tipo IN ('Transaccion fallida', 'Pago rechazado', 'Error en la transaccion', 'Problema con el metodo de pago'));
ALTER TABLE notificaciones ADD CONSTRAINT chk_notificacion_leida CHECK (estado IN ('Leido', 'No Leido'));
ALTER TABLE empleados ADD CONSTRAINT chk_correo_empleado CHECK (correo LIKE '%@gmail.com');
ALTER TABLE empleados ADD CONSTRAINT chk_telefono_empleado CHECK (LENGTH(telefono) = 10 AND telefono NOT LIKE '%[^0-9]%');
ALTER TABLE usuarios ADD CONSTRAINT chk_telefono_usuario CHECK (LENGTH(telefono) = 10 AND telefono NOT LIKE '%[^0-9]%');
ALTER TABLE usuarios ADD CONSTRAINT chk_correo_usuario CHECK (LENGTH(correo) - LENGTH(REPLACE(correo, '@', '')) = 1);
ALTER TABLE compradores ADD CONSTRAINT chk_calificacion_comprador CHECK (calificacion BETWEEN 1 AND 5);
ALTER TABLE compradores ADD CONSTRAINT chk_metodo_pago CHECK (metodoPago IN ('Tarjeta crédito', 'Tarjeta de débito', 'PSE'));
ALTER TABLE vendedores ADD CONSTRAINT chk_reputacion_vendedor CHECK (reputacion BETWEEN 0 AND 5);
ALTER TABLE vendedores ADD CONSTRAINT chk_estado_cuenta CHECK (estadoCuenta IN ('Activada', 'Suspendida', 'Verificada'));
ALTER TABLE vehiculos ADD CONSTRAINT chk_año_vehiculo CHECK (año > 1990 AND año <= 2026);
ALTER TABLE vehiculos ADD CONSTRAINT chk_tipo_vehiculo CHECK (tipo IN ('sedan', 'camioneta', 'SUV', 'pickup', 'COUP', 'camion', 'Hatchback'));
ALTER TABLE vehiculos ADD CONSTRAINT chk_kilometraje CHECK (kilometraje >= 0);
ALTER TABLE vehiculos ADD CONSTRAINT chk_precio CHECK (precio >= 0);
ALTER TABLE vehiculos ADD CONSTRAINT chk_estado_vehiculo CHECK (estadoVehiculo IN ('malo', 'muy malo', 'bueno', 'muy bueno'));
ALTER TABLE seguros ADD CONSTRAINT chk_tipo_seguro CHECK (tipo IN ('responsabilidad civil', 'todo riesgo', 'SOAT'));
ALTER TABLE seguros ADD CONSTRAINT chk_fechas_seguro CHECK (fechaInicio < fechaFin);
ALTER TABLE seguros ADD CONSTRAINT chk_cobertura_seguro CHECK (cobertura IN ('daño a tercero','robo total','perdida total','daños materiales','responsabilidad civil','asistencia a carretera'));
ALTER TABLE partesAuto ADD CONSTRAINT chk_cantidad_disponible CHECK (cantidadDisponible >= 0);
ALTER TABLE partesAuto ADD CONSTRAINT chk_estado_partes CHECK (estado IN ('Nuevo', 'Usado', 'Defectuoso', 'No Disponible'));

/*POBLAR*/
INSERT INTO plataforma(idPlataforma) VALUES (1);
INSERT INTO usuarios(idUsuario,idPlataforma,nombre,correo,telefono,ubicacion) VALUES (251,1,'Margarita Lopez','margaritalopez@gmail.com','5252525235',null);
INSERT INTO usuarios(idUsuario,idPlataforma,nombre,correo,telefono,ubicacion) VALUES (252,1,'Pepito Perez','pepitoperez@gmail.com','1234567890','casa');
INSERT INTO usuarios(idUsuario,idPlataforma,nombre,correo,telefono,ubicacion) VALUES (253,1,'Raul Gonzales','leomessi@gmail.com','0987654321','Miami');
INSERT INTO usuarios(idUsuario,idPlataforma,nombre,correo,telefono,ubicacion) VALUES (254,1,'Alejandro Cifuentes','alejandrocifuentes@gmail.com','7777777777','Arabia');
INSERT INTO usuarios(idUsuario,idPlataforma,nombre,correo,telefono,ubicacion) VALUES (260,1,'Andres Moreno','andresmoreno@gmail.com','1237894560','Buenos Aires');
INSERT INTO empleados(idEmpleado,idPlataforma,nombre,telefono,correo) VALUES (2,1,'David Rodriguez','5464598721','davidvilla@gmail.com');
INSERT INTO empleados(idEmpleado,idPlataforma,nombre,telefono,correo) VALUES (3,1,'Luisa Pineda','5464598721','davidsalas@gmail.com');
INSERT INTO vendedores(idUsuario,idVendedor,cantidadVentas,reputacion,respuestaPromedio,estadoCuenta)VALUES(254,2,7,5,'REVISADO','Suspendida');
INSERT INTO ofertas(idOferta,idUsuario,montoOfrecido,fechaOferta,estadoOferta,tipoOferta) VALUES (2,253,900000000,TO_DATE('2025-02-23','YYYY-MM-DD'),'Aprobada','Fija');
INSERT INTO ofertas(idOferta,idUsuario,montoOfrecido,fechaOferta,estadoOferta,tipoOferta) VALUES (3,251,10000000,TO_DATE('2024-09-22','YYYY-MM-DD'),'Rechazada','Negociable');
INSERT INTO transacciones(idTransaccion,idOferta) VALUES (2,2);

--------------
/*TUPLAS OK*/
INSERT INTO usuarios(idUsuario,idPlataforma,nombre,correo,telefono,ubicacion) VALUES(250,1,'Juan Dominguez','juandominguez@gmail.com','5252525252',null);
INSERT INTO vendedores(idUsuario,idVendedor,cantidadVentas,reputacion,respuestaPromedio,estadoCuenta)VALUES(250,1,10,4,'REVISADO','Suspendida');
INSERT INTO compradores(idComprador,idUsuario,calificacion,metodoPago,cantidadOfertas)VALUES (350,251,5,'Tarjeta crédito',4);
INSERT INTO ofertas(idOferta,idUsuario,montoOfrecido,fechaOferta,estadoOferta,tipoOferta) VALUES (1,252,30000000,TO_DATE('2022-03-31','YYYY-MM-DD'),'Enviada','Fija');
INSERT INTO transacciones(idTransaccion,idOferta) VALUES (1,1);
INSERT INTO compras (idCompra,idTransaccion,fecha,monto,estado,compraAprobada) VALUES (1001,1,SYSDATE,230323,'Pendiente','TRUE');
INSERT INTO notificaciones (idNotificacion,idTransaccion,tipo,mensaje,motivoRechazo,fechaEnvio,estado) VALUES (1,1,'Transaccion fallida','Se necesita atención inmediata','Reservado',TO_DATE('2023-08-01','YYYY-MM-DD'),'No Leido');
INSERT INTO partesAuto(idPartes,idOferta,nombre,marca,modeloCompatible,precio,estado,descripcion,cantidadDisponible,fechaPublicacion) VALUES(1,1,'puerta','Mitsubishi','Lancer',10800000,'Nuevo','Roja Delantera',1,TO_DATE('2022-04-29','YYYY-MM-DD'));
INSERT INTO empleados(idEmpleado,idPlataforma,nombre,telefono,correo) VALUES (1,1,'Manuel Perez','2525412202','manuelperez@gmail.com');
INSERT INTO vehiculos (idVehiculo,idUsuario,marca,modelo,año,tipo,precio,color,kilometraje,estadoVehiculo,fechaPublicacion)VALUES(1,250,'Mazda','2',2020,'sedan',60000000,'negro',10000,'muy bueno',TO_DATE('2023-05-22','YYYY-MM-DD'));
INSERT INTO seguros(idSeguro,idVehiculo,aseguradora,fechaInicio,fechaFin,cobertura,tipo) VALUES(8000,1,'Aseguradoras Seguro',TO_DATE('2022-08-01','YYYY-MM-DD'),TO_DATE('2024-05-22','YYYY-MM-DD'),'robo total','todo riesgo');

/*TUPLAS NO OK*/
INSERT INTO compras(idCompra,idTransaccion,fecha,monto,estado,compraAprobada) VALUES (2,2, TO_DATE('2025-05-01','YYYY-MM-DD'),900000000,'Sin finalizar','FALSE');
INSERT INTO notificaciones(idNotificacion,idTransaccion,tipo,mensaje,motivoRechazo,fechaEnvio,estado) VALUES(1,2,'Transacción en proceso','Enviado', 'Reservado',TO_DATE('2025-04-29','YYYY-MM-DD'),'No Leido');
INSERT INTO notificaciones(idNotificacion,idTransaccion,tipo,mensaje,motivoRechazo,fechaEnvio,estado) VALUES(1,2,'Transacción fallida','Enviado','Reservado',TO_DATE('2024-02-24','YYYY-MM-DD'),'Por leer');
INSERT INTO partesAuto(idPartes,idOferta,nombre,marca,modeloCompatible,precio,estado,descripcion,cantidadDisponible,fechaPublicacion)VALUES(1211,254,'Silla','Sillas X','Ford Fiesta',2000000,'No Disponible','Cuero',-1,TO_DATE('2024-11-21','YYYY-MM-DD'));
INSERT INTO partesAuto(idPartes,idOferta,nombre,marca,modeloCompatible,precio,estado,descripcion,cantidadDisponible,fechaPublicacion) VALUES(1211,254,'puerta','Mitsubishi','Lancer',10800000,'Bueno','Roja delantera',1,TO_DATE('2022-04-29','YYYY-MM-DD'));
INSERT INTO empleados(idEmpleado,idPlataforma,nombre,telefono,correo) VALUES (502,1,'Manuel Perez','2521454','manuelperez@gmail.com');
INSERT INTO empleados(idEmpleado,idPlataforma,nombre,telefono,correo) VALUES (503,1,'Manuel Perez','2525412202','manuelperez@hotmail.com');
INSERT INTO usuarios(idUsuario,idPlataforma,nombre,correo,telefono,ubicacion) VALUES(250,1,'Juan Dominguez','juandominguez@gmail.com','525252',null);
INSERT INTO usuarios(idUsuario,idPlataforma,nombre,correo,telefono,ubicacion) VALUES(250,1,'Juan Dominguez','juandominguez gmail.com','5252525252',null);
INSERT INTO compradores(idComprador,idUsuario,calificacion,metodoPago,cantidadOfertas)VALUES (305,260,6,'Tarjeta crédito',4);
INSERT INTO compradores(idComprador,idUsuario,calificacion,metodoPago,cantidadOfertas)VALUES (305,260,5,'Efectivo',4);
INSERT INTO vendedores(idUsuario,idVendedor,cantidadVentas,reputacion,respuestaPromedio,estadoCuenta)VALUES(260,450,10,7,'REVISADO','Suspendida');
INSERT INTO vendedores(idUsuario,idVendedor,cantidadVentas,reputacion,respuestaPromedio,estadoCuenta)VALUES(260,450,10,4,'REVISADO','En revision');
INSERT INTO vehiculos (idVehiculo,idUsuario,marca,modelo,año,tipo,precio,color,kilometraje,estadoVehiculo,fechaPublicacion)VALUES(1001,260,'Mazda','2',1980,'sedan',60000000,'negro',10000,'muy bueno',TO_DATE('2023-05-22','YYYY-MM-DD'));
INSERT INTO vehiculos (idVehiculo,idUsuario,marca,modelo,año,tipo,precio,color,kilometraje,estadoVehiculo,fechaPublicacion)VALUES(1001,260,'Mazda','2',2020,'lindo',60000000,'negro',10000,'muy bueno',TO_DATE('2023-05-22','YYYY-MM-DD'));
INSERT INTO vehiculos (idVehiculo,idUsuario,marca,modelo,año,tipo,precio,color,kilometraje,estadoVehiculo,fechaPublicacion)VALUES(1001,260,'Mazda','2',2020,'sedan',60000000,'negro',-2000,'muy bueno',TO_DATE('2023-05-22','YYYY-MM-DD'));
INSERT INTO vehiculos (idVehiculo,idUsuario,marca,modelo,año,tipo,precio,color,kilometraje,estadoVehiculo,fechaPublicacion)VALUES(1001,111,'Mazda','2',2020,'sedan',-20000000,'negro',10000,'muy bueno',TO_DATE('2023-05-22','YYYY-MM-DD'));
INSERT INTO vehiculos (idVehiculo,idUsuario,marca,modelo,año,tipo,precio,color,kilometraje,estadoVehiculo,fechaPublicacion)VALUES(1001,111,'Mazda','2',2020,'sedan',60000000,'negro',10000,'regular',TO_DATE('2023-05-22','YYYY-MM-DD'));
INSERT INTO seguros(idSeguro,idVehiculo,aseguradora,fechaInicio,fechaFin,cobertura,tipo) VALUES(8000,1001,'Aseguradoras Seguro',TO_DATE('2022-08-01','YYYY-MM-DD'),TO_DATE('2024-05-22','YYYY-MM-DD'),'robo total','muy seguro');
INSERT INTO seguros(idSeguro,idVehiculo,aseguradora,fechaInicio,fechaFin,cobertura,tipo) VALUES(8000,1001,'Aseguradoras Seguro',TO_DATE('2025-01-01','YYYY-MM-DD'),TO_DATE('2024-05-22','YYYY-MM-DD'),'robo total','todo riesgo');
INSERT INTO seguros(idSeguro,idVehiculo,aseguradora,fechaInicio,fechaFin,cobertura,tipo) VALUES(8000,1001,'Aseguradoras Seguro',TO_DATE('2022-08-01','YYYY-MM-DD'),TO_DATE('2024-05-22','YYYY-MM-DD'),'cobertura total','todo riesgo');


---------------
/*DISPARADORES*/
  -- Se genera automáticamente idNotificacion:

CREATE SEQUENCE seq_notificaciones
  START WITH 1
  INCREMENT BY 1
  NOCACHE;  
CREATE OR REPLACE TRIGGER trg_notificaciones_bi
BEFORE INSERT ON notificaciones
FOR EACH ROW
BEGIN
  IF :NEW.idNotificacion IS NULL THEN
    SELECT seq_notificaciones.NEXTVAL
      INTO :NEW.idNotificacion
      FROM DUAL;
  END IF;

  IF :NEW.fechaEnvio IS NULL THEN
    :NEW.fechaEnvio := SYSDATE;
  END IF;
END;
/

  -- Coloca el día actual como fechaEnvio
CREATE OR REPLACE TRIGGER trg_notificaciones_fecha_bi
BEFORE INSERT ON notificaciones
FOR EACH ROW
BEGIN
  :NEW.fechaEnvio := TRUNC(SYSDATE);
END;
/
/*
SELECT
  idNotificacion,
  idTransaccion,
  tipo,
  mensaje,
  motivoRechazo,
  fechaEnvio,
  estado
FROM notificaciones;
*/

  -- coloca la Notificación como enviada cuando se complete la información
CREATE OR REPLACE TRIGGER trg_notificaciones_estado
BEFORE INSERT OR UPDATE ON notificaciones
FOR EACH ROW
BEGIN
  IF :NEW.idTransaccion   IS NOT NULL
     AND :NEW.tipo          IS NOT NULL
     AND :NEW.mensaje       IS NOT NULL
     AND :NEW.fechaEnvio    IS NOT NULL
  THEN
    :NEW.estado := 'enviada';
  END IF;
END;
/
/*Prueba
INSERT INTO notificaciones (
  idTransaccion, tipo, mensaje, fechaEnvio
) VALUES (
  2001, 'INFO', 'Mensaje completo', SYSDATE
);
COMMIT;

SELECT * FROM notificaciones WHERE idTransaccion = 2001;
-- Verifica que estado = 'enviada'

*/

  -- Se autogenera idPArtes
CREATE SEQUENCE seq_partesauto
  START WITH 1
  INCREMENT BY 1
  NOCACHE;  

CREATE OR REPLACE TRIGGER trg_partesauto_bi
BEFORE INSERT ON partesAuto
FOR EACH ROW
BEGIN
  IF :NEW.idPartes IS NULL THEN
    SELECT seq_partesauto.NEXTVAL
      INTO :NEW.idPartes
      FROM DUAL;
  END IF;
END;
/

  -- No permite qie cantidadDisponible sea negativa 
CREATE OR REPLACE TRIGGER trg_partesauto_check_cantidad
BEFORE INSERT OR UPDATE ON partesAuto
FOR EACH ROW
BEGIN
  IF :NEW.cantidadDisponible < 0 THEN
    RAISE_APPLICATION_ERROR(
      -20001,
      'ERROR: cantidadDisponible no puede ser negativa (valor=' || :NEW.cantidadDisponible || ')'
    );
  END IF;
END;
/

  -- Cuando se llenen todos los datos te la tabla aparezca el estado como activa

CREATE OR REPLACE TRIGGER trg_partesauto_set_activa
BEFORE INSERT OR UPDATE ON partesAuto
FOR EACH ROW
BEGIN
  -- Si todos los campos esenciales están completos, marcamos la parte como ACTIVA
  IF :NEW.idPartes          IS NOT NULL
     AND :NEW.idOferta       IS NOT NULL
     AND :NEW.nombre         IS NOT NULL
     AND :NEW.marca          IS NOT NULL
     AND :NEW.modeloCompatible IS NOT NULL
     AND :NEW.precio         IS NOT NULL
     AND :NEW.descripcion    IS NOT NULL
     AND :NEW.cantidadDisponible IS NOT NULL
     AND :NEW.fechaPublicacion    IS NOT NULL
  THEN
    :NEW.estado := 'ACTIVA';
  END IF;
END;
/

  -- Cuando la cantidad sea 0 estado pase a ser agotado 

CREATE OR REPLACE TRIGGER trg_partesauto_agotado
BEFORE INSERT OR UPDATE ON partesAuto
FOR EACH ROW
BEGIN
  -- Si la cantidad disponible llega a 0, marcamos el estado como 'Agotado'
  IF :NEW.cantidadDisponible = 0 THEN
    :NEW.estado := 'Agotado';
  END IF;
END;
/

  -- Se genera idTransaccion de manera automática
CREATE SEQUENCE seq_transacciones
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE OR REPLACE TRIGGER trg_transacciones_bi
BEFORE INSERT ON transacciones
FOR EACH ROW
BEGIN
  IF :NEW.idTransaccion IS NULL THEN
    SELECT seq_transacciones.NEXTVAL
      INTO :NEW.idTransaccion
      FROM DUAL;
  END IF;
END;
/

  -- Se genera automáticamente idCompra
CREATE SEQUENCE seq_compras
  START WITH 1
  INCREMENT BY 1
  NOCACHE; 

CREATE OR REPLACE TRIGGER trg_compras_bi
BEFORE INSERT ON compras
FOR EACH ROW
BEGIN
  IF :NEW.idCompra IS NULL THEN
    SELECT seq_compras.NEXTVAL
      INTO :NEW.idCompra
      FROM DUAL;
  END IF;
END;
/

  -- Deja como fecha la fecha actual
CREATE OR REPLACE TRIGGER trg_compras_fecha_bi
  BEFORE INSERT ON compras
  FOR EACH ROW
BEGIN
  IF :NEW.fecha IS NULL THEN
    :NEW.fecha := SYSDATE;
  END IF;
END;
/



/*ÍNDICES*/


/* Acelerar búsquedas de historial por vehículo */
CREATE INDEX IHistorial_IdVehiculo
  ON historialPropietarios(idVehiculo);

/* Acelerar búsquedas de vehículos por usuario */
CREATE INDEX IVehiculos_IdUsuario
  ON vehiculos(idUsuario);

/* Acelerar filtros por estado o marca */
CREATE INDEX IVehiculos_Estado
  ON vehiculos(estadoVehiculo);

CREATE INDEX IVehiculos_Marca
  ON vehiculos(marca);


/*VISTAS*/
/*
  VHistorialCompleto:
  Une cada cambio de propietario con los datos básicos
  del vehículo.
*/
CREATE VIEW VHistorialCompleto AS
SELECT
  h.idhistorial,
  h.idVehiculo,
  v.marca,
  v.modelo,
  h.propietarioAnterior,
  h.fechaCambio
FROM historialPropietarios h
JOIN vehiculos v
  ON h.idVehiculo = v.idVehiculo
ORDER BY h.idVehiculo, h.fechaCambio;


/*
  VUltimoCambioPropietario:
  Para cada vehículo, muestra el cambio de propietario
  más reciente (la última fecha de cambio).
*/
CREATE VIEW VUltimoCambioPropietario AS
SELECT
  h.idVehiculo,
  h.propietarioAnterior,
  h.fechaCambio
FROM historialPropietarios h
JOIN (
    SELECT idVehiculo, MAX(fechaCambio) AS maxFecha
    FROM historialPropietarios
    GROUP BY idVehiculo
) m
  ON h.idVehiculo = m.idVehiculo
 AND h.fechaCambio = m.maxFecha;


/*
  VVehiculosPorUsuario:
  Cuenta cuántos vehículos tiene cada usuario.
  (Asume que existe tabla 'usuarios' con clave idUsuario → usuarios.idUsuario)
*/
CREATE VIEW VVehiculosPorUsuario AS
SELECT
  v.idUsuario,
  u.nombre,               /* si la tabla usuarios tiene nombre */
  COUNT(v.idVehiculo) AS numVehiculos
FROM vehiculos v
JOIN usuarios u
  ON v.idUsuario = u.idUsuario
GROUP BY v.idUsuario, u.nombre
ORDER BY numVehiculos DESC;


/*
  VVehiculosDisponibles:
  Lista todos los vehículos cuyo estado sea 'Disponible'.
*/
CREATE VIEW VVehiculosDisponibles AS
SELECT
  idVehiculo,
  idUsuario,
  marca,
  modelo,
  año,
  tipo,
  precio,
  color,
  kilometraje,
  fechaPublicacion
FROM vehiculos
WHERE estadoVehiculo = 'Disponible'
ORDER BY fechaPublicacion DESC;


/*
  VVehiculosRecientes:
  Muestra los vehículos publicados en los últimos 30 días.
*/
CREATE VIEW VVehiculosRecientes AS
SELECT
  idVehiculo,
  idUsuario,
  marca,
  modelo,
  año,
  tipo,
  precio,
  color,
  kilometraje,
  estadoVehiculo,
  fechaPublicacion
FROM vehiculos
WHERE fechaPublicacion >= ADD_MONTHS(TRUNC(SYSDATE), -1)
ORDER BY fechaPublicacion DESC;



--------
/*COMPONENTES*/
/*CRUDE*/
/*Inserta registro en partesAuto
  Obtiene parte por medio de idParte
  Lista todas las partes registradas
  Actualiza parte
  Elimina registro de partes
*/
CREATE OR REPLACE PACKAGE PKG_PARTESAUTO IS

  PROCEDURE crearParte(
    p_idPartes           IN NUMBER,
    p_idOferta           IN NUMBER,
    p_nombre             IN VARCHAR2,
    p_marca              IN VARCHAR2,
    p_modeloCompatible   IN VARCHAR2,
    p_precio             IN NUMBER,
    p_estado             IN VARCHAR2,
    p_descripcion        IN VARCHAR2,
    p_cantidadDisponible IN NUMBER,
    p_fechaPublicacion   IN DATE
  );

  FUNCTION obtenerParte(
    p_idPartes IN NUMBER
  ) RETURN partesAuto%ROWTYPE;

  FUNCTION listarPartes
    RETURN SYS_REFCURSOR;

  PROCEDURE actualizarParte(
    p_idPartes           IN NUMBER,
    p_idOferta           IN NUMBER,
    p_nombre             IN VARCHAR2,
    p_marca              IN VARCHAR2,
    p_modeloCompatible   IN VARCHAR2,
    p_precio             IN NUMBER,
    p_estado             IN VARCHAR2,
    p_descripcion        IN VARCHAR2,
    p_cantidadDisponible IN NUMBER
  );

  PROCEDURE eliminarParte(
    p_idPartes IN NUMBER
  );

END PKG_PARTESAUTO;
/


CREATE OR REPLACE PACKAGE BODY PKG_PARTESAUTO IS

  PROCEDURE crearParte(
    p_idPartes           IN NUMBER,
    p_idOferta           IN NUMBER,
    p_nombre             IN VARCHAR2,
    p_marca              IN VARCHAR2,
    p_modeloCompatible   IN VARCHAR2,
    p_precio             IN NUMBER,
    p_estado             IN VARCHAR2,
    p_descripcion        IN VARCHAR2,
    p_cantidadDisponible IN NUMBER,
    p_fechaPublicacion   IN DATE
  ) IS
  BEGIN
    INSERT INTO partesAuto (
      idPartes,
      idOferta,
      nombre,
      marca,
      modeloCompatible,
      precio,
      estado,
      descripcion,
      cantidadDisponible,
      fechaPublicacion
    ) VALUES (
      p_idPartes,
      p_idOferta,
      p_nombre,
      p_marca,
      p_modeloCompatible,
      p_precio,
      p_estado,
      p_descripcion,
      p_cantidadDisponible,
      p_fechaPublicacion
    );
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20020, 'No se pudo crear la parte.');
  END crearParte;

  FUNCTION obtenerParte(
    p_idPartes IN NUMBER
  ) RETURN partesAuto%ROWTYPE IS
    v_row partesAuto%ROWTYPE;
  BEGIN
    SELECT *
      INTO v_row
      FROM partesAuto
     WHERE idPartes = p_idPartes;
    RETURN v_row;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20021, 'Parte no encontrada.');
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20022, 'Error al obtener la parte.');
  END obtenerParte;

  FUNCTION listarPartes
    RETURN SYS_REFCURSOR IS
    v_cur SYS_REFCURSOR;
  BEGIN
    OPEN v_cur FOR
      SELECT * FROM partesAuto;
    RETURN v_cur;
  END listarPartes;

  PROCEDURE actualizarParte(
    p_idPartes           IN NUMBER,
    p_idOferta           IN NUMBER,
    p_nombre             IN VARCHAR2,
    p_marca              IN VARCHAR2,
    p_modeloCompatible   IN VARCHAR2,
    p_precio             IN NUMBER,
    p_estado             IN VARCHAR2,
    p_descripcion        IN VARCHAR2,
    p_cantidadDisponible IN NUMBER
  ) IS
  BEGIN
    UPDATE partesAuto
       SET idOferta           = p_idOferta,
           nombre             = p_nombre,
           marca              = p_marca,
           modeloCompatible   = p_modeloCompatible,
           precio             = p_precio,
           estado             = p_estado,
           descripcion        = p_descripcion,
           cantidadDisponible = p_cantidadDisponible
     WHERE idPartes = p_idPartes;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20023, 'No se pudo actualizar la parte.');
  END actualizarParte;

  PROCEDURE eliminarParte(
    p_idPartes IN NUMBER
  ) IS
  BEGIN
    DELETE FROM partesAuto
     WHERE idPartes = p_idPartes;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20024, 'No se pudo eliminar la parte.');
  END eliminarParte;

END PKG_PARTESAUTO;
/

--------Componentes
--------CRUDI

/*Insertar un nuevo registro en vehiculos
  Actualiza estadoVehiculo
  Busca por idVehiculo
  Elimina el registro por idVehiculo*/
CREATE OR REPLACE PACKAGE PKG_VEHICULOS IS

  PROCEDURE alta(
    p_idVehiculo        IN NUMBER,
    p_idUsuario         IN NUMBER,
    p_marca             IN VARCHAR2,
    p_modelo            IN VARCHAR2,
    p_año               IN NUMBER,           
    p_tipo              IN VARCHAR2,
    p_precio            IN NUMBER,
    p_color             IN VARCHAR2,
    p_kilometraje       IN NUMBER,
    p_estadoVehiculo    IN VARCHAR2,
    p_fechaPublicacion  IN DATE
  );

  PROCEDURE actualizarEstado(
    p_idVehiculo      IN NUMBER,
    p_estadoVehiculo  IN VARCHAR2
  );

  FUNCTION buscarPorId(
    p_idVehiculo IN NUMBER
  ) RETURN vehiculos%ROWTYPE;

  PROCEDURE eliminar(
    p_idVehiculo IN NUMBER
  );

END PKG_VEHICULOS;
/


CREATE OR REPLACE PACKAGE BODY PKG_VEHICULOS IS

  PROCEDURE alta(
    p_idVehiculo        IN NUMBER,
    p_idUsuario         IN NUMBER,
    p_marca             IN VARCHAR2,
    p_modelo            IN VARCHAR2,
    p_año               IN NUMBER,
    p_tipo              IN VARCHAR2,
    p_precio            IN NUMBER,
    p_color             IN VARCHAR2,
    p_kilometraje       IN NUMBER,
    p_estadoVehiculo    IN VARCHAR2,
    p_fechaPublicacion  IN DATE
  ) IS
  BEGIN
    INSERT INTO vehiculos (
      idVehiculo,
      idUsuario,
      marca,
      modelo,
      año,               
      tipo,
      precio,
      color,
      kilometraje,
      estadoVehiculo,
      fechaPublicacion
    ) VALUES (
      p_idVehiculo,
      p_idUsuario,
      p_marca,
      p_modelo,
      p_año,
      p_tipo,
      p_precio,
      p_color,
      p_kilometraje,
      p_estadoVehiculo,
      p_fechaPublicacion
    );
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20010, 'No se pudo insertar el vehículo.');
  END alta;

  PROCEDURE actualizarEstado(
    p_idVehiculo      IN NUMBER,
    p_estadoVehiculo  IN VARCHAR2
  ) IS
  BEGIN
    UPDATE vehiculos
       SET estadoVehiculo = p_estadoVehiculo
     WHERE idVehiculo = p_idVehiculo;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20011, 'No se pudo actualizar estado.');
  END actualizarEstado;

  FUNCTION buscarPorId(
    p_idVehiculo IN NUMBER
  ) RETURN vehiculos%ROWTYPE IS
    v_row vehiculos%ROWTYPE;
  BEGIN
    SELECT *
      INTO v_row
      FROM vehiculos
     WHERE idVehiculo = p_idVehiculo;
    RETURN v_row;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20012, 'Vehículo no encontrado.');
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20013, 'Error al buscar vehículo.');
  END buscarPorId;

  PROCEDURE eliminar(
    p_idVehiculo IN NUMBER
  ) IS
  BEGIN
    DELETE FROM vehiculos
     WHERE idVehiculo = p_idVehiculo;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20014, 'No se pudo eliminar vehículo.');
  END eliminar;

END PKG_VEHICULOS;
/



/*SEGURIDAD*/
/*ACTORESI*/

CREATE OR REPLACE PACKAGE PKG_EMPLEADOS IS

  /** Inserta un nuevo empleado */
  PROCEDURE ad_empleado(
    p_idEmpleado    IN NUMBER,
    p_idPlataforma  IN NUMBER,
    p_nombre        IN VARCHAR2,
    p_telefono      IN VARCHAR2,
    p_correo        IN VARCHAR2
  );

  /** Modifica el nombre de un empleado existente */
  PROCEDURE mo_nombre(
    p_idEmpleado IN NUMBER,
    p_nombre     IN VARCHAR2
  );

  /** Modifica el teléfono de un empleado existente */
  PROCEDURE mo_telefono(
    p_idEmpleado IN NUMBER,
    p_telefono   IN VARCHAR2
  );

  /** Modifica el correo de un empleado existente */
  PROCEDURE mo_correo(
    p_idEmpleado IN NUMBER,
    p_correo     IN VARCHAR2
  );

  /** Devuelve los datos de un empleado por su ID */
  FUNCTION co_empleado(
    p_idEmpleado IN NUMBER
  ) RETURN SYS_REFCURSOR;

  /** Lista todos los empleados de una plataforma dada */
  FUNCTION co_porPlataforma(
    p_idPlataforma IN NUMBER
  ) RETURN SYS_REFCURSOR;

  /** Elimina un empleado por su ID */
  PROCEDURE el_empleado(
    p_idEmpleado IN NUMBER
  );

END PKG_EMPLEADOS;
/


CREATE OR REPLACE PACKAGE BODY PKG_EMPLEADOS IS

  -- Inserta un nuevo empleado
  PROCEDURE ad_empleado(
    p_idEmpleado    IN NUMBER,
    p_idPlataforma  IN NUMBER,
    p_nombre        IN VARCHAR2,
    p_telefono      IN VARCHAR2,
    p_correo        IN VARCHAR2
  ) IS
  BEGIN
    INSERT INTO empleados (
      idEmpleado,
      idPlataforma,
      nombre,
      telefono,
      correo
    ) VALUES (
      p_idEmpleado,
      p_idPlataforma,
      p_nombre,
      p_telefono,
      p_correo
    );
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20030, 'No se pudo insertar el empleado.');
  END ad_empleado;

  -- Modifica el nombre de un empleado existente
  PROCEDURE mo_nombre(
    p_idEmpleado IN NUMBER,
    p_nombre     IN VARCHAR2
  ) IS
  BEGIN
    UPDATE empleados
       SET nombre = p_nombre
     WHERE idEmpleado = p_idEmpleado;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20031, 'No se pudo actualizar el nombre.');
  END mo_nombre;

  -- Modifica el teléfono de un empleado existente
  PROCEDURE mo_telefono(
    p_idEmpleado IN NUMBER,
    p_telefono   IN VARCHAR2
  ) IS
  BEGIN
    UPDATE empleados
       SET telefono = p_telefono
     WHERE idEmpleado = p_idEmpleado;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20032, 'No se pudo actualizar el teléfono.');
  END mo_telefono;

  -- Modifica el correo de un empleado existente
  PROCEDURE mo_correo(
    p_idEmpleado IN NUMBER,
    p_correo     IN VARCHAR2
  ) IS
  BEGIN
    UPDATE empleados
       SET correo = p_correo
     WHERE idEmpleado = p_idEmpleado;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20033, 'No se pudo actualizar el correo.');
  END mo_correo;

  -- Devuelve los datos de un empleado por su ID
  FUNCTION co_empleado(
    p_idEmpleado IN NUMBER
  ) RETURN SYS_REFCURSOR IS
    v_cur SYS_REFCURSOR;
  BEGIN
    OPEN v_cur FOR
      SELECT *
        FROM empleados
       WHERE idEmpleado = p_idEmpleado;
    RETURN v_cur;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20034, 'Empleado no encontrado.');
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20035, 'Error al consultar empleado.');
  END co_empleado;

  -- Lista todos los empleados de una plataforma dada
  FUNCTION co_porPlataforma(
    p_idPlataforma IN NUMBER
  ) RETURN SYS_REFCURSOR IS
    v_cur SYS_REFCURSOR;
  BEGIN
    OPEN v_cur FOR
      SELECT *
        FROM empleados
       WHERE idPlataforma = p_idPlataforma;
    RETURN v_cur;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20036, 'Error al listar empleados por plataforma.');
  END co_porPlataforma;

  -- Elimina un empleado por su ID
  PROCEDURE el_empleado(
    p_idEmpleado IN NUMBER
  ) IS
  BEGIN
    DELETE FROM empleados
     WHERE idEmpleado = p_idEmpleado;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20037, 'No se pudo eliminar el empleado.');
  END el_empleado;

END PKG_EMPLEADOS;
/

/*ACTORESE*/
CREATE OR REPLACE PACKAGE PKG_SEGUROS IS

  -- Agrega un nuevo seguro para un vehículo
  PROCEDURE ad_seguro(
    p_idSeguro    IN NUMBER,
    p_idVehiculo  IN NUMBER,
    p_aseguradora IN VARCHAR2,
    p_fechaInicio IN DATE,
    p_fechaFin    IN DATE,
    p_cobertura   IN VARCHAR2,
    p_tipo        IN VARCHAR2
  );

  -- Modifica la fecha de fin de un seguro existente
  PROCEDURE mo_fechaFin(
    p_idSeguro IN NUMBER,
    p_fechaFin IN DATE
  );

  -- Modifica la cobertura de un seguro existente
  PROCEDURE mo_cobertura(
    p_idSeguro  IN NUMBER,
    p_cobertura IN VARCHAR2
  );

  -- Consulta los datos de un seguro por su ID
  FUNCTION co_seguro(
    p_idSeguro IN NUMBER
  ) RETURN SYS_REFCURSOR;

  -- Lista todos los seguros asociados a un vehículo
  FUNCTION co_porVehiculo(
    p_idVehiculo IN NUMBER
  ) RETURN SYS_REFCURSOR;

  -- Elimina un seguro por su ID
  PROCEDURE el_seguro(
    p_idSeguro IN NUMBER
  );

END PKG_SEGUROS;
/

CREATE OR REPLACE PACKAGE BODY PKG_SEGUROS IS

  PROCEDURE ad_seguro(
    p_idSeguro    IN NUMBER,
    p_idVehiculo  IN NUMBER,
    p_aseguradora IN VARCHAR2,
    p_fechaInicio IN DATE,
    p_fechaFin    IN DATE,
    p_cobertura   IN VARCHAR2,
    p_tipo        IN VARCHAR2
  ) IS
  BEGIN
    INSERT INTO seguros (
      idSeguro,
      idVehiculo,
      aseguradora,
      fechaInicio,
      fechaFin,
      cobertura,
      tipo
    ) VALUES (
      p_idSeguro,
      p_idVehiculo,
      p_aseguradora,
      p_fechaInicio,
      p_fechaFin,
      p_cobertura,
      p_tipo
    );
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20040, 'No se pudo agregar el seguro.');
  END ad_seguro;

  PROCEDURE mo_fechaFin(
    p_idSeguro IN NUMBER,
    p_fechaFin IN DATE
  ) IS
  BEGIN
    UPDATE seguros
       SET fechaFin = p_fechaFin
     WHERE idSeguro = p_idSeguro;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20041, 'No se pudo actualizar la fecha de fin.');
  END mo_fechaFin;

  PROCEDURE mo_cobertura(
    p_idSeguro  IN NUMBER,
    p_cobertura IN VARCHAR2
  ) IS
  BEGIN
    UPDATE seguros
       SET cobertura = p_cobertura
     WHERE idSeguro = p_idSeguro;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20042, 'No se pudo actualizar la cobertura.');
  END mo_cobertura;

  FUNCTION co_seguro(
    p_idSeguro IN NUMBER
  ) RETURN SYS_REFCURSOR IS
    v_cur SYS_REFCURSOR;
  BEGIN
    OPEN v_cur FOR
      SELECT *
        FROM seguros
       WHERE idSeguro = p_idSeguro;
    RETURN v_cur;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20043, 'Seguro no encontrado.');
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20044, 'Error al consultar el seguro.');
  END co_seguro;

  FUNCTION co_porVehiculo(
    p_idVehiculo IN NUMBER
  ) RETURN SYS_REFCURSOR IS
    v_cur SYS_REFCURSOR;
  BEGIN
    OPEN v_cur FOR
      SELECT *
        FROM seguros
       WHERE idVehiculo = p_idVehiculo;
    RETURN v_cur;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20045, 'Error al listar seguros por vehículo.');
  END co_porVehiculo;

  PROCEDURE el_seguro(
    p_idSeguro IN NUMBER
  ) IS
  BEGIN
    DELETE FROM seguros
     WHERE idSeguro = p_idSeguro;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20046, 'No se pudo eliminar el seguro.');
  END el_seguro;

END PKG_SEGUROS;
/



/*ROLES*/
CREATE ROLE empleado;
CREATE ROLE cliente;
CREATE ROLE vendedor;
CREATE ROLE asesor;


GRANT INSERT, SELECT, UPDATE, DELETE ON usuarios TO empleado;
GRANT INSERT, SELECT, UPDATE, DELETE ON reporteProblemas TO empleado;
GRANT SELECT ON reporteProblemas TO vendedor;
GRANT INSERT, UPDATE ON reporteProblemas TO cliente; 
GRANT INSERT, SELECT, UPDATE, DELETE ON devoluciones TO empleado;
GRANT INSERT, SELECT, UPDATE, DELETE ON devolucionVehiculos TO empleado;
GRANT INSERT, SELECT, UPDATE, DELETE ON devolucionRepuestos TO empleado;
GRANT INSERT, UPDATE, DELETE ON ofertas TO cliente;
GRANT SELECT ON ofertas TO vendedor;
GRANT INSERT, SELECT, UPDATE, DELETE ON seguros TO empleado;
GRANT INSERT,UPDATE ON seguros TO vendedor;
GRANT INSERT,SELECT,UPDATE,DELETE ON seguros TO cliente;
GRANT INSERT,SELECT,UPDATE,DELETE ON seguros TO asesor;


VAR rc REFCURSOR
VAR sc REFCURSOR

------------------------------------------------
-- Historia 1: gestión de empleados
------------------------------------------------
SET ROLE empleado;
BEGIN
  PKG_EMPLEADOS.ad_empleado(
    p_idEmpleado   => 1001,
    p_idPlataforma => 1,
    p_nombre       => 'Lucía Gómez',
    p_telefono     => '3215551234',
    p_correo       => 'lgomez@gmail.com'
  );
  PKG_EMPLEADOS.mo_nombre(1001, 'Lucía G. Ramírez');
  PKG_EMPLEADOS.mo_telefono(1001, '3124445678');
  PKG_EMPLEADOS.mo_correo(1001, 'lgramirez@gmail.com');
  DBMS_OUTPUT.PUT_LINE('Historia empleados: inserción y modificaciones completadas.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Historia empleados ERROR: ' || SQLERRM);
END;
/

BEGIN
  :rc := PKG_EMPLEADOS.co_empleado(1001);
END;
/
PRINT rc

BEGIN
  :rc := PKG_EMPLEADOS.co_porPlataforma(1);
END;
/
PRINT rc

BEGIN
  PKG_EMPLEADOS.el_empleado(1001);
  DBMS_OUTPUT.PUT_LINE('Empleado eliminado.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error eliminando empleado: ' || SQLERRM);
END;
/

BEGIN
  :rc := PKG_EMPLEADOS.co_empleado(1001);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error esperado al consultar empleado eliminado: ' || SQLERRM);
END;
/
---------------
GRANT EXECUTE
  ON PKG_SEGUROS
  TO cliente;


------------------------------------------------
-- Historia 2: gestión de seguros
------------------------------------------------
SET ROLE asesor;
BEGIN
  PKG_SEGUROS.ad_seguro(
    p_idSeguro    => 3001,
    p_idVehiculo  => 2002,
    p_aseguradora => 'Seguro',
    p_fechaInicio => TO_DATE('2024-05-01','YYYY-MM-DD'),
    p_fechaFin    => TO_DATE('2025-05-01','YYYY-MM-DD'),
    p_cobertura   => 'responsabilidad civil',
    p_tipo        => 'responsabilidad civil'
  );
  PKG_SEGUROS.mo_fechaFin(3001, TO_DATE('2027-05-01','YYYY-MM-DD'));
  PKG_SEGUROS.mo_cobertura(3001, 'responsabilidad civil');
  DBMS_OUTPUT.PUT_LINE('Historia seguros: creación y modificaciones completadas.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Historia seguros ERROR: ' || SQLERRM);
END;
/

BEGIN
  :sc := PKG_SEGUROS.co_seguro(3001);
END;
/
PRINT sc

BEGIN
  :sc := PKG_SEGUROS.co_porVehiculo(2002);
END;
/
PRINT sc

BEGIN
  PKG_SEGUROS.el_seguro(3001);
  DBMS_OUTPUT.PUT_LINE('Seguro eliminado.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error eliminando seguro: ' || SQLERRM);
END;
/

BEGIN
  :sc := PKG_SEGUROS.co_seguro(3001);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error esperado al consultar seguro eliminado: ' || SQLERRM);
END;
/

BEGIN
  PKG_SEGUROS.ad_seguro(
    p_idSeguro    => 3002,
    p_idVehiculo  => 2003,
    p_aseguradora => 'Express',
    p_fechaInicio => SYSDATE,
    p_fechaFin    => SYSDATE + 365,
    p_cobertura   => 'responsabilidad civil',
    p_tipo        => 'SOAT'
  );
  DBMS_OUTPUT.PUT_LINE('Inserción cliente.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Acción no permitida (cliente): ' || SQLERRM);
END;
/

SET ROLE NONE;

SET ROLE ALL;


/*ELIMINACION POBLAR*/
DELETE FROM usuarios;
DELETE FROM historialPropietarios;
DELETE FROM empleados;
DELETE FROM vendedores;
DELETE FROM vehiculos;
DELETE FROM devolucionVehiculos;
DELETE FROM devolucionRepuestos;
DELETE FROM ofertas;
DELETE FROM compras;
DELETE FROM compradores;
DELETE FROM devoluciones;
DELETE FROM seguros;
DELETE FROM reporteProblemas;
DELETE FROM plataforma;
DELETE FROM transacciones;
DELETE FROM notificaciones;
DELETE FROM partesAuto;

/*ELIMINACIÓN DE TABLAS*/
DROP TABLE usuarios CASCADE CONSTRAINTS PURGE;
DROP TABLE historialPropietarios CASCADE CONSTRAINTS PURGE;
DROP TABLE empleados CASCADE CONSTRAINTS PURGE;
DROP TABLE vendedores CASCADE CONSTRAINTS PURGE;
DROP TABLE vehiculos CASCADE CONSTRAINTS PURGE;
DROP TABLE devolucionVehiculos CASCADE CONSTRAINTS PURGE;
DROP TABLE devolucionRepuestos CASCADE CONSTRAINTS PURGE;
DROP TABLE ofertas CASCADE CONSTRAINTS PURGE;
DROP TABLE compras CASCADE CONSTRAINTS PURGE;
DROP TABLE compradores CASCADE CONSTRAINTS PURGE;
DROP TABLE devoluciones CASCADE CONSTRAINTS PURGE;
DROP TABLE seguros CASCADE CONSTRAINTS PURGE;
DROP TABLE reporteProblemas CASCADE CONSTRAINTS PURGE;
DROP TABLE transacciones CASCADE CONSTRAINTS PURGE;
DROP TABLE notificaciones CASCADE CONSTRAINTS PURGE;
DROP TABLE partesAuto CASCADE CONSTRAINTS PURGE;
DROP TABLE plataforma CASCADE CONSTRAINTS PURGE;

/*ELIMINACIÓN SECUENCIAS*/
DROP SEQUENCE seq_notificaciones;
DROP SEQUENCE seq_partesauto;
DROP SEQUENCE seq_transacciones;
DROP SEQUENCE seq_compras;

/*ELIMINACIÓN DE DISPARADORES*/
DROP TRIGGER trg_notificaciones_bi;
DROP TRIGGER trg_notificaciones_fecha_bi;
DROP TRIGGER trg_notificaciones_estado;
DROP TRIGGER trg_partesauto_bi;
DROP TRIGGER trg_partesauto_check_cantidad;
DROP TRIGGER trg_partesauto_set_activa;
DROP TRIGGER trg_partesauto_agotado;
DROP TRIGGER trg_transacciones_bi;
DROP TRIGGER trg_compras_bi;
DROP TRIGGER trg_compras_fecha_bi;

/*ELIMINACION CRUD*/
DROP PACKAGE PKG_PARTESAUTO;
DROP PACKAGE PKG_VEHICULOS;

/*ELIMINACIÓN SEGURIDAD*/
DROP PACKAGE PKG_EMPLEADOS;
DROP PACKAGE PKG_SEGUROS;

/*ELIMINACIÓN INDICES Y VISTAS*/
DROP INDEX IHistorial_IdVehiculo;
DROP INDEX IVehiculos_IdUsuario;
DROP INDEX IVehiculos_Estado;
DROP INDEX IVehiculos_Marca;

DROP VIEW VHistorialCompleto;
DROP VIEW VUltimoCambioPropietario;
DROP VIEW VVehiculosPorUsuario;
DROP VIEW VVehiculosDisponibles;
DROP VIEW VVehiculosRecientes;

/*ELIMINACIÓN DE ROLES*/
DROP ROLE cliente;
DROP ROLE empleado;
DROP ROLE asesor;
DROP ROLE vendedor;
