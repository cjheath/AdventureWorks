
CREATE TABLE Hub_ProdSubCatID
(
	Hub_ProdSubCatID_SQN  NUMERIC(12)  NOT NULL,
	Hub_ProdSubCatID_LDTS  DATE  NOT NULL,
	Hub_ProdSubCatID_RSRC  VARCHAR(18)  ,
	ProductSubcategoryID  INTEGER  NOT NULL,
	CONSTRAINT  PK_ProductSubcategory_ProductSubcategoryID  PRIMARY KEY (Hub_ProdSubCatID_SQN)
)
;



CREATE UNIQUE INDEX BK_ProductSubcategoryID ON Hub_ProdSubCatID
(
	ProductSubcategoryID  ASC
)
;



CREATE TABLE Hub_ProdNum
(
	Hub_ProdNum_SQN       NUMERIC(12)  NOT NULL,
	Hub_ProdNum_LDTS      DATE  NOT NULL,
	Hub_ProdNum_RSRC      VARCHAR(18)  ,
	ProductNumber         VARCHAR(25)  NOT NULL,
	CONSTRAINT  PK_Product_ProductID  PRIMARY KEY (Hub_ProdNum_SQN)
)
;



CREATE UNIQUE INDEX BK_ProdNumID ON Hub_ProdNum
(
	ProductNumber         ASC
)
;



CREATE TABLE Hub_ProdCatID
(
	Hub_ProdCatID_SQN     NUMERIC(12)  NOT NULL,
	Hub_ProdCatID_LDTS    DATE  NOT NULL,
	Hub_ProdCatID_RSRC    VARCHAR(18)  ,
	ProductCategoryID     INTEGER  NOT NULL,
	CONSTRAINT  PK_ProductCategory_ProductCategoryID  PRIMARY KEY (Hub_ProdCatID_SQN)
)
;



CREATE UNIQUE INDEX BK_ProductCategoryID ON Hub_ProdCatID
(
	ProductCategoryID     ASC
)
;



