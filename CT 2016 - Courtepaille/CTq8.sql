CREATE OR REPLACE TRIGGER check_rupture_stock
BEFORE INSERT ON CommandeProduitALaCarte FOR EACH ROW
BEGIN
  IF (EnRuptureDeStock(:new.idProduit, :new.quantiteProduit)) THEN
    raise_application_error(-20000,'RUPTURE DE STOCK');
  END IF;
END;