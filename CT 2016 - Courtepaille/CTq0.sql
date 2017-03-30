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
-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 9i
--                        (27/3/2015 10:35:45)
-- -----------------------------------------------------------------------------
--      Nom de la base : Café
--      Projet : Gestion Café
--      Auteur : Rakotozafy
--      Date de dernière modification : 27/3/2015 10:35:05
-- -----------------------------------------------------------------------------

/*
DROP TABLE Categorie CASCADE CONSTRAINTS;
DROP TABLE ProduitSimple CASCADE CONSTRAINTS;
DROP TABLE Ingredient CASCADE CONSTRAINTS;
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
*/
-- -----------------------------------------------------------------------------
--       TABLE : TableClient
-- -----------------------------------------------------------------------------
/*
CREATE TABLE TableClient (
    numTableClient NUMBER(2)  NOT NULL,
    capacite NUMBER(2)  
    , CONSTRAINT PK_TableClient PRIMARY KEY (numTableClientClient)  
) ;
*/
--
-- Contenu de la table TableClient
--
INSERT INTO TableClient (numTableClient, capacite) VALUES(1, 4);
INSERT INTO TableClient (numTableClient, capacite) VALUES(2, 4);
INSERT INTO TableClient (numTableClient, capacite) VALUES(3, 4);
INSERT INTO TableClient (numTableClient, capacite) VALUES(4, 4);
INSERT INTO TableClient (numTableClient, capacite) VALUES(5, 4);
INSERT INTO TableClient (numTableClient, capacite) VALUES(6, 6);
INSERT INTO TableClient (numTableClient, capacite) VALUES(7, 6);
INSERT INTO TableClient (numTableClient, capacite) VALUES(8, 6);
INSERT INTO TableClient (numTableClient, capacite) VALUES(9, 6);
INSERT INTO TableClient (numTableClient, capacite) VALUES(10, 6);
INSERT INTO TableClient (numTableClient, capacite) VALUES(11, 8);
INSERT INTO TableClient (numTableClient, capacite) VALUES(12, 8);
INSERT INTO TableClient (numTableClient, capacite) VALUES(13, 8);
INSERT INTO TableClient (numTableClient, capacite) VALUES(14, 8);
INSERT INTO TableClient (numTableClient, capacite) VALUES(15, 8);
INSERT INTO TableClient (numTableClient, capacite) VALUES(16, 10);
INSERT INTO TableClient (numTableClient, capacite) VALUES(17, 10);
INSERT INTO TableClient (numTableClient, capacite) VALUES(18, 10);
INSERT INTO TableClient (numTableClient, capacite) VALUES(19, 10);
INSERT INTO TableClient (numTableClient, capacite) VALUES(20, 10);


-- -----------------------------------------------------------------------------
--       TABLE : Serveur
-- -----------------------------------------------------------------------------
/*
CREATE TABLE Serveur (
    idServeur VARCHAR2(8)  NOT NULL
    , CONSTRAINT PK_Serveur PRIMARY KEY (idServeur)  
) ;
*/
--
-- Contenu de la table Serveur
--
INSERT INTO Serveur (idServeur) VALUES('SERVEUR1');
INSERT INTO Serveur (idServeur) VALUES('SERVEUR2');
INSERT INTO Serveur (idServeur) VALUES('SERVEUR3');
INSERT INTO Serveur (idServeur) VALUES('SERVEUR4');

-- -----------------------------------------------------------------------------
--       TABLE : Tablee
-- -----------------------------------------------------------------------------
/*
CREATE TABLE Tablee (
    idTablee NUMBER(4)  NOT NULL,
    dateArrivee DATE  ,
    numTableClient NUMBER(2)  NOT NULL,
    idServeur VARCHAR2(8)  NOT NULL
    , CONSTRAINT PK_Tablee PRIMARY KEY (idTablee)  
) ;
*/
--
-- Contenu de la table Tablee
--
INSERT INTO Tablee (idTablee, dateArrivee, numTableClient, idServeur) 
	VALUES(1, TO_DATE('2014-12-17 12:00:00','YYYY-MM-DD HH24:MI:SS'), 1, 'SERVEUR1');
