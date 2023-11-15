-- nom des lieux qui finissent par 'um'.

-- Sélectionne le nom des lieux 
SELECT nom_lieu

-- De la table 'lieu'
FROM lieu

-- Filtre les résultats en spécifiant une condition
WHERE nom_lieu 

-- Recherche les lignes dans la colonne 'nom_lieu' avec "%um", le "%" est un joker qui représente les caractères avant"um"
LIKE '%um';