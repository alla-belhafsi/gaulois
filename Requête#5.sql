-- Sélectionne les informations sur les batailles, leurs nom, les dates et les lieux, triés par date
SELECT
    bataille.date_bataille AS date_bataille, -- Sélectionne la date de la bataille depuis la table "bataille" en l'aliasant en "date_bataille"
    bataille.nom_bataille, -- Sélectionne le nom de la bataille depuis la table "bataille"
    lieu.nom_lieu -- Sélectionne le nom du lieu depuis la table "lieu"
FROM
    bataille
LEFT JOIN
    lieu ON bataille.id_lieu = lieu.id_lieu -- Joindre la table "bataille" et "lieu" sur leur relation d'ID
GROUP BY
    bataille.nom_bataille, bataille.date_bataille, lieu.nom_lieu -- Regroupement des résultats par nom de la bataille, date de la bataille et lieu de la bataille
ORDER BY
    bataille.date_bataille;