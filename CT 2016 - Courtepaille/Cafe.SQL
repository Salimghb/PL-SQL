-- -----------------------------------------------------------------------------
--             Generation d'une base de donnees pour
--                      Oracle Version 9i
--                        (16/6/2015 17:49:05)
-- -----------------------------------------------------------------------------
--      Nom de la base : Cafe
--      Projet : Gestion Cafe
--      Auteur : Rakotozafy
--      Date de derniere modification : 16/6/2015 17:44:09
-- -----------------------------------------------------------------------------

DROP TABLE Categorie CASCADE CONSTRAINTS;
DROP TABLE Fournisseur CASCADE CONSTRAINTS;
DROP TABLE ProduitSimple CASCADE CONSTRAINTS;
DROP TABLE Ingredient CASCADE CONSTRAINTS;
DROP TABLE DemandeAppro CASCADE CONSTRAINTS;
DROP TABLE ProduitCompose CASCADE CONSTRAINTS;
DROP TABLE Menu CASCADE CONSTRAINTS;
DROP TABLE ProduitEnVente CASCADE CONSTRAINTS;
DROP TABLE Tablee CASCADE CONSTRAINTS;
DROP TABLE CouvertClient CASCADE CONSTRAINTS;
DROP TABLE TableClient CASCADE CONSTRAINTS;
DROP TABLE Serveur CASCADE CONSTRAINTS;
DROP TABLE CommandeProduitALaCarte CASCADE CONSTRAINTS;
DROP TABLE ProduitsAuChoixDansMenu CASCADE CONSTRAINTS;
DROP TABLE Formule CASCADE CONSTRAINTS;
DROP TABLE CompositionIngredient CASCADE CONSTRAINTS;
DROP TABLE ProduitsChoisisDansMenu CASCADE CONSTRAINTS;
DROP TABLE CommandeMenu CASCADE CONSTRAINTS;
DROP TABLE ApproProduitSimple CASCADE CONSTRAINTS;
DROP TABLE ApproIngredient CASCADE CONSTRAINTS;
-- -----------------------------------------------------------------------------
--       TABLE : Categorie
-- -----------------------------------------------------------------------------
CREATE TABLE Categorie (
    idCategorie VARCHAR2(8)  NOT NULL,
    libelleCategorie VARCHAR2(64)  
    , CONSTRAINT PK_Categorie PRIMARY KEY (idCategorie)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : Fournisseur
-- -----------------------------------------------------------------------------
CREATE TABLE Fournisseur (
    idFournisseur VARCHAR2(8)  NOT NULL,
    nomFournisseur VARCHAR2(32)  ,
    adresseFournisseur VARCHAR2(32)  ,
    eMailFournisseur VARCHAR2(64)  ,
    numTelFournisseur VARCHAR2(10)  
    , CONSTRAINT PK_Fournisseur PRIMARY KEY (idFournisseur)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : ProduitSimple
-- -----------------------------------------------------------------------------
CREATE TABLE ProduitSimple (
    idProduit VARCHAR2(16)  NOT NULL,
    qteStock NUMBER(4)  ,
    seuilStock NUMBER(4)  
    , CONSTRAINT PK_ProduitSimple PRIMARY KEY (idProduit)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : Ingredient
-- -----------------------------------------------------------------------------
CREATE TABLE Ingredient (
    idIngredient VARCHAR2(8)  NOT NULL,
    libelleIngredient VARCHAR2(64)  ,
    qteStock NUMBER(4)  ,
    seuilStock NUMBER(4)  
    , CONSTRAINT PK_Ingredient PRIMARY KEY (idIngredient)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : DemandeAppro
-- -----------------------------------------------------------------------------
CREATE TABLE DemandeAppro (
    idDemandeAppro VARCHAR2(8)  NOT NULL,
    idFournisseur VARCHAR2(8)  NOT NULL,
    dateDemandeAppro DATE  ,
    etatDemandeAppro VARCHAR2(32)  
    , CONSTRAINT PK_DemandeAppro PRIMARY KEY (idDemandeAppro)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : ProduitCompose
-- -----------------------------------------------------------------------------
CREATE TABLE ProduitCompose (
    idProduit VARCHAR2(16)  NOT NULL
    , CONSTRAINT PK_ProduitCompose PRIMARY KEY (idProduit)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : Menu
-- -----------------------------------------------------------------------------
CREATE TABLE Menu (
    idMenu VARCHAR2(8)  NOT NULL,
    libelleMenu VARCHAR2(64)  ,
    prixUnitaireMenu NUMBER(6,2)  
    , CONSTRAINT PK_Menu PRIMARY KEY (idMenu)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : ProduitEnVente
-- -----------------------------------------------------------------------------
CREATE TABLE ProduitEnVente (
    idProduit VARCHAR2(16)  NOT NULL,
    libelleProduit VARCHAR2(64)  ,
    prixUnitaireProduitEnVente NUMBER(6,2)  ,
    idCategorie VARCHAR2(8)  NOT NULL
    , CONSTRAINT PK_ProduitEnVente PRIMARY KEY (idProduit)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : Tablee
-- -----------------------------------------------------------------------------
CREATE TABLE Tablee (
    idTablee NUMBER(4)  NOT NULL,
    dateArrivee DATE  ,
    numTableClient NUMBER(2)  NOT NULL,
    idServeur VARCHAR2(8)  NOT NULL
    , CONSTRAINT PK_Tablee PRIMARY KEY (idTablee)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : CouvertClient
-- -----------------------------------------------------------------------------
CREATE TABLE CouvertClient (
    idTablee NUMBER(4)  NOT NULL,
    numCouvert NUMBER(2)  NOT NULL
    , CONSTRAINT PK_CouvertClient PRIMARY KEY (idTablee, numCouvert)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : TableClient
-- -----------------------------------------------------------------------------
CREATE TABLE TableClient (
    numTableClient NUMBER(2)  NOT NULL,
    capacite NUMBER(2)  
    , CONSTRAINT PK_TableClient PRIMARY KEY (numTableClient)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : Serveur
-- -----------------------------------------------------------------------------
CREATE TABLE Serveur (
    idServeur VARCHAR2(8)  NOT NULL
    , CONSTRAINT PK_Serveur PRIMARY KEY (idServeur)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : CommandeProduitALaCarte
-- -----------------------------------------------------------------------------
CREATE TABLE CommandeProduitALaCarte (
    idTablee NUMBER(4)  NOT NULL,
    numCouvert NUMBER(2)  NOT NULL,
    idProduit VARCHAR2(16)  NOT NULL,
    quantiteProduit NUMBER(4)  
    , CONSTRAINT PK_CommandeProduitALaCarte PRIMARY KEY (idTablee, numCouvert, idProduit)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : ProduitsAuChoixDansMenu
-- -----------------------------------------------------------------------------
CREATE TABLE ProduitsAuChoixDansMenu (
    idMenu VARCHAR2(8)  NOT NULL,
    idProduit VARCHAR2(16)  NOT NULL
    , CONSTRAINT PK_ProduitsAuChoixDansMenu PRIMARY KEY (idMenu, idProduit)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : Formule
-- -----------------------------------------------------------------------------
CREATE TABLE Formule (
    idMenu VARCHAR2(8)  NOT NULL,
    idCategorie VARCHAR2(8)  NOT NULL
    , CONSTRAINT PK_Formule PRIMARY KEY (idCategorie, idMenu)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : CompositionIngredient
-- -----------------------------------------------------------------------------
CREATE TABLE CompositionIngredient (
    idProduit VARCHAR2(16)  NOT NULL,
    idIngredient VARCHAR2(8)  NOT NULL,
    qteIngredient NUMBER(4)  
    , CONSTRAINT PK_CompositionIngredient PRIMARY KEY (idProduit, idIngredient)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : ProduitsChoisisDansMenu
-- -----------------------------------------------------------------------------
CREATE TABLE ProduitsChoisisDansMenu (
    idTablee NUMBER(4)  NOT NULL,
    numCouvert NUMBER(2)  NOT NULL,
    idMenu VARCHAR2(8)  NOT NULL,
    idProduit VARCHAR2(16)  NOT NULL
    , CONSTRAINT PK_ProduitsChoisisDansMenu PRIMARY KEY (idProduit, idMenu, idTablee, numCouvert)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : CommandeMenu
-- -----------------------------------------------------------------------------
CREATE TABLE CommandeMenu (
    idTablee NUMBER(4)  NOT NULL,
    numCouvert NUMBER(2)  NOT NULL,
    idMenu VARCHAR2(8)  
    , CONSTRAINT PK_CommandeMenu PRIMARY KEY (idTablee, numCouvert)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : ApproProduitSimple
-- -----------------------------------------------------------------------------
CREATE TABLE ApproProduitSimple (
    idDemandeAppro VARCHAR2(8)  NOT NULL,
    idProduit VARCHAR2(16)  NOT NULL,
    qteCommandee NUMBER(4)  ,
    prixAchatUnitaire NUMBER(6,2)  
    , CONSTRAINT PK_ApproProduitSimple PRIMARY KEY (idDemandeAppro, idProduit)  
) ;

-- -----------------------------------------------------------------------------
--       TABLE : ApproIngredient
-- -----------------------------------------------------------------------------
CREATE TABLE ApproIngredient (
    idDemandeAppro VARCHAR2(8)  NOT NULL,
    idIngredient VARCHAR2(8)  NOT NULL,
    qteCommandee NUMBER(4)  ,
    prixAchatUnitaire NUMBER(6,2)  
    , CONSTRAINT PK_ApproIngredient PRIMARY KEY (idDemandeAppro, idIngredient)  
) ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE ProduitSimple ADD (
     CONSTRAINT FK_ProduitSimple_ProduitEnVent
          FOREIGN KEY (idProduit)
               REFERENCES ProduitEnVente (idProduit))   ;

ALTER TABLE DemandeAppro ADD (
     CONSTRAINT FK_DemandeAppro_Fournisseur
          FOREIGN KEY (idFournisseur)
               REFERENCES Fournisseur (idFournisseur))   ;

ALTER TABLE ProduitCompose ADD (
     CONSTRAINT FK_ProduitCompose_ProduitEnVen
          FOREIGN KEY (idProduit)
               REFERENCES ProduitEnVente (idProduit))   ;

ALTER TABLE ProduitEnVente ADD (
     CONSTRAINT FK_ProduitEnVente_Categorie
          FOREIGN KEY (idCategorie)
               REFERENCES Categorie (idCategorie))   ;

ALTER TABLE Tablee ADD (
     CONSTRAINT FK_Tablee_Serveur
          FOREIGN KEY (idServeur)
               REFERENCES Serveur (idServeur))   ;

ALTER TABLE Tablee ADD (
     CONSTRAINT FK_Tablee_TableClient
          FOREIGN KEY (numTableClient)
               REFERENCES TableClient (numTableClient))   ;

ALTER TABLE CouvertClient ADD (
     CONSTRAINT FK_CouvertClient_Tablee
          FOREIGN KEY (idTablee)
               REFERENCES Tablee (idTablee))   ;

ALTER TABLE CommandeProduitALaCarte ADD (
     CONSTRAINT FK_CommandeProduitALaCarte_Cou
          FOREIGN KEY (idTablee, numCouvert)
               REFERENCES CouvertClient (idTablee, numCouvert))   ;

ALTER TABLE CommandeProduitALaCarte ADD (
     CONSTRAINT FK_CommandeProduitALaCarte_Pro
          FOREIGN KEY (idProduit)
               REFERENCES ProduitEnVente (idProduit))   ;

ALTER TABLE ProduitsAuChoixDansMenu ADD (
     CONSTRAINT FK_ProduitsAuChoixDansMenu_Men
          FOREIGN KEY (idMenu)
               REFERENCES Menu (idMenu))   ;

ALTER TABLE ProduitsAuChoixDansMenu ADD (
     CONSTRAINT FK_ProduitsAuChoixDansMenu_Pro
          FOREIGN KEY (idProduit)
               REFERENCES ProduitEnVente (idProduit))   ;

ALTER TABLE Formule ADD (
     CONSTRAINT FK_Formule_Categorie
          FOREIGN KEY (idCategorie)
               REFERENCES Categorie (idCategorie))   ;

ALTER TABLE Formule ADD (
     CONSTRAINT FK_Formule_Menu
          FOREIGN KEY (idMenu)
               REFERENCES Menu (idMenu))   ;

ALTER TABLE CompositionIngredient ADD (
     CONSTRAINT FK_CompositionIngredient_Produ
          FOREIGN KEY (idProduit)
               REFERENCES ProduitCompose (idProduit))   ;

ALTER TABLE CompositionIngredient ADD (
     CONSTRAINT FK_CompositionIngredient_Ingre
          FOREIGN KEY (idIngredient)
               REFERENCES Ingredient (idIngredient))   ;

ALTER TABLE ProduitsChoisisDansMenu ADD (
     CONSTRAINT FK_ProduitsChoisisDansMenu_Pro
          FOREIGN KEY (idProduit)
               REFERENCES ProduitEnVente (idProduit))   ;

ALTER TABLE ProduitsChoisisDansMenu ADD (
     CONSTRAINT FK_ProduitsChoisisDansMenu_Men
          FOREIGN KEY (idMenu)
               REFERENCES Menu (idMenu))   ;

ALTER TABLE ProduitsChoisisDansMenu ADD (
     CONSTRAINT FK_ProduitsChoisisDansMenu_Cou
          FOREIGN KEY (idTablee, numCouvert)
               REFERENCES CouvertClient (idTablee, numCouvert))   ;

ALTER TABLE CommandeMenu ADD (
     CONSTRAINT FK_CommandeMenu_CouvertClient
          FOREIGN KEY (idTablee, numCouvert)
               REFERENCES CouvertClient (idTablee, numCouvert))   ;

ALTER TABLE CommandeMenu ADD (
     CONSTRAINT FK_CommandeMenu_Menu
          FOREIGN KEY (idMenu)
               REFERENCES Menu (idMenu))   ;

ALTER TABLE ApproProduitSimple ADD (
     CONSTRAINT FK_ApproProduitSimple_DemandeA
          FOREIGN KEY (idDemandeAppro)
               REFERENCES DemandeAppro (idDemandeAppro))   ;

ALTER TABLE ApproProduitSimple ADD (
     CONSTRAINT FK_ApproProduitSimple_ProduitS
          FOREIGN KEY (idProduit)
               REFERENCES ProduitSimple (idProduit))   ;

ALTER TABLE ApproIngredient ADD (
     CONSTRAINT FK_ApproIngredient_DemandeAppr
          FOREIGN KEY (idDemandeAppro)
               REFERENCES DemandeAppro (idDemandeAppro))   ;

ALTER TABLE ApproIngredient ADD (
     CONSTRAINT FK_ApproIngredient_Ingredient
          FOREIGN KEY (idIngredient)
               REFERENCES Ingredient (idIngredient))   ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------