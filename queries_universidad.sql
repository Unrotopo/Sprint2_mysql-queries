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
-- 1
SELECT 
	d.nombre AS nombre_departamento,
    p.apellido1 AS primer_apellido,
    p.apellido2 AS segundo_apellido,
    p.nombre AS nombre_profesor
FROM profesor pr LEFT JOIN departamento d
ON pr.id_departamento = d.id
JOIN persona p ON p.id = pr.id_profesor
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
-- 2
