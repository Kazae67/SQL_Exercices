/* Exercices 1 : villes de France */

/* 1. Obtenir la liste des 10 villes les plus peuplées en 2012 */
SELECT * 
FROM villes_france_free
ORDER BY ville_population_2012 DESC 
LIMIT 10

/* 2. Obtenir la liste des 50 villes ayant la plus faible superficie */ 
SELECT * 
FROM villes_france_free
ORDER BY ville_surface ASC 
LIMIT 50

/* 3. Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97” */
SELECT * 
FROM departement
WHERE departement_code
LIKE '97%'

/* 4. Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé */ 
/* fonctionne également avec l'id (LEFT JOIN departement ON departement_id = ville_departement) */
SELECT * 
FROM villes_france_free
LEFT JOIN departement ON departement_code = ville_departement
ORDER BY ville_population_2012 DESC 
LIMIT 10

/* 5. Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes */
SELECT departement_nom, ville_departement, COUNT(departement_nom) AS communes
FROM villes_france_free
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement
ORDER BY communes DESC

/* 6. Obtenir la liste des 10 plus grands départements, en terme de superficie */
SELECT departement_nom AS nom, ville_departement AS département, SUM(ville_surface) AS surface
FROM villes_france_free
LEFT JOIN departement ON departement_id = ville_departement
GROUP BY ville_departement  
ORDER BY surface  DESC
LIMIT 10

/* 7. Compter le nombre de villes dont le nom commence par “Saint” */
SELECT COUNT(ville_nom) AS nombre
FROM villes_france_free 
WHERE ville_nom LIKE 'saint%'

/* 8. Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes */
SELECT ville_nom AS communes, COUNT(ville_nom) AS nombre_de_fois
FROM villes_france_free 
GROUP BY ville_nom
ORDER BY nombre_de_fois DESC

/* 9. Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur à la superficie moyenne*/
SELECT ville_nom AS nom, ville_surface AS surface
FROM villes_france_free 
WHERE ville_surface > (SELECT AVG(ville_surface) 
FROM villes_france_free)

/* 10. Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants */
SELECT ville_departement AS nombre_de_ville, SUM(ville_population_2012) AS nombre_population_2012
FROM villes_france_free
GROUP BY ville_departement
HAVING nombre_population_2012 >= 2000000
ORDER BY nombre_population_2012 DESC

/* 11. Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” (dans la colonne qui contient les noms en majuscule) */
UPDATE villes_france_free
SET ville_nom = REPLACE(ville_nom, '-', ' ') 
WHERE ville_nom LIKE 'SAINT-%'