INSERT INTO Tablee (idTablee, dateArrivee, numTableClient, idServeur) 
	VALUES(2, TO_DATE('2014-12-17 12:05:00','YYYY-MM-DD HH24:MI:SS'), 2, 'SERVEUR2');
INSERT INTO Tablee (idTablee, dateArrivee, numTableClient, idServeur) 
	VALUES(3, TO_DATE('2014-12-17 12:10:00','YYYY-MM-DD HH24:MI:SS'), 3, 'SERVEUR3');
INSERT INTO Tablee (idTablee, dateArrivee, numTableClient, idServeur) 
	VALUES(4, TO_DATE('2014-12-17 12:15:00','YYYY-MM-DD HH24:MI:SS'), 4, 'SERVEUR4');
INSERT INTO Tablee (idTablee, dateArrivee, numTableClient, idServeur) 
	VALUES(5, TO_DATE('2014-12-17 13:00:00','YYYY-MM-DD HH24:MI:SS'), 5, 'SERVEUR1');
INSERT INTO Tablee (idTablee, dateArrivee, numTableClient, idServeur) 
	VALUES(6, TO_DATE('2014-12-17 13:05:00','YYYY-MM-DD HH24:MI:SS'), 6, 'SERVEUR2');

-- -----------------------------------------------------------------------------
--       TABLE : Categorie
-- -----------------------------------------------------------------------------
/*
CREATE TABLE Categorie (
    idCategorie VARCHAR2(8)  NOT NULL,
    libelleCategorie VARCHAR2(64)  
    , CONSTRAINT PK_Categorie PRIMARY KEY (idCategorie)  
) ;
*/
--
-- Contenu de la table categorie
--
INSERT INTO categorie (idCategorie, libelleCategorie) 
	VALUES('4_Bois', 'Boisson');
INSERT INTO categorie (idCategorie, libelleCategorie) 
	VALUES('3_Dess', 'Dessert');
INSERT INTO categorie (idCategorie, libelleCategorie) 
	VALUES('1_Entr', 'Entrée');
INSERT INTO categorie (idCategorie, libelleCategorie) 
	VALUES('2_Plat', 'Plat');

-- -----------------------------------------------------------------------------
--       TABLE : Menu
-- -----------------------------------------------------------------------------
/*
CREATE TABLE Menu (
    idMenu VARCHAR2(8)  NOT NULL,
    libelleMenu VARCHAR2(64)  ,
    prixUnitaireMenu NUMBER(6,2)  
    , CONSTRAINT PK_Menu PRIMARY KEY (idMenu)  
) ;
*/
--
-- Contenu de la table menu
--
INSERT INTO menu (idMenu, libelleMenu, prixUnitaireMenu) 
	VALUES('CTP_1', 'Courtepause', 9.90);
INSERT INTO menu (idMenu, libelleMenu, prixUnitaireMenu) 
	VALUES('L61_1', 'Le 1961', 18.20);
INSERT INTO menu (idMenu, libelleMenu, prixUnitaireMenu) 
	VALUES('LFP_1', 'Le Festipaille', 13.50);
INSERT INTO menu (idMenu, libelleMenu, prixUnitaireMenu) 
	VALUES('LGR_1', 'Le Grillardin', 18.40);
INSERT INTO menu (idMenu, libelleMenu, prixUnitaireMenu) 
	VALUES('LGR_2', 'Le Grillardin', 18.40);
INSERT INTO menu (idMenu, libelleMenu, prixUnitaireMenu) 
	VALUES('LGR_3', 'Le Grillardin', 21.50);
INSERT INTO menu (idMenu, libelleMenu, prixUnitaireMenu) 
	VALUES('LPG_1', 'Le Petit Grill', 12.60);
