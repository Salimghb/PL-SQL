ALTER TABLE Tablee DROP COLUMN mtAddition;
ALTER TABLE Tablee ADD mtAddition NUMBER(5,2);

UPDATE
    Tablee
SET
    mtAddition = AdditionTablee(idTablee);






