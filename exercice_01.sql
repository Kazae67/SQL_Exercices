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
