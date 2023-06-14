SELECT DISTINCT apellido1, apellido2, nombre FROM persona p JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno WHERE id_alumno IS NOT NULL ORDER BY apellido1, apellido2, nombre;
SELECT DISTINCT apellido1, apellido2, nombre, telefono AS falta_telf FROM persona p JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno WHERE telefono IS NULL;
SELECT DISTINCT apellido1, apellido2, nombre, fecha_nacimiento AS nacidos_en_1999 FROM persona p JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno WHERE YEAR(fecha_nacimiento) = 1999;
SELECT DISTINCT apellido1, apellido2, nombre, telefono AS falta_telf, nif AS nif_K FROM persona p JOIN profesor pr ON p.id = pr.id_profesor WHERE telefono IS NULL AND RIGHT(nif, 1) = "K";
SELECT a.nombre, a.curso, a.cuatrimestre, g.id AS grado_id FROM asignatura a JOIN grado g ON a.id_grado = g.id AND g.id = 7 WHERE a.cuatrimestre = 1 AND a.curso = 3;
SELECT DISTINCT apellido1, apellido2, p.nombre, d.nombre AS departamento FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id ORDER BY apellido1, apellido2, p.nombre;
SELECT p.nif, a.nombre, c.anyo_inicio, c.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar c ON am.id_curso_escolar = c.id JOIN asignatura a ON a.id = am.id_asignatura WHERE p.nif = "26902806M";
SELECT DISTINCT d.nombre AS nombre_departamento, g.nombre AS grado FROM departamento d JOIN profesor pr ON pr.id_departamento = d.id JOIN asignatura a ON a.id_profesor = pr.id_profesor JOIN grado g ON g.id = a.id_grado WHERE g.nombre LIKE "%Informática%";
SELECT DISTINCT p.nombre AS matriculados_2018_2019 FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar c ON c.id = am.id_curso_escolar JOIN asignatura a ON a.id = am.id_asignatura WHERE c.anyo_fin = 2019 AND c.anyo_inicio = 2018 AND a.id IS NOT NULL;
-- LEFT JOIN y RIGHT JOIN :
SELECT d.nombre, apellido1, apellido2, p.nombre FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id JOIN persona p ON pr.id_profesor = p.id ORDER BY d.nombre, apellido1, apellido2, p.nombre;
SELECT d.nombre, apellido1, apellido2, p.nombre FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id JOIN persona p ON pr.id_profesor = p.id WHERE d.nombre IS NULL;
SELECT d.nombre, pr.id_profesor FROM profesor pr RIGHT JOIN departamento d ON pr.id_departamento = d.id WHERE pr.id_profesor IS NULL;
SELECT pr.id_profesor, a.nombre FROM asignatura a RIGHT JOIN profesor pr ON pr.id_profesor = a.id_profesor WHERE a.nombre IS NULL;
SELECT DISTINCT pr.id_profesor, a.nombre FROM profesor pr RIGHT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE pr.id_profesor IS NULL ORDER BY a.nombre;
SELECT DISTINCT d.nombre AS departamento FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;



-- RESUM :
SELECT COUNT(id_alumno) AS total_alumnos FROM alumno_se_matricula_asignatura;
SELECT COUNT(id_alumno) AS total_alumnos FROM alumno_se_matricula_asignatura am JOIN persona p ON am.id_alumno = p.id WHERE YEAR(fecha_nacimiento) = 1999 ;
SELECT d.nombre AS dept, COUNT(pr.id_profesor) AS profesores_del_dept FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY profesores_del_dept ASC;
SELECT d.nombre AS dept, COUNT(pr.id_profesor) AS profesores_del_dept FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre;
SELECT g.nombre AS grado, COUNT(a.id) AS asignaturas_del_grado FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP by g.nombre ORDER BY asignaturas_del_grado;
SELECT g.nombre AS grado, COUNT(a.id) AS asignaturas_del_grado FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP by g.nombre HAVING asignaturas_del_grado > 40;

