-- Sélectionne les informations sur les batailles, leurs nom, les dates et les lieux, triés par date
SELECT
    bataille.date_bataille AS date_bataille, -- Sélectionne la date de la bataille depuis la table "bataille" en l'aliasant en "date_bataille"
    bataille.nom_bataille, -- Sélectionne le nom de la bataille depuis la table "bataille"
    lieu.nom_lieu -- Sélectionne le nom du lieu depuis la table "lieu"
FROM
    bataille

-- Joindre la table "bataille" et "lieu" sur leur relation d'ID
LEFT JOIN
    lieu ON bataille.id_lieu = lieu.id_lieu 

-- Regroupement des résultats par nom de la bataille, date de la bataille et lieu de la bataille
GROUP BY
    bataille.nom_bataille, bataille.date_bataille, lieu.nom_lieu

-- Trie par date de la bataille dans l'ordre décroissant avec un format spécifique (année-mois-jour)
ORDER BY
    DATE_FORMAT(bataille.date_bataille, '%Y-%m-%d') DESC; 