INSERT INTO menu (idMenu, libelleMenu, prixUnitaireMenu) 
	VALUES('LPG_2', 'Le Petit Grill', 12.60);

-- -----------------------------------------------------------------------------
--       TABLE : Formule
-- -----------------------------------------------------------------------------
/*
CREATE TABLE Formule (
    idMenu VARCHAR2(8)  NOT NULL,
    idCategorie VARCHAR2(8)  NOT NULL
    , CONSTRAINT PK_Formule PRIMARY KEY (idMenu, idCategorie)  
) ;
*/
--
-- Contenu de la table Formule
--
INSERT INTO Formule (idMenu, idCategorie) VALUES('CTP_1', '3_Dess');
INSERT INTO Formule (idMenu, idCategorie) VALUES('CTP_1', '2_Plat');
INSERT INTO Formule (idMenu, idCategorie) VALUES('L61_1', '3_Dess');
INSERT INTO Formule (idMenu, idCategorie) VALUES('L61_1', '1_Entr');
INSERT INTO Formule (idMenu, idCategorie) VALUES('L61_1', '2_Plat');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LFP_1', '4_Bois');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LFP_1', '3_Dess');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LFP_1', '1_Entr');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LFP_1', '2_Plat');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LGR_1', '1_Entr');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LGR_1', '2_Plat');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LGR_2', '3_Dess');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LGR_2', '2_Plat');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LGR_3', '3_Dess');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LGR_3', '1_Entr');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LGR_3', '2_Plat');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LPG_1', '3_Dess');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LPG_1', '2_Plat');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LPG_2', '4_Bois');
INSERT INTO Formule (idMenu, idCategorie) VALUES('LPG_2', '2_Plat');


