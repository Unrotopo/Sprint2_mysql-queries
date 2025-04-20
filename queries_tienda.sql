USE tienda;
-- 1
SELECT nombre FROM producto;
-- 2
SELECT nombre, precio FROM producto;
-- 3
SELECT * FROM producto;
-- 4
SELECT nombre, precio, precio*1.14 AS precioUSD FROM producto;
-- 5
SELECT nombre AS nom_de_producte, precio AS euros, precio*1.14 AS dólars FROM producto;
-- 6
SELECT UPPER(nombre), precio FROM producto;
-- 7
SELECT LOWER(nombre), precio FROM producto;
-- 8
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;
-- 9
SELECT nombre, ROUND(precio) FROM producto;
-- 10
SELECT nombre, FLOOR(precio) FROM producto;
-- 11
SELECT codigo_fabricante FROM producto;
-- 12
SELECT DISTINCT codigo_fabricante FROM producto;
-- 13
SELECT nombre FROM fabricante ORDER BY nombre;
-- 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15
SELECT nombre, precio from producto ORDER BY nombre, precio DESC;
-- 16
SELECT * FROM fabricante LIMIT 5;
-- 17
SELECT * FROM fabricante LIMIT 3, 2;
-- 18
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
-- 19
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 20
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- 21
SELECT
	producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM producto JOIN fabricante 
ON producto.codigo_fabricante = fabricante.codigo;
-- 22
SELECT
	producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM producto JOIN fabricante 
ON producto.codigo_fabricante = fabricante.codigo 
ORDER BY fabricante.nombre;
-- 23
SELECT
	producto.codigo AS codigo_producto,
    producto.nombre AS nombre_producto,
    producto.codigo_fabricante AS codigo_fabricante,
    fabricante.nombre AS nombre_fabricante
FROM producto JOIN fabricante 
ON producto.codigo_fabricante = fabricante.codigo;
-- 24
SELECT
	producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM producto JOIN fabricante 
ON producto.codigo_fabricante = fabricante.codigo 
ORDER BY producto.precio LIMIT 1;
-- 25
SELECT
	producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM producto JOIN fabricante 
ON producto.codigo_fabricante = fabricante.codigo 
ORDER BY producto.precio DESC LIMIT 1;
-- 26
SELECT * FROM producto JOIN fabricante 
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Lenovo";
-- 27
SELECT * FROM producto JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Crucial" AND producto.precio > 200;
-- 28
SELECT * FROM producto JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Asus" OR fabricante.nombre = "Hewlett-Packard" OR fabricante.nombre = "Seagate";
-- 29
SELECT * FROM producto JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre IN ("Asus", "Hewlett-Packard", "Seagate");
-- 30
SELECT
	producto.nombre AS nombre_producto,
    producto.precio AS precio
FROM producto JOIN fabricante
ON producto.codigo_Fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%e';
-- 31
SELECT
	producto.nombre AS nombre_producto,
    producto.precio AS precio
FROM producto JOIN fabricante
ON producto.codigo_Fabricante = fabricante.codigo
WHERE fabricante.nombre	LIKE '%w%';
-- 32
SELECT
	producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM producto JOIN fabricante
ON  producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio  >= 180 
ORDER BY producto.precio DESC, producto.nombre;
-- 33
SELECT DISTINCT
	fabricante.codigo,
    fabricante.nombre
FROM fabricante JOIN producto
ON fabricante.codigo = producto.codigo_fabricante;
-- 34
SELECT
	fabricante.codigo,
    fabricante.nombre AS nombre_fabricante,
    producto.nombre AS nombre_producto
FROM fabricante LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante;
-- 35
SELECT
    fabricante.nombre AS nombre_fabricante
FROM fabricante LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.codigo IS NULL;
-- 36
SELECT
	producto.nombre AS nombre_producto
FROM producto JOIN fabricante
ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = "Lenovo";
-- 37
SELECT * FROM producto 
WHERE precio = (
	SELECT MAX(precio) FROM producto
    WHERE codigo_fabricante = (
		SELECT codigo FROM fabricante
        WHERE nombre = "Lenovo"
	)
);
-- 38
SELECT nombre FROM producto 
WHERE precio = (
	SELECT MAX(precio) FROM producto
    WHERE codigo_fabricante = (
		SELECT codigo FROM fabricante
        WHERE nombre = "Lenovo"
	)
);
-- 39
SELECT nombre FROM producto 
WHERE precio = (
	SELECT MIN(precio) FROM producto
    WHERE codigo_fabricante = (
		SELECT codigo FROM fabricante
        WHERE nombre = "Hewlett-Packard"
	)
);
-- 40
SELECT * FROM producto 
WHERE precio >= (
	SELECT MAX(precio) FROM producto
    WHERE codigo_fabricante = (
		SELECT codigo FROM fabricante
        WHERE nombre = "Lenovo"
	)
);
-- 41
SELECT * FROM producto
WHERE codigo_fabricante = (
	SELECT codigo FROM fabricante
    WHERE nombre = "Asus"
)
AND precio > (
	SELECT AVG(precio) FROM producto
    WHERE codigo_fabricante = (
		SELECT codigo FROM fabricante
		WHERE nombre = "Asus"
	)
);