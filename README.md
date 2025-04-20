# 📚 Consultes SQL - Bases de dades *Tienda* i *Universidad*

Aquest repositori conté una col·lecció completa de consultes SQL aplicades a dues bases de dades:

- **🛒 Tienda**: amb les taules `producto` i `fabricante`.
- **🏫 Universidad**: definida a partir de l’script `schema_universidad.sql`.

---

## 🛒 Base de dades: Tienda

### 📋 Esquema

- `producto(codigo, nombre, precio, codigo_fabricante)`
- `fabricante(codigo, nombre)`

Relació: `producto.codigo_fabricante` → `fabricante.codigo`

### 📌 Consultes

1. Nom de tots els productes.
2. Nom i preu de tots els productes.
3. Totes les columnes de la taula `producto`.
4. Nom, preu en euros i preu en dòlars.
5. Alias: `nom de producto`, `euros`, `dòlars`.
6. Noms en majúscula.
7. Noms en minúscula.
8. Nom de fabricants i les dues primeres lletres en majúscula.
9. Preus arrodonits.
10. Preus truncats (sense decimals).
11. Codis de fabricants amb productes.
12. Codis de fabricants únics amb productes.
13. Fabricants ordenats ascendentment.
14. Fabricants ordenats descendentment.
15. Productes ordenats per nom i preu.
16. Primeres 5 files de `fabricante`.
17. 2 files a partir de la quarta.
18. Producte més barat (amb `ORDER BY` + `LIMIT`).
19. Producte més car (amb `ORDER BY` + `LIMIT`).
20. Productes del fabricant amb codi 2.
21. Producte, preu i fabricant de tots els productes.
22. Mateix que l'anterior però ordenat pel nom del fabricant.
23. Codi i nom de producte i fabricant.
24. Producte més barat amb fabricant.
25. Producte més car amb fabricant.
26. Tots els productes de Lenovo.
27. Productes de Crucial amb preu > 200 €.
28. Productes d'Asus, Hewlett-Packard i Seagate (sense `IN`).
29. Mateix que anterior amb `IN`.
30. Productes de fabricants el nom dels quals acaba en "e".
31. Productes amb fabricants que continguin "w".
32. Productes amb preu ≥ 180 €, ordenats per preu descendent i nom ascendent.
33. Codis i noms de fabricants amb productes associats.
34. Tots els fabricants i els seus productes (inclou els que no en tenen).
35. Fabricants sense productes associats.
36. Productes de Lenovo (sense `INNER JOIN`).
37. Productes amb el mateix preu que el més car de Lenovo (sense `INNER JOIN`).
38. Nom del producte més car de Lenovo.
39. Nom del producte més barat de Hewlett-Packard.
40. Productes amb preu ≥ al més car de Lenovo.
41. Productes d'Asus amb preu > mitjana de productes d'Asus.

---

## 🏫 Base de dades: Universidad

**📂 Fitxer SQL inicial:** `schema_universidad.sql`

### 📌 Consultes generals

1. Nom i cognoms dels alumnes, ordenats.
2. Alumnes sense número de telèfon.
3. Alumnes nascuts el 1999.
4. Professors sense telèfon i NIF acabat en 'K'.
5. Assignatures del primer quadrimestre, tercer curs, grau amb id=7.
6. Professors i nom del seu departament.
7. Assignatures i cursos d’un alumne amb NIF específic.
8. Departaments amb professors que imparteixen al Grau d’Enginyeria Informàtica.
9. Alumnes matriculats en 2018/2019.

### 🔁 LEFT / RIGHT JOIN

10. Tots els professors i els seus departaments (inclosos els sense).
11. Professors sense departament.
12. Departaments sense professors.
13. Professors que no imparteixen assignatures.
14. Assignatures sense professor/a.
15. Departaments sense assignatures impartides.

### 📊 Consultes amb agrupació i resum

16. Nombre total d'alumnes.
17. Alumnes nascuts el 1999.
18. Nombre de professors per departament (només departaments amb professors).
19. Tots els departaments i nombre de professors (encara que no en tinguin).
20. Tots els graus i nombre d’assignatures (encara que no en tinguin).
21. Graus amb més de 40 assignatures.
22. Nom de graus + tipus d'assignatura + crèdits totals per tipus.
23. Nombre d'alumnes matriculats per curs escolar.
24. Nombre d’assignatures per professor (inclou professors sense).
25. Dades de l’alumne més jove.
26. Professors amb departament però sense assignatures.

---

## 🧠 Nivells de certificació

- **🥉 Nivell 1:** 37 consultes correctes (20 de `Universidad`)
- **🥈 Nivell 2:** 37–56 consultes correctes (20 de `Universidad`)
- **🥇 Nivell 3:** Més de 56 consultes correctes (20 de `Universidad`)

---

## 💡 Autor

> Desenvolupat per Luis Portas Montero