-- -----------------------------------------------------------------------------
--       TABLE : ProduitEnVente
-- -----------------------------------------------------------------------------
/*
CREATE TABLE ProduitEnVente (
    idProduit VARCHAR2(16)  NOT NULL,
    libelleProduit VARCHAR2(64)  ,
    prixUnitaireProduitEnVente NUMBER(6,2)  ,
    idCategorie VARCHAR2(8)  NOT NULL
    , CONSTRAINT PK_ProduitEnVente PRIMARY KEY (idProduit)  
) ;
*/
--
-- Contenu de la table ProduitEnVente
--
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('andouillette 1', 'Andouillette 160g', 12.40, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('andouillette 2', 'Andouillette 240g', 16.55, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('assiette terrine', 'Assiette de terrine de campagne ', 6.30, '1_Entr');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('beef', 'Le p’tit Griz’beef', 13.90, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('boudin', 'Boudin noir 190g', 9.95, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('bourgogne', 'AOC. Montagny. Vignerons de Buxy', 19.35, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('caramel', 'Crème caramel', 4.95, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('champagne', 'Champagne 12cl', 7.50, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('chocolat', 'Duo chocolat : mini gâteau et mi', 4.50, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('cocktail', 'Cocktail multifruit 20cl', 3.80, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('cola', 'Pepsi Cola 33cl', 3.40, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('confite', 'Cuisse de canard confite', 16.45, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('crémant', 'Crémant de Bourgogne 12cl', 5.40, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('crumble', 'Crumble "Figues"', 6.10, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('desperados', 'Desperados 33cl', 5.80, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('duo', 'Duo de cabillaud et saumon', 16.85, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('entrecôte', 'Entrecôte 350g', 23.50, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('expresso', 'Café ou décaféiné Expresso', 1.95, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('faisselle 1', 'Faisselle de fromage blanc de « Rians »', 5.70, '1_Entr');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('faisselle 2', 'Faisselle de fromage blanc de « Rians »', 5.70, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('filet', 'Faux-filet 170g', 14.90, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('fischer', 'Fischer "Tradition" 33 cl', 4.80, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('gateau riz', 'Gâteau de riz aux raisins au rhu', 6.60, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('glace', 'Coupe de sorbet ou de glace (2 boules au choix)', 3.90, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('gourmand 1', 'Café gourmand tout café', 5.90, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('gourmand 2', 'Café gourmand tout chocolat', 5.90, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('haché', 'Steak haché pur boeuf', 9.80, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('hampe', 'Steak dans la hampe',11.15, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('heineken', 'Heineken 33cl', 4.90, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('ice tea', 'Ice TEA 25cl', 3.40, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('infusion', 'Infusion', 2.50, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('jambon', 'Jambon grillé', 9.80, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('magret', 'Magret de canard', 17.70, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('maison', 'Glace "Petite Maison"', 3.40, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('mousse', 'Mousse au chocolat', 5.90, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('nectar', 'Jus ou nectar de fruits Granini ', 3.40, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('oeuf', 'Oeufs durs mayonnaise', 4.90, '1_Entr');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('onglet', 'Onglet de boeuf 140g', 13.75, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('orangina', 'Orangina 25cl', 3.40, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('pamplemousse', 'Coupe de pamplemousse', 4.80, '1_Entr');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('pastis', 'Pastis 51, Ricard 2cl', 4.00, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('pellegrino', 'San Pellegrino 50cl', 3.30, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('perrier', 'Perrier 50cl', 3.50, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('plaisir', 'La café plaisir', 7.90, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('pomme', 'Compote de pommes', 4.90, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('porc', 'Rillettes de porc', 4.70, '1_Entr');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('porto', 'Porto 5cl', 5.00, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('pot 25cl blanc', 'IGP. Côtes de Gascogne 25cl', 5.10, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('pot 25cl rosé', 'IGP. du Var 25cl', 5.10, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('pot 25cl rouge', 'AOC. Ventoux 25cl', 5.60, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('pot 50cl blanc', 'IGP. Côtes de Gascogne 50cl', 9.50, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('pot 50cl rosé', 'IGP. du Var 50cl', 9.50, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('pot 50cl rouge', 'AOC. Ventoux 50cl', 10.60, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('poulet', 'Suprême de poulet mariné', 9.95, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('provence', 'AOC. Côtes de Provence. Château ', 21.30, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('rumsteck', 'Pavé de rumsteck 180g', 15.90, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('salade canard', 'Salade "Gésiers de canard confit', 13.90, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('salade poulet', 'Salade "Suprême de poulet mariné', 13.90, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('saucisses', '2 saucisses paysannes', 9.95, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('saucisson', 'Assiette de saucisson sec', 4.70, '1_Entr');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('sud-ouest', 'AOC. Bergerac. Château Haut Lamo', 19.25, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('tartare', 'Tartare de boeuf 200g', 15.40, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('tarte', 'Tarte aux pommes', 5.70, '3_Dess');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('terrine', 'Tranche de terrine de campagne', 4.50, '1_Entr');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('thé', 'Thé', 2.50, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('thon', 'Rillettes de thon', 4.70, '1_Entr');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('travers', 'Travers de porc marinés', 15.00, '2_Plat');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('vittel', 'Vittel 50cl', 3.30, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('whisky', 'Whisky Ballantine''s 5cl', 6.50, '4_Bois');
INSERT INTO ProduitEnVente (idProduit, libelleProduit, prixUnitaireProduitEnVente, idCategorie) VALUES('yaourt', 'Yaourt nature au lait entier La ', 3.60, '3_Dess');

-- -----------------------------------------------------------------------------
--       TABLE : CouvertClient
-- -----------------------------------------------------------------------------
/*
CREATE TABLE CouvertClient (
    idTablee NUMBER(4)  NOT NULL,
    numCouvert NUMBER(2)  NOT NULL
    , CONSTRAINT PK_CouvertClient PRIMARY KEY (idTablee, numCouvert)  
) ;
*/
--
-- Contenu de la table CouvertClient
--
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(1, 1);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(1, 2);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(2, 1);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(2, 2);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(3, 1);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(3, 2);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(4, 1);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(4, 2);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(4, 3);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(4, 4);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(5, 1);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(6, 1);
INSERT INTO CouvertClient (idTablee, numCouvert) VALUES(6, 2);


-- -----------------------------------------------------------------------------
--       TABLE : CommandeMenu
-- -----------------------------------------------------------------------------
/*
CREATE TABLE CommandeMenu (
    idTablee NUMBER(4)  NOT NULL,
    numCouvert NUMBER(2)  NOT NULL,
    idMenu VARCHAR2(8)  
    , CONSTRAINT PK_CommandeMenu PRIMARY KEY (idTablee, numCouvert)  
) ;
*/
--
-- Contenu de la table CommandeMenu
--
INSERT INTO CommandeMenu (idTablee, numCouvert, idMenu) VALUES(3, 2, 'CTP_1');
INSERT INTO CommandeMenu (idTablee, numCouvert, idMenu) VALUES(3, 1, 'L61_1');
INSERT INTO CommandeMenu (idTablee, numCouvert, idMenu) VALUES(4, 4, 'LFP_1');
INSERT INTO CommandeMenu (idTablee, numCouvert, idMenu) VALUES(1, 1, 'LGR_1');
INSERT INTO CommandeMenu (idTablee, numCouvert, idMenu) VALUES(1, 2, 'LGR_2');
INSERT INTO CommandeMenu (idTablee, numCouvert, idMenu) VALUES(2, 1, 'LPG_1');
INSERT INTO CommandeMenu (idTablee, numCouvert, idMenu) VALUES(4, 1, 'LPG_1');
INSERT INTO CommandeMenu (idTablee, numCouvert, idMenu) VALUES(2, 2, 'LPG_2');
INSERT INTO CommandeMenu (idTablee, numCouvert, idMenu) VALUES(6, 1, 'LPG_2');


-- -----------------------------------------------------------------------------
--       TABLE : CommandeProduitALaCarte
-- -----------------------------------------------------------------------------
/*
CREATE TABLE CommandeProduitALaCarte (
    idTablee NUMBER(4)  NOT NULL,
    numCouvert NUMBER(2)  NOT NULL,
    idProduit VARCHAR2(16)  NOT NULL,
    quantiteProduit NUMBER(2)  
    , CONSTRAINT PK_CommandeProduitALaCarte PRIMARY KEY (idTablee, numCouvert, idProduit)  
) ;
*/
--
-- Contenu de la table CommandeProduitALaCarte
--
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(1, 1, 'pastis', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(1, 2, 'porto', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(2, 1, 'cocktail', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(2, 2, 'cocktail', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(3, 1, 'champagne', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(3, 2, 'crémant', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 1, 'expresso', 2);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 1, 'pot 50cl rosé', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 1, 'whisky', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 2, 'cocktail', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 2, 'duo', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 2, 'gourmand 1', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 2, 'infusion', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 2, 'vittel', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 3, 'beef', 2);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 3, 'expresso', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 3, 'heineken', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 3, 'whisky', 1);
INSERT INTO CommandeProduitALaCarte (idTablee, numCouvert, idProduit, quantiteProduit) VALUES(4, 4, 'infusion', 1);


-- -----------------------------------------------------------------------------
--       TABLE : ProduitsAuChoixDansMenu
-- -----------------------------------------------------------------------------
/*
CREATE TABLE ProduitsAuChoixDansMenu (
    idMenu VARCHAR2(8)  NOT NULL,
    idProduit VARCHAR2(16)  NOT NULL
    , CONSTRAINT PK_ProduitsAuChoixDansMenu PRIMARY KEY (idMenu, idProduit)  
) ;
*/
--
-- Contenu de la table ProduitsAuChoixDansMenu
--

INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('L61_1', 'andouillette 1');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'andouillette 2');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'andouillette 2');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'andouillette 2');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('L61_1', 'assiette terrine');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'assiette terrine');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'assiette terrine');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'beef');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('L61_1', 'boudin');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('L61_1', 'caramel');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_1', 'caramel');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'chocolat');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_1', 'chocolat');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'cola');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'cola');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'confite');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'confite');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'confite');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'crumble');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'crumble');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'duo');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'duo');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'duo');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('CTP_1', 'expresso');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('L61_1', 'faisselle 1');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'faisselle 1');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'faisselle 1');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('L61_1', 'faisselle 2');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'faisselle 2');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'faisselle 2');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'faisselle 2');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'filet');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'filet');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'filet');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'fischer');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'gateau riz');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'gateau riz');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'glace');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_1', 'glace');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'gourmand 1');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'gourmand 1');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'gourmand 2');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'gourmand 2');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('CTP_1', 'haché');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'haché');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_1', 'haché');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'haché');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('L61_1', 'hampe');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'hampe');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_1', 'hampe');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'hampe');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'heineken');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'ice tea');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('CTP_1', 'jambon');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'jambon');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_1', 'jambon');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'jambon');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'maison');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'mousse');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'mousse');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'nectar');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('L61_1', 'oeuf');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'oeuf');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'oeuf');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'oeuf');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'orangina');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'pamplemousse');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'pamplemousse');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'pamplemousse');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_1', 'pamplemousse');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'pellegrino');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'pellegrino');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'perrier');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'perrier');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'pomme');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'pomme');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_1', 'pomme');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'porc');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'porc');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'porc');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'pot 25cl blanc');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'pot 25cl rosé');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'pot 25cl rouge');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'poulet');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_1', 'poulet');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'poulet');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'rumsteck');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'rumsteck');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'rumsteck');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'salade canard');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'salade canard');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'salade canard');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'salade poulet');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'salade poulet');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'salade poulet');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'saucisses');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_1', 'saucisses');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'saucisses');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'saucisson');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'saucisson');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'saucisson');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('L61_1', 'tarte');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'terrine');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'thon');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_1', 'thon');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'thon');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'vittel');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_2', 'vittel');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LFP_1', 'yaourt');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_2', 'yaourt');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LGR_3', 'yaourt');
INSERT INTO ProduitsAuChoixDansMenu (idMenu, idProduit) VALUES('LPG_1', 'yaourt');