CREATE TABLE Lnk_ProdNum_ProdSubCatID
(
	Lnk_ProdNum_ProdSubCatID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_ProdSubCatID_LDTS  DATE  NOT NULL,
	Lnk_ProdNum_ProdSubCatID_RSRC  VARCHAR(18)  ,
	Hub_ProdCatID_SQN     NUMERIC(12)  NOT NULL,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_ProdSubCatID_SQN  NUMERIC(12)  NOT NULL,
	CONSTRAINT  XPKLnk_ProdSubCatID_ProdCatID  PRIMARY KEY (Lnk_ProdNum_ProdSubCatID_SQN),
	CONSTRAINT R_131 FOREIGN KEY (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN),
	CONSTRAINT R_133 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_326 FOREIGN KEY (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_ProdSubCatID_ProdCatID ON Lnk_ProdNum_ProdSubCatID
(
	Hub_ProdNum_SQN       ASC,
	Hub_ProdSubCatID_SQN  ASC,
	Hub_ProdCatID_SQN     ASC
)
;



CREATE TABLE Sat_ProdSubCat
(
	Hub_ProdSubCatID_SQN  NUMERIC(12)  NOT NULL,
	Sat_ProdSubCat_LDTS   DATE  NOT NULL,
	Sat_ProdSubCat_LEDTS  DATE  ,
	Sat_ProdSubCat_RSRC   VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SAT_ProductSubcategoryID  PRIMARY KEY (Hub_ProdSubCatID_SQN,Sat_ProdSubCat_LDTS),
	CONSTRAINT R_122 FOREIGN KEY (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductSubcategory_Name ON Sat_ProdSubCat
(
	Name                  ASC
)
;



CREATE TABLE Lnk_ProdSubCatID_ProdCatID
(
	Lnk_ProdSubCatID_ProdCatID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdSubCatID_ProdCatID_LDT  DATE  NOT NULL,
	Lnk_ProdSubCatID_ProdCatID_RSR  VARCHAR(18)  ,
	Hub_ProdSubCatID_SQN  NUMERIC(12)  NOT NULL,
	Hub_ProdCatID_SQN     NUMERIC(12)  NOT NULL,
	CONSTRAINT  XPKLnk_ProdSubCatCatID  PRIMARY KEY (Lnk_ProdSubCatID_ProdCatID_SQN),
	CONSTRAINT R_128 FOREIGN KEY (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN),
	CONSTRAINT R_129 FOREIGN KEY (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_ProdSubCatID_ProdCatID ON Lnk_ProdSubCatID_ProdCatID
(
	Hub_ProdCatID_SQN     ASC,
	Hub_ProdSubCatID_SQN  ASC
)
;



CREATE TABLE Sat_ProdCat
(
	Hub_ProdCatID_SQN     NUMERIC(12)  NOT NULL,
	Sat_ProdCat_LDTS      DATE  NOT NULL,
	Sat_ProdCat_LEDTS     DATE  ,
	Sat_ProdCat_RSRC      VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SAT_ProductCategoryID  PRIMARY KEY (Hub_ProdCatID_SQN,Sat_ProdCat_LDTS),
	CONSTRAINT R_121 FOREIGN KEY (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductCategory_Name ON Sat_ProdCat
(
	Name                  ASC
)
;



CREATE TABLE Hub_AddID
(
	Hub_AddID_SQN         NUMERIC(12)  NOT NULL,
	Hub_AddID_RSRC        VARCHAR(18)  ,
	Hub_AddID_LDTS        DATE  NOT NULL,
	AddressID             INTEGER  NOT NULL,
	CONSTRAINT  PK_Address_AddressID  PRIMARY KEY (Hub_AddID_SQN)
)
;



CREATE UNIQUE INDEX BK_AddressID ON Hub_AddID
(
	AddressID             ASC
)
;



CREATE TABLE Hub_StProvID
(
	Hub_StProvID_SQN      NUMERIC(12)  NOT NULL,
	Hub_StProvID_LDTS     DATE  NOT NULL,
	Hub_StProvID_RSRC     VARCHAR(18)  ,
	StateProvinceID       INTEGER  NOT NULL,
	CONSTRAINT  PK_StateProvince_StateProvinceID  PRIMARY KEY (Hub_StProvID_SQN)
)
;



CREATE UNIQUE INDEX BK_StateProvinceID ON Hub_StProvID
(
	StateProvinceID       ASC
)
;



CREATE TABLE Lnk_AddID_StProvID
(
	Lnk_AddID_StProvID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_AddID_StProvID_LDTS  DATE  NOT NULL,
	Lnk_AddID_StProvID_RSRC  VARCHAR(18)  ,
	Hub_AddID_SQN         NUMERIC(12)  ,
	Hub_StProvID_SQN      NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_AddID_StProvID  PRIMARY KEY (Lnk_AddID_StProvID_SQN),
	CONSTRAINT R_291 FOREIGN KEY (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN),
	CONSTRAINT R_292 FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_AddID_StProvID ON Lnk_AddID_StProvID
(
	Hub_AddID_SQN         ASC,
	Hub_StProvID_SQN      ASC
)
;



CREATE TABLE Hub_DocNode
(
	Hub_DocNode_SQN       NUMERIC(12)  NOT NULL,
	Hub_DocNode_LDTS      DATE  NOT NULL,
	Hub_DocNode_RSRC      VARCHAR(18)  ,
	DocumentNode          CHAR(18)  NOT NULL,
	CONSTRAINT  PK_Document_DocumentNode  PRIMARY KEY (Hub_DocNode_SQN)
)
;



CREATE UNIQUE INDEX BK_DocumentNode ON Hub_DocNode
(
	DocumentNode          ASC
)
;



CREATE TABLE Lnk_ProdNum_DocNode
(
	Lnk_ProdNum_DocNode_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_DocNode_LDTS  DATE  NOT NULL,
	Lnk_ProdNum_DocNode_RSRC  VARCHAR(18)  ,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_DocNode_SQN       NUMERIC(12)  ,
	CONSTRAINT  PK_ProductDocument_ProductID_DocumentNode  PRIMARY KEY (Lnk_ProdNum_DocNode_SQN),
	CONSTRAINT R_194 FOREIGN KEY (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN),
	CONSTRAINT R_195 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductDocument ON Lnk_ProdNum_DocNode
(
	Hub_ProdNum_SQN       ASC,
	Hub_DocNode_SQN       ASC
)
;



CREATE TABLE Sat_Prod_Doc
(
	Lnk_ProdNum_DocNode_SQN  NUMERIC(12)  NOT NULL,
	Sat_Prod_Doc_LDTS     DATE  NOT NULL,
	Sat_Prod_Doc_LEDTS    DATE  ,
	Sat_Prod_Doc_RSRC     VARCHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SAT_ProductDocumentID  PRIMARY KEY (Lnk_ProdNum_DocNode_SQN,Sat_Prod_Doc_LDTS),
	CONSTRAINT R_192 FOREIGN KEY (Lnk_ProdNum_DocNode_SQN) REFERENCES Lnk_ProdNum_DocNode(Lnk_ProdNum_DocNode_SQN)
)
;



CREATE TABLE Hub_ShopCartItemID
(
	Hub_ShopCartItemID_SQN  NUMERIC(12)  NOT NULL,
	Hub_ShopCartItemID_LDTS  DATE  NOT NULL,
	Hub_ShopCartItemID_RSRC  VARCHAR(18)  ,
	ShoppingCartItemID    INTEGER  NOT NULL,
	CONSTRAINT  PK_ShoppingCartItem_ShoppingCartItemID  PRIMARY KEY (Hub_ShopCartItemID_SQN)
)
;



CREATE UNIQUE INDEX BK_ShopCartItemID ON Hub_ShopCartItemID
(
	ShoppingCartItemID    ASC
)
;



CREATE TABLE Sat_ShopCartItem
(
	Hub_ShopCartItemID_SQN  NUMERIC(12)  NOT NULL,
	Sat_ShopCartItem_LDTS  DATE  NOT NULL,
	Sat_ShopCartItem_LEDTS  DATE  ,
	Sat_ShopCartItem_RSRC  VARCHAR(18)  ,
	ShoppingCartID        VARCHAR(50)  NOT NULL,
	Quantity              INTEGER  NOT NULL,
	DateCreated           TIMESTAMP  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SAT_ShoppingCartItemID  PRIMARY KEY (Hub_ShopCartItemID_SQN,Sat_ShopCartItem_LDTS),
	CONSTRAINT R_113 FOREIGN KEY (Hub_ShopCartItemID_SQN) REFERENCES Hub_ShopCartItemID(Hub_ShopCartItemID_SQN)
)
;



CREATE TABLE Hub_SOrdNum
(
	Hub_SOrdNum_SQN       NUMERIC(12)  NOT NULL,
	Hub_SOrdNum_LDTS      DATE  NOT NULL,
	Hub_SOrdNum_RSRC      VARCHAR(18)  ,
	SalesOrderNumber      VARCHAR(25)  NOT NULL,
	CONSTRAINT  PK_SalesOrderHeader_SalesOrderID  PRIMARY KEY (Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX BK_SalesOrderHeaderID ON Hub_SOrdNum
(
	SalesOrderNumber      ASC
)
;



CREATE TABLE Hub_SRsnID
(
	Hub_SRsnID_SQN        NUMERIC(12)  NOT NULL,
	Hub_SRsnID_LDTS       DATE  NOT NULL,
	Hub_SRsnID_RSRC       VARCHAR(18)  ,
	SalesReasonID         INTEGER  NOT NULL,
	CONSTRAINT  PK_SalesReason_SalesReasonID  PRIMARY KEY (Hub_SRsnID_SQN)
)
;



CREATE UNIQUE INDEX BK_SalesReasonID ON Hub_SRsnID
(
	SalesReasonID         ASC
)
;



CREATE TABLE Lnk_SOrdNum_SRsnID
(
	Lnk_SOrdNum_SRsnID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_SOrdNum_SRsnID_LDTS  DATE  NOT NULL,
	Lnk_SOrdNum_SRsnID_RSRC  VARCHAR(18)  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  ,
	Hub_SRsnID_SQN        NUMERIC(12)  ,
	CONSTRAINT  PK_SalesOrderHeaderSalesReason  PRIMARY KEY (Lnk_SOrdNum_SRsnID_SQN),
	CONSTRAINT R_188 FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	CONSTRAINT R_189 FOREIGN KEY (Hub_SRsnID_SQN) REFERENCES Hub_SRsnID(Hub_SRsnID_SQN)
)
;



CREATE UNIQUE INDEX AK_SalesOrderHeaderSalesReason ON Lnk_SOrdNum_SRsnID
(
	Hub_SOrdNum_SQN       ASC,
	Hub_SRsnID_SQN        ASC
)
;



CREATE TABLE Sat_SOrdNum_SRsnID
(
	Lnk_SOrdNum_SRsnID_SQN  NUMERIC(12)  NOT NULL,
	Sat_SOrdNum_SRsnID_LDTS  DATE  NOT NULL,
	Sat_SOrdNum_SRsnID_LEDTS  DATE  ,
	Sat_SOrdNum_SRsnID_RSRC  VARCHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID  PRIMARY KEY (Lnk_SOrdNum_SRsnID_SQN,Sat_SOrdNum_SRsnID_LDTS),
	CONSTRAINT R_191 FOREIGN KEY (Lnk_SOrdNum_SRsnID_SQN) REFERENCES Lnk_SOrdNum_SRsnID(Lnk_SOrdNum_SRsnID_SQN)
)
;



CREATE TABLE Lnk_ProdNum_ShopCartItemID
(
	Lnk_ProdNum_ShopCartItemID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_ShopCartItemID_LDT  DATE  NOT NULL,
	Lnk_ProdNum_ShopCartItemID_RSR  VARCHAR(18)  ,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_ShopCartItemID_SQN  NUMERIC(12)  ,
	CONSTRAINT  PK_ShoppingCartItem_ShoppingCartItemID  PRIMARY KEY (Lnk_ProdNum_ShopCartItemID_SQN),
	CONSTRAINT R_118 FOREIGN KEY (Hub_ShopCartItemID_SQN) REFERENCES Hub_ShopCartItemID(Hub_ShopCartItemID_SQN),
	CONSTRAINT R_119 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_ProdNum_ShopCartItemID ON Lnk_ProdNum_ShopCartItemID
(
	Hub_ShopCartItemID_SQN  ASC,
	Hub_ProdNum_SQN       ASC
)
;



CREATE TABLE Hub_ProdPhotoID
(
	Hub_ProdPhotoID_SQN   NUMERIC(12)  NOT NULL,
	Hub_ProdPhotoID_LDTS  DATE  NOT NULL,
	Hub_ProdPhotoID_RSRC  VARCHAR(18)  ,
	ProductPhotoID        INTEGER  NOT NULL,
	CONSTRAINT  PK_ProductPhoto_ProductPhotoID  PRIMARY KEY (Hub_ProdPhotoID_SQN)
)
;



CREATE UNIQUE INDEX BK_ProdPhotoID ON Hub_ProdPhotoID
(
	ProductPhotoID        ASC
)
;



CREATE TABLE Lnk_ProdNum_ProdPhotoID
(
	Lnk_ProdNum_ProdPhotoID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_ProdPhotoID_LDTS  DATE  NOT NULL,
	Lnk_ProdNum_ProdPhotoID_RSRC  VARCHAR(18)  ,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_ProdPhotoID_SQN   NUMERIC(12)  ,
	CONSTRAINT  PK_ProductProductPhoto_ProductID_ProductPhotoID  PRIMARY KEY (Lnk_ProdNum_ProdPhotoID_SQN),
	CONSTRAINT R_108 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_109 FOREIGN KEY (Hub_ProdPhotoID_SQN) REFERENCES Hub_ProdPhotoID(Hub_ProdPhotoID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_ProdNum_ProdPhotoID ON Lnk_ProdNum_ProdPhotoID
(
	Hub_ProdNum_SQN       ASC,
	Hub_ProdPhotoID_SQN   ASC
)
;



CREATE TABLE Sat_Prod_ProdPhoto
(
	Lnk_ProdNum_ProdPhotoID_SQN  NUMERIC(12)  NOT NULL,
	Sat_ProdNum_ProdPhotoID_LDTS  DATE  NOT NULL,
	Sat_ProdNum_ProdPhotoID_LEDTS  DATE  ,
	Sat_ProdNum_ProdPhotoID_RSRC  VARCHAR(18)  ,
	Primary               SMALLINT  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ProductProductPhoto_ProductID_ProductPhotoID  PRIMARY KEY (Lnk_ProdNum_ProdPhotoID_SQN,Sat_ProdNum_ProdPhotoID_LDTS),
	CONSTRAINT R_107 FOREIGN KEY (Lnk_ProdNum_ProdPhotoID_SQN) REFERENCES Lnk_ProdNum_ProdPhotoID(Lnk_ProdNum_ProdPhotoID_SQN)
)
;



CREATE TABLE Sat_ProdPhoto
(
	Hub_ProdPhotoID_SQN   NUMERIC(12)  NOT NULL,
	Sat_ProdPhoto_LDTS    DATE  NOT NULL,
	Sat_ProdPhoto_LEDTS   DATE  ,
	Sat_ProdPhoto_RSRC    VARCHAR(18)  ,
	ThumbNailPhoto        LONG VARGRAPHIC  ,
	ThumbnailPhotoFileName  VARCHAR(50)  ,
	LargePhoto            LONG VARGRAPHIC  ,
	LargePhotoFileName    VARCHAR(50)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ProductPhoto_ProductPhotoID  PRIMARY KEY (Hub_ProdPhotoID_SQN,Sat_ProdPhoto_LDTS),
	CONSTRAINT R_110 FOREIGN KEY (Hub_ProdPhotoID_SQN) REFERENCES Hub_ProdPhotoID(Hub_ProdPhotoID_SQN)
)
;



CREATE TABLE Hub_SOfrID
(
	Hub_SOfrID_SQN        NUMERIC(12)  NOT NULL,
	Hub_SOfrID_LDTS       DATE  NOT NULL,
	Hub_SOfrID_RSRC       VARCHAR(18)  ,
	SpecialOfferID        INTEGER  NOT NULL,
	CONSTRAINT  PK_SpecialOffer_SpecialOfferID  PRIMARY KEY (Hub_SOfrID_SQN)
)
;



CREATE UNIQUE INDEX BK_SpecialOfferID ON Hub_SOfrID
(
	SpecialOfferID        ASC
)
;



CREATE TABLE Sat_SOfr
(
	Hub_SOfrID_SQN        NUMERIC(12)  NOT NULL,
	Sat_SOfr_LDTS         DATE  NOT NULL,
	Sat_SOfr_LEDTS        DATE  ,
	Sat_SOfr_RSRC         VARCHAR(18)  ,
	Description           VARCHAR(255)  NOT NULL,
	DiscountPct           DECIMAL(10,4)  NOT NULL,
	Type                  VARCHAR(50)  NOT NULL,
	Category              VARCHAR(50)  NOT NULL,
	StartDate             TIMESTAMP  NOT NULL,
	EndDate               TIMESTAMP  NOT NULL,
	MinQty                INTEGER  NOT NULL,
	MaxQty                INTEGER  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SpecialOffer_SpecialOfferID  PRIMARY KEY (Hub_SOfrID_SQN,Sat_SOfr_LDTS),
	CONSTRAINT R_182 FOREIGN KEY (Hub_SOfrID_SQN) REFERENCES Hub_SOfrID(Hub_SOfrID_SQN)
)
;



CREATE TABLE Lnk_ProdNum_SOrdNum_SOfrID
(
	Lnk_ProdNum_SOrdNum_SOfrID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_SOrdNum_SOfrID_LDT  DATE  NOT NULL,
	Lnk_ProdNum_SOrdNum_SOfrID_RSR  VARCHAR(18)  ,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  ,
	Hub_SOfrID_SQN        NUMERIC(12)  ,
	SalesOrderDetailID    INTEGER  NOT NULL,
	CONSTRAINT  PK_SpecialOfferProduct_SpecialOfferID_ProductID  PRIMARY KEY (Lnk_ProdNum_SOrdNum_SOfrID_SQN),
	CONSTRAINT R_174 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_176 FOREIGN KEY (Hub_SOfrID_SQN) REFERENCES Hub_SOfrID(Hub_SOfrID_SQN),
	CONSTRAINT R_186 FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_SpecialOfferProduct ON Lnk_ProdNum_SOrdNum_SOfrID
(
	Hub_ProdNum_SQN       ASC,
	Hub_SOfrID_SQN        ASC,
	SalesOrderDetailID    ASC,
	Hub_SOrdNum_SQN       ASC
)
;



CREATE TABLE Sat_SOrdDet
(
	Lnk_ProdNum_SOrdID_SOfrID_SQN  NUMERIC(12)  NOT NULL,
	Sat_SOrdDet_LDTS      DATE  NOT NULL,
	Sat_SOrdDet_LEDTS     DATE  ,
	Sat_SOrdDet_RSRC      VARCHAR(18)  ,
	CarrierTrackingNumber  VARCHAR(25)  ,
	OrderQty              smallint  NOT NULL,
	UnitPrice             DECIMAL(19,4)  NOT NULL,
	UnitPriceDiscount     DECIMAL(19,4)  NOT NULL,
	LineTotal             NUMERIC(31,6)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID  PRIMARY KEY (Lnk_ProdNum_SOrdID_SOfrID_SQN,Sat_SOrdDet_LDTS),
	CONSTRAINT R_181 FOREIGN KEY (Lnk_ProdNum_SOrdID_SOfrID_SQN) REFERENCES Lnk_ProdNum_SOrdNum_SOfrID(Lnk_ProdNum_SOrdNum_SOfrID_SQN)
)
;



CREATE TABLE Hub_LocID
(
	Hub_LocID_SQN         NUMERIC(12)  NOT NULL,
	Hub_LocID_LDTS        DATE  NOT NULL,
	Hub_LocID_RSRC        VARCHAR(18)  ,
	LocationID            smallint  NOT NULL,
	CONSTRAINT  PK_Location_LocationID  PRIMARY KEY (Hub_LocID_SQN)
)
;



CREATE UNIQUE INDEX BK_LocationID ON Hub_LocID
(
	LocationID            ASC
)
;



CREATE TABLE Sat_Loc
(
	Hub_LocID_SQN         NUMERIC(12)  NOT NULL,
	Sat_Loc_LDTS          DATE  NOT NULL,
	Sat_Loc_LEDTS         DATE  ,
	Sat_Loc_RSRC          VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	CostRate              DECIMAL(10,4)  NOT NULL,
	Availability          decimal(8,2)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Location_LocationID  PRIMARY KEY (Hub_LocID_SQN,Sat_Loc_LDTS),
	CONSTRAINT R_161 FOREIGN KEY (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
;



CREATE UNIQUE INDEX AK_Location_Name ON Sat_Loc
(
	Name                  ASC
)
;



CREATE TABLE Sat_ProdNum_SOrdNum_SOfrID
(
	Lnk_ProdNum_SOrdNum_SOfrID_SQN  NUMERIC(12)  NOT NULL,
	Sat_ProdNum_SOrdNum_SOfrID_LDT  DATE  NOT NULL,
	Sat_ProdNum_SOrdNum_SOfrID_LED  DATE  ,
	Sat_ProdNum_SOrdNum_SOfrID_RSR  VARCHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SpecialOfferProduct_SpecialOfferID_ProductID  PRIMARY KEY (Lnk_ProdNum_SOrdNum_SOfrID_SQN,Sat_ProdNum_SOrdNum_SOfrID_LDT),
	CONSTRAINT R_175 FOREIGN KEY (Lnk_ProdNum_SOrdNum_SOfrID_SQN) REFERENCES Lnk_ProdNum_SOrdNum_SOfrID(Lnk_ProdNum_SOrdNum_SOfrID_SQN)
)
;



CREATE TABLE Hub_TransID
(
	Hub_TransID_SQN       NUMERIC(12)  NOT NULL,
	Hub_TransID_LDTS      DATE  NOT NULL,
	Hub_TransID_RSRC      VARCHAR(18)  ,
	TransactionID         INTEGER  NOT NULL,
	CONSTRAINT  PK_TransactionHistory_TransactionID  PRIMARY KEY (Hub_TransID_SQN)
)
;



CREATE UNIQUE INDEX BK_TransID ON Hub_TransID
(
	TransactionID         ASC
)
;



CREATE TABLE Sat_TransHist
(
	Hub_TransID_SQN       NUMERIC(12)  NOT NULL,
	Sat_TransHist_LDTS    DATE  NOT NULL,
	Sat_TransHist_LEDTS   DATE  ,
	Sat_TransHist_RSRC    VARCHAR(18)  ,
	TransactionID         INTEGER  NOT NULL,
	ReferenceOrderID      INTEGER  NOT NULL,
	ReferenceOrderLineID  INTEGER  NOT NULL,
	TransactionDate       TIMESTAMP  NOT NULL,
	TransactionType       CHAR(1)  NOT NULL,
	Quantity              INTEGER  NOT NULL,
	ActualCost            DECIMAL(19,4)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_TransactionHistory_TransactionID  PRIMARY KEY (Hub_TransID_SQN,Sat_TransHist_LDTS),
	CONSTRAINT R_97 FOREIGN KEY (Hub_TransID_SQN) REFERENCES Hub_TransID(Hub_TransID_SQN)
)
;



CREATE INDEX IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID ON Sat_TransHist
(
	ReferenceOrderID      ASC,
	ReferenceOrderLineID  ASC
)
;



CREATE TABLE Sat_ProdListPriceHist
(
	Hub_ProdNum_SQN       NUMERIC(12)  NOT NULL,
	Sat_ProdListPriceHist_LDTS  DATE  NOT NULL,
	Sat_ProdListPriceHist_LEDTS  DATE  ,
	Sat_ProdListPriceHist_RSRC  VARCHAR(18)  ,
	StartDate             TIMESTAMP  NOT NULL,
	EndDate               TIMESTAMP  ,
	ListPrice             DECIMAL(19,4)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ProductListPriceHistory_ProductID_StartDate  PRIMARY KEY (Hub_ProdNum_SQN,Sat_ProdListPriceHist_LDTS),
	CONSTRAINT R_95 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE TABLE Sat_ProdCostHist
(
	Hub_ProdNum_SQN       NUMERIC(12)  NOT NULL,
	Sat_ProdCostHist_LDTS  DATE  NOT NULL,
	Sat_ProdCostHist_LEDTS  DATE  ,
	Sat_ProdCostHist_RSRC  VARCHAR(18)  ,
	StartDate             TIMESTAMP  NOT NULL,
	EndDate               TIMESTAMP  ,
	StandardCost          DECIMAL(19,4)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ProductCostHistory_ProductID_StartDate  PRIMARY KEY (Hub_ProdNum_SQN,Sat_ProdCostHist_LDTS),
	CONSTRAINT R_94 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE TABLE Sat_ProdRev
(
	Hub_ProdNum_SQN       NUMERIC(12)  NOT NULL,
	Sat_ProdRev_LDTS      DATE  NOT NULL,
	Sat_ProdRev_LEDTS     DATE  ,
	Sat_ProdRev_RSRC      VARCHAR(18)  ,
	ProductReviewID       INTEGER  NOT NULL,
	ReviewerName          VARCHAR(50)  NOT NULL,
	ReviewDate            TIMESTAMP  NOT NULL,
	EmailAddress          VARCHAR(50)  NOT NULL,
	Rating                INTEGER  NOT NULL,
	Comments              VARCHAR(3850)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ProductReview_ProductReviewID  PRIMARY KEY (Hub_ProdNum_SQN,Sat_ProdRev_LDTS),
	CONSTRAINT R_93 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE INDEX IX_ProductReview_ProductID_Name ON Sat_ProdRev
(
	ReviewerName          ASC
)
;



CREATE TABLE Hub_Wrk_Ord
(
	Hub_WOID_SQN          NUMERIC(12)  NOT NULL,
	Hub_WOID_LDTS         DATE  NOT NULL,
	Hub_WOID_RSRC         VARCHAR(18)  ,
	WorkOrderID           INTEGER  NOT NULL,
	CONSTRAINT  PK_WorkOrder_WorkOrderID  PRIMARY KEY (Hub_WOID_SQN)
)
;



CREATE UNIQUE INDEX BK_WorkOrderID ON Hub_Wrk_Ord
(
	WorkOrderID           ASC
)
;



CREATE TABLE Sat_Wrk_Ord
(
	Hub_WOID_SQN          NUMERIC(12)  NOT NULL,
	Sat_WOID_LDTS         DATE  NOT NULL,
	Sat_WOID_LEDTS        DATE  ,
	Sat_WOID_RSRC         VARCHAR(18)  ,
	OrderQty              INTEGER  NOT NULL,
	StockedQty            INTEGER  NOT NULL,
	ScrappedQty           smallint  NOT NULL,
	StartDate             TIMESTAMP  NOT NULL,
	EndDate               TIMESTAMP  ,
	DueDate               TIMESTAMP  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_WorkOrder_WorkOrderID  PRIMARY KEY (Hub_WOID_SQN,Sat_WOID_LDTS),
	CONSTRAINT R_164 FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN)
)
;



CREATE TABLE Hub_EmpID
(
	Hub_EmpID_SQN         NUMERIC(12)  NOT NULL,
	Hub_EmpID_LDTS        DATE  NOT NULL,
	Hub_EmpID_RSRC        VARCHAR(18)  ,
	EmployeeID            INTEGER  NOT NULL,
	CONSTRAINT  PK_Employee_BusinessEntityID  PRIMARY KEY (Hub_EmpID_SQN)
)
;



CREATE UNIQUE INDEX BK_EmployeeID ON Hub_EmpID
(
	EmployeeID            ASC
)
;



CREATE TABLE Sat_EmpPayHist
(
	Hub_EmpID_SQN         NUMERIC(12)  NOT NULL,
	Sat_EmpPayHist_LDTS   DATE  NOT NULL,
	Sat_EmpPayHist_LEDTS  DATE  ,
	Sat_EmpPayHist_RSRC   VARCHAR(18)  ,
	RateChangeDate        TIMESTAMP  NOT NULL,
	Rate                  DECIMAL(19,4)  NOT NULL,
	PayFrequency          SMALLINT  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_EmployeePayHistory_BusinessEntityID_RateChangeDate  PRIMARY KEY (Hub_EmpID_SQN,Sat_EmpPayHist_LDTS),
	CONSTRAINT R_206 FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
;



CREATE TABLE ErrorLog
(
	ErrorLogID            INTEGER  NOT NULL,
	ErrorTime             TIMESTAMP  NOT NULL,
	UserName              VARCHAR(20)  NOT NULL,
	ErrorNumber           INTEGER  NOT NULL,
	ErrorSeverity         INTEGER  ,
	ErrorState            INTEGER  ,
	ErrorProcedure        VARCHAR(126)  ,
	ErrorLine             INTEGER  ,
	ErrorMessage          VARCHAR(4000)  NOT NULL,
	CONSTRAINT  PK_ErrorLog_ErrorLogID  PRIMARY KEY (ErrorLogID)
)
;



CREATE TABLE DatabaseLog
(
	DatabaseLogID         INTEGER  NOT NULL,
	PostTime              TIMESTAMP  NOT NULL,
	DatabaseUser          VARCHAR(20)  NOT NULL,
	Event                 VARCHAR(20)  NOT NULL,
	Schema                VARCHAR(20)  ,
	Object                VARCHAR(20)  ,
	TSQL                  VARCHAR(32672)  NOT NULL,
	XmlEvent              CLOB  NOT NULL,
	CONSTRAINT  PK_DatabaseLog_DatabaseLogID  PRIMARY KEY (DatabaseLogID)
)
;



CREATE TABLE TransactionHistoryArchive
(
	TransactionID         INTEGER  NOT NULL,
	ProductID             INTEGER  NOT NULL,
	ReferenceOrderID      INTEGER  NOT NULL,
	ReferenceOrderLineID  INTEGER  NOT NULL,
	TransactionDate       TIMESTAMP  NOT NULL,
	TransactionType       CHAR(1)  NOT NULL,
	Quantity              INTEGER  NOT NULL,
	ActualCost            DECIMAL(19,4)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_TransactionHistoryArchive_TransactionID  PRIMARY KEY (TransactionID)
)
;



CREATE INDEX IX_TransactionHistoryArchive_ProductID ON TransactionHistoryArchive
(
	ProductID             ASC
)
;



CREATE INDEX IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLine ON TransactionHistoryArchive
(
	ReferenceOrderID      ASC,
	ReferenceOrderLineID  ASC
)
;



CREATE TABLE AWBuildVersion
(
	SystemInformationID   SMALLINT  NOT NULL,
	Database_Version      VARCHAR(25)  NOT NULL,
	VersionDate           TIMESTAMP  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_AWBuildVersion_SystemInformationID  PRIMARY KEY (SystemInformationID)
)
;



CREATE TABLE Lnk_ProdNum_TransID
(
	Lnk_ProdNum_TransID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_TransID_LDTS  DATE  NOT NULL,
	Lnk_ProdNum_TransID_RSRC  VARCHAR(18)  ,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_TransID_SQN       NUMERIC(12)  ,
	CONSTRAINT  PK_TransactionHistory_TransactionID  PRIMARY KEY (Lnk_ProdNum_TransID_SQN),
	CONSTRAINT R_104 FOREIGN KEY (Hub_TransID_SQN) REFERENCES Hub_TransID(Hub_TransID_SQN),
	CONSTRAINT R_105 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_TransactionHistory ON Lnk_ProdNum_TransID
(
	Hub_TransID_SQN       ASC,
	Hub_ProdNum_SQN       ASC
)
;



CREATE TABLE Hub_CCID
(
	Hub_CCID_SQN          NUMERIC(12)  NOT NULL,
	Hub_CCID_LDTS         DATE  NOT NULL,
	Hub_CCID_RSRC         VARCHAR(18)  ,
	CreditCardID          INTEGER  NOT NULL,
	CONSTRAINT  PK_CreditCard_CreditCardID  PRIMARY KEY (Hub_CCID_SQN)
)
;



CREATE UNIQUE INDEX BK_CreditCardID ON Hub_CCID
(
	CreditCardID          ASC
)
;



CREATE TABLE Sat_CC
(
	Hub_CCID_SQN          NUMERIC(12)  NOT NULL,
	Sat_CC_LDTS           DATE  NOT NULL,
	Sat_CC_LEDTS          DATE  ,
	Sat_CC_RSRC           VARCHAR(18)  ,
	CardType              VARCHAR(50)  NOT NULL,
	CardNumber            VARCHAR(25)  NOT NULL,
	ExpMonth              SMALLINT  NOT NULL,
	ExpYear               smallint  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_CreditCard_CreditCardID  PRIMARY KEY (Hub_CCID_SQN,Sat_CC_LDTS),
	CONSTRAINT R_198 FOREIGN KEY (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN)
)
;



CREATE UNIQUE INDEX AK_CreditCard_CardNumber ON Sat_CC
(
	CardNumber            ASC
)
;



CREATE TABLE Hub_JobCandID
(
	Hub_JobCandID_SQN     NUMERIC(12)  NOT NULL,
	Hub_JobCandID_LDTS    DATE  NOT NULL,
	Hub_JobCandID_RSRC    VARCHAR(18)  ,
	JobCandidateID        INTEGER  NOT NULL,
	CONSTRAINT  PK_JobCandidate_JobCandidateID  PRIMARY KEY (Hub_JobCandID_SQN)
)
;



CREATE UNIQUE INDEX BK_JobCandidateID ON Hub_JobCandID
(
	JobCandidateID        ASC
)
;



CREATE TABLE Sat_JobCand
(
	Hub_JobCandID_SQN     NUMERIC(12)  NOT NULL,
	Sat_JobCand_LDTS      DATE  NOT NULL,
	Sat_JobCand_LEDTS     DATE  ,
	Sat_JobCand_RSRC      VARCHAR(18)  ,
	Resume                CLOB  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_JobCandidate_JobCandidateID  PRIMARY KEY (Hub_JobCandID_SQN,Sat_JobCand_LDTS),
	CONSTRAINT R_209 FOREIGN KEY (Hub_JobCandID_SQN) REFERENCES Hub_JobCandID(Hub_JobCandID_SQN)
)
;



CREATE TABLE Lnk_WOID_LocID
(
	Lnk_WOID_LocID_WOOpSeqID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_WOID_LocID_WOOpSeqID_LDTS  DATE  NOT NULL,
	Lnk_WOID_LocID_WOOpSeqID_RSRC  VARCHAR(18)  ,
	Hub_WOID_SQN          NUMERIC(12)  ,
	Hub_LocID_SQN         NUMERIC(12)  ,
	Oper_Seq              smallint  NOT NULL,
	CONSTRAINT  PK_WorkOrderRouting  PRIMARY KEY (Lnk_WOID_LocID_WOOpSeqID_SQN),
	CONSTRAINT R_168 FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN),
	CONSTRAINT R_169 FOREIGN KEY (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
;



CREATE UNIQUE INDEX AK_WorkOrderRouting ON Lnk_WOID_LocID
(
	Hub_WOID_SQN          ASC,
	Hub_LocID_SQN         ASC,
	Oper_Seq              ASC
)
;



CREATE TABLE Sat_WOID_LocID
(
	Lnk_WOID_LocID_SQN    NUMERIC(12)  NOT NULL,
	Sat_WOID_LocID_LDTS   DATE  NOT NULL,
	Sat_WOID_LocID_LEDTS  DATE  ,
	Sat_WOID_LocID_RSRC   VARCHAR(18)  ,
	ScheduledStartDate    TIMESTAMP  NOT NULL,
	ScheduledEndDate      TIMESTAMP  NOT NULL,
	ActualStartDate       TIMESTAMP  ,
	ActualEndDate         TIMESTAMP  ,
	ActualResourceHrs     decimal(9,4)  ,
	PlannedCost           DECIMAL(19,4)  NOT NULL,
	ActualCost            DECIMAL(19,4)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence  PRIMARY KEY (Lnk_WOID_LocID_SQN,Sat_WOID_LocID_LDTS),
	CONSTRAINT R_180 FOREIGN KEY (Lnk_WOID_LocID_SQN) REFERENCES Lnk_WOID_LocID(Lnk_WOID_LocID_WOOpSeqID_SQN)
)
;



CREATE TABLE Hub_PersID
(
	Hub_PersID_SQN        NUMERIC(12)  NOT NULL,
	Hub_PersID_LDTS       DATE  NOT NULL,
	Hub_PersID_RSRC       VARCHAR(18)  ,
	PersonID              INTEGER  NOT NULL,
	CONSTRAINT  PK_Person_BusinessEntityID  PRIMARY KEY (Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX BK_PersonID ON Hub_PersID
(
	PersonID              ASC
)
;



CREATE TABLE Hub_BusEntID
(
	Hub_BusEntID_SQN      NUMERIC(12)  NOT NULL,
	Hub_BusEntID_LDTS     DATE  NOT NULL,
	Hub_BusEntID_RSRC     VARCHAR(18)  ,
	BusinessEntityID      INTEGER  NOT NULL,
	CONSTRAINT  PK_BusinessEntity_BusinessEntityID  PRIMARY KEY (Hub_BusEntID_SQN)
)
;



CREATE UNIQUE INDEX BK_BusinessEntityID ON Hub_BusEntID
(
	BusinessEntityID      ASC
)
;



CREATE TABLE Lnk_PersID_BusEntID
(
	Lnk_PersID_BusEntID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_PersID_BusEntID_LDTS  DATE  NOT NULL,
	Lnk_PersID_BusEntID_RSRC  VARCHAR(18)  ,
	Hub_BusEntID_SQN      NUMERIC(12)  ,
	Hub_PersID_SQN        NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_PersID_BEID  PRIMARY KEY (Lnk_PersID_BusEntID_SQN),
	CONSTRAINT R_269 FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	CONSTRAINT R_270 FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_PersID_BEID ON Lnk_PersID_BusEntID
(
	Hub_PersID_SQN        ASC,
	Hub_BusEntID_SQN      ASC
)
;



CREATE TABLE Hub_ScrapID
(
	Hub_ScrapID_SQN       NUMERIC(12)  NOT NULL,
	Hub_ScrapID_LDTS      DATE  NOT NULL,
	Hub_ScrapID_RSRC      VARCHAR(18)  ,
	ScrapReasonID         smallint  NOT NULL,
	CONSTRAINT  PK_ScrapReason_ScrapReasonID  PRIMARY KEY (Hub_ScrapID_SQN)
)
;



CREATE UNIQUE INDEX BK_ScrapReasonID ON Hub_ScrapID
(
	ScrapReasonID         ASC
)
;



CREATE TABLE Lnk_Wrk_Ord_ScrapID
(
	Lnk_WOID_ScrapID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_WOID_ScrapID_LDTS  DATE  NOT NULL,
	Lnk_WOID_ScrapID_RSRC  VARCHAR(18)  ,
	Hub_WOID_SQN          NUMERIC(12)  NOT NULL,
	Hub_ScrapID_SQN       NUMERIC(12)  NOT NULL,
	CONSTRAINT  PK_ScrapReason_ScrapReasonID  PRIMARY KEY (Lnk_WOID_ScrapID_SQN),
	CONSTRAINT R_165 FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN),
	CONSTRAINT R_166 FOREIGN KEY (Hub_ScrapID_SQN) REFERENCES Hub_ScrapID(Hub_ScrapID_SQN)
)
;



CREATE UNIQUE INDEX AK_ScrapReason ON Lnk_Wrk_Ord_ScrapID
(
	Hub_WOID_SQN          ASC,
	Hub_ScrapID_SQN       ASC
)
;



CREATE TABLE Lnk_SOrdNum_CCID
(
	Lnk_SOrdNum_CCID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_SOrdNum_CCID_LDTS  DATE  NOT NULL,
	Lnk_SOrdNum_CCID_RSRC  VARCHAR(18)  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  ,
	Hub_CCID_SQN          NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_SOrdNum_Add  PRIMARY KEY (Lnk_SOrdNum_CCID_SQN),
	CONSTRAINT R_196 FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	CONSTRAINT R_197 FOREIGN KEY (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_Add ON Lnk_SOrdNum_CCID
(
	Hub_SOrdNum_SQN       ASC,
	Hub_CCID_SQN          ASC
)
;



CREATE TABLE Sat_Scrap
(
	Hub_ScrapID_SQN       NUMERIC(12)  NOT NULL,
	Sat_Scrap_LDTS        DATE  NOT NULL,
	Sat_Scrap_LEDTS       DATE  ,
	Sat_Scrap_RSRC        VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ScrapReason_ScrapReasonID  PRIMARY KEY (Hub_ScrapID_SQN,Sat_Scrap_LDTS),
	CONSTRAINT R_167 FOREIGN KEY (Hub_ScrapID_SQN) REFERENCES Hub_ScrapID(Hub_ScrapID_SQN)
)
;



CREATE UNIQUE INDEX AK_ScrapReason_Name ON Sat_Scrap
(
	Name                  ASC
)
;



CREATE TABLE Sat_Prod
(
	Hub_ProdNum_SQN       NUMERIC(12)  NOT NULL,
	Sat_Prod_LDTS         DATE  NOT NULL,
	Sat_Prod_LEDTS        DATE  ,
	Sat_Prod_RSRC         VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	MakeFlag              SMALLINT  NOT NULL,
	FinishedGoodsFlag     SMALLINT  NOT NULL,
	Color                 VARCHAR(15)  ,
	SafetyStockLevel      smallint  NOT NULL,
	ReorderPoint          smallint  NOT NULL,
	StandardCost          DECIMAL(19,4)  NOT NULL,
	ListPrice             DECIMAL(19,4)  NOT NULL,
	Size                  VARCHAR(5)  ,
	Weight                decimal(8,2)  ,
	DaysToManufacture     INTEGER  NOT NULL,
	ProductLine           CHAR(2)  ,
	Class                 CHAR(2)  ,
	Style                 CHAR(2)  ,
	SellStartDate         TIMESTAMP  NOT NULL,
	SellEndDate           TIMESTAMP  ,
	DiscontinuedDate      TIMESTAMP  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Product_ProductID  PRIMARY KEY (Hub_ProdNum_SQN,Sat_Prod_LDTS),
	CONSTRAINT R_92 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Product_Name ON Sat_Prod
(
	Name                  ASC
)
;



CREATE TABLE Lnk_SOrdNum_AddID
(
	Lnk_SOrdNum_AddID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_SOrdNum_AddID_LDTS  DATE  NOT NULL,
	Lnk_SOrdNum_AddID_RSRC  VARCHAR(18)  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  ,
	Hub_AddID_BillTo_SQN  NUMERIC(12)  ,
	Hub_AddID_ShipTo_SQN  NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_SOrdNum_Add  PRIMARY KEY (Lnk_SOrdNum_AddID_SQN),
	CONSTRAINT R_287 FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	CONSTRAINT R_288 FOREIGN KEY (Hub_AddID_BillTo_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN),
	CONSTRAINT R_290 FOREIGN KEY (Hub_AddID_ShipTo_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_Add ON Lnk_SOrdNum_AddID
(
	Hub_SOrdNum_SQN       ASC,
	Hub_AddID_BillTo_SQN  ASC,
	Hub_AddID_ShipTo_SQN  ASC
)
;



CREATE TABLE Lnk_ProdNum_WOID
(
	Lnk_ProdNum_WOID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_WOID_LDTS  DATE  NOT NULL,
	Lnk_ProdNum_WOID_RSRC  VARCHAR(18)  ,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_WOID_SQN          NUMERIC(12)  ,
	CONSTRAINT  PK_WorkOrder_WorkOrderID  PRIMARY KEY (Lnk_ProdNum_WOID_SQN),
	CONSTRAINT R_162 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_163 FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN)
)
;



CREATE UNIQUE INDEX AK_WorkOrder ON Lnk_ProdNum_WOID
(
	Hub_ProdNum_SQN       ASC,
	Hub_WOID_SQN          ASC
)
;



CREATE TABLE Lnk_DocNode_EmpID
(
	Lnk_DocNode_EmpID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_DocNode_EmpID_LDTS  DATE  NOT NULL,
	Lnk_DocNode_EmpID_RSRC  VARCHAR(18)  ,
	Hub_EmpID_SQN         NUMERIC(12)  NOT NULL,
	Hub_DocNode_SQN       NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_DocNode_Emp  PRIMARY KEY (Lnk_DocNode_EmpID_SQN),
	CONSTRAINT R_203 FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT R_204 FOREIGN KEY (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_DocNode_Emp ON Lnk_DocNode_EmpID
(
	Hub_EmpID_SQN         ASC,
	Hub_DocNode_SQN       ASC
)
;



CREATE TABLE Lnk_ProdNum_LocID
(
	Lnk_ProdNum_LocID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_LocID_LDTS  DATE  NOT NULL,
	Lnk_ProdINum_LocID_RSRC  VARCHAR(18)  ,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_LocID_SQN         NUMERIC(12)  ,
	CONSTRAINT  PK_ProductInventory_ProductID_LocationID  PRIMARY KEY (Lnk_ProdNum_LocID_SQN),
	CONSTRAINT R_159 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_160 FOREIGN KEY (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductInventory ON Lnk_ProdNum_LocID
(
	Hub_ProdNum_SQN       ASC,
	Hub_LocID_SQN         ASC
)
;



CREATE TABLE Sat_Prod_Loc
(
	Lnk_ProdNum_LocID_SQN  NUMERIC(12)  NOT NULL,
	Sat_Prod_Loc_LDTS     DATE  NOT NULL,
	Sat_Prod_Loc_LEDTS    DATE  ,
	Sat_Prod_Loc_RSRC     VARCHAR(18)  ,
	Shelf                 VARCHAR(10)  NOT NULL,
	Bin                   SMALLINT  NOT NULL,
	Quantity              smallint  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ProductInventory_ProductID_LocationID  PRIMARY KEY (Lnk_ProdNum_LocID_SQN,Sat_Prod_Loc_LDTS),
	CONSTRAINT R_158 FOREIGN KEY (Lnk_ProdNum_LocID_SQN) REFERENCES Lnk_ProdNum_LocID(Lnk_ProdNum_LocID_SQN)
)
;



CREATE TABLE Sat_Pers
(
	Hub_PersID_SQN        NUMERIC(12)  NOT NULL,
	Sat_Pers_LDTS         DATE  NOT NULL,
	Sat_Pers_LEDTS        DATE  ,
	Sat_Pers_RSRC         VARCHAR(18)  ,
	PersonType            CHAR(2)  NOT NULL,
	NameStyle             SMALLINT  NOT NULL,
	Title                 VARCHAR(8)  ,
	FirstName             VARCHAR(50)  NOT NULL,
	MiddleName            VARCHAR(50)  ,
	LastName              VARCHAR(50)  NOT NULL,
	Suffix                VARCHAR(10)  ,
	EmailPromotion        INTEGER  NOT NULL,
	AdditionalContactInfo  CLOB  ,
	Demographics          CLOB  ,
	rowguid               INTEGER  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Person_BusinessEntityID  PRIMARY KEY (Hub_PersID_SQN,Sat_Pers_LDTS),
	CONSTRAINT R_202 FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX AK_Person_rowguid ON Sat_Pers
(
	rowguid               ASC
)
;



CREATE INDEX IX_Person_LastName_FirstName_MiddleName ON Sat_Pers
(
	LastName              ASC,
	FirstName             ASC,
	MiddleName            ASC
)
;



CREATE TABLE Sat_Emp
(
	Hub_EmpID_SQN         NUMERIC(12)  NOT NULL,
	Sat_Emp_LDTS          DATE  NOT NULL,
	Sat_Emp_LEDTS         DATE  ,
	Sat_Emp_RSRC          VARCHAR(18)  ,
	NationalIDNumber      VARCHAR(15)  NOT NULL,
	LoginID               VARCHAR(256)  NOT NULL,
	OrganizationNode      CHAR(18)  NOT NULL,
	OrganizationLevel     smallint  ,
	JobTitle              VARCHAR(50)  NOT NULL,
	BirthDate             date  NOT NULL,
	MaritalStatus         CHAR(1)  NOT NULL,
	Gender                CHAR(1)  NOT NULL,
	HireDate              date  NOT NULL,
	SalariedFlag          SMALLINT  NOT NULL,
	VacationHours         smallint  NOT NULL,
	SickLeaveHours        smallint  NOT NULL,
	CurrentFlag           SMALLINT  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Employee_BusinessEntityID  PRIMARY KEY (Hub_EmpID_SQN,Sat_Emp_LDTS),
	CONSTRAINT R_205 FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
;



CREATE UNIQUE INDEX AK_Employee_OrganizationNode ON Sat_Emp
(
	OrganizationNode      ASC
)
;



CREATE UNIQUE INDEX AK_Employee_OrganizationLevel_OrganizationNode ON Sat_Emp
(
	OrganizationLevel     ASC,
	OrganizationNode      ASC
)
;



CREATE UNIQUE INDEX AK_Employee_LoginID ON Sat_Emp
(
	LoginID               ASC
)
;



CREATE UNIQUE INDEX AK_Employee_NationalIDNumber ON Sat_Emp
(
	NationalIDNumber      ASC
)
;



CREATE TABLE Hub_ProdDescID
(
	Hub_ProdDescID_SQN    NUMERIC(12)  NOT NULL,
	Hub_ProdDescID_LDTS   DATE  NOT NULL,
	Hub_ProdDescID_RSRC   VARCHAR(18)  ,
	ProductDescriptionID  INTEGER  NOT NULL,
	CONSTRAINT  PK_ProductDescription_ProductDescriptionID  PRIMARY KEY (Hub_ProdDescID_SQN)
)
;



CREATE UNIQUE INDEX BK_ProductDescriptionID ON Hub_ProdDescID
(
	ProductDescriptionID  ASC
)
;



CREATE TABLE Sat_ProdDesc
(
	Hub_ProdDescID_SQN    NUMERIC(12)  NOT NULL,
	Sat_ProdDesc_LDTS     DATE  NOT NULL,
	Sat_ProdDesc_LEDTS    DATE  ,
	Sat_ProdDesc_RSRC     VARCHAR(18)  ,
	Description           VARCHAR(400)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ProductDescription_ProductDescriptionID  PRIMARY KEY (Hub_ProdDescID_SQN,Sat_ProdDesc_LDTS),
	CONSTRAINT R_149 FOREIGN KEY (Hub_ProdDescID_SQN) REFERENCES Hub_ProdDescID(Hub_ProdDescID_SQN)
)
;



CREATE TABLE Hub_CultID
(
	Hub_CultID_SQN        NUMERIC(12)  NOT NULL,
	Hub_CultID_LDTS       DATE  NOT NULL,
	Hub_CultID_RSRC       VARCHAR(18)  ,
	CultureID             CHAR(6)  NOT NULL,
	CONSTRAINT  PK_Culture_CultureID  PRIMARY KEY (Hub_CultID_SQN)
)
;



CREATE UNIQUE INDEX BK_CultureID ON Hub_CultID
(
	CultureID             ASC
)
;



CREATE TABLE Sat_Cult
(
	Hub_CultID_SQN        NUMERIC(12)  NOT NULL,
	Sat_Cult_LDTS         DATE  NOT NULL,
	Sat_Cult_LEDTS        DATE  ,
	Sat_Cult_RSRC         VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Culture_CultureID  PRIMARY KEY (Hub_CultID_SQN,Sat_Cult_LDTS),
	CONSTRAINT R_148 FOREIGN KEY (Hub_CultID_SQN) REFERENCES Hub_CultID(Hub_CultID_SQN)
)
;



CREATE UNIQUE INDEX AK_Culture_Name ON Sat_Cult
(
	Name                  ASC
)
;



CREATE TABLE Hub_ModID
(
	Hub_ModID_SQN         NUMERIC(12)  NOT NULL,
	Hub_ModID_LDTS        DATE  NOT NULL,
	Hub_ModID_RSRC        VARCHAR(18)  ,
	ProductModelID        INTEGER  NOT NULL,
	CONSTRAINT  PK_ProductModel_ProductModelID  PRIMARY KEY (Hub_ModID_SQN)
)
;



CREATE UNIQUE INDEX BK_ProductModelID ON Hub_ModID
(
	ProductModelID        ASC
)
;



CREATE TABLE Lnk_ModID_ProdDescID_CultID
(
	Lnk_ModID_ProdDescID_CultID_SQ  NUMERIC(12)  NOT NULL,
	Lnk_ModID_ProdDescID_CultID_LD  DATE  NOT NULL,
	Lnk_ModID_ProdDescID_CultID_RS  VARCHAR(18)  ,
	Hub_ModID_SQN         NUMERIC(12)  NOT NULL,
	Hub_CultID_SQN        NUMERIC(12)  ,
	Hub_ProdDescID_SQN    NUMERIC(12)  ,
	CONSTRAINT  PK_ProductModelProductDescriptionCulture_ProductModelID_ProductD  PRIMARY KEY (Lnk_ModID_ProdDescID_CultID_SQ),
	CONSTRAINT R_151 FOREIGN KEY (Hub_CultID_SQN) REFERENCES Hub_CultID(Hub_CultID_SQN),
	CONSTRAINT R_152 FOREIGN KEY (Hub_ProdDescID_SQN) REFERENCES Hub_ProdDescID(Hub_ProdDescID_SQN),
	CONSTRAINT R_153 FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductModelProductDescriptionCulture ON Lnk_ModID_ProdDescID_CultID
(
	Hub_CultID_SQN        ASC,
	Hub_ProdDescID_SQN    ASC,
	Hub_ModID_SQN         ASC
)
;



CREATE TABLE Sat_ProdMod_ProdDesc_Cult
(
	Lnk_ModID_ProdDescID_CultID_SQ  NUMERIC(12)  NOT NULL,
	Sat_Mod_ProdDesc_Cult_LDTS  DATE  NOT NULL,
	Sat_Mod_ProdDesc_Cult__LEDTS  DATE  ,
	Sat_Mod_ProdDesc_Cult__RSRC  VARCHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ProductModelProductDescriptionCulture_ProductModelID_ProductD  PRIMARY KEY (Lnk_ModID_ProdDescID_CultID_SQ,Sat_Mod_ProdDesc_Cult_LDTS),
	CONSTRAINT R_150 FOREIGN KEY (Lnk_ModID_ProdDescID_CultID_SQ) REFERENCES Lnk_ModID_ProdDescID_CultID(Lnk_ModID_ProdDescID_CultID_SQ)
)
;



CREATE TABLE Hub_IllID
(
	Hub_IllID_SQN         NUMERIC(12)  NOT NULL,
	Hub_IllID_LDTS        DATE  NOT NULL,
	Hub_IllID_RSRC        VARCHAR(18)  ,
	IllustrationID        INTEGER  NOT NULL,
	CONSTRAINT  PK_Illustration_IllustrationID  PRIMARY KEY (Hub_IllID_SQN)
)
;



CREATE UNIQUE INDEX BK_IllustrationID ON Hub_IllID
(
	IllustrationID        ASC
)
;



CREATE TABLE Lnk_ModID_IllID
(
	Lnk_ModID_IllID_SQN   NUMERIC(12)  NOT NULL,
	Lnk_ModID_IllID_LDTS  DATE  NOT NULL,
	Lnk_ModID_IllID_RSRC  VARCHAR(18)  ,
	Hub_ModID_SQN         NUMERIC(12)  ,
	Hub_IllID_SQN         NUMERIC(12)  ,
	CONSTRAINT  PK_ProductModelIllustration_ProductModelID_IllustrationID  PRIMARY KEY (Lnk_ModID_IllID_SQN),
	CONSTRAINT R_145 FOREIGN KEY (Hub_IllID_SQN) REFERENCES Hub_IllID(Hub_IllID_SQN),
	CONSTRAINT R_146 FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductModelIllustration ON Lnk_ModID_IllID
(
	Hub_IllID_SQN         ASC,
	Hub_ModID_SQN         ASC
)
;



CREATE TABLE Sat_ProdMod_Ill
(
	Lnk_ModID_IllID_SQN   NUMERIC(12)  NOT NULL,
	Sat_ProdMod_Ill_LDTS  DATE  NOT NULL,
	Sat_ProdMod_Ill_LEDTS  DATE  ,
	Sat_ProdMod_Ill_RSRC  VARCHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ProductModelIllustration_ProductModelID_IllustrationID  PRIMARY KEY (Lnk_ModID_IllID_SQN,Sat_ProdMod_Ill_LDTS),
	CONSTRAINT R_147 FOREIGN KEY (Lnk_ModID_IllID_SQN) REFERENCES Lnk_ModID_IllID(Lnk_ModID_IllID_SQN)
)
;



CREATE TABLE Sat_Illustraion
(
	Hub_IllID_SQN         NUMERIC(12)  NOT NULL,
	Sat_Ill_LDTS          DATE  NOT NULL,
	Sat_Ill_LEDTS         DATE  ,
	Sat_Ill_RSRC          VARCHAR(18)  ,
	Diagram               CLOB  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Illustration_IllustrationID  PRIMARY KEY (Hub_IllID_SQN,Sat_Ill_LDTS),
	CONSTRAINT R_144 FOREIGN KEY (Hub_IllID_SQN) REFERENCES Hub_IllID(Hub_IllID_SQN)
)
;



CREATE TABLE Hub_POID
(
	Hub_POID_SQN          NUMERIC(12)  NOT NULL,
	Hub_POID_LDTS         DATE  NOT NULL,
	Hub_POID_RSRC         VARCHAR(18)  ,
	PurchaseOrderID       INTEGER  NOT NULL,
	CONSTRAINT  PK_PurchaseOrderHeader_PurchaseOrderID  PRIMARY KEY (Hub_POID_SQN)
)
;



CREATE UNIQUE INDEX BK_PurchaseOrderHeaderID ON Hub_POID
(
	PurchaseOrderID       ASC
)
;



CREATE TABLE Sat_POHead
(
	Hub_POID_SQN          NUMERIC(12)  NOT NULL,
	Sat_POHead_LDTS       DATE  NOT NULL,
	Sat_POHead_LEDTS      DATE  ,
	Sat_POHead_RSRC       VARCHAR(18)  ,
	RevisionNumber        SMALLINT  NOT NULL,
	Status                SMALLINT  NOT NULL,
	OrderDate             TIMESTAMP  NOT NULL,
	ShipDate              TIMESTAMP  ,
	SubTotal              DECIMAL(19,4)  NOT NULL,
	TaxAmt                DECIMAL(19,4)  NOT NULL,
	Freight               DECIMAL(19,4)  NOT NULL,
	TotalDue              DECIMAL(19,4)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_PurchaseOrderHeader_PurchaseOrderID  PRIMARY KEY (Hub_POID_SQN,Sat_POHead_LDTS),
	CONSTRAINT R_232 FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
;



CREATE TABLE Lnk_EmpID_JobCandID
(
	Lnk_EmpID_JobCandID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_EmpID_JobCandID_LDTS  DATE  NOT NULL,
	Lnk_EmpID_JobCandID_RSRC  VARCHAR(18)  ,
	Hub_EmpID_SQN         NUMERIC(12)  ,
	Hub_JobCandID_SQN     NUMERIC(12)  ,
	CONSTRAINT  PK_JobCandidate_JobCandidateID  PRIMARY KEY (Lnk_EmpID_JobCandID_SQN),
	CONSTRAINT R_207 FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT R_208 FOREIGN KEY (Hub_JobCandID_SQN) REFERENCES Hub_JobCandID(Hub_JobCandID_SQN)
)
;



CREATE UNIQUE INDEX AK_JobCandidate ON Lnk_EmpID_JobCandID
(
	Hub_EmpID_SQN         ASC,
	Hub_JobCandID_SQN     ASC
)
;



CREATE TABLE Lnk_ProdNum_ModID
(
	Lnk_ProdNum_ModID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_ModID_LDTS  DATE  NOT NULL,
	Lnk_ProdNum_ModID_RSRC  VARCHAR(18)  ,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_ModID_SQN         NUMERIC(12)  ,
	CONSTRAINT  PK_ProductModel_ProductModelID  PRIMARY KEY (Lnk_ProdNum_ModID_SQN),
	CONSTRAINT R_139 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_142 FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductModel ON Lnk_ProdNum_ModID
(
	Hub_ProdNum_SQN       ASC,
	Hub_ModID_SQN         ASC
)
;



CREATE TABLE Sat_Mod
(
	Hub_ModID_SQN         NUMERIC(12)  NOT NULL,
	Sat_Mod_LDTS          DATE  NOT NULL,
	Sat_Mod_LEDTS         DATE  ,
	Sat_Mod_RSRC          VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	CatalogDescription    CLOB  ,
	Instructions          CLOB  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ProductModel_ProductModelID  PRIMARY KEY (Hub_ModID_SQN,Sat_Mod_LDTS),
	CONSTRAINT R_143 FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductModel_Name ON Sat_Mod
(
	Name                  ASC
)
;



CREATE TABLE Sat_SRsn
(
	Hub_SRsnID_SQN        NUMERIC(12)  NOT NULL,
	Sat_SRsn_LDTS         DATE  NOT NULL,
	Sat_SRsn_LEDTS        DATE  ,
	Sat_SRsn_RSRC         VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ReasonType            VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SalesReason_SalesReasonID  PRIMARY KEY (Hub_SRsnID_SQN,Sat_SRsn_LDTS),
	CONSTRAINT R_190 FOREIGN KEY (Hub_SRsnID_SQN) REFERENCES Hub_SRsnID(Hub_SRsnID_SQN)
)
;



CREATE TABLE Lnk_PersID_CCID
(
	Lnk_PersID_CCID_SQN   NUMERIC(12)  NOT NULL,
	Lnk_PersID_CCID_LDTS  DATE  NOT NULL,
	Lnk_PersID_CCID_RSRC  VARCHAR(18)  ,
	Hub_PersID_SQN        NUMERIC(12)  ,
	Hub_CCID_SQN          NUMERIC(12)  ,
	CONSTRAINT  PK_PersonCreditCard_BusinessEntityID_CreditCardID  PRIMARY KEY (Lnk_PersID_CCID_SQN),
	CONSTRAINT R_199 FOREIGN KEY (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN),
	CONSTRAINT R_201 FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX AK_PersonCreditCard ON Lnk_PersID_CCID
(
	Hub_PersID_SQN        ASC,
	Hub_CCID_SQN          ASC
)
;



CREATE TABLE Sat_PersID_CCID
(
	Lnk_PersID_CCID_SQN   NUMERIC(12)  NOT NULL,
	Sat_PersID_CCID_LDTS  DATE  NOT NULL,
	Sat_PersID_CCID_LEDTS  DATE  ,
	Sat_PersID_CCID_RSRC  VARCHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_PersonCreditCard_BusinessEntityID_CreditCardID  PRIMARY KEY (Lnk_PersID_CCID_SQN,Sat_PersID_CCID_LDTS),
	CONSTRAINT R_200 FOREIGN KEY (Lnk_PersID_CCID_SQN) REFERENCES Lnk_PersID_CCID(Lnk_PersID_CCID_SQN)
)
;



CREATE TABLE Sat_SOrd
(
	Hub_SOrdNum_SQN       NUMERIC(12)  NOT NULL,
	Sat_SOrd_LDTS         DATE  NOT NULL,
	Sat_SOrd_LEDTS        DATE  ,
	Sat_SOrd_RSRC         VARCHAR(18)  ,
	RevisionNumber        SMALLINT  NOT NULL,
	OrderDate             TIMESTAMP  NOT NULL,
	DueDate               TIMESTAMP  NOT NULL,
	ShipDate              TIMESTAMP  ,
	Status                SMALLINT  NOT NULL,
	OnlineOrderFlag       SMALLINT  NOT NULL,
	PurchaseOrderNumber   VARCHAR(25)  ,
	AccountNumber         VARCHAR(15)  ,
	CreditCardApprovalCode  varchar(15)  ,
	SubTotal              DECIMAL(19,4)  NOT NULL,
	TaxAmt                DECIMAL(19,4)  NOT NULL,
	Freight               DECIMAL(19,4)  NOT NULL,
	TotalDue              DECIMAL(19,4)  NOT NULL,
	Comment               VARCHAR(128)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SalesOrderHeader_SalesOrderID  PRIMARY KEY (Hub_SOrdNum_SQN,Sat_SOrd_LDTS),
	CONSTRAINT R_187 FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE TABLE Sat_Doc
(
	Hub_DocNode_SQN       NUMERIC(12)  NOT NULL,
	Sat_Doc_LDTS          DATE  NOT NULL,
	Sat_Doc_LEDTS         DATE  ,
	Sat_Doc_RSRC          VARCHAR(18)  ,
	DocumentLevel         smallint  ,
	Title                 VARCHAR(50)  NOT NULL,
	FolderFlag            SMALLINT  NOT NULL,
	FileName              VARCHAR(400)  NOT NULL,
	FileExtension         VARCHAR(8)  NOT NULL,
	Revision              CHAR(5)  NOT NULL,
	ChangeNumber          INTEGER  NOT NULL,
	Status                SMALLINT  NOT NULL,
	DocumentSummary       VARCHAR(32672)  ,
	Document              LONG VARGRAPHIC  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	PersonID              CHAR(18)  ,
	CONSTRAINT  PK_Document_DocumentNode  PRIMARY KEY (Hub_DocNode_SQN,Sat_Doc_LDTS),
	CONSTRAINT R_193 FOREIGN KEY (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN)
)
;



CREATE UNIQUE INDEX AK_Document_DocumentLevel_DocumentNode ON Sat_Doc
(
	DocumentLevel         ASC
)
;



CREATE INDEX IX_Document_FileName_Revision ON Sat_Doc
(
	FileName              ASC,
	Revision              ASC
)
;



CREATE TABLE Hub_VendNum
(
	Hub_VendNum_SQN       NUMERIC(12)  NOT NULL,
	Hub_VendNum_LDTS      DATE  NOT NULL,
	Hub_VendNum_RSRC      VARCHAR(18)  ,
	AccountNumber         VARCHAR(15)  NOT NULL,
	CONSTRAINT  PK_Vendor_BusinessEntityID  PRIMARY KEY (Hub_VendNum_SQN)
)
;



CREATE UNIQUE INDEX BK_AccountNumber ON Hub_VendNum
(
	AccountNumber         ASC
)
;



CREATE TABLE Lnk_BusEntID_VendNum
(
	Lnk_BusEntID_VendNum_SQN  NUMERIC(12)  NOT NULL,
	Lnk_BusEntID_VendNum_LDTS  DATE  NOT NULL,
	Lnk_BusEntID_VendNum_RSRC  VARCHAR(18)  ,
	Hub_BusEntID_SQN      NUMERIC(12)  ,
	Hub_VendNum_SQN       NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_BusEntID_AcctNum  PRIMARY KEY (Lnk_BusEntID_VendNum_SQN),
	CONSTRAINT R_272 FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT R_275 FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_BusEntID_AcctNum ON Lnk_BusEntID_VendNum
(
	Hub_BusEntID_SQN      ASC,
	Hub_VendNum_SQN       ASC
)
;



CREATE TABLE Hub_EmailAddID
(
	Hub_EmailAddID_SQN    NUMERIC(12)  NOT NULL,
	Hub_EmailAddID_LDTS   DATE  NOT NULL,
	Hub_EmailAddID_RSRC   VARCHAR(18)  ,
	EmailAddressID        INTEGER  NOT NULL,
	CONSTRAINT  PK_EmailAddress_BusinessEntityID_EmailAddressID  PRIMARY KEY (Hub_EmailAddID_SQN)
)
;



CREATE UNIQUE INDEX BK_EmailAddressID ON Hub_EmailAddID
(
	EmailAddressID        ASC
)
;



CREATE TABLE Lnk_PersID_EmailAddID
(
	Lnk_PersID_EmailAddID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_PersID_EmailAddID_LDTS  DATE  NOT NULL,
	Lnk_PersID_EmailAddID_RSRC  VARCHAR(18)  ,
	Hub_PersID_SQN        NUMERIC(12)  ,
	Hub_EmailAddID_SQN    NUMERIC(12)  ,
	CONSTRAINT  PK_EmailAddress_BusinessEntityID_EmailAddressID  PRIMARY KEY (Lnk_PersID_EmailAddID_SQN),
	CONSTRAINT R_217 FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	CONSTRAINT R_218 FOREIGN KEY (Hub_EmailAddID_SQN) REFERENCES Hub_EmailAddID(Hub_EmailAddID_SQN)
)
;



CREATE UNIQUE INDEX AK_EmailAddress ON Lnk_PersID_EmailAddID
(
	Hub_PersID_SQN        ASC,
	Hub_EmailAddID_SQN    ASC
)
;



CREATE TABLE Hub_ShiftID
(
	Hub_ShiftID_SQN       NUMERIC(12)  NOT NULL,
	Hub_ShiftID_LDTS      DATE  NOT NULL,
	Hub_ShiftID_RSRC      VARCHAR(18)  ,
	ShiftID               SMALLINT  NOT NULL,
	CONSTRAINT  PK_Shift_ShiftID  PRIMARY KEY (Hub_ShiftID_SQN)
)
;



CREATE UNIQUE INDEX BK_ShiftID ON Hub_ShiftID
(
	ShiftID               ASC
)
;



CREATE TABLE Hub_DepID
(
	Hub_DepID_SQN         NUMERIC(12)  NOT NULL,
	Hub_DepID_LDTS        DATE  NOT NULL,
	Hub_DepID_RSRC        VARCHAR(18)  ,
	DepartmentID          smallint  NOT NULL,
	CONSTRAINT  PK_Department_DepartmentID  PRIMARY KEY (Hub_DepID_SQN)
)
;



CREATE UNIQUE INDEX BK_DepartmentID ON Hub_DepID
(
	DepartmentID          ASC
)
;



CREATE TABLE Lnk_EmpID_DepID_ShiftID
(
	Lnk_EmpID_DepID_ShiftID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_EmpID_DepID_ShiftID_LDTS  DATE  NOT NULL,
	Lnk_EmpID_DepID_ShiftID_RSRC  VARCHAR(18)  ,
	Hub_EmpID_SQN         NUMERIC(12)  ,
	Hub_DepID_SQN         NUMERIC(12)  ,
	Hub_ShiftID_SQN       NUMERIC(12)  ,
	CONSTRAINT  PK_EmployeeDepartmentHistory  PRIMARY KEY (Lnk_EmpID_DepID_ShiftID_SQN),
	CONSTRAINT R_210 FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT R_212 FOREIGN KEY (Hub_ShiftID_SQN) REFERENCES Hub_ShiftID(Hub_ShiftID_SQN),
	CONSTRAINT R_214 FOREIGN KEY (Hub_DepID_SQN) REFERENCES Hub_DepID(Hub_DepID_SQN)
)
;



CREATE UNIQUE INDEX AK_EmployeeDepartmentHistory ON Lnk_EmpID_DepID_ShiftID
(
	Hub_EmpID_SQN         ASC,
	Hub_ShiftID_SQN       ASC,
	Hub_DepID_SQN         ASC
)
;



CREATE TABLE Sat_EmpID_DepID_ShiftID
(
	Lnk_EmpID_DepID_ShiftID_SQN  NUMERIC(12)  NOT NULL,
	Sat_EmpID_DepID_ShiftID_LDTS  DATE  NOT NULL,
	Sat_EmpID_DepID_ShiftID_LEDTS  DATE  ,
	Sat_EmpID_DepID_ShiftID_RSRC  VARCHAR(18)  ,
	StartDate             date  NOT NULL,
	EndDate               date  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_Departme  PRIMARY KEY (Lnk_EmpID_DepID_ShiftID_SQN,Sat_EmpID_DepID_ShiftID_LDTS),
	CONSTRAINT R_211 FOREIGN KEY (Lnk_EmpID_DepID_ShiftID_SQN) REFERENCES Lnk_EmpID_DepID_ShiftID(Lnk_EmpID_DepID_ShiftID_SQN)
)
;



CREATE TABLE Sat_Dep
(
	Hub_DepID_SQN         NUMERIC(12)  NOT NULL,
	Sat_Dep_LDTS          DATE  NOT NULL,
	Sat_Dep_LEDTS         DATE  ,
	Sat_Dep_RSRC          VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	GroupName             VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Department_DepartmentID  PRIMARY KEY (Hub_DepID_SQN,Sat_Dep_LDTS),
	CONSTRAINT R_215 FOREIGN KEY (Hub_DepID_SQN) REFERENCES Hub_DepID(Hub_DepID_SQN)
)
;



CREATE UNIQUE INDEX AK_Department_Name ON Sat_Dep
(
	Name                  ASC
)
;



CREATE TABLE Hub_CntryRgnCd
(
	Hub_CntryRgnCd_SQN    NUMERIC(12)  NOT NULL,
	Hub_CntryRgnCd_LDTS   DATE  NOT NULL,
	Hub_CntryRgnCd_RSRC   VARCHAR(18)  ,
	CountryRegionCode     VARCHAR(3)  NOT NULL,
	CONSTRAINT  PK_CountryRegion_CountryRegionCode  PRIMARY KEY (Hub_CntryRgnCd_SQN)
)
;



CREATE UNIQUE INDEX BK_CountryRegionCode ON Hub_CntryRgnCd
(
	CountryRegionCode     ASC
)
;



CREATE TABLE Hub_CrncyCd
(
	Hub_CrncyCd_SQN       NUMERIC(12)  NOT NULL,
	Hub_CrncyCd_LDTS      DATE  NOT NULL,
	Hub_CrncyCd_RSRC      VARCHAR(18)  ,
	CurrencyCode          CHAR(3)  NOT NULL,
	CONSTRAINT  PK_Currency_CurrencyCode  PRIMARY KEY (Hub_CrncyCd_SQN)
)
;



CREATE UNIQUE INDEX BK_CurrencyCode ON Hub_CrncyCd
(
	CurrencyCode          ASC
)
;



CREATE TABLE Lnk_CntryRgnID_CrncyCd
(
	Lnk_CntryRgnID_CrncyCd_SQN  NUMERIC(12)  NOT NULL,
	Lnk_CntryRgnID_CrncyCd_LDTS  DATE  NOT NULL,
	Lnk_CntryRgnID_CrncyCd_RSRC  VARCHAR(18)  ,
	Hub_CntryRgnCd_SQN    NUMERIC(12)  ,
	Hub_CrncyCd_SQN       NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_CntryRgnID_Crncy  PRIMARY KEY (Lnk_CntryRgnID_CrncyCd_SQN),
	CONSTRAINT R_301 FOREIGN KEY (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN),
	CONSTRAINT R_303 FOREIGN KEY (Hub_CrncyCd_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_CntryRgnID_Crncy ON Lnk_CntryRgnID_CrncyCd
(
	Hub_CntryRgnCd_SQN    ASC,
	Hub_CrncyCd_SQN       ASC
)
;



CREATE TABLE Sat_CntryRgn_Crncy
(
	Lnk_CntryRgnID_CrncyCd_SQN  NUMERIC(12)  NOT NULL,
	Sat_CntryRgn_Crncy_LDTS  DATE  NOT NULL,
	Sat_CntryRgn_Crncy_LEDTS  DATE  ,
	Sat_CntryRgn_Crncy_RSRC  VARCHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode  PRIMARY KEY (Lnk_CntryRgnID_CrncyCd_SQN,Sat_CntryRgn_Crncy_LDTS),
	CONSTRAINT R_305 FOREIGN KEY (Lnk_CntryRgnID_CrncyCd_SQN) REFERENCES Lnk_CntryRgnID_CrncyCd(Lnk_CntryRgnID_CrncyCd_SQN)
)
;



CREATE TABLE Sat_Shift
(
	Hub_ShiftID_SQN       NUMERIC(12)  NOT NULL,
	Sat_Shift_LDTS        DATE  NOT NULL,
	Sat_Shift_LEDTS       DATE  ,
	Sat_Shift_RSRC        VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	StartTime             time  NOT NULL,
	EndTime               time  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Shift_ShiftID  PRIMARY KEY (Hub_ShiftID_SQN,Sat_Shift_LDTS),
	CONSTRAINT R_213 FOREIGN KEY (Hub_ShiftID_SQN) REFERENCES Hub_ShiftID(Hub_ShiftID_SQN)
)
;



CREATE UNIQUE INDEX AK_Shift_Name ON Sat_Shift
(
	Name                  ASC
)
;



CREATE UNIQUE INDEX AK_Shift_StartTime_EndTime ON Sat_Shift
(
	StartTime             ASC,
	EndTime               ASC
)
;



CREATE TABLE Sat_Vend
(
	Hub_VendNum_SQN       NUMERIC(12)  NOT NULL,
	Sat_Vend_LDTS         DATE  NOT NULL,
	Sat_Vend_LEDTS        DATE  ,
	Sat_Vend_RSRC         VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	CreditRating          SMALLINT  NOT NULL,
	PreferredVendorStatus  SMALLINT  NOT NULL,
	ActiveFlag            SMALLINT  NOT NULL,
	PurchasingWebServiceURL  VARCHAR(1024)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Vendor_BusinessEntityID  PRIMARY KEY (Hub_VendNum_SQN,Sat_Vend_LDTS),
	CONSTRAINT R_228 FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN)
)
;



CREATE TABLE Hub_UntMsrCd
(
	Hub_UntMsrCd_SQN      NUMERIC(12)  NOT NULL,
	Hub_UntMsrCd_LDTS     DATE  NOT NULL,
	Hub_UntMsrCd_RSRC     VARCHAR(18)  ,
	UnitMeasureCode       CHAR(3)  NOT NULL,
	CONSTRAINT  PK_UnitMeasure_UnitMeasureCode  PRIMARY KEY (Hub_UntMsrCd_SQN)
)
;



CREATE UNIQUE INDEX BK_UnitMeasureCode ON Hub_UntMsrCd
(
	UnitMeasureCode       ASC
)
;



CREATE TABLE Lnk_ProdNum_VendNum_UntMsrCd
(
	Lnk_ProdNum_VendNum_UntMsrCd_S  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_VendNum_UntMsrCd_L  VARCHAR(18)  ,
	Lnk_ProdNum_VendNum_UntMsrCd_R  VARCHAR(18)  ,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_VendNum_SQN       NUMERIC(12)  ,
	Hub_UntMsrCd_SQN      NUMERIC(12)  ,
	CONSTRAINT  PK_ProductVendor_ProductID_BusinessEntityID  PRIMARY KEY (Lnk_ProdNum_VendNum_UntMsrCd_S),
	CONSTRAINT R_225 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_227 FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN),
	CONSTRAINT R_314 FOREIGN KEY (Hub_UntMsrCd_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductVendor ON Lnk_ProdNum_VendNum_UntMsrCd
(
	Hub_ProdNum_SQN       ASC,
	Hub_VendNum_SQN       ASC,
	Hub_UntMsrCd_SQN      ASC
)
;



CREATE TABLE Sat_ProdNum_VendNum_UntMsrCd
(
	Lnk_ProdNum_VendNum_UntMsrCd_S  NUMERIC(12)  NOT NULL,
	Sat_ProdNum_VendNum_UntMsrCd_L  DATE  NOT NULL,
	Sat_ProdNum_VendNum_UntMsrCd_L  DATE  ,
	Sat_ProdNum_VendNum_UntMsrCd_R  VARCHAR(18)  ,
	AverageLeadTime       INTEGER  NOT NULL,
	StandardPrice         DECIMAL(19,4)  NOT NULL,
	LastReceiptCost       DECIMAL(19,4)  ,
	LastReceiptDate       TIMESTAMP  ,
	MinOrderQty           INTEGER  NOT NULL,
	MaxOrderQty           INTEGER  NOT NULL,
	OnOrderQty            INTEGER  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ProductVendor_ProductID_BusinessEntityID  PRIMARY KEY (Lnk_ProdNum_VendNum_UntMsrCd_S,Sat_ProdNum_VendNum_UntMsrCd_L),
	CONSTRAINT R_226 FOREIGN KEY (Lnk_ProdNum_VendNum_UntMsrCd_S) REFERENCES Lnk_ProdNum_VendNum_UntMsrCd(Lnk_ProdNum_VendNum_UntMsrCd_S)
)
;



CREATE TABLE Lnk_EmpID_POID
(
	Lnk_EmpID_POID_SQN    NUMERIC(12)  NOT NULL,
	Lnk_EmpID_POID_LDTS   DATE  NOT NULL,
	Lnk_EmpID_POID_RSRC   VARCHAR(18)  ,
	Hub_EmpID_SQN         NUMERIC(12)  ,
	Hub_POID_SQN          NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_EmpID_POID  PRIMARY KEY (Lnk_EmpID_POID_SQN),
	CONSTRAINT R_240 FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN),
	CONSTRAINT R_241 FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_EmpID_POID ON Lnk_EmpID_POID
(
	Hub_POID_SQN          ASC,
	Hub_EmpID_SQN         ASC
)
;



CREATE TABLE Hub_ShpMthdID
(
	Hub_ShpMthID_SQN      NUMERIC(12)  NOT NULL,
	Hub_ShpMthID_LDTS     DATE  NOT NULL,
	Hub_ShpMthID_RSRC     VARCHAR(18)  ,
	ShipMethodID          INTEGER  NOT NULL,
	CONSTRAINT  PK_ShipMethod_ShipMethodID  PRIMARY KEY (Hub_ShpMthID_SQN)
)
;



CREATE UNIQUE INDEX BK_ShipMethodID ON Hub_ShpMthdID
(
	ShipMethodID          ASC
)
;



CREATE TABLE Lnk_POID_ShpMthdID
(
	Lnk_POID_ShpMthdID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_POID_ShpMthdID_LDTS  DATE  NOT NULL,
	Lnk_POID_ShpMthdID_RSRC  VARCHAR(18)  ,
	Hub_POID_SQN          NUMERIC(12)  ,
	Hub_ShpMthID_SQN      NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_POID_ShPMthdID  PRIMARY KEY (Lnk_POID_ShpMthdID_SQN),
	CONSTRAINT R_235 FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN),
	CONSTRAINT R_236 FOREIGN KEY (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_POID_ShPMthdID ON Lnk_POID_ShpMthdID
(
	Hub_POID_SQN          ASC,
	Hub_ShpMthID_SQN      ASC
)
;



CREATE TABLE Lnk_VendNum_POID
(
	Lnk_VendNum_POID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_VendNum_POID_LDTS  DATE  NOT NULL,
	Lnk_VendNum_POID_RSRC  VARCHAR(18)  ,
	Hub_VendNum_SQN       NUMERIC(12)  ,
	Hub_POID_SQN          NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_AcctNum_POID  PRIMARY KEY (Lnk_VendNum_POID_SQN),
	CONSTRAINT R_233 FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN),
	CONSTRAINT R_234 FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_AcctNum_POID ON Lnk_VendNum_POID
(
	Hub_VendNum_SQN       ASC,
	Hub_POID_SQN          ASC
)
;



CREATE TABLE Hub_CustID
(
	Hub_CustID_SQN        NUMERIC(12)  NOT NULL,
	Hub_CustID_LDTS       DATE  NOT NULL,
	Hub_CustID_RSRC       VARCHAR(18)  ,
	CustomerID            INTEGER  NOT NULL,
	CONSTRAINT  PK_Customer_CustomerID  PRIMARY KEY (Hub_CustID_SQN)
)
;



CREATE UNIQUE INDEX BK_CustomerID ON Hub_CustID
(
	CustomerID            ASC
)
;



CREATE TABLE Sat_Cust
(
	Hub_CustID_SQN        NUMERIC(12)  NOT NULL,
	Sat_Cust_LDTS         DATE  NOT NULL,
	Sat_Cust_LEDTS        DATE  ,
	Sat_Cust_RSRC         VARCHAR(18)  ,
	PersonID              CHAR(18)  ,
	StoreID               CHAR(18)  ,
	TerritoryID           CHAR(18)  ,
	AccountNumber         varchar(10)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Customer_CustomerID  PRIMARY KEY (Hub_CustID_SQN,Sat_Cust_LDTS),
	CONSTRAINT R_253 FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN)
)
;



CREATE UNIQUE INDEX AK_Customer_AccountNumber ON Sat_Cust
(
	AccountNumber         ASC
)
;



CREATE TABLE Hub_PNTID
(
	Hub_PNTID_SQN         NUMERIC(12)  NOT NULL,
	Hub_PNTID_LDTS        DATE  NOT NULL,
	Hub_PNTID_RSRC        VARCHAR(18)  ,
	PhoneNumberTypeID     INTEGER  NOT NULL,
	CONSTRAINT  PK_PhoneNumberType_PhoneNumberTypeID  PRIMARY KEY (Hub_PNTID_SQN)
)
;



CREATE UNIQUE INDEX BK_PhoneNumberTypeID ON Hub_PNTID
(
	PhoneNumberTypeID     ASC
)
;



CREATE TABLE Sat_PNT
(
	Hub_PNTID_SQN         NUMERIC(12)  NOT NULL,
	Sat_PNT_LDTS          DATE  NOT NULL,
	Sat_PNT_LEDTS         DATE  ,
	Sat_PNT_RSRC          VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_PhoneNumberType_PhoneNumberTypeID  PRIMARY KEY (Hub_PNTID_SQN,Sat_PNT_LDTS),
	CONSTRAINT R_224 FOREIGN KEY (Hub_PNTID_SQN) REFERENCES Hub_PNTID(Hub_PNTID_SQN)
)
;



CREATE TABLE Hub_Phon
(
	Hub_Phon_SQN          NUMERIC(12)  NOT NULL,
	Hub_Phon_LDTS         DATE  NOT NULL,
	Hub_Phon_RSRC         VARCHAR(18)  ,
	PhoneNumber           VARCHAR(25)  NOT NULL,
	CONSTRAINT  PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID  PRIMARY KEY (Hub_Phon_SQN)
)
;



CREATE UNIQUE INDEX BK_PhoneNumber ON Hub_Phon
(
	PhoneNumber           ASC
)
;



CREATE TABLE Sat_Phon
(
	Hub_Phon_SQN          NUMERIC(12)  NOT NULL,
	Sat_Phon_LDTS         DATE  NOT NULL,
	Sat_Phon_LEDTS        DATE  ,
	Sat_Phon_RSRC         VARCHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID  PRIMARY KEY (Hub_Phon_SQN,Sat_Phon_LDTS),
	CONSTRAINT R_222 FOREIGN KEY (Hub_Phon_SQN) REFERENCES Hub_Phon(Hub_Phon_SQN)
)
;



CREATE TABLE Lnk_PersID_Phon_PNTID
(
	Lnk_PersID_Phon_PNTID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_PersID_Phon_PNTID_LDTS  DATE  NOT NULL,
	Lnk_PersID_Phon_PNTID_RSRC  VARCHAR(18)  ,
	Hub_PersID_SQN        NUMERIC(12)  ,
	Hub_Phon_SQN          NUMERIC(12)  ,
	Hub_PNTID_SQN         NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_PersID_Phon_PNTID  PRIMARY KEY (Lnk_PersID_Phon_PNTID_SQN),
	CONSTRAINT R_220 FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	CONSTRAINT R_221 FOREIGN KEY (Hub_Phon_SQN) REFERENCES Hub_Phon(Hub_Phon_SQN),
	CONSTRAINT R_223 FOREIGN KEY (Hub_PNTID_SQN) REFERENCES Hub_PNTID(Hub_PNTID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_PersID_Phon_PNTID ON Lnk_PersID_Phon_PNTID
(
	Hub_PersID_SQN        ASC,
	Hub_Phon_SQN          ASC,
	Hub_PNTID_SQN         ASC
)
;



CREATE TABLE Sat_EmailAdd
(
	Hub_EmailAddID_SQN    NUMERIC(12)  NOT NULL,
	Sat_EmailAdd_LDTS     DATE  NOT NULL,
	Sat_EmailAdd_LEDTS    DATE  ,
	Sat_EmailAdd_RSRC     VARCHAR(18)  ,
	EmailAddress          VARCHAR(50)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_EmailAddress_BusinessEntityID_EmailAddressID  PRIMARY KEY (Hub_EmailAddID_SQN,Sat_EmailAdd_LDTS),
	CONSTRAINT R_219 FOREIGN KEY (Hub_EmailAddID_SQN) REFERENCES Hub_EmailAddID(Hub_EmailAddID_SQN)
)
;



CREATE INDEX IX_EmailAddress_EmailAddress ON Sat_EmailAdd
(
	EmailAddress          ASC
)
;



CREATE TABLE Lnk_SOrdNum_ShpMthdID
(
	Lnk_SOrdNum_ShpMthdID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_SOrdNum_ShpMthdID_LDTS  DATE  NOT NULL,
	Lnk_SOrdNum_ShpMthdID_RSRC  VARCHAR(18)  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  ,
	Hub_ShpMthID_SQN      NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_POID_ShPMthdID  PRIMARY KEY (Lnk_SOrdNum_ShpMthdID_SQN),
	CONSTRAINT R_238 FOREIGN KEY (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN),
	CONSTRAINT R_239 FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_POID_ShPMthdID ON Lnk_SOrdNum_ShpMthdID
(
	Hub_ShpMthID_SQN      ASC,
	Hub_SOrdNum_SQN       ASC
)
;



CREATE TABLE Sat_Pswrd
(
	Hub_PersID_SQN        NUMERIC(12)  NOT NULL,
	Sat_Pswrd_LDTS        DATE  NOT NULL,
	Sat_Pswrd_LEDTS       DATE  ,
	Sat_Pswrd_RSRC        VARCHAR(18)  ,
	PasswordHash          varchar(128)  NOT NULL,
	PasswordSalt          varchar(10)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Password_BusinessEntityID  PRIMARY KEY (Hub_PersID_SQN,Sat_Pswrd_LDTS),
	CONSTRAINT R_216 FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE TABLE Lnk_ProdNum_POID
(
	Lnk_ProdNum_POID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_POID_LDTS  DATE  NOT NULL,
	Lnk_ProdNum_POID_RSRC  VARCHAR(18)  ,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_POID_SQN          NUMERIC(12)  ,
	PurchaseOrderDetailID  INTEGER  NOT NULL,
	CONSTRAINT  PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID  PRIMARY KEY (Lnk_ProdNum_POID_SQN),
	CONSTRAINT R_229 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_231 FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
;



CREATE UNIQUE INDEX AK_PurchaseOrderDetail ON Lnk_ProdNum_POID
(
	Hub_ProdNum_SQN       ASC,
	PurchaseOrderDetailID  ASC,
	Hub_POID_SQN          ASC
)
;



CREATE TABLE Sat_PODetail
(
	Lnk_ProdNum_POID_SQN  NUMERIC(12)  NOT NULL,
	Sat_PODetail_LDTS     DATE  NOT NULL,
	Sat_PODetail_LEDTS    DATE  ,
	Sat_PODetail_RSRC     VARCHAR(18)  ,
	DueDate               TIMESTAMP  NOT NULL,
	OrderQty              smallint  NOT NULL,
	ProductID             CHAR(18)  NOT NULL,
	UnitPrice             DECIMAL(19,4)  NOT NULL,
	LineTotal             DECIMAL(19,4)  NOT NULL,
	ReceivedQty           decimal(8,2)  NOT NULL,
	RejectedQty           decimal(8,2)  NOT NULL,
	StockedQty            decimal(9,2)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID  PRIMARY KEY (Lnk_ProdNum_POID_SQN,Sat_PODetail_LDTS),
	CONSTRAINT R_230 FOREIGN KEY (Lnk_ProdNum_POID_SQN) REFERENCES Lnk_ProdNum_POID(Lnk_ProdNum_POID_SQN)
)
;



CREATE TABLE Sat_ShpMthd
(
	Hub_ShpMthID_SQN      NUMERIC(12)  NOT NULL,
	Sat_ShpMthd_LDTS      DATE  NOT NULL,
	Sat_ShpMthd_LEDTS     DATE  ,
	Sat_ShpMthd_RSRC      VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ShipBase              DECIMAL(19,4)  NOT NULL,
	ShipRate              DECIMAL(19,4)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ShipMethod_ShipMethodID  PRIMARY KEY (Hub_ShpMthID_SQN,Sat_ShpMthd_LDTS),
	CONSTRAINT R_237 FOREIGN KEY (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN)
)
;



CREATE UNIQUE INDEX AK_ShipMethod_Name ON Sat_ShpMthd
(
	Name                  ASC
)
;



CREATE TABLE Hub_SaleTaxRtID
(
	Hub_SaleTaxRtID_SQN   NUMERIC(12)  NOT NULL,
	Hub_SaleTaxRtID_LDTS  DATE  NOT NULL,
	Hub_SaleTaxRtID_RSRC  VARCHAR(18)  ,
	SalesTaxRateID        INTEGER  NOT NULL,
	CONSTRAINT  PK_SalesTaxRate_SalesTaxRateID  PRIMARY KEY (Hub_SaleTaxRtID_SQN)
)
;



CREATE UNIQUE INDEX BK_SalesTaxRateID ON Hub_SaleTaxRtID
(
	SalesTaxRateID        ASC
)
;



CREATE TABLE Lnk_StProvID_SaleTaxRtID
(
	Lnk_StProvID_SaleTaxRtID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_StProvID_SaleTaxRtID_LDTS  DATE  NOT NULL,
	Lnk_StProvID_SaleTaxRtID_RSRC  VARCHAR(18)  ,
	Hub_StProvID_SQN      NUMERIC(12)  ,
	Hub_SaleTaxRtID_SQN   NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_StProvID_SaleTaxRtID  PRIMARY KEY (Lnk_StProvID_SaleTaxRtID_SQN),
	CONSTRAINT R_295 FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN),
	CONSTRAINT R_296 FOREIGN KEY (Hub_SaleTaxRtID_SQN) REFERENCES Hub_SaleTaxRtID(Hub_SaleTaxRtID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_StProvID_SaleTaxRtID ON Lnk_StProvID_SaleTaxRtID
(
	Hub_StProvID_SQN      ASC,
	Hub_SaleTaxRtID_SQN   ASC
)
;



CREATE TABLE Hub_Store
(
	Hub_Store_SQN         NUMERIC(12)  NOT NULL,
	Hub_Store_LDTS        DATE  NOT NULL,
	Hub_Store_RSRC        VARCHAR(18)  ,
	BusinessEntityID      CHAR(18)  NOT NULL,
	CONSTRAINT  PK_Store_BusinessEntityID  PRIMARY KEY (Hub_Store_SQN)
)
;



CREATE UNIQUE INDEX BK_BusinessEntityID ON Hub_Store
(
	BusinessEntityID      ASC
)
;



CREATE TABLE Lnk_BusEntID_Store
(
	Lnk_BusEntID_Store_SQN  NUMERIC(12)  NOT NULL,
	Lnk_BusEntID_Store_LDTS  DATE  NOT NULL,
	Lnk_BusEntID_Store_RSRC  VARCHAR(18)  ,
	Hub_BusEntID_SQN      NUMERIC(12)  ,
	Hub_Store_SQN         NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_BEID_Store  PRIMARY KEY (Lnk_BusEntID_Store_SQN),
	CONSTRAINT R_271 FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT R_274 FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_BEID_Store ON Lnk_BusEntID_Store
(
	Hub_BusEntID_SQN      ASC,
	Hub_Store_SQN         ASC
)
;



CREATE TABLE Hub_SalePers
(
	Hub_SalePers_SQN      NUMERIC(12)  NOT NULL,
	Hub_SalePers_LDTS     DATE  NOT NULL,
	Hub_SalePers_RSRC     VARCHAR(18)  ,
	EmployeeID            CHAR(18)  NOT NULL,
	CONSTRAINT  PK_SalesPerson_BusinessEntityID  PRIMARY KEY (Hub_SalePers_SQN)
)
;



CREATE UNIQUE INDEX BK_SalesPersonID ON Hub_SalePers
(
	EmployeeID            ASC
)
;



CREATE TABLE Lnk_EmpID_SalePers
(
	Lnk_EmpID_SalePers_SQN  NUMERIC(12)  NOT NULL,
	Lnk_EmpID_SalePers_LDTS  DATE  NOT NULL,
	Lnk_EmpID_SalePers_RSRC  VARCHAR(18)  ,
	Hub_EmpID_SQN         NUMERIC(12)  ,
	Hub_SalePers_SQN      NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_EmpID_SalePers  PRIMARY KEY (Lnk_EmpID_SalePers_SQN),
	CONSTRAINT R_242 FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT R_243 FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_EmpID_SalePers ON Lnk_EmpID_SalePers
(
	Hub_EmpID_SQN         ASC,
	Hub_SalePers_SQN      ASC
)
;



CREATE TABLE Lnk_SalePers_Store
(
	Lnk_SalePers_Store_SQN  NUMERIC(12)  NOT NULL,
	Lnk_SalePers_Store_LDTS  DATE  NOT NULL,
	Lnk_SalePers_Store_RSRC  VARCHAR(18)  ,
	Hub_Store_SQN         NUMERIC(12)  ,
	Hub_SalePers_SQN      NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_SalePers_Store  PRIMARY KEY (Lnk_SalePers_Store_SQN),
	CONSTRAINT R_250 FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	CONSTRAINT R_251 FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SalePers_Store ON Lnk_SalePers_Store
(
	Hub_SalePers_SQN      ASC,
	Hub_Store_SQN         ASC
)
;



CREATE TABLE Hub_BOMID
(
	Hub_BOMID_SQN         NUMERIC(12)  NOT NULL,
	Hub_BOMID_LDTS        DATE  NOT NULL,
	Hub_BOMID_RSRC        VARCHAR(18)  ,
	BillOfMaterialsID     INTEGER  NOT NULL,
	CONSTRAINT  PK_BillOfMaterials_BillOfMaterialsID  PRIMARY KEY (Hub_BOMID_SQN)
)
;



CREATE UNIQUE INDEX BK_BillOfMaterialsID ON Hub_BOMID
(
	BillOfMaterialsID     ASC
)
;



CREATE TABLE Sat_BOM
(
	Hub_BOMID_SQN         NUMERIC(12)  NOT NULL,
	Sat_BOM_LDTS          DATE  NOT NULL,
	Sat_BOM_LEDTS         DATE  ,
	Sat_BOM_RSRC          VARCHAR(18)  ,
	StartDate             TIMESTAMP  NOT NULL,
	EndDate               TIMESTAMP  ,
	BOMLevel              smallint  NOT NULL,
	PerAssemblyQty        decimal(8,2)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_BillOfMaterials_BillOfMaterialsID  PRIMARY KEY (Hub_BOMID_SQN,Sat_BOM_LDTS),
	CONSTRAINT R_320 FOREIGN KEY (Hub_BOMID_SQN) REFERENCES Hub_BOMID(Hub_BOMID_SQN)
)
;



CREATE UNIQUE INDEX AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate ON Sat_BOM
(
	StartDate             ASC
)
	CLUSTER
;



CREATE TABLE Sat_StProv
(
	Hub_StProvID_SQN      NUMERIC(12)  NOT NULL,
	Sat_StProv_LDTS       DATE  NOT NULL,
	Sat_StProv_LEDTS      DATE  ,
	Sat_StProv_RSRC       VARCHAR(18)  ,
	StateProvinceCode     CHAR(3)  NOT NULL,
	CountryRegionCode     CHAR(18)  NOT NULL,
	IsOnlyStateProvinceFlag  SMALLINT  NOT NULL,
	Name                  VARCHAR(50)  NOT NULL,
	TerritoryID           CHAR(18)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_StateProvince_StateProvinceID  PRIMARY KEY (Hub_StProvID_SQN,Sat_StProv_LDTS),
	CONSTRAINT R_297 FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
;



CREATE UNIQUE INDEX AK_StateProvince_Name ON Sat_StProv
(
	Name                  ASC
)
;



CREATE UNIQUE INDEX AK_StateProvince_StateProvinceCode_CountryRegionCode ON Sat_StProv
(
	StateProvinceCode     ASC,
	CountryRegionCode     ASC
)
;



CREATE TABLE Lnk_StProvID_CntryRgnCd
(
	Lnk_StProvID_CntryRgnCd_SQN  NUMERIC(12)  NOT NULL,
	Lnk_StProvID_CntryRgnCd_LDTS  DATE  NOT NULL,
	Lnk_StProvID_CntryRgnCd_RSRC  VARCHAR(18)  ,
	Hub_StProvID_SQN      NUMERIC(12)  ,
	Hub_CntryRgnCd_SQN    NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_StProvID_CntryRgnID  PRIMARY KEY (Lnk_StProvID_CntryRgnCd_SQN),
	CONSTRAINT R_299 FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN),
	CONSTRAINT R_302 FOREIGN KEY (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_StProvID_CntryRgnID ON Lnk_StProvID_CntryRgnCd
(
	Hub_CntryRgnCd_SQN    ASC,
	Hub_StProvID_SQN      ASC
)
;



CREATE TABLE Sat_SaleTaxRt
(
	Hub_SaleTaxRtID_SQN   NUMERIC(12)  NOT NULL,
	Sat_SaleTaxRt_LDTS    DATE  NOT NULL,
	Sat_SaleTaxRt_LEDTS   DATE  ,
	Sat_SaleTaxRt_RSRC    VARCHAR(18)  ,
	TaxType               SMALLINT  NOT NULL,
	TaxRate               DECIMAL(10,4)  NOT NULL,
	Name                  VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SalesTaxRate_SalesTaxRateID  PRIMARY KEY (Hub_SaleTaxRtID_SQN,Sat_SaleTaxRt_LDTS),
	CONSTRAINT R_298 FOREIGN KEY (Hub_SaleTaxRtID_SQN) REFERENCES Hub_SaleTaxRtID(Hub_SaleTaxRtID_SQN)
)
;



CREATE UNIQUE INDEX AK_SalesTaxRate_StateProvinceID_TaxType ON Sat_SaleTaxRt
(
	TaxType               ASC
)
;



CREATE TABLE Sat_SalePers
(
	Hub_SalePers_SQN      NUMERIC(12)  NOT NULL,
	Sat_SalePersLDTS      DATE  NOT NULL,
	Sat_SalePersLEDTS     DATE  ,
	Sat_SalePers_RSRC     VARCHAR(18)  ,
	TerritoryID           CHAR(18)  ,
	SalesQuota            DECIMAL(19,4)  ,
	Bonus                 DECIMAL(19,4)  NOT NULL,
	CommissionPct         DECIMAL(10,4)  NOT NULL,
	SalesYTD              DECIMAL(19,4)  NOT NULL,
	SalesLastYear         DECIMAL(19,4)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SalesPerson_BusinessEntityID  PRIMARY KEY (Hub_SalePers_SQN,Sat_SalePersLDTS),
	CONSTRAINT R_244 FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
;



CREATE TABLE Hub_SaleTerID
(
	Hub_SaleTerID_SQN     NUMERIC(12)  NOT NULL,
	Hub_SaleTerID_LDTS    DATE  NOT NULL,
	Hub_SaleTerID_RSRC    VARCHAR(18)  ,
	TerritoryID           INTEGER  NOT NULL,
	CONSTRAINT  PK_SalesTerritory_TerritoryID  PRIMARY KEY (Hub_SaleTerID_SQN)
)
;



CREATE UNIQUE INDEX BK_SalesTerritoryID ON Hub_SaleTerID
(
	TerritoryID           ASC
)
;



CREATE TABLE Lnk_SalePers_SaleTerID
(
	Lnk_SalePers_SaleTerID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_SalePers_SaleTerID_LDTS  DATE  NOT NULL,
	Lnk_SalePers_SaleTerID_RSRC  VARCHAR(18)  ,
	Hub_SalePers_SQN      NUMERIC(12)  ,
	Hub_SaleTerID_SQN     NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_SalePers_SaleTer  PRIMARY KEY (Lnk_SalePers_SaleTerID_SQN),
	CONSTRAINT R_266 FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	CONSTRAINT R_267 FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SalePers_SaleTer ON Lnk_SalePers_SaleTerID
(
	Hub_SalePers_SQN      ASC,
	Hub_SaleTerID_SQN     ASC
)
;



CREATE TABLE Sat_SaleTerHist
(
	Lnk_SalePers_SaleTerID_SQN  NUMERIC(12)  NOT NULL,
	Sat_SaleTerHist_LDTS  DATE  NOT NULL,
	Sat_SaleTerHist_LEDTS  DATE  ,
	Sat_SaleTerHist_RSRC  VARCHAR(18)  ,
	StartDate             TIMESTAMP  NOT NULL,
	EndDate               TIMESTAMP  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID  PRIMARY KEY (Lnk_SalePers_SaleTerID_SQN,Sat_SaleTerHist_LDTS),
	CONSTRAINT R_265 FOREIGN KEY (Lnk_SalePers_SaleTerID_SQN) REFERENCES Lnk_SalePers_SaleTerID(Lnk_SalePers_SaleTerID_SQN)
)
;



CREATE TABLE Sat_Store
(
	Hub_Store_SQN         NUMERIC(12)  NOT NULL,
	Sat_Store_LDTS        DATE  NOT NULL,
	Sat_Store_LEDTS       DATE  ,
	Sat_Store_RSRC        VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	Demographics          CLOB  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Store_BusinessEntityID  PRIMARY KEY (Hub_Store_SQN,Sat_Store_LDTS),
	CONSTRAINT R_252 FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
;



CREATE TABLE Lnk_Cust_SaleTerID
(
	Lnk_Cust_SaleTerID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_Cust_SaleTerID_LDTS  DATE  NOT NULL,
	Lnk_Cust_SaleTerID_SRC  VARCHAR(18)  ,
	Hub_CustID_SQN        NUMERIC(12)  ,
	Hub_SaleTerID_SQN     NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_Cust_SaleTerID  PRIMARY KEY (Lnk_Cust_SaleTerID_SQN),
	CONSTRAINT R_261 FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	CONSTRAINT R_262 FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_Cust_SaleTerID ON Lnk_Cust_SaleTerID
(
	Hub_CustID_SQN        ASC,
	Hub_SaleTerID_SQN     ASC
)
;



CREATE TABLE Sat_Crncy
(
	Hub_CrncyCd_SQN       NUMERIC(12)  NOT NULL,
	Sat_Crncy_LDTS        DATE  NOT NULL,
	Sat_Crncy_LEDTS       DATE  ,
	Sat_Crncy_RSRC        VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Currency_CurrencyCode  PRIMARY KEY (Hub_CrncyCd_SQN,Sat_Crncy_LDTS),
	CONSTRAINT R_306 FOREIGN KEY (Hub_CrncyCd_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
;



CREATE UNIQUE INDEX AK_Currency_Name ON Sat_Crncy
(
	Name                  ASC
)
;



CREATE TABLE Lnk_SOrdNum_SalePers
(
	Lnk_SOrdNum_SalePers_SQN  NUMERIC(12)  NOT NULL,
	Lnk_SOrdNum_SalePers_LDTS  DATE  NOT NULL,
	Lnk_SOrdNum_SalePers_RSRC  VARCHAR(18)  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  ,
	Hub_SalePers_SQN      NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_SOrdID_SalePers  PRIMARY KEY (Lnk_SOrdNum_SalePers_SQN),
	CONSTRAINT R_246 FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	CONSTRAINT R_247 FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SOrdID_SalePers ON Lnk_SOrdNum_SalePers
(
	Hub_SalePers_SQN      ASC,
	Hub_SOrdNum_SQN       ASC
)
;



CREATE TABLE Sat_SalePersQuotaHist
(
	Hub_SalePers_SQN      NUMERIC(12)  NOT NULL,
	Sat_SalePersQuotaHist_LDTS  DATE  NOT NULL,
	Sat_SalePersQuotaHist_LEDTS  DATE  ,
	Sat_SalePersQuotaHist_RSRC  VARCHAR(18)  ,
	QuotaDate             TIMESTAMP  NOT NULL,
	SalesQuota            DECIMAL(19,4)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate  PRIMARY KEY (Hub_SalePers_SQN,Sat_SalePersQuotaHist_LDTS),
	CONSTRAINT R_245 FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
;



CREATE TABLE Hub_CrncyRtID
(
	Hub_CrncyRtID_SQN     NUMERIC(12)  NOT NULL,
	Hub_CrncyRtID_LDTS    DATE  NOT NULL,
	Hub_CrncyRtID_RSRC    VARCHAR(18)  ,
	CurrencyRateID        INTEGER  NOT NULL,
	CONSTRAINT  PK_CurrencyRate_CurrencyRateID  PRIMARY KEY (Hub_CrncyRtID_SQN)
)
;



CREATE UNIQUE INDEX BK_CurrencyRate ON Hub_CrncyRtID
(
	CurrencyRateID        ASC
)
;



CREATE TABLE Sat_CrncyRt
(
	Hub_CrncyRtID_SQN     NUMERIC(12)  NOT NULL,
	Sat_CrncyRt_LDTS      DATE  NOT NULL,
	Sat_CrncyRt_LEDTS     DATE  ,
	Sat_CrncyRt_RSRC      VARCHAR(18)  ,
	CurrencyRateDate      TIMESTAMP  NOT NULL,
	AverageRate           DECIMAL(19,4)  NOT NULL,
	EndOfDayRate          DECIMAL(19,4)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_CurrencyRate_CurrencyRateID  PRIMARY KEY (Hub_CrncyRtID_SQN,Sat_CrncyRt_LDTS),
	CONSTRAINT R_310 FOREIGN KEY (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN)
)
;



CREATE UNIQUE INDEX AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode ON Sat_CrncyRt
(
	CurrencyRateDate      ASC
)
;



CREATE TABLE Sat_BusEntID
(
	Hub_BusEntID_SQN      NUMERIC(12)  NOT NULL,
	Sat_BusEntID_LDTS     DATE  NOT NULL,
	Sat_BusEntID_LEDTS    DATE  ,
	Sat_BusEntID_RSRC     VARCHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_BusinessEntity_BusinessEntityID  PRIMARY KEY (Hub_BusEntID_SQN,Sat_BusEntID_LDTS),
	CONSTRAINT R_268 FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN)
)
;



CREATE TABLE Lnk_EmpID_PersID
(
	Lnk_EmpID_PersID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_EmpID_PersID_LDTS  DATE  NOT NULL,
	Lnk_EmpID_PersID_RSRC  VARCHAR(18)  ,
	Hub_PersID_SQN        NUMERIC(12)  ,
	Hub_EmpID_SQN         NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_EmpID_PersID  PRIMARY KEY (Lnk_EmpID_PersID_SQN),
	CONSTRAINT R_248 FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT R_249 FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_EmpID_PersID ON Lnk_EmpID_PersID
(
	Hub_EmpID_SQN         ASC,
	Hub_PersID_SQN        ASC
)
;



CREATE TABLE Lnk_CustID_Store
(
	Lnk_CustID_Store_SQN  NUMERIC(12)  NOT NULL,
	Lnk_CustID_Store_LDTS  DATE  NOT NULL,
	Lnk_CustID_Store_RSRC  VARCHAR(18)  ,
	Hub_CustID_SQN        NUMERIC(12)  ,
	Hub_Store_SQN         NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_CustID_Store  PRIMARY KEY (Lnk_CustID_Store_SQN),
	CONSTRAINT R_254 FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN),
	CONSTRAINT R_255 FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_CustID_Store ON Lnk_CustID_Store
(
	Hub_Store_SQN         ASC,
	Hub_CustID_SQN        ASC
)
;



CREATE TABLE Lnk_PersID_CustID
(
	Lnk_PersID_CustID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_PersID_CustID_LDTS  DATE  NOT NULL,
	Lnk_PersID_CustID_RSRC  VARCHAR(18)  ,
	Hub_PersID_SQN        NUMERIC(12)  ,
	Hub_CustID_SQN        NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_PersID_CustID  PRIMARY KEY (Lnk_PersID_CustID_SQN),
	CONSTRAINT R_256 FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	CONSTRAINT R_257 FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_PersID_CustID ON Lnk_PersID_CustID
(
	Hub_CustID_SQN        ASC,
	Hub_PersID_SQN        ASC
)
;



CREATE TABLE Hub_AddTypID
(
	Hub_AddTypID_SQN      NUMERIC(12)  NOT NULL,
	Hub_AddTypID_LDTS     DATE  NOT NULL,
	Hub_AddTypID_RSRC     VARCHAR(18)  ,
	AddressTypeID         INTEGER  NOT NULL,
	CONSTRAINT  PK_AddressType_AddressTypeID  PRIMARY KEY (Hub_AddTypID_SQN)
)
;



CREATE UNIQUE INDEX BK_AddressTypeID ON Hub_AddTypID
(
	AddressTypeID         ASC
)
;



CREATE TABLE Sat_AddTyp
(
	Hub_AddTypID_SQN      NUMERIC(12)  NOT NULL,
	Sat_AddTyp_LDTS       DATE  NOT NULL,
	Sat_AddTyp_LEDTS      DATE  ,
	Sat_AddTyp_RSRC       VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_AddressType_AddressTypeID  PRIMARY KEY (Hub_AddTypID_SQN,Sat_AddTyp_LDTS),
	CONSTRAINT R_285 FOREIGN KEY (Hub_AddTypID_SQN) REFERENCES Hub_AddTypID(Hub_AddTypID_SQN)
)
;



CREATE UNIQUE INDEX AK_AddressType_Name ON Sat_AddTyp
(
	Name                  ASC
)
;



CREATE TABLE Sat_SaleTer
(
	Hub_SaleTerID_SQN     NUMERIC(12)  NOT NULL,
	Sat_SaleTer_LDTS      DATE  NOT NULL,
	Sat_SaleTer_LEDTS     DATE  ,
	Sat_SaleTer_RSRC      VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	CountryRegionCode     VARCHAR(3)  NOT NULL,
	Group                 VARCHAR(50)  NOT NULL,
	SalesYTD              DECIMAL(19,4)  NOT NULL,
	SalesLastYear         DECIMAL(19,4)  NOT NULL,
	CostYTD               DECIMAL(19,4)  NOT NULL,
	CostLastYear          DECIMAL(19,4)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_SalesTerritory_TerritoryID  PRIMARY KEY (Hub_SaleTerID_SQN,Sat_SaleTer_LDTS),
	CONSTRAINT R_260 FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
;



CREATE UNIQUE INDEX AK_SalesTerritory_Name ON Sat_SaleTer
(
	Name                  ASC
)
;



CREATE TABLE Lnk_ProdNum_UntMsrCd
(
	Lnk_ProdNum_UntMsrCd_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_UntMsrCd_LDTS  DATE  NOT NULL,
	Lnk_ProdNum_UntMsrCd_RSRC  VARCHAR(18)  ,
	Hub_ProdNum_SQN       NUMERIC(12)  ,
	Hub_UntMsrCd_Wt_SQN   NUMERIC(12)  ,
	Hub_UntMsrCd_Size_SQN  NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_VendNum_UntMsrCd  PRIMARY KEY (Lnk_ProdNum_UntMsrCd_SQN),
	CONSTRAINT R_315 FOREIGN KEY (Hub_UntMsrCd_Wt_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN),
	CONSTRAINT R_316 FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_319 FOREIGN KEY (Hub_UntMsrCd_Size_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_VendNum_UntMsrCd ON Lnk_ProdNum_UntMsrCd
(
	Hub_UntMsrCd_Wt_SQN   ASC,
	Hub_ProdNum_SQN       ASC,
	Hub_UntMsrCd_Size_SQN  ASC
)
;



CREATE TABLE Sat_UntMsr
(
	Sat_UntMsr_LDTS       DATE  NOT NULL,
	Hub_UntMsrCd_SQN      NUMERIC(12)  NOT NULL,
	Sat_UntMsr_LEDTS      DATE  ,
	Sat_UntMsr_RSRC       VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_UnitMeasure_UnitMeasureCode  PRIMARY KEY (Sat_UntMsr_LDTS,Hub_UntMsrCd_SQN),
	CONSTRAINT R_313 FOREIGN KEY (Hub_UntMsrCd_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
;



CREATE UNIQUE INDEX AK_UnitMeasure_Name ON Sat_UntMsr
(
	Name                  ASC
)
;



CREATE TABLE Lnk_CrncyCd_CrncyRtID
(
	Lnk_CrncyCd_CrncyRtID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_CrncyCd_CrncyRtID_LDTS  DATE  NOT NULL,
	Lnk_CrncyCd_CrncyRtID_RSRC  VARCHAR(18)  ,
	Hub_CrncyRtID_SQN     NUMERIC(12)  ,
	Hub_CrncyCd_From_SQN  NUMERIC(12)  ,
	Hub_CrncyCd_To_SQN    NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_CrncyCd_CrncyRtID  PRIMARY KEY (Lnk_CrncyCd_CrncyRtID_SQN),
	CONSTRAINT R_307 FOREIGN KEY (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN),
	CONSTRAINT R_308 FOREIGN KEY (Hub_CrncyCd_From_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN),
	CONSTRAINT R_309 FOREIGN KEY (Hub_CrncyCd_To_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_CrncyCd_CrncyRtID ON Lnk_CrncyCd_CrncyRtID
(
	Hub_CrncyRtID_SQN     ASC,
	Hub_CrncyCd_From_SQN  ASC,
	Hub_CrncyCd_To_SQN    ASC
)
;



CREATE TABLE Lnk_SOrdNum_CrncyRtID
(
	Lnk_SOrdNum_CrncyRtID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_SOrdNum_CrncyRtID_LDTS  DATE  NOT NULL,
	Lnk_SOrdNum_CrncyRtID_RSRC  VARCHAR(18)  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  ,
	Hub_CrncyRtID_SQN     NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_SOrdNum_CrncyRtID  PRIMARY KEY (Lnk_SOrdNum_CrncyRtID_SQN),
	CONSTRAINT R_311 FOREIGN KEY (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN),
	CONSTRAINT R_312 FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_CrncyRtID ON Lnk_SOrdNum_CrncyRtID
(
	Hub_CrncyRtID_SQN     ASC,
	Hub_SOrdNum_SQN       ASC
)
;



CREATE TABLE Sat_CntryRgn
(
	Hub_CntryRgnCd_SQN    NUMERIC(12)  NOT NULL,
	Sat_CntryRgn_LDTS     DATE  NOT NULL,
	Sat_CntryRgn_LEDTS    DATE  ,
	Sat_CntryRgn_RSRC     VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_CountryRegion_CountryRegionCode  PRIMARY KEY (Hub_CntryRgnCd_SQN,Sat_CntryRgn_LDTS),
	CONSTRAINT R_304 FOREIGN KEY (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN)
)
;



CREATE UNIQUE INDEX AK_CountryRegion_Name ON Sat_CntryRgn
(
	Name                  ASC
)
;



CREATE TABLE Lnk_SaleTerID_StProvID
(
	Lnk_SaleTerID_StProvID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_SaleTerID_StProvID_LDTS  DATE  NOT NULL,
	Lnk_SaleTerID_StProvID_RSRC  VARCHAR(18)  ,
	Hub_StProvID_SQN      NUMERIC(12)  ,
	Hub_SaleTerID_SQN     NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_SaleTerID_StProvID  PRIMARY KEY (Lnk_SaleTerID_StProvID_SQN),
	CONSTRAINT R_293 FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN),
	CONSTRAINT R_294 FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SaleTerID_StProvID ON Lnk_SaleTerID_StProvID
(
	Hub_SaleTerID_SQN     ASC,
	Hub_StProvID_SQN      ASC
)
;



CREATE TABLE Lnk_CustID_SOrdNum
(
	Lnk_CustID_SOrdNum_SQN  NUMERIC(12)  NOT NULL,
	Lnk_CustID_SOrdNum_LDTS  DATE  NOT NULL,
	Lnk_CustID_SOrdNum_RSRC  VARCHAR(18)  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  ,
	Hub_CustID_SQN        NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_CustID_SOrdNum  PRIMARY KEY (Lnk_CustID_SOrdNum_SQN),
	CONSTRAINT R_258 FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	CONSTRAINT R_259 FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_CustID_SOrdNum ON Lnk_CustID_SOrdNum
(
	Hub_SOrdNum_SQN       ASC,
	Hub_CustID_SQN        ASC
)
;



CREATE TABLE Sat_Add
(
	Hub_AddID_SQN         NUMERIC(12)  NOT NULL,
	Sat_Add_LDTS          DATE  NOT NULL,
	Sat_Add_LEDTS         DATE  ,
	Sat_Add_RSRC          VARCHAR(18)  ,
	AddressLine1          VARCHAR(60)  NOT NULL,
	AddressLine2          VARCHAR(60)  ,
	City                  VARCHAR(30)  NOT NULL,
	StateProvinceID       CHAR(18)  NOT NULL,
	PostalCode            VARCHAR(15)  NOT NULL,
	SpatialLocation       CHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_Address_AddressID  PRIMARY KEY (Hub_AddID_SQN,Sat_Add_LDTS),
	CONSTRAINT R_286 FOREIGN KEY (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
;



CREATE UNIQUE INDEX IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_Postal ON Sat_Add
(
	AddressLine1          ASC,
	AddressLine2          ASC,
	City                  ASC,
	StateProvinceID       ASC,
	PostalCode            ASC
)
;



CREATE TABLE Lnk_BusEntID_AddID_AddTypID
(
	Lnk_BusEntID_AddID_AddTypID_SQ  NUMERIC(12)  NOT NULL,
	Lnk_BusEntID_AddID_AddTypID_LD  DATE  NOT NULL,
	Lnk_BusEntID_AddID_AddTypID_RS  VARCHAR(18)  ,
	Hub_BusEntID_SQN      NUMERIC(12)  ,
	Hub_AddID_SQN         NUMERIC(12)  ,
	Hub_AddTypID_SQN      NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_BusEntID_AddID  PRIMARY KEY (Lnk_BusEntID_AddID_AddTypID_SQ),
	CONSTRAINT R_281 FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT R_282 FOREIGN KEY (Hub_AddTypID_SQN) REFERENCES Hub_AddTypID(Hub_AddTypID_SQN),
	CONSTRAINT R_283 FOREIGN KEY (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_BusEntID_AddID ON Lnk_BusEntID_AddID_AddTypID
(
	Hub_BusEntID_SQN      ASC,
	Hub_AddTypID_SQN      ASC,
	Hub_AddID_SQN         ASC
)
;



CREATE TABLE Sat_BusEntID_AddID_AddTypID
(
	Lnk_BusEntID_AddID_AddTypID_SQ  NUMERIC(12)  NOT NULL,
	Sat_BusEntID_AddID_AddTypID_LD  DATE  NOT NULL,
	Sat_BusEntID_AddID_AddTypID_LE  DATE  ,
	Sat_BusEntID_AddID_AddTypID_RS  VARCHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeI  PRIMARY KEY (Lnk_BusEntID_AddID_AddTypID_SQ,Sat_BusEntID_AddID_AddTypID_LD),
	CONSTRAINT R_284 FOREIGN KEY (Lnk_BusEntID_AddID_AddTypID_SQ) REFERENCES Lnk_BusEntID_AddID_AddTypID(Lnk_BusEntID_AddID_AddTypID_SQ)
)
;



CREATE TABLE Lnk_ProdNum_BOMID
(
	Lnk_ProdNum_BOMID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_ProdNum_BOMID_LDTS  DATE  NOT NULL,
	Lnk_ProdNum_BOMID_RSRC  VARCHAR(18)  ,
	Hub_ProdNum_Asmbly_SQN  NUMERIC(12)  ,
	Hub_ProdNum_Comp_SQN  NUMERIC(12)  ,
	Hub_BOMID_SQN         NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_BOM_Heir  PRIMARY KEY (Lnk_ProdNum_BOMID_SQN),
	CONSTRAINT R_323 FOREIGN KEY (Hub_ProdNum_Comp_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_324 FOREIGN KEY (Hub_ProdNum_Asmbly_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_325 FOREIGN KEY (Hub_BOMID_SQN) REFERENCES Hub_BOMID(Hub_BOMID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_BOM_Heir ON Lnk_ProdNum_BOMID
(
	Hub_ProdNum_Comp_SQN  ASC,
	Hub_ProdNum_Asmbly_SQN  ASC,
	Hub_BOMID_SQN         ASC
)
;



CREATE TABLE Hub_CntTypID
(
	Hub_CntTypID_SQN      NUMERIC(12)  NOT NULL,
	Hub_CntTypID_LDTS     DATE  NOT NULL,
	Hub_CntTypID_RSRC     VARCHAR(18)  ,
	ContactTypeID         INTEGER  NOT NULL,
	CONSTRAINT  PK_ContactType_ContactTypeID  PRIMARY KEY (Hub_CntTypID_SQN)
)
;



CREATE UNIQUE INDEX BK_ContactTypeID ON Hub_CntTypID
(
	ContactTypeID         ASC
)
;



CREATE TABLE Sat_CntTyp
(
	Hub_CntTypID_SQN      NUMERIC(12)  NOT NULL,
	Sat_CntTyp_LDTS       DATE  NOT NULL,
	Sat_CntTyp_LEDTS      DATE  ,
	Sat_CntTyp_RSRC       VARCHAR(18)  ,
	Name                  VARCHAR(50)  NOT NULL,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_ContactType_ContactTypeID  PRIMARY KEY (Hub_CntTypID_SQN,Sat_CntTyp_LDTS),
	CONSTRAINT R_277 FOREIGN KEY (Hub_CntTypID_SQN) REFERENCES Hub_CntTypID(Hub_CntTypID_SQN)
)
;



CREATE UNIQUE INDEX AK_ContactType_Name ON Sat_CntTyp
(
	Name                  ASC
)
;



CREATE TABLE Lnk_PersID_BusEntID_CntTypID
(
	Lnk_PersID_BusEntID_CntTypID_S  NUMERIC(12)  NOT NULL,
	Lnk_PersID_BusEntID_CntTypID_L  DATE  NOT NULL,
	Lnk_PersID_BusEntID_CntTypID_R  VARCHAR(18)  ,
	Hub_BusEntID_SQN      NUMERIC(12)  ,
	Hub_PersID_SQN        NUMERIC(12)  ,
	Hub_CntTypID_SQN      NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_PersID_BusEntID_CntTypID  PRIMARY KEY (Lnk_PersID_BusEntID_CntTypID_S),
	CONSTRAINT R_278 FOREIGN KEY (Hub_CntTypID_SQN) REFERENCES Hub_CntTypID(Hub_CntTypID_SQN),
	CONSTRAINT R_279 FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT R_280 FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_PersID_BusEntID_CntTypID ON Lnk_PersID_BusEntID_CntTypID
(
	Hub_CntTypID_SQN      ASC,
	Hub_BusEntID_SQN      ASC,
	Hub_PersID_SQN        ASC
)
;



CREATE TABLE Sat_BusEnt_Cnt
(
	Lnk_PersID_BusEntID_CntTypID_S  NUMERIC(12)  NOT NULL,
	Sat_BusEnt_Cnt_LDTS   DATE  NOT NULL,
	Sat_BusEnt_Cnt_LEDTS  DATE  ,
	Sat_BusEnt_Cnt_RSRC   VARCHAR(18)  ,
	ModifiedDate          TIMESTAMP  NOT NULL,
	CONSTRAINT  PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID  PRIMARY KEY (Lnk_PersID_BusEntID_CntTypID_S,Sat_BusEnt_Cnt_LDTS),
	CONSTRAINT R_276 FOREIGN KEY (Lnk_PersID_BusEntID_CntTypID_S) REFERENCES Lnk_PersID_BusEntID_CntTypID(Lnk_PersID_BusEntID_CntTypID_S)
)
;



CREATE TABLE Lnk_SOrdNum_SaleTerID
(
	Lnk_SOrdNum_SaleTerID_SQN  NUMERIC(12)  NOT NULL,
	Lnk_SOrdNum_SaleTerID_LDTS  DATE  NOT NULL,
	Lnk_SOrdNum_SaleTerID_RSRC  VARCHAR(18)  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  ,
	Hub_SaleTerID_SQN     NUMERIC(12)  ,
	CONSTRAINT  XPKLnk_SOrdNum_SaleTerID  PRIMARY KEY (Lnk_SOrdNum_SaleTerID_SQN),
	CONSTRAINT R_263 FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN),
	CONSTRAINT R_264 FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_SaleTerID ON Lnk_SOrdNum_SaleTerID
(
	Hub_SaleTerID_SQN     ASC,
	Hub_SOrdNum_SQN       ASC
)
;



CREATE PROCEDURE uspGetWhereUsedProductID 
	@StartProductID int , 
	@CheckDate datetime   
   
 AS BEGIN
    SET NOCOUNT ON;

    --Use recursive query to generate a multi-level Bill of Material (i.e. all level 1 components of a level 0 assembly, all level 2 components of a level 1 assembly)
    WITH [BOM_cte]([ProductAssemblyID], [ComponentID], [ComponentDesc], [PerAssemblyQty], [StandardCost], [ListPrice], [BOMLevel], [RecursionLevel]) -- CTE name and columns
    AS (
        SELECT b.[ProductAssemblyID], b.[ComponentID], p.[Name], b.[PerAssemblyQty], p.[StandardCost], p.[ListPrice], b.[BOMLevel], 0 -- Get the initial list of components for the bike assembly
        FROM [Production].[BillOfMaterials] b
            INNER JOIN [Production].[Product] p 
            ON b.[ProductAssemblyID] = p.[ProductID] 
        WHERE b.[ComponentID] = @StartProductID 
            AND @CheckDate >= b.[StartDate] 
            AND @CheckDate <= ISNULL(b.[EndDate], @CheckDate)
        UNION ALL
        SELECT b.[ProductAssemblyID], b.[ComponentID], p.[Name], b.[PerAssemblyQty], p.[StandardCost], p.[ListPrice], b.[BOMLevel], [RecursionLevel] + 1 -- Join recursive member to anchor
        FROM [BOM_cte] cte
            INNER JOIN [Production].[BillOfMaterials] b 
            ON cte.[ProductAssemblyID] = b.[ComponentID]
            INNER JOIN [Production].[Product] p 
            ON b.[ProductAssemblyID] = p.[ProductID] 
        WHERE @CheckDate >= b.[StartDate] 
            AND @CheckDate <= ISNULL(b.[EndDate], @CheckDate)
        )
    -- Outer select from the CTE
    SELECT b.[ProductAssemblyID], b.[ComponentID], b.[ComponentDesc], SUM(b.[PerAssemblyQty]) AS [TotalQuantity] , b.[StandardCost], b.[ListPrice], b.[BOMLevel], b.[RecursionLevel]
    FROM [BOM_cte] b
    GROUP BY b.[ComponentID], b.[ComponentDesc], b.[ProductAssemblyID], b.[BOMLevel], b.[RecursionLevel], b.[StandardCost], b.[ListPrice]
    ORDER BY b.[BOMLevel], b.[ProductAssemblyID], b.[ComponentID]
    OPTION (MAXRECURSION 25) 
END;
;



CREATE PROCEDURE uspUpdateEmployeeHireInfo 
	@BusinessEntityID int , 
	@JobTitle nvarchar(50) , 
	@HireDate datetime , 
	@RateChangeDate datetime , 
	@Rate money , 
	@PayFrequency tinyint , 
	@CurrentFlag dbo.Flag   
   
 AS BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [HumanResources].[Employee] 
        SET [JobTitle] = @JobTitle 
            ,[HireDate] = @HireDate 
            ,[CurrentFlag] = @CurrentFlag 
        WHERE [BusinessEntityID] = @BusinessEntityID;

        INSERT INTO [HumanResources].[EmployeePayHistory] 
            ([BusinessEntityID]
            ,[RateChangeDate]
            ,[Rate]
            ,[PayFrequency]) 
        VALUES (@BusinessEntityID, @RateChangeDate, @Rate, @PayFrequency);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback any active or uncommittable transactions before
        -- inserting information in the ErrorLog
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
;



CREATE PROCEDURE uspPrintError   
   
 AS BEGIN
    SET NOCOUNT ON;

    -- Print error information. 
    PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
END;
;



CREATE PROCEDURE uspUpdateEmployeeLogin 
	@BusinessEntityID int , 
	@OrganizationNode  , 
	@LoginID nvarchar(256) , 
	@JobTitle nvarchar(50) , 
	@HireDate datetime , 
	@CurrentFlag dbo.Flag   
   
 AS BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE [HumanResources].[Employee] 
        SET [OrganizationNode] = @OrganizationNode 
            ,[LoginID] = @LoginID 
            ,[JobTitle] = @JobTitle 
            ,[HireDate] = @HireDate 
            ,[CurrentFlag] = @CurrentFlag 
        WHERE [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
;



CREATE PROCEDURE uspLogError 
	@ErrorLogID int  = 0  OUTPUT   
   
 AS -- by uspLogError in the ErrorLog table
BEGIN
    SET NOCOUNT ON;

    -- Output parameter value of 0 indicates that error 
    -- information was not logged
    SET @ErrorLogID = 0;

    BEGIN TRY
        -- Return if there is no error information to log
        IF ERROR_NUMBER() IS NULL
            RETURN;

        -- Return if inside an uncommittable transaction.
        -- Data insertion/modification is not allowed when 
        -- a transaction is in an uncommittable state.
        IF XACT_STATE() = -1
        BEGIN
            PRINT 'Cannot log error since the current transaction is in an uncommittable state. ' 
                + 'Rollback the transaction before executing uspLogError in order to successfully log error information.';
            RETURN;
        END

        INSERT [dbo].[ErrorLog] 
            (
            [UserName], 
            [ErrorNumber], 
            [ErrorSeverity], 
            [ErrorState], 
            [ErrorProcedure], 
            [ErrorLine], 
            [ErrorMessage]
            ) 
        VALUES 
            (
            CONVERT(sysname, CURRENT_USER), 
            ERROR_NUMBER(),
            ERROR_SEVERITY(),
            ERROR_STATE(),
            ERROR_PROCEDURE(),
            ERROR_LINE(),
            ERROR_MESSAGE()
            );

        -- Pass back the ErrorLogID of the row inserted
        SET @ErrorLogID = @@IDENTITY;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred in stored procedure uspLogError: ';
        EXECUTE [dbo].[uspPrintError];
        RETURN -1;
    END CATCH
END;
;



CREATE PROCEDURE uspUpdateEmployeePersonalInfo 
	@BusinessEntityID int , 
	@NationalIDNumber nvarchar(15) , 
	@BirthDate datetime , 
	@MaritalStatus nchar(1) , 
	@Gender nchar(1)   
   
 AS BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE [HumanResources].[Employee] 
        SET [NationalIDNumber] = @NationalIDNumber 
            ,[BirthDate] = @BirthDate 
            ,[MaritalStatus] = @MaritalStatus 
            ,[Gender] = @Gender 
        WHERE [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
;



CREATE PROCEDURE uspSearchCandidateResumes 
	@searchString nvarchar(1000) , 
	@useInflectional bit  = 0 , 
	@useThesaurus bit  = 0 , 
	@language int  = 0   
   
 AS BEGIN
    SET NOCOUNT ON;

      DECLARE @string nvarchar(1050)
      --setting the lcid to the default instance LCID if needed
      IF @language = NULL OR @language = 0 
      BEGIN 
            SELECT @language =CONVERT(int, serverproperty('lcid'))  
      END
      

            --FREETEXTTABLE case as inflectional and Thesaurus were required
      IF @useThesaurus = 1 AND @useInflectional = 1  
        BEGIN
                  SELECT FT_TBL.[JobCandidateID], KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 
                        INNER JOIN FREETEXTTABLE([HumanResources].[JobCandidate],*, @searchString,LANGUAGE @language) AS KEY_TBL
                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]
            END

      ELSE IF @useThesaurus = 1
            BEGIN
                  SELECT @string ='FORMSOF(THESAURUS,"'+@searchString +'"'+')'      
                  SELECT FT_TBL.[JobCandidateID], KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 
                        INNER JOIN CONTAINSTABLE([HumanResources].[JobCandidate],*, @string,LANGUAGE @language) AS KEY_TBL
                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]
        END

      ELSE IF @useInflectional = 1
            BEGIN
                  SELECT @string ='FORMSOF(INFLECTIONAL,"'+@searchString +'"'+')'
                  SELECT FT_TBL.[JobCandidateID], KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 
                        INNER JOIN CONTAINSTABLE([HumanResources].[JobCandidate],*, @string,LANGUAGE @language) AS KEY_TBL
                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]
        END
  
      ELSE --base case, plain CONTAINSTABLE
            BEGIN
                  SELECT @string='"'+@searchString +'"'
                  SELECT FT_TBL.[JobCandidateID],KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 
                        INNER JOIN CONTAINSTABLE([HumanResources].[JobCandidate],*,@string,LANGUAGE @language) AS KEY_TBL
                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]
            END

END;
;



CREATE PROCEDURE uspGetBillOfMaterials 
	@StartProductID int , 
	@CheckDate datetime   
   
 AS BEGIN
    SET NOCOUNT ON;

    -- Use recursive query to generate a multi-level Bill of Material (i.e. all level 1 
    -- components of a level 0 assembly, all level 2 components of a level 1 assembly)
    -- The CheckDate eliminates any components that are no longer used in the product on this date.
    WITH [BOM_cte]([ProductAssemblyID], [ComponentID], [ComponentDesc], [PerAssemblyQty], [StandardCost], [ListPrice], [BOMLevel], [RecursionLevel]) -- CTE name and columns
    AS (
        SELECT b.[ProductAssemblyID], b.[ComponentID], p.[Name], b.[PerAssemblyQty], p.[StandardCost], p.[ListPrice], b.[BOMLevel], 0 -- Get the initial list of components for the bike assembly
        FROM [Production].[BillOfMaterials] b
            INNER JOIN [Production].[Product] p 
            ON b.[ComponentID] = p.[ProductID] 
        WHERE b.[ProductAssemblyID] = @StartProductID 
            AND @CheckDate >= b.[StartDate] 
            AND @CheckDate <= ISNULL(b.[EndDate], @CheckDate)
        UNION ALL
        SELECT b.[ProductAssemblyID], b.[ComponentID], p.[Name], b.[PerAssemblyQty], p.[StandardCost], p.[ListPrice], b.[BOMLevel], [RecursionLevel] + 1 -- Join recursive member to anchor
        FROM [BOM_cte] cte
            INNER JOIN [Production].[BillOfMaterials] b 
            ON b.[ProductAssemblyID] = cte.[ComponentID]
            INNER JOIN [Production].[Product] p 
            ON b.[ComponentID] = p.[ProductID] 
        WHERE @CheckDate >= b.[StartDate] 
            AND @CheckDate <= ISNULL(b.[EndDate], @CheckDate)
        )
    -- Outer select from the CTE
    SELECT b.[ProductAssemblyID], b.[ComponentID], b.[ComponentDesc], SUM(b.[PerAssemblyQty]) AS [TotalQuantity] , b.[StandardCost], b.[ListPrice], b.[BOMLevel], b.[RecursionLevel]
    FROM [BOM_cte] b
    GROUP BY b.[ComponentID], b.[ComponentDesc], b.[ProductAssemblyID], b.[BOMLevel], b.[RecursionLevel], b.[StandardCost], b.[ListPrice]
    ORDER BY b.[BOMLevel], b.[ProductAssemblyID], b.[ComponentID]
    OPTION (MAXRECURSION 25) 
END;
;



CREATE PROCEDURE uspGetEmployeeManagers 
	@BusinessEntityID int   
   
 AS BEGIN
    SET NOCOUNT ON;

    -- Use recursive query to list out all Employees required for a particular Manager
    WITH [EMP_cte]([BusinessEntityID], [OrganizationNode], [FirstName], [LastName], [JobTitle], [RecursionLevel]) -- CTE name and columns
    AS (
        SELECT e.[BusinessEntityID], e.[OrganizationNode], p.[FirstName], p.[LastName], e.[JobTitle], 0 -- Get the initial Employee
        FROM [HumanResources].[Employee] e 
			INNER JOIN [Person].[Person] as p
			ON p.[BusinessEntityID] = e.[BusinessEntityID]
        WHERE e.[BusinessEntityID] = @BusinessEntityID
        UNION ALL
        SELECT e.[BusinessEntityID], e.[OrganizationNode], p.[FirstName], p.[LastName], e.[JobTitle], [RecursionLevel] + 1 -- Join recursive member to anchor
        FROM [HumanResources].[Employee] e 
            INNER JOIN [EMP_cte]
            ON e.[OrganizationNode] = [EMP_cte].[OrganizationNode].GetAncestor(1)
            INNER JOIN [Person].[Person] p 
            ON p.[BusinessEntityID] = e.[BusinessEntityID]
    )
    -- Join back to Employee to return the manager name 
    SELECT [EMP_cte].[RecursionLevel], [EMP_cte].[BusinessEntityID], [EMP_cte].[FirstName], [EMP_cte].[LastName], 
        [EMP_cte].[OrganizationNode].ToString() AS [OrganizationNode], p.[FirstName] AS 'ManagerFirstName', p.[LastName] AS 'ManagerLastName'  -- Outer select from the CTE
    FROM [EMP_cte] 
        INNER JOIN [HumanResources].[Employee] e 
        ON [EMP_cte].[OrganizationNode].GetAncestor(1) = e.[OrganizationNode]
        INNER JOIN [Person].[Person] p 
        ON p.[BusinessEntityID] = e.[BusinessEntityID]
    ORDER BY [RecursionLevel], [EMP_cte].[OrganizationNode].ToString()
    OPTION (MAXRECURSION 25) 
END;
;



CREATE PROCEDURE uspGetManagerEmployees 
	@BusinessEntityID int   
   
 AS BEGIN
    SET NOCOUNT ON;

    -- Use recursive query to list out all Employees required for a particular Manager
    WITH [EMP_cte]([BusinessEntityID], [OrganizationNode], [FirstName], [LastName], [RecursionLevel]) -- CTE name and columns
    AS (
        SELECT e.[BusinessEntityID], e.[OrganizationNode], p.[FirstName], p.[LastName], 0 -- Get the initial list of Employees for Manager n
        FROM [HumanResources].[Employee] e 
			INNER JOIN [Person].[Person] p 
			ON p.[BusinessEntityID] = e.[BusinessEntityID]
        WHERE e.[BusinessEntityID] = @BusinessEntityID
        UNION ALL
        SELECT e.[BusinessEntityID], e.[OrganizationNode], p.[FirstName], p.[LastName], [RecursionLevel] + 1 -- Join recursive member to anchor
        FROM [HumanResources].[Employee] e 
            INNER JOIN [EMP_cte]
            ON e.[OrganizationNode].GetAncestor(1) = [EMP_cte].[OrganizationNode]
			INNER JOIN [Person].[Person] p 
			ON p.[BusinessEntityID] = e.[BusinessEntityID]
        )
    -- Join back to Employee to return the manager name 
    SELECT [EMP_cte].[RecursionLevel], [EMP_cte].[OrganizationNode].ToString() as [OrganizationNode], p.[FirstName] AS 'ManagerFirstName', p.[LastName] AS 'ManagerLastName',
        [EMP_cte].[BusinessEntityID], [EMP_cte].[FirstName], [EMP_cte].[LastName] -- Outer select from the CTE
    FROM [EMP_cte] 
        INNER JOIN [HumanResources].[Employee] e 
        ON [EMP_cte].[OrganizationNode].GetAncestor(1) = e.[OrganizationNode]
			INNER JOIN [Person].[Person] p 
			ON p.[BusinessEntityID] = e.[BusinessEntityID]
    ORDER BY [RecursionLevel], [EMP_cte].[OrganizationNode].ToString()
    OPTION (MAXRECURSION 25) 
END;
;


