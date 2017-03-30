CREATE OR REPLACE FUNCTION EnRuptureDeStock (id_de_produit IN VARCHAR, quantit� IN INT) RETURN BOOLEAN
AS
  qte NUMBER;
BEGIN
  --test produit simple
  SELECT qteStock INTO qte FROM ProduitSimple WHERE idProduit= id_de_produit;
  If (qteStock != null) THEN
    Return qte > quantit�;
  END IF;
  --test produit compose
  SELECT COUNT(*) INTO qte 
  FROM CompositionIngredient NATURAL JOIN Ingredient 
  WHERE idProduit=id_de_produit AND qteIngredient >= qteStock;
END;