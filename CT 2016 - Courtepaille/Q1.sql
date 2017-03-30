CREATE OR REPLACE function MtCommandeCouvert (idTab NUMBER, numCouv NUMBER) return NUMBER is

montantProduits NUMBER;
montantMenus	NUMBER;

Begin

Select 	NVL(SUM (quantiteProduit * prixUnitaireProduitEnVente),0)
Into 	montantProduits
From 	CouvertClient NATURAL JOIN CommandeProduitALaCarte NATURAL JOIN ProduitEnVente
Where 	idTablee = idTab AND numCouvert = numCouv;

Select 	NVL(SUM (prixUnitaireMenu),0)
Into 	montantMenus
From 	CouvertClient NATURAL JOIN CommandeMenu NATURAL JOIN Menu
Where	idTablee = idTab AND numCouvert = numCouv;

if ( montantMenus + montantProduits = 0 ) then

	return -1;

else

	return montantMenus + montantProduits;

end if;

End MtCommandeCouvert;
/

