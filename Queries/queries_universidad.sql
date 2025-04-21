USE universidad;

-- 1
SELECT apellido1, apellido2, nombre FROM persona
WHERE tipo = "alumno"
ORDER BY apellido1, apellido2, nombre;
-- 2
SELECT nombre, apellido1, apellido2 FROM persona
WHERE tipo = "alumno" AND telefono IS NULL;
-- 3
SELECT * FROM persona
WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = 1999;
-- 4
SELECT * FROM persona
WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE '%K';
-- 5
SELECT * FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- 6
SELECT
	p.apellido1 AS primer_apellido,
    p.apellido2 AS segundo_apellido,
	p.nombre AS nombre_profe,
    d.nombre AS nombre_departamento
FROM profesor pr
JOIN persona p ON pr.id_profesor = p.id
JOIN departamento d ON pr.id_departamento = d.id
ORDER BY p.apellido1, p.apellido2, p.nombre;
-- 7
SELECT
	a.nombre AS nombre_asignatura,
    c.anyo_inicio AS inicio,
    c.anyo_fin AS fin
FROM alumno_se_matricula_asignatura am
JOIN asignatura a ON am.id_asignatura = a.id
JOIN curso_escolar c ON am.id_curso_escolar = c.id
JOIN persona p ON am.id_asignatura = p.id
WHERE p.nif = "26902806M";
-- 8
SELECT DISTINCT
	d.nombre AS nombre_departamento
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
JOIN asignatura a ON p.id_departamento = a.id_profesor
JOIN grado g ON a.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- 9
SELECT DISTINCT p.nombre, p.* FROM persona p
JOIN alumno_se_matricula_asignatura am ON am.id_alumno = p.id
JOIN curso_escolar c ON am.id_curso_escolar = c.id
WHERE p.tipo = "alumno" AND c.anyo_inicio = 2018;
-- 9 -- otra opción
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2, p.nif
FROM alumno_se_matricula_asignatura am
JOIN curso_escolar ce ON am.id_curso_escolar = ce.id
JOIN persona p ON am.id_alumno = p.id
WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

-- Clausulas LEFT JOIN y RIGHT JOIN
-- 1 left
SELECT 
	d.nombre AS nombre_departamento,
    p.apellido1 AS primer_apellido,
    p.apellido2 AS segundo_apellido,
    p.nombre AS nombre_profesor
FROM profesor pr LEFT JOIN departamento d
ON pr.id_departamento = d.id
JOIN persona p ON p.id = pr.id_profesor
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
-- 1 right
SELECT 
	d.nombre AS nombre_departamento,
    p.apellido1 AS primer_apellido,
    p.apellido2 AS segundo_apellido,
    p.nombre AS nombre_profesor
FROM departamento d RIGHT JOIN profesor pr
ON pr.id_departamento = d.id
JOIN persona p ON p.id = pr.id_profesor
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
-- 2
SELECT p.nombre AS nombre_profe
FROM profesor pr LEFT JOIN departamento d -- ¿hace falta hacer left Y right?
ON pr.id_departamento = d.id
JOIN persona p ON p.id = pr.id_profesor
WHERE d.nombre IS NULL;
-- 3
SELECT d.nombre AS departamento
FROM departamento d LEFT JOIN profesor pr
ON d.id = pr.id_departamento
JOIN persona p ON pr.id_profesor = p.id
WHERE p.nombre IS NULL;
-- 4
SELECT p.nombre AS profe
FROM profesor pr LEFT JOIN asignatura a
ON pr.id_profesor = a.id_profesor
JOIN persona p ON pr.id_profesor = p.id
WHERE a.id_profesor IS NULL;
-- 5
SELECT a.nombre AS asignatura
FROM asignatura a LEFT JOIN profesor pr
ON a.id_profesor = pr.id_profesor
WHERE pr.id_profesor IS NULL;
-- 6
SELECT d.nombre AS departamento
FROM departamento d LEFT JOIN profesor pr
ON pr.id_departamento = d.id
LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor
LEFT JOIN alumno_se_matricula_asignatura am ON a.id = am.id_asignatura
LEFT JOIN curso_escolar c ON c.id = am.id_curso_escolar
GROUP BY d.nombre
HAVING COUNT(am.id_asignatura) = 0;

-- Consultas resumen
-- 1
SELECT COUNT(*) AS total_alumnos FROM persona
WHERE tipo = "alumno";
-- 2
SELECT COUNT(*) AS alumnos_nacidos_1999 FROM persona
WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = 1999;
-- 3
SELECT 
	d.nombre AS departamento,
    COUNT(d.nombre) AS numero_profesores
FROM departamento d JOIN profesor pr
ON d.id = pr.id_departamento
GROUP BY d.nombre
ORDER BY numero_profesores DESC;
-- 4
SELECT 
	d.nombre AS departamento,
    COUNT(pr.id_profesor) AS numero_profesores
FROM departamento d LEFT JOIN profesor pr
ON d.id = pr.id_departamento
GROUP BY d.nombre
ORDER BY numero_profesores DESC;
-- 5
SELECT
	g.nombre AS grado,
    COUNT(a.nombre) AS numero_asignaturas
FROM grado g LEFT JOIN asignatura a
ON g.id = a.id_grado
GROUP BY g.nombre
ORDER BY numero_asignaturas DESC;
-- 6
SELECT
	g.nombre AS grado,
    COUNT(a.nombre) AS numero_asignaturas
FROM grado g LEFT JOIN asignatura a
ON g.id = a.id_grado
GROUP BY g.nombre
HAVING numero_asignaturas > 40
ORDER BY numero_asignaturas DESC;
-- 7
SELECT
	g.nombre AS grado,
    a.tipo AS tipo_asignatura,
    SUM(a.creditos) AS total_creditos
FROM grado g JOIN asignatura a
ON g.id = a.id_grado
GROUP BY g.nombre, tipo_asignatura;
-- 8
SELECT
	c.anyo_inicio AS curso_escolar,
	SUM(am.id_alumno) AS alumnos_matriculados
FROM curso_escolar c JOIN alumno_se_matricula_asignatura am
ON c.id = am.id_curso_escolar
GROUP BY curso_escolar;
-- 9
SELECT
	p.id AS id_profesor,
    p.nombre AS nombre_profesor,
    p.apellido1 AS primer_apellido,
    p.apellido2 AS segundo_apellido,
    SUM(a.id_profesor) AS numero_asignaturas
FROM persona p JOIN profesor pr
ON p.id = pr.id_profesor
LEFT JOIN asignatura a
ON a.id_profesor = pr.id_profesor
GROUP BY p.id
ORDER BY numero_asignaturas DESC;
-- 10
SELECT * FROM persona
WHERE fecha_nacimiento = (
	SELECT MAX(fecha_nacimiento)
    FROM persona
    WHERE tipo = "alumno" -- aunque no creo que la persona más joven sea un profesor...
	);
-- 11
SELECT
	p.nombre AS nombre_profe,
    d.nombre AS departamento
FROM profesor pr JOIN departamento d
ON pr.id_departamento = d.id
JOIN persona p ON p.id = pr.id_profesor
LEFT JOIN asignatura a ON a.id_profesor = p.id
GROUP BY p.nombre, d.nombre
HAVING count(a.id_profesor) = 0;