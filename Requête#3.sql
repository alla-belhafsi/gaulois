-- Nom des personnages + spécialité + adresse et lieu d'habitation, triés par lieu (Requête 1) puis par nom de personnage (Requête 2).

-- Requête 1: triés par nom du lieu 

-- Sélectionne le nom du lieu depuis la table "lieu" et l'aliasant en "nom_lieu", l'adresse du personnage depuis la table "personnage",le nom du personnage depuis la table "personnage" et le nom de la spécialité depuis la table "specialite"
SELECT 
    lieu.nom_lieu AS nom_lieu,
    personnage.adresse_personnage,
    personnage.nom_personnage, 
    specialite.nom_specialite 
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
    lieu.nom_lieu, personnage.adresse_personnage, personnage.nom_personnage, specialite.nom_specialite
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
    personnage.nom_personnage, specialite.nom_specialite, personnage.adresse_personnage, lieu.nom_lieu
-- Trie les résultats par nom du personnage
ORDER BY 
    personnage.nom_personnage; 