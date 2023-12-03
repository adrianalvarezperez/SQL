



-- 1.	Muestre el salario más alto, más bajo, salario total y salario promedio por cada tipo de puesto que se tiene en la organización.
SELECT J.JOB_TITLE AS TRABAJO, MAX(E.SALARY)AS SALARIO_MAX, MIN(E.SALARY)AS SALARIO_MIN, SUM(E.SALARY)AS SALARIO_TOTAL, AVG(E.SALARY)AS SALARIO_PROMEDIO
FROM EMPLOYEES E JOIN JOBS J ON E.JOB_ID=J.JOB_ID
GROUP BY J.JOB_TITLE;



-- 2.	Escriba una consulta que muestre la cantidad de personas que tienen el mismo puesto y a cuánto asciende la suma total de sus salarios. 
--      El resultado debe mostrarse en orden descendente por el puesto que tiene la mayor cantidad de empleados.
SELECT J.JOB_TITLE AS TRABAJO, COUNT(E.JOB_ID)AS TOTAL_EMPLEADOS, SUM(E.SALARY)AS SUMA_TOTAL_SALARIOS
FROM EMPLOYEES E JOIN JOBS J ON E.JOB_ID=J.JOB_ID
GROUP BY J.JOB_TITLE
ORDER BY COUNT(E.JOB_ID) DESC;


-- 3.	Escriba una consulta para mostrar la diferencia entre el salario más alto y el salario más bajo. Etiquete la columna como «Diferencia Salarial».
SELECT MAX(SALARY)AS SALARIO_MAX, MIN(SALARY)AS SALARIO_MIN, MAX(SALARY) - MIN(SALARY)AS DIFERENCIA_SALARIAL
FROM EMPLOYEES;


-- 4.	Escriba una consulta para mostrar el número de empleado y apellidos de todos los empleados que ganan por encima del salario promedio.
SELECT EMPLOYEE_ID AS NUMERO_EMPLEADO, LAST_NAME AS APELLIDOS_EMPLEADO, SALARY AS SALARIO_EMPLEADOS_PROMEDIO
FROM EMPLOYEES
WHERE SALARY >
            (SELECT AVG(SALARY) 
             FROM EMPLOYEES);


-- 5.	Muestre los nombres y apellidos (es una sola columna), nombre del departamento y el nombre del puesto de todos los empleados cuyo código de ubicación de departamento (LOCATION_ID) es 1700. 
--      El resultado debe mostrarse en orden ascendente por el apellido del empleado.
SELECT (FIRST_NAME || ' ' || LAST_NAME)AS NOMBRES_APELLIDO_EMPLEADO, D.DEPARTMENT_NAME AS DEPARTAMENTO, J.JOB_TITLE AS TRABAJO
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
                 JOIN JOBS J ON E.JOB_ID=J.JOB_ID
WHERE D.LOCATION_ID= 1700
ORDER BY E.LAST_NAME ASC;