-- -----------------------------------------------------------------------------
--       TABLE : ProduitsChoisisDansMenu
-- -----------------------------------------------------------------------------
/*
CREATE TABLE ProduitsChoisisDansMenu (
    idTablee NUMBER(4)  NOT NULL,
    numCouvert NUMBER(2)  NOT NULL,
    idMenu VARCHAR2(8)  NOT NULL,
    idProduit VARCHAR2(16)  NOT NULL
    , CONSTRAINT PK_ProduitsChoisisDansMenu PRIMARY KEY (idTablee, numCouvert, idMenu, idProduit)  
) ;
*/
--
-- Contenu de la table ProduitsChoisisDansMenu
--
INSERT INTO ProduitsChoisisDansMenu (idTablee, numCouvert, idMenu, idProduit) VALUES(4, 1, 'LPG_1', 'glace');
INSERT INTO ProduitsChoisisDansMenu (idTablee, numCouvert, idMenu, idProduit) VALUES(4, 1, 'LPG_1', 'hampe');
INSERT INTO ProduitsChoisisDansMenu (idTablee, numCouvert, idMenu, idProduit) VALUES(4, 4, 'LFP_1', 'beef');
INSERT INTO ProduitsChoisisDansMenu (idTablee, numCouvert, idMenu, idProduit) VALUES(4, 4, 'LFP_1', 'faisselle 2');
INSERT INTO ProduitsChoisisDansMenu (idTablee, numCouvert, idMenu, idProduit) VALUES(4, 4, 'LFP_1', 'orangina');
INSERT INTO ProduitsChoisisDansMenu (idTablee, numCouvert, idMenu, idProduit) VALUES(4, 4, 'LFP_1', 'terrine');

