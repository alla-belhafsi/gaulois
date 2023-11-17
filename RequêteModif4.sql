-- QUESTION D --- Modifiez l'adresse de Zérozérosix : il a été mis en prison à Condate.

-- L'instruction UPDATE modifie les enregistrements dans une table
UPDATE personnage

-- La clause SET dans une instruction UPDATE indique quelles colonnes doivent être mises à jour et avec quelles valeurs.
SET adresse_personnage = 'Prison', id_lieu = 9

-- Ici, elle met à jour la table personnage en changeant 'adresse_personnage' et l'ID du lieu pour Zérozérosix, qui à un ID de personnage égal à 9.
WHERE id_personnage = 23;