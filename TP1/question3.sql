  ALTER TABLE SERV DROP (NBPERS,NBFORM);
  ALTER TABLE SERV ADD NBPERS NUMBER;
  ALTER TABLE SERV ADD NBFORM NUMBER;
 
  UPDATE 
    SERV 
  SET
    nbpers = NbEmploye(numServ),
    nbform = NbFormateur(numServ);

