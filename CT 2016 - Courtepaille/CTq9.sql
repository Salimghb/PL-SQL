CREATE TABLE AlerteStock (
    idProduitBase VARCHAR2(8)  NOT NULL,
    libelleProduitBase VARCHAR2(32)  ,
    qteStock VARCHAR2(32)  ,
    seuilStock VARCHAR2(64)  ,
    typeProduitBase VARCHAR2(10),
    dateAlerte DATE(8)
    , CONSTRAINT PK_AlerteStock PRIMARY KEY (idProduitBase)
    , CONSTRAINT CK_TypeProduitBase CHECK (typeProduitBase IN ('Produit simple','Ingredient'))
);