-- -----------------------------------------------------------------------------
--       TABLE : ProduitSimple
-- -----------------------------------------------------------------------------
/*
CREATE TABLE ProduitSimple (
    idProduit VARCHAR2(16)  NOT NULL,
    qteStock NUMBER(4)  ,
    seuilStock NUMBER(4)  
    , CONSTRAINT PK_ProduitSimple PRIMARY KEY (idProduit)  
) ;
*/
--
-- Contenu de la table ProduitSimple
--
INSERT INTO ProduitSimple (idProduit, qteStock, seuilStock) VALUES('andouillette 1', 10, 5);
INSERT INTO ProduitSimple (idProduit, qteStock, seuilStock) VALUES('andouillette 2', 20, 10);
INSERT INTO ProduitSimple (idProduit, qteStock, seuilStock) VALUES('cola', 30, 20);
INSERT INTO ProduitSimple (idProduit, qteStock, seuilStock) VALUES('heineken', 40, 30);

-- -----------------------------------------------------------------------------
--       TABLE : ProduitCompose
-- -----------------------------------------------------------------------------
/*
CREATE TABLE ProduitCompose (
    idProduit VARCHAR2(16)  NOT NULL
    , CONSTRAINT PK_ProduitCompose PRIMARY KEY (idProduit)  
) ;
*/
--
-- Contenu de la table ProduitCompose
--
INSERT INTO ProduitCompose (idProduit) VALUES('assiette terrine');
INSERT INTO ProduitCompose (idProduit) VALUES('salade canard');
INSERT INTO ProduitCompose (idProduit) VALUES('salade poulet');

