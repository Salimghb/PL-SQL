CREATE OR REPLACE FUNCTION MtCommandeCouvert (IdTable NUMBER, Ncouvert NUMBER) RETURN NUMBER
AS
  prix_menu NUMBER;
  prix_unitaire NUMBER;
BEGIN
  SELECT NVL(SUM(prixUnitaireMenu),0) INTO prix_menu 
  FROM CommandeMenu NATURAL JOIN Menu 
  WHERE idTablee = IdTable AND Ncouvert=numCouvert;
  
  SELECT NVL(SUM(prixUnitaireProduitEnVente*QUANTITEPRODUIT), 0) INTO prix_unitaire
  FROM CommandeProduitALaCarte NATURAL JOIN ProduitEnVente 
  WHERE idTablee = IdTable AND Ncouvert=numCouvert;
  
  IF prix_menu + prix_unitaire=0 then return -1;
  else return prix_menu + prix_unitaire;
  end if;

END;

SELECT MtCommandeCouvert(4,1) FROM DUAL;
SELECT MtCommandeCouvert(4,2) FROM DUAL;
SELECT MtCommandeCouvert(4,3) FROM DUAL;
SELECT MtCommandeCouvert(4,4) FROM DUAL;
SELECT MtCommandeCouvert(5,1) FROM DUAL;
SELECT MtCommandeCouvert(6,1) FROM DUAL;