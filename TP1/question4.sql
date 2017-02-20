CREATE OR REPLACE TRIGGER MajNbEmployes

After DELETE or INSERT or UPDATE of emploi on DRH

FOR EACH ROW

BEGIN

  If INSERTING Then
  
    Update Serv set nbpers=nbpers+1 where numServ = :new.numServ;
    
    if :new.emploi = 'FORMATEUR' then 
      
      Update Serv set nbform=nbform+1 where numServ = :new.numServ;
      
    end if;
    
  end if;
  
  
  If DELETING then
  
    Update Serv set nbpers=nbpers-1 where numServ = :old.numServ;
    
    if :old.emploi ='FORMATEUR' then
      
      Update Serv set nbform = nbform-1 where numServ = :old.numServ;
      
    end if;
      
  end if;
      
      
  If UPDATING then
  
    If :old.emploi = 'FORMATEUR' then
      
      Update Serv set nbform = nbform-1 where numServ = :old.numServ;
      
    end if;
    
    If :new.emploi = 'FORMATEUR' then
    
      Update Serv set nbform = nbform+1 where numServ = :new.numServ;
      
    end if;
    
  end if;
  
--  EXCEPTION
--  when others then DBMS_OUTPUT.PUT_LINE('Fausse alerte');
end MajNbEmployes;
/
  