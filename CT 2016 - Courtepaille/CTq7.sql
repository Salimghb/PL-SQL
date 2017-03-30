CREATE OR REPLACE TRIGGER check_commande
BEFORE INSERT ON ProduitsChoisisDansMenu FOR EACH ROW
BEGIN
  -- VERIF Un produit choisi dans la commande 
  -- d�un menu doit �tre un des produits au choix au sein du menu.
  SELECT COUNT(*) INTO nb_prod FROM ProduitsAuChoixDansMenu 
  WHERE idMenu = :new.idMenu AND idProduit = :new.idProduit;
  If (nb_prod = 0) THEN raise_application_error(-20000,'Le produit choisi doit �tre pr�sent dans le menu');

  -- VERIF Un seul produit doit �tre choisi par cat�gorie retenue 
  -- dans la fromule du menu

 
  -- VERIF Un produit choisi dans la commande d�un menu
  -- ne doit pas �tre en rupture de stock.

END;
