/* Exercices 1 : villes de France */

/* 1. Obtenir la liste des 10 villes les plus peuplées en 2012 */
SELECT * 
FROM `villes_france_free` 
ORDER BY `ville_population_2012` DESC 
LIMIT 10

/* 2. Obtenir la liste des 50 villes ayant la plus faible superficie */ 
SELECT * 
FROM `villes_france_free` 
ORDER BY `ville_surface` ASC 
LIMIT 50

/* 3. Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97” */
SELECT * 
FROM departement
WHERE departement_code
LIKE '97%'

/* 4. Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé*/ 