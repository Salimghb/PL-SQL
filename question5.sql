CREATE OR REPLACE function MasseSalariale (numService NUMBER) return NUMBER is

  masseSal NUMBER;

Begin

  if ( NbEmploye(numService) = 0 ) then
    return 0;
  end if;
  
  SELECT SUM (sal + NVL (vac,0)) into masseSal
    FROM Drh
      WHERE numServ = numService;
  
  return masseSal;

End MasseSalariale;
/

  
CREATE OR REPLACE TRIGGER MajBudget

After DELETE or UPDATE or INSERT of emploi, on DRH

FOR EACH ROW BEGIN      
      
  If UPDATING then
      
      Update Serv set nbform = nbform-1 where numServ = :old.numServ;
    
    If :new.emploi = 'FORMATEUR' then
    
      Update Serv set nbform = nbform+1 where numServ = :new.numServ;
      
    end if;
    
  end if;

end MajNbEmployes;

  
  ALTER TABLE SERV DROP COLUMN BUDGET;
  ALTER TABLE SERV ADD BUDGET NUMBER;

  UPDATE
    SERV
  SET
    budget = MasseSalariale(numServ);
    

