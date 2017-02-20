CREATE OR REPLACE function NbEmploye (numService NUMBER) return NUMBER is

nbEmp NUMBER;

Begin

Select Count (*) 
Into nbEmp
From Drh
Where numServ=numService;

RETURN nbEmp;

End NbEmploye;
/

CREATE OR REPLACE function NbFormateur (numService NUMBER) return NUMBER is

nbForm NUMBER;

Begin

Select Count (*) 
Into nbForm
From Drh 
Where numServ=numService
And emploi='FORMATEUR';

RETURN nbForm;

End NbFormateur;
/