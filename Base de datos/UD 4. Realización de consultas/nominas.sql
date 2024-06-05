
-- Código y nombre de todos los departamentos, ordenados por el nombre.
SELECT codigo, nombre FROM departamento ORDER BY nombre;

-- 2. Mes y ejercicio de los justificantes de nómina pertenecientes al empleado cuyo codigo es 1

SELECT mes, ejercicio FROM just_nomina WHERE cod_emp = 1;

-- 3. Código y nombre de los empleados ordenados ascendentemente por nombre.
SELECT codigo, nombre FROM empleado ORDER BY nombre;

-- 4. Código y número de cuenta de los empleados cuyo nombre empiece por 'A' o por 'J'.

SELECT codigo, cuenta FROM empleado WHERE nombre LIKE 'A%' OR nombre LIKE 'J%';

-- 5. Número de empleados que hay en la base de datos.
SELECT COUNT(*) AS numero_empleados FROM empleado;

-- 6. Nombre y número de hijos de los empleados cuya retención es: 8, 10 o 12.
SELECT nombre, hijos FROM empleado WHERE retencion IN (8, 10, 12);

-- 7. Número de hijos y número de empleados agrupados por hijos, mostrando sólo los grupos cuyo número de empleados sea mayor que 1.

SELECT hijos, COUNT(*) AS num_empleados
FROM empleado
GROUP BY hijos
HAVING COUNT(*) > 1;

-- 8. Número de hijos, retención máxima, mínima y media de los empleados agrupados por hijos.

SELECT hijos, MAX(retencion) AS retencion_maxima, MIN(retencion) AS retencion_minima, AVG(retencion) AS retencion_media
FROM empleado
GROUP BY hijos;

-- 9. Nombre y función de los empleados que han trabajado en el departamento 1.
SELECT e.nombre, t.funcion
FROM empleado e
JOIN trabajan t ON e.codigo = t.cod_emp
WHERE t.cod_dep = 1;

-- 10. Nombre del empleado y nombre del departamento en el que han trabajado empleados que no tienen hijos.

SELECT e.nombre AS nombre_empleado, d.nombre AS nombre_departamento
FROM empleado e
JOIN trabajan t ON e.codigo = t.cod_emp
JOIN departamento d ON t.cod_dep = d.codigo
WHERE e.hijos = 0;
-- 11. Nombre del empleado, mes, número de línea, ejercicio de sus justificantes de nómina y cantidad.
SELECT e.nombre, l.mes, l.numero, l.ejercicio, l.cantidad
FROM empleado e
JOIN just_nomina j ON e.codigo = j.cod_emp
JOIN linea l ON j.mes = l.mes AND j.ejercicio = l.ejercicio AND j.cod_emp = l.cod_emp
WHERE e.codigo = 1
ORDER BY l.mes;

-- 12. Nombre de los empleados e ingresos totales percibidos por cada uno.
SELECT e.nombre, SUM(j.ingreso) AS ingresos_totales
FROM empleado e
JOIN just_nomina j ON e.codigo = j.cod_emp
GROUP BY e.nombre;

-- 13. Número de empleados cuyo número de hijos es superior a la media de hijos de los empleados

SELECT COUNT(*) AS num_empleados
FROM empleado
WHERE hijos > (SELECT AVG(hijos) FROM empleado);

-- 14. Nombre de los empleados que más hijos tienen o que menos hijos tienen.
SELECT nombre
FROM empleado
WHERE hijos = (SELECT MAX(hijos) FROM empleado)
OR hijos = (SELECT MIN(hijos) FROM empleado);

-- 15. Nombre de los empleados que no tienen justificante de nóminas.
SELECT nombre
FROM empleado
WHERE codigo NOT IN (SELECT cod_emp FROM just_nomina);

-- 16. Nombre de los empleados, nombre de los departamentos en los que han trabajado y función (en mayúsculas) que ha realizado en cada departamento.

SELECT e.nombre AS nombre_empleado, d.nombre AS nombre_departamento, UPPER(t.funcion) AS funcion
FROM empleado e
JOIN trabajan t ON e.codigo = t.cod_emp
JOIN departamento d ON t.cod_dep = d.codigo;

-- 17. Nombre, fecha de nacimiento y nombre del día de la semana de su fecha de nacimiento de todos los empleados.

SELECT nombre, fnacimiento, DAYNAME(fnacimiento) AS dia_semana
FROM empleado;

-- 18. Nombre y edad de los empleados.
SELECT nombre, YEAR(CURRENT_DATE()) - YEAR(fnacimiento) AS edad
FROM empleado;

-- 19. Nombre, edad y número de hijos de los empleados que tienen menos de 50 años  y tienen hijos.

SELECT nombre, YEAR(CURRENT_DATE()) - YEAR(fnacimiento) AS edad, hijos
FROM empleado
WHERE YEAR(CURRENT_DATE()) - YEAR(fnacimiento) < 50 AND hijos > 0;

-- 20. Nombre e ingresos percibidos por el empleado más joven y el más longevo.
SELECT nombre, ingreso
FROM just_nomina
JOIN empleado ON just_nomina.cod_emp = empleado.codigo
WHERE fnacimiento = (SELECT MIN(fnacimiento) FROM empleado)
OR fnacimiento = (SELECT MAX(fnacimiento) FROM empleado);

