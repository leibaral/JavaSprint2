SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio/0.93 FROM producto;
SELECT nombre AS nom_de_producto, precio AS euros, precio/0.93 AS dòlars FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT lower(nombre), precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre,2)) FROM fabricante;
SELECT nombre, ROUND(precio,0) FROM producto;
SELECT nombre, FLOOR(precio) FROM producto;
SELECT f.codigo FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante; 
SELECT DISTINCT f.codigo FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante; 
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
SELECT p. codigo, p.nombre, f.codigo AS código_fabricante, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ORDER BY precio ASC LIMIT 1;
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ORDER BY precio DESC LIMIT 1;
SELECT p.nombre AS productos_Lenovo FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";
SELECT p.nombre AS productos_Crucial_más_caros, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Crucial" AND precio>200;
SELECT p.nombre, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus" OR f.nombre = "Hewlett-Packard" OR f.nombre = "Seagate";
SELECT p.nombre, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ("Asus", "Hewlett-Packard", "Seagate");
SELECT p.nombre, precio, f.nombre AS fabricante_acaba_en_e FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE RIGHT(f.nombre, 1)='e';
SELECT p.nombre, precio, f.nombre AS fabricante_contiene_w FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "%w%";
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE precio >= 180 ORDER BY precio DESC, p.nombre ASC;
SELECT DISTINCT f.codigo, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo;
SELECT f.codigo, f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo;
SELECT f.codigo, f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo WHERE p.nombre IS NULL;
SELECT p.nombre AS productos_Lenovo FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";
SELECT * FROM producto p WHERE precio = (SELECT MAX(precio) FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo");
SELECT p.nombre AS lo_más_caro_de_Lenovo FROM producto p WHERE precio = (SELECT MAX(precio) FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo");
SELECT p.nombre AS lo_más_barato_de_HP FROM producto p WHERE precio = (SELECT MIN(precio) FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Hewlett-Packard");
SELECT * FROM producto p WHERE precio >= (SELECT MAX(precio) FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo");
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus" AND precio > (SELECT AVG(precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus");