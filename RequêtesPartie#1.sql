-- QUESTION 1 --- nom des lieux qui finissent par 'um'.

-- Sélectionne le nom des lieux 
SELECT nom_lieu

-- De la table 'lieu'
FROM lieu

-- Filtre les résultats en spécifiant une condition
WHERE nom_lieu 

-- Recherche les lignes dans la colonne 'nom_lieu' avec "%um", le "%" est un joker qui représente les caractères avant"um"
LIKE '%um';


-----------------------------------------------------------------------------


--  QUESTION 2 --- Nombre de personnages par lieu (trié par nombre de personnages décroissant). 

-- Sélectionne les 'nom_lieu' et count des 'id_personnage' par 'lieu'
SELECT lieu.nom_lieu, COUNT(personnage.id_personnage) AS nombre_de_personnage

-- Tables utilisées dans la requête      
FROM lieu

-- Joindre la table des 'lieu' et des 'personnage' sur leur relation d'ID
INNER JOIN personnage ON lieu.id_lieu = personnage.id_lieu

-- Regroupement des résultats pour obtenir le count de 'personnage' pour chaque 'id_lieu'
GROUP BY lieu.nom_lieu

-- Tri par ordre décroissant en fonction du 'nombre_de_personnage' par 'id_lieu'
ORDER BY nombre_de_personnage DESC;  


-----------------------------------------------------------------------------


-- QUESION 3 --- Nom des personnages + spécialité + adresse et lieu d'habitation, triés par lieu (Requête 1) puis par nom de personnage (Requête 2).

-- Requête 1: triés par nom du lieu 

-- Sélectionne le nom du lieu depuis la table "lieu" et l'aliasant en "nom_lieu", l'adresse du personnage depuis la table "personnage",le nom du personnage depuis la table "personnage" et le nom de la spécialité depuis la table "specialite"
SELECT 
    lieu.nom_lieu AS nom_lieu,
    personnage.adresse_personnage,
    personnage.nom_personnage, 
    specialite.nom_specialite 

-- Tables utilisées dans la requête      
FROM 
    personnage

-- Joindre les informations de la table "personnage" avec la table "lieu" en utilisant les identifiants d'emplacement
INNER JOIN 
    lieu ON personnage.id_lieu = lieu.id_lieu

-- Joindre les informations de la table "personnage" avec la table "specialite" en utilisant les identifiants de spécialité
INNER JOIN 
    specialite ON personnage.id_specialite = specialite.id_specialite

-- Regroupement des résultats par nom du lieu, adresse du personnage, nom du personnage et nom de la spécialité 
GROUP BY 
    lieu.id_lieu, personnage.id_personnage, specialite.id_specialite

-- Trie les résultats par nom du lieu
ORDER BY 
    lieu.nom_lieu; 

-- Requête 2: triés par nom du personnage

-- Sélectionne le nom du personnage depuis la table "personnage" en l'aliasant en "nom_personnage", le nom de la spécialité depuis la table "specialite",l'adresse du personnage depuis la table "personnage" et le nom du lieu depuis la table "lieu"
SELECT 
    personnage.nom_personnage AS nom_personnage, 
    specialite.nom_specialite, 
    personnage.adresse_personnage, 
    lieu.nom_lieu 

-- Tables utilisées dans la requête      
FROM 
    personnage

-- Joindre les informations de la table "personnage" avec la table "lieu" en utilisant les identifiants d'emplacement
INNER JOIN 
    lieu ON personnage.id_lieu = lieu.id_lieu

-- Joindre les informations de la table "personnage" avec la table "specialite" en utilisant les identifiants de spécialité
INNER JOIN 
    specialite ON personnage.id_specialite = specialite.id_specialite

-- Regroupement des résultats par nom du personnage, nom de spécialité, adresse du personnage et nom du lieu
GROUP BY 
    personnage.id_personnage, specialite.id_specialite, lieu.id_lieu

-- Trie les résultats par nom du personnage
ORDER BY 
    personnage.nom_personnage; 


-----------------------------------------------------------------------------


-- Question 4 --- Nom des spécialités avec nombre de personnages par spécialité (trié par nombre de personnages décroissant). 

-- Sélectionne les 'nom_specialite' et le count des 'id_specialite' par 'personnage'
SELECT specialite.nom_specialite, COUNT(personnage.id_specialite) AS nombre_de_personnage

-- Tables utilisées dans la requête      
FROM specialite

-- Jointure entre la table 'specialite' et la table 'personnage' sur leur relation d'ID
INNER JOIN personnage ON specialite.id_specialite = personnage.id_specialite

-- Regroupement des résultats pour obtenir le count de 'personnage' pour chaque 'id_specialite'
GROUP BY specialite.id_specialite

-- Tri par ordre décroissant en fonction du 'nombre_de_personnage' par 'id_specialite'
ORDER BY nombre_de_personnage DESC;


-----------------------------------------------------------------------------


-- Question 5 --- Nom, date et lieu des batailles, classées de la plus récente à la plus ancienne (dates affichées au format 'jourSemaine-jour-mois-année').

-- Sélectionne les informations sur les batailles, leurs nom, les dates et les lieux, triés par date
SET lc_time_names = 'fr_FR';
SELECT
    DATE_FORMAT(bataille.date_bataille, '%W %e %M %Y') AS date_bataille, 
    bataille.nom_bataille,
    lieu.nom_lieu

-- Tables utilisées dans la requête      
FROM
    bataille

-- Joindre la table "bataille" et "lieu" sur leur relation d'ID
INNER JOIN
    lieu ON bataille.id_lieu = lieu.id_lieu 

-- Regroupement des résultats par nom de la bataille, date de la bataille et lieu de la bataille
GROUP BY
    bataille.id_bataille, lieu.id_lieu

-- Trie par date de la bataille dans l'ordre décroissant avec un format spécifique (année-mois-jour)
ORDER BY
    bataille.date_bataille DESC; 


-----------------------------------------------------------------------------


-- Question 6 --- Nom des potions + coût de réalisation de la potion (trié par coût décroissant).

-- Sélection des colonnes 'potion.nom_potion', 'composer.qte', 'ingredient.cout_ingredient' 
SELECT potion.nom_potion, 
       SUM(composer.qte * ingredient.cout_ingredient) AS cout_potion
 
-- Tables utilisées dans la requête      
FROM composer

-- Jointure entre la table 'composer' et la table 'ingredient' sur leur relation d'ID d'ingrédient
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient

-- Jointure entre la table 'composer' et la table 'potion' sur leur relation d'ID d'ingrédient
INNER JOIN potion ON composer.id_potion = potion.id_potion

-- Groupement des résultats par l'identifiant de la potion
GROUP BY potion.id_potion

-- Trié le coût par ordre décroissant
ORDER BY cout_potion DESC;


-----------------------------------------------------------------------------


--  Question 7 --- Nom des ingrédients + coût + quantité de chaque ingrédient qui composent la potion 'Santé'

-- Sélection des colonnes 'nom_ingredient', 'cout_ingredient' et 'qte'
SELECT ingredient.nom_ingredient AS nom_ingredient, ingredient.cout_ingredient, composer.qte, (ingredient.cout_ingredient * composer.qte) AS cout_total

-- Tables utilisées dans la requête
FROM composer

-- Jointure entre la table 'composer' et la table 'ingredient' sur leur relation d'ID d'ingrédient
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient

-- Filtre pour obtenir les ingrédients associés à la potion 'Santé' (ID de potion = 3)
WHERE composer.id_potion = 3

-- Trier les résultats par ordre décroissant de 'cout_ingredient'
ORDER BY cout_total DESC;


-----------------------------------------------------------------------------


-- QUESTION 8 --- Nom du ou des personnages qui ont le plus de 'prendre_casques.qte' dans la bataille 'Bataille du village gaulois' dont le 'id_bataille' = 1.

-- Sélectionne le nom de la personne et le total de casques pris dont le 'id_bataille' = 1
SELECT p.nom_personnage AS nom_personnage, 
       SUM(pc.qte) AS total_casques_pris

-- Tables utilisées dans la requête
FROM personnage p

-- Jointure entre les tables prendre_casque et personnage pour récupérer les données nécessaires
INNER JOIN prendre_casque pc ON p.id_personnage = pc.id_personnage

-- Jointure entre les tables bataille et prendre_casque pour récupérer les données nécessaires
INNER JOIN bataille b ON pc.id_bataille = b.id_bataille

-- Filtre pour une bataille spécifique
WHERE b.id_bataille = 1 

-- Groupement des résultats par l'identifiant de la bataille
GROUP BY p.id_personnage

-- Sous-requête pour ne conserver que les personnages ayant le total de casques pris supérieur ou égal 
HAVING SUM(pc.qte) >= ALL (

    -- Sélectionne le nom de la personne et le total de casques pris dont le 'id_bataille' = 1
    SELECT subquery.total_casques_pris

    -- Tables utilisées dans la requête
    FROM(
        -- Calcule le total de casques pris dans id_bataille = 1
        SELECT SUM(pc2.qte) AS total_casques_pris

        -- Table utilisée dans la requête
        FROM prendre_casque pc2

        -- Jointure entre les tables
        INNER JOIN personnage p2 ON pc2.id_personnage = p2.id_personnage
        INNER JOIN bataille b2 ON pc2.id_bataille = b2.id_bataille

        -- Filtre pour la bataille spécifique
        WHERE b2.id_bataille = 1

        -- Groupement des résultats par l'identifiant du personnage
        GROUP BY pc2.id_personnage
    ) AS subquery
);


-----------------------------------------------------------------------------


-- QUESTION 9 --- Nom des personnages et leur quantité de potion bue (en les classant du plus grand buveur au plus petit) 'total_doses_bues'

-- Sélection des colonnes 'nom_personnage' et la somme des doses bues 'total_doses_bues'
SELECT personnage.nom_personnage AS nom_personnage, SUM(boire.dose_boire) AS total_doses_bues

-- Tables utilisées dans la requête
FROM boire

-- Jointure entre la table 'boire' et la table 'personnage' sur leur relation d'ID de personnage
INNER JOIN personnage ON boire.id_personnage = personnage.id_personnage

-- Groupement des résultats par 'personnage.id_personnage' et 'personnage.nom_personnage' pour obtenir les totaux par personnage
GROUP BY personnage.id_personnage

-- Tri des résultats par ordre décroissant de 'total_doses_bues' pour classer du plus grand buveur au plus petit
ORDER BY total_doses_bues DESC;


-----------------------------------------------------------------------------


-- QUESTION 10 --- Nom de la bataille où le nombre de casques pris a été le plus important.

-- Sélectionne le nom de la bataille et le total de casques pris pour chaque bataille
SELECT b.nom_bataille AS nom_bataille, 
       SUM(pc.qte) AS total_casques_pris

-- Tables utilisées dans la requête
FROM bataille b

-- Jointure entre les tables bataille et prendre_casque pour récupérer les données nécessaires
INNER JOIN prendre_casque pc ON b.id_bataille = pc.id_bataille

-- Groupement des résultats par l'identifiant de la bataille
GROUP BY b.id_bataille

-- Sous-requête pour ne conserver que les batailles ayant le total de casques pris supérieur ou égal
HAVING SUM(pc.qte) >= ALL (
    -- Sélectionne le maximum total de casques pris parmi toutes les batailles
    SELECT subquery.total_casques_pris
    FROM (
        -- Calcule le total de casques pris pour chaque bataille
        SELECT SUM(pc2.qte) AS total_casques_pris

        -- Table utilisée dans la requête
        FROM prendre_casque pc2
        -- Groupement par l'identifiant de la bataille
        GROUP BY pc2.id_bataille
        
    ) AS subquery
);


-----------------------------------------------------------------------------


-- Question 11 --- Combien existe-t-il de casques de chaque type et quel est leur coût total ? (classés par nombre décroissant)

-- Sélection du nom du type de casque, du nombre de casques de chaque type et leur coût total
SELECT 
    type_casque.nom_type_casque AS nom_type_casque, 
    COUNT(casque.id_type_casque) AS nb_casques, 
    SUM(casque.cout_casque) AS cout_total

-- Tables utilisées dans la requête
FROM casque

-- Jointure entre la table 'casque' et la table 'type_casque' sur leur relation d'ID de type de casque
INNER JOIN type_casque ON casque.id_type_casque = type_casque.id_type_casque

-- Groupement des résultats par 'type_casque.id_type_casque' et 'type_casque.nom_type_casque' pour obtenir les totaux par type de casque
GROUP BY type_casque.id_type_casque

