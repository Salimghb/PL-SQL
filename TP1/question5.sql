ALTER TABLE SERV DROP COLUMN BUDGET;
ALTER TABLE SERV ADD BUDGET NUMBER;

UPDATE
    SERV
SET
    budget = MasseSalariale(numServ);

CREATE OR REPLACE FUNCTION MasseSalariale (numService NUMBER) return NUMBER is

  masseSal NUMBER;

Begin

  if ( NbEmploye(numService) = 0 ) then
    return 0;
  else
    SELECT NVL(SUM (sal + NVL (vac,0)),0)into masseSal FROM Drh WHERE numServ = numService; 
    return masseSal;
  end if;
End MasseSalariale;
/

CREATE OR REPLACE TRIGGER MajBudget

After DELETE or INSERT or UPDATE on DRH

FOR EACH ROW 

BEGIN

  if inserting then
  
    Update Serv set budget=budget+:new.sal+NVL(:new.vac,0) where numServ = :new.numServ;
    
  end if;
  
  
  
  if deleting then
  
    Update Serv set budget=budget-:old.sal-NVL(:old.vac,0) where numServ = :old.numServ;
    
  end if;
  
  
  
  if updating then
  
      if :new.numServ != :old.numServ then
      
         Update Serv set budget=budget-(:old.sal+NVL(:old.vac,0)) where numServ = :old.numServ;
                                                          
         Update Serv set budget=budget+(:new.sal+NVL(:new.vac,0)) where numServ = :new.numServ;
              
           
      else
      
         Update Serv set budget=budget+
                                                        (
                                                          (:new.sal+NVL(:new.vac,0)) - (:old.sal+NVL(:old.vac,0)) 
                                                        )
                                                        where numServ = :new.numServ;
      end if;
  end if;

END MajBudget;
/







