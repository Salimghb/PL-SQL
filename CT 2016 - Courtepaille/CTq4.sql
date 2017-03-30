CREATE OR REPLACE TRIGGER mt_addition_menu
AFTER INSERT ON CommandeMenu FOR EACH ROW
DECLARE
  prix_menu NUMBER;
BEGIN
  SELECT prixUnitaireMenu INTO prix_menu FROM Menu WHERE idMenu = :new.idMenu;
  UPDATE Tablee SET mtAddition = mtAddition + prix_menu WHERE idTablee = :new.idTablee;
END;


CREATE OR REPLACE TRIGGER mt_addition_produit
AFTER INSERT ON CommandeProduitALaCarte FOR EACH ROW
DECLARE
  prix_produit NUMBER;
BEGIN
  SELECT prixUnitaireProduitEnVente INTO prix_produit FROM ProduitEnVente WHERE idProduit = :new.idProduit;
  UPDATE Tablee SET mtAddition = mtAddition + prix_produit*:new.quantiteProduit WHERE idTablee = :new.idTablee;
END;