-- Tri des résultats par ordre décroissant du nombre de casques pour afficher les types de casques les plus fréquents en premier
ORDER BY nb_casques DESC;


-----------------------------------------------------------------------------


-- QUESTION 12 --- Nom des potions contenant l'ingrédient "poisson frais"

-- Sélection de la colonne 'nom_potion'
SELECT potion.nom_potion AS nom_potion

-- Tables utilisées dans la requête
FROM potion

-- Jointure entre la table 'potion' et la table 'composer' sur leur relation d'ID de potion
INNER JOIN composer ON potion.id_potion = composer.id_potion

-- Jointure entre la table 'composer' et la table 'ingredient' sur leur relation d'ID d'ingrédient
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient

-- Filtre pour obtenir les potions contenant l'ingrédient spécifique "poisson frais" (ID d'ingrédient = 24)
WHERE ingredient.id_ingredient = 24;


-----------------------------------------------------------------------------


-- QUESTION 13 --- Nom du / des lieu(x) possédant le plus d'habitants, en dehors du village gaulois. (condate, lutèce)

-- Sélection du nom du/des lieu(x) avec le plus grand nombre d'habitants, en dehors du village gaulois

SELECT lieu.nom_lieu AS nom_lieu, COUNT(personnage.id_personnage) AS total_habitants

-- Tables utilisées dans la requête
FROM personnage
INNER JOIN lieu ON personnage.id_lieu = lieu.id_lieu

-- Filtre pour exclure le village gaulois (ID = 1)
WHERE lieu.id_lieu != 1

-- Groupement des résultats par ID de lieu pour obtenir les totaux par lieu
GROUP BY lieu.id_lieu

-- Sous-requête pour trouver le nombre maximal d'habitants parmi les lieux en dehors du village gaulois
HAVING COUNT(personnage.id_personnage) >= ALL (
    SELECT total_habitants
    FROM (
        SELECT COUNT(personnage.id_personnage) AS total_habitants
        FROM personnage
        INNER JOIN lieu ON personnage.id_lieu = lieu.id_lieu
        WHERE lieu.id_lieu != 1
        GROUP BY lieu.id_lieu
    ) AS subquery
);


-----------------------------------------------------------------------------


-- QUESTION 14 --- Nom des personnages qui n'ont jamais bu aucune potion

-- Sélection du nom des personnages
SELECT personnage.nom_personnage AS personnage_sans_boire

-- Tables utilisées dans la requête
FROM personnage

-- Jointure avec la table 'boire' pour vérifier les personnages ayant bu une potion
LEFT JOIN boire ON personnage.id_personnage = boire.id_personnage

-- Filtre pour sélectionner les personnages n'ayant pas bu de potion
WHERE boire.id_personnage IS NULL OR boire.dose_boire IS NULL

-- Groupement des résultats par ID et nom de personnage
GROUP BY personnage.id_personnage

-- Tri des résultats par ordre alphabétique
ORDER BY personnage_sans_boire ASC;


-----------------------------------------------------------------------------


--  QUESTION 15 --- Nom du / des personnages qui n'ont pas le droit de boire de la potion 'Magique'.

-- Sélectionne les noms des personnages qui ne sont pas autorisés à boire une potion spécifique

-- Sélectionne le nom des personnages et les renomme comme "nom_personnage"
SELECT personnage.nom_personnage AS nom_personnage 

-- Utilise la table "personnage"
FROM personnage 

-- Filtre pour sélectionner les personnages qui n'ont pas le droit de boire de la potion 'Magique' dans une sous-requête
WHERE personnage.id_personnage NOT IN ( 

    -- Sous-requête pour obtenir les ID des personnages qui ont le droit de boire de la potion 'Magique'

    -- Sélectionne l'ID des personnages de la table "autoriser_boire"
    SELECT autoriser_boire.id_personnage 

    -- Utilise la table "autoriser_boire"
    FROM autoriser_boire 
    
    -- Jointure avec la table "potion" sur la relation d'ID de potion
    INNER JOIN potion ON autoriser_boire.id_potion = potion.id_potion 
    
    -- Filtre pour choisir la potion 'Magique'
    WHERE potion.id_potion = 1
)
-- Ordonne les résultats par ordre alphabétique des noms des personnages
ORDER BY personnage.nom_personnage; 
