ALTER TABLE Tablee ADD (mtAddition DEC(5,2));

UPDATE Tablee
  SET mtAddition = AdditionTablee(idTablee);
  
SELECT * FROM Tablee;