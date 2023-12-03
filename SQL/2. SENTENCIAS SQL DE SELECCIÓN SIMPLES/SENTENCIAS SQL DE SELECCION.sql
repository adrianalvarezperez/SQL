USE PROYECTOS;

-- 1º. MOSTRAR TODOS LOS DATOS DE LAS 4 TABLAS.
SELECT *
FROM DEPARTAMENTO;

SELECT *
FROM EMPLEADOS;

SELECT *
FROM PROYECTOS;

SELECT *
FROM RENACIDA;


-- 2º. MOSTRAR UNA LISTA INDICANDO EL NOMBRE Y LA FECHA DE INICIO QUE EMPIEZAN A PARTIR DE MARZO. EN LA CABECERA DE FECHA PONER "FECHA INICIO DEL PROYECTO".
SELECT NOMBRE, FECHA_INI AS FECHA_INICIO_DEL_PROYECTO
FROM PROYECTOS
WHERE FECHA_INI >= '2018-03-01';


-- 3º. LISTADO DE TODOS LOS EMPLEADOS QUE TENGAS EL APELLIDO LOPEZ COMO PRIMERO O SEGUNDO APELLIDO.
SELECT *
FROM EMPLEADOS
WHERE APELLIDO LIKE '%LOPEZ%';


-- 4º. MOSTRAR EL NOMBRE DEL PROYECTO QUE TIENE ASIGNADO EL EMPLEADO "10480".
SELECT *
FROM RENACIDA
WHERE ID_EMP= 10480;			-- PRIMERO AVERIGUAMOS EL NUMERO DE PROYECTO DEL EMPLEADO 10480

SELECT *
FROM PROYECTOS					-- SEGUNDO BUSCAMOS EL NOMBRE DEL PROYECTO DONDE ESTA EL EMPLEADO 10480
WHERE ID_PROY= 3;


-- 5º. SACAR UN LISTADO DE LOS EMPLEADOS QUE SEAN DE MADRID O CORDOBA.
SELECT *
FROM EMPLEADOS
WHERE MUNICIPIO= 'MADRID' OR MUNICIPIO='CORDOBA';

SELECT *
FROM EMPLEADOS
WHERE MUNICIPIO IN ('MADRID','CORDOBA');


-- 6º. SACAR UN LISTADO DE LOS EMPLEADOS QUE TENGAN UN SUELDO ENTRE 1300 Y 1550 EUROS.
SELECT *
FROM EMPLEADOS
WHERE SUELDO >= 1300 AND SUELDO <= 1550;


-- 7º. ORDENA LOS EMPLEADOS POR FECHA DE NACIMIENTO DESCENDENTE Y SOLO LOS QUE HAYAN NACIDO DESPUES DE 1976.
SELECT *
FROM EMPLEADOS
WHERE FECHA_NAC >= '1977-01-01'
ORDER BY FECHA_NAC DESC;


-- 8º. SE HA DETECTADO UN ERROR Y ES NECESARIO SUMAR 5000 EUROS AL PRESUPUESTO DEL DEPARTAMENTO DE MARKETING. MODIFICARLO SIN INSERTAR UN NUEVO REGISTRO
UPDATE DEPARTAMENTO
SET PRESUPUESTO=PRESUPUESTO +5000
WHERE NOMBRE= 'MARKETING';					


-- 9º. SE VA A CAMBIAR DE PROYECTO A ALBERTO GARCIA LOPEZ. MODIFICALO PARA QUE TENGA ASIGNADO EL PROYECTO "RUNTA".
SELECT *
FROM EMPLEADOS;					-- MIRAMOS EL ID_EMP QUE TIENE ALBERTO

SELECT *
FROM PROYECTOS;					-- MIRAMOS EL ID_PROY QUE TIENE RUNTA


UPDATE RENACIDA
SET ID_PROY= 3
WHERE ID_EMP=10478;				


-- 10º. POR MOTIVOS DE LOGISTICA "ANTONIO GARCÍA MONTERO" YA NO SEGUÍRA EN EL PROYECTO QUE TENIA ASIGNADO Y POR LO TANTO HAY QUE QUITARLE ESA ASIGNACIÓN. 
-- HAZLO EN DOS PASOS AL IGUAL QUE EN LA CONSULTA 4. 
SELECT *
FROM EMPLEADOS;			-- PRIMERO AVERIGUAMOS EL ID_EMP DE ANTONIO GARCIA MONTERO

SELECT *
FROM RENACIDA;			-- UNA VEZ TENEMOS EL PROYECTO MIRAMOS EN LA RENACIDA QUE ID_PROY TIENE ANTONIO GARCIA MONTERO.

DELETE 
FROM RENACIDA
WHERE ID_EMP= 10480 AND ID_PROY= 3;


-- 11º. SACAR A TODOS LOS EMPLEADOS DEL DEPARTAMENTO DE DISEÑO Y QUE GANEN MAS de 1500 EUROS. 
SELECT *
FROM DEPARTAMENTO;						-- MIRAMOS CUAL ES EL ID_DTPO DE DISEÑO

SELECT *
FROM EMPLEADOS
WHERE ID_DPTO= 2 AND SUELDO > 1500;


-- 12º. INCREMENTAR EN 5% EL SUELDO DE LOS EMPLEADOS QUE PERTENEZCAN AL DEPARTAMENTO DE I + D Y QUE GANEN MENOS DE 1400 EUROS. 
SELECT *
FROM DEPARTAMENTO;

SELECT ID_EMP, NOMBRE, APELLIDO, SEXO, FECHA_NAC, MUNICIPIO, SUELDO * 1.05 AS SUELDO_AUMENTADO_UN_5_PORCIENTO, ID_DPTO
FROM EMPLEADOS
WHERE ID_DPTO=1 AND SUELDO <1400;			-- AQUI LO HACEMOS EN FORMA DE CONSULTA

UPDATE EMPLEADOS
SET SUELDO= SUELDO * 1.05
WHERE ID_DPTO=1 AND SUELDO <1400;			-- AQUI LO MODIFICAMOS