-- -----------------------------------------------------------------------------
--       TABLE : Ingredient
-- -----------------------------------------------------------------------------
/*
CREATE TABLE Ingredient (
    idIngredient VARCHAR2(8)  NOT NULL,
    libelleIngredient VARCHAR2(64)  ,
    qteStock NUMBER(4)  ,
    seuilStock NUMBER(4)  
    , CONSTRAINT PK_Ingredient PRIMARY KEY (idIngredient)  
) ;
*/
--
-- Contenu de la table Ingredient
--
INSERT INTO Ingredient (idIngredient ,libelleIngredient, qteStock, seuilStock) 
    VALUES('terrine','Terrine de campagne', 20, 10);
INSERT INTO Ingredient (idIngredient ,libelleIngredient, qteStock, seuilStock) 
    VALUES('salade','Feuille de chêne', 30, 10);
INSERT INTO Ingredient (idIngredient ,libelleIngredient, qteStock, seuilStock) 
    VALUES('canard','Cuisse de Canard', 40, 10);
INSERT INTO Ingredient (idIngredient ,libelleIngredient, qteStock, seuilStock) 
    VALUES('poulet','Blanc de Poulet', 50, 10);


-- -----------------------------------------------------------------------------
--       TABLE : CompositionIngredient
-- -----------------------------------------------------------------------------
/*
CREATE TABLE CompositionIngredient (
    idProduit VARCHAR2(16)  NOT NULL,
    idIngredient VARCHAR2(8)  NOT NULL,
    qteIngredient NUMBER(4)  
    , CONSTRAINT PK_CompositionIngredient PRIMARY KEY (idProduit, idIngredient)  
) ;
*/
--
-- Contenu de la table CompositionIngredient
--
INSERT INTO CompositionIngredient (idProduit, idIngredient ,qteIngredient) 
    VALUES('assiette terrine','terrine', 5);
INSERT INTO CompositionIngredient (idProduit, idIngredient ,qteIngredient) 
    VALUES('assiette terrine','salade', 10);
INSERT INTO CompositionIngredient (idProduit, idIngredient ,qteIngredient) 
    VALUES('salade canard','salade', 10);
INSERT INTO CompositionIngredient (idProduit, idIngredient ,qteIngredient) 
    VALUES('salade canard','canard', 20);
INSERT INTO CompositionIngredient (idProduit, idIngredient ,qteIngredient) 
    VALUES('salade poulet','salade', 10);
INSERT INTO CompositionIngredient (idProduit, idIngredient ,qteIngredient) 
    VALUES('salade poulet','poulet', 20);
