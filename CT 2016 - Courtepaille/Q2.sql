CREATE OR REPLACE function AdditionTablee (idTab NUMBER) return NUMBER is

montantTotal NUMBER;

Begin

Select 	SUM (MtCommandeCouvert(numCouvert, idTab))
Into 	montantTotal
From 	CouvertClient
Where 	idTablee = idTab;

if	(montantTotal <= 0) then
	return 0;
else 
	return montantTotal;
end if;

End AdditionTablee;
/










