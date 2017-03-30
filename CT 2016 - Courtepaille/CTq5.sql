CREATE OR REPLACE TRIGGER check_ajout_produit_menu
BEFORE INSERT ON ProduitsAuChoixDansMenu FOR EACH ROW
DECLARE
  categorie VARCHAR(8);
  nb NUMBER;
BEGIN
  SELECT idCategorie INTO categorie FROM ProduitEnVente WHERE idProduit = :new.idProduit;
  SELECT COUNT(idCategorie) INTO nb FROM Formule WHERE idCategorie=categorie AND idMenu=:new.idMenu;
  IF (nb = 0) THEN
    raise_application_error(-20000,'ERROR');
  END IF;
END;

