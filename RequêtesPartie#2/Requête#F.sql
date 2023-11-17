-- QUESTION F ---  Obélix s'est trompé : ce sont 42 casques Weisenau, et non Ostrogoths, qu'il a pris lors de la bataille 'Attaque de la banque postale'. Corrigez son erreur !

-- Obélix 'id_personnage = 5'
-- La bataille 'Attaque de la banque postale' 'id_bataille = 9'
-- Casques 'Weisenau' 'id_casque = 10'
-- Casques 'Ostrogoth' 'id_casque = 14'

-- L'instruction UPDATE modifie les enregistrements dans une table
UPDATE prendre_casque

-- La clause SET dans une instruction UPDATE indique quelles colonnes doivent être mises à jour et avec quelles valeurs.
SET qte = 42

-- Ici, elle met à jour la table prendre_casque en changeant 'qte'.
WHERE id_bataille = 9 AND id_personnage = 5;
