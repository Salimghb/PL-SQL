CREATE OR REPLACE TRIGGER FormVac
  BEFORE INSERT OR UPDATE 
    ON DRH
      FOR EACH ROW
      
BEGIN

    if (:new.emploi = 'FORMATEUR') AND (:new.vac is NULL or :new.vac = 0) then
    
      Raise_application_error(-20001, 'Un formateur doit avoir à une vacation !');
      
    end if;
    
        
    if (:new.emploi != 'FORMATEUR') AND (:new.vac is not NULL or :new.vac != 0) then 
    
      Raise_application_error(-20001,'Un non formateur n''a pas le droit à une vacation !');
      
    end if;
   
END FormVac;
/


CREATE OR REPLACE TRIGGER MatSal
  BEFORE INSERT OR UPDATE 
    ON DRH
      FOR EACH ROW
      
BEGIN

    if (:new.matchef = :new.mat) then
    
        Raise_application_error(-20004,'Un salarié ne doit pas être son propre chef !');
        
    end if;
  
END MatSal;
/


CREATE OR REPLACE TRIGGER DateEmbModif
  BEFORE UPDATE of dateEmb
    ON DRH
      FOR EACH ROW
      
BEGIN

        Raise_application_error(-20005, 'La date d''embauche d''un salarié est non modifiable !');
  
END DateEmbModif;
/


CREATE OR REPLACE TRIGGER SalaireModif
  BEFORE UPDATE of Sal
    ON DRH
      FOR EACH ROW
      
BEGIN

    if ( (:new.sal+NVL(:new.vac,0)) < (:old.sal+NVL(:old.vac,0)) ) then
    
        Raise_application_error(-20003, 'Le salaire d''un employé ne doit jamais diminuer !');
        
    else 
    
        null;
    
    end if;
    
END SalaireModif;
/











