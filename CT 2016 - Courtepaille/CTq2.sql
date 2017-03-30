CREATE OR REPLACE FUNCTION AdditionTablee (idTable Number) RETURN Number
AS
  prix_menu NUMBER;
  prix_unitaire NUMBER;
BEGIN
  SELECT NVL(SUM(prixUnitaireMenu),0) INTO prix_menu 
  FROM CommandeMenu NATURAL JOIN Menu 
  WHERE idTablee = IdTable;
  
  SELECT NVL(SUM(prixUnitaireProduitEnVente*QUANTITEPRODUIT), 0) INTO prix_unitaire
  FROM CommandeProduitALaCarte NATURAL JOIN ProduitEnVente 
  WHERE idTablee = IdTable;
  
  IF prix_menu + prix_unitaire=0 then return 0;
  else return prix_menu + prix_unitaire;
  end if;
END;

SELECT AdditionTablee(1) FROM DUAL;
SELECT AdditionTablee(2) FROM DUAL;
SELECT AdditionTablee(3) FROM DUAL;
SELECT AdditionTablee(4) FROM DUAL;
SELECT AdditionTablee(5) FROM DUAL;
SELECT AdditionTablee(6) FROM DUAL;