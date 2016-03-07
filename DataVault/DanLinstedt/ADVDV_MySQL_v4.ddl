
CREATE TABLE Hub_ProdSubCatID
(
	Hub_ProdSubCatID_SQN  NUMERIC(12) NOT NULL,
	Hub_ProdSubCatID_LDTS  DATE NOT NULL,
	Hub_ProdSubCatID_RSRC  VARCHAR(18) NULL,
	ProductSubcategoryID  INTEGER NOT NULL,
	 PRIMARY KEY (Hub_ProdSubCatID_SQN)
)
;



CREATE UNIQUE INDEX BK_ProductSubcategoryID ON Hub_ProdSubCatID
(
	ProductSubcategoryID
)
;



CREATE TABLE Hub_ProdNum
(
	Hub_ProdNum_SQN       NUMERIC(12) NOT NULL,
	Hub_ProdNum_LDTS      DATE NOT NULL,
	Hub_ProdNum_RSRC      VARCHAR(18) NULL,
	ProductNumber         VARCHAR(25) NOT NULL,
	 PRIMARY KEY (Hub_ProdNum_SQN)
)
;



CREATE UNIQUE INDEX BK_ProdNumID ON Hub_ProdNum
(
	ProductNumber
)
;



CREATE TABLE Hub_ProdCatID
(
	Hub_ProdCatID_SQN     NUMERIC(12) NOT NULL,
	Hub_ProdCatID_LDTS    DATE NOT NULL,
	Hub_ProdCatID_RSRC    VARCHAR(18) NULL,
	ProductCategoryID     INTEGER NOT NULL,
	 PRIMARY KEY (Hub_ProdCatID_SQN)
)
;



CREATE UNIQUE INDEX BK_ProductCategoryID ON Hub_ProdCatID
(
	ProductCategoryID
)
;



CREATE TABLE Lnk_ProdNum_ProdSubCatID
(
	Lnk_ProdNum_ProdSubCatID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_ProdSubCatID_LDTS  DATE NOT NULL,
	Lnk_ProdNum_ProdSubCatID_RSRC  VARCHAR(18) NULL,
	Hub_ProdCatID_SQN     NUMERIC(12) NOT NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_ProdSubCatID_SQN  NUMERIC(12) NOT NULL,
	 PRIMARY KEY (Lnk_ProdNum_ProdSubCatID_SQN)FOREIGN KEY R_131 (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN),
	FOREIGN KEY R_133 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	FOREIGN KEY R_326 (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_ProdSubCatID_ProdCatID ON Lnk_ProdNum_ProdSubCatID
(
	Hub_ProdNum_SQN,
	Hub_ProdSubCatID_SQN,
	Hub_ProdCatID_SQN
)
;



CREATE TABLE Sat_ProdSubCat
(
	Hub_ProdSubCatID_SQN  NUMERIC(12) NOT NULL,
	Sat_ProdSubCat_LDTS   DATE NOT NULL,
	Sat_ProdSubCat_LEDTS  DATE NULL,
	Sat_ProdSubCat_RSRC   VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ProdSubCatID_SQN,Sat_ProdSubCat_LDTS)FOREIGN KEY R_122 (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductSubcategory_Name ON Sat_ProdSubCat
(
	Name
)
;



CREATE TABLE Lnk_ProdSubCatID_ProdCatID
(
	Lnk_ProdSubCatID_ProdCatID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdSubCatID_ProdCatID_LDTS  DATE NOT NULL,
	Lnk_ProdSubCatID_ProdCatID_RSRC  VARCHAR(18) NULL,
	Hub_ProdSubCatID_SQN  NUMERIC(12) NOT NULL,
	Hub_ProdCatID_SQN     NUMERIC(12) NOT NULL,
	 PRIMARY KEY (Lnk_ProdSubCatID_ProdCatID_SQN)FOREIGN KEY R_128 (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN),
	FOREIGN KEY R_129 (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_ProdSubCatID_ProdCatID ON Lnk_ProdSubCatID_ProdCatID
(
	Hub_ProdCatID_SQN,
	Hub_ProdSubCatID_SQN
)
;



CREATE TABLE Sat_ProdCat
(
	Hub_ProdCatID_SQN     NUMERIC(12) NOT NULL,
	Sat_ProdCat_LDTS      DATE NOT NULL,
	Sat_ProdCat_LEDTS     DATE NULL,
	Sat_ProdCat_RSRC      VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ProdCatID_SQN,Sat_ProdCat_LDTS)FOREIGN KEY R_121 (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductCategory_Name ON Sat_ProdCat
(
	Name
)
;



CREATE TABLE Hub_AddID
(
	Hub_AddID_SQN         NUMERIC(12) NOT NULL,
	Hub_AddID_RSRC        VARCHAR(18) NULL,
	Hub_AddID_LDTS        DATE NOT NULL,
	AddressID             INTEGER NOT NULL,
	 PRIMARY KEY (Hub_AddID_SQN)
)
;



CREATE UNIQUE INDEX BK_AddressID ON Hub_AddID
(
	AddressID
)
;



CREATE TABLE Hub_StProvID
(
	Hub_StProvID_SQN      NUMERIC(12) NOT NULL,
	Hub_StProvID_LDTS     DATE NOT NULL,
	Hub_StProvID_RSRC     VARCHAR(18) NULL,
	StateProvinceID       INTEGER NOT NULL,
	 PRIMARY KEY (Hub_StProvID_SQN)
)
;



CREATE UNIQUE INDEX BK_StateProvinceID ON Hub_StProvID
(
	StateProvinceID
)
;



CREATE TABLE Lnk_AddID_StProvID
(
	Lnk_AddID_StProvID_SQN  NUMERIC(12) NOT NULL,
	Lnk_AddID_StProvID_LDTS  DATE NOT NULL,
	Lnk_AddID_StProvID_RSRC  VARCHAR(18) NULL,
	Hub_AddID_SQN         NUMERIC(12) NULL,
	Hub_StProvID_SQN      NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_AddID_StProvID_SQN)FOREIGN KEY R_291 (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN),
	FOREIGN KEY R_292 (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_AddID_StProvID ON Lnk_AddID_StProvID
(
	Hub_AddID_SQN,
	Hub_StProvID_SQN
)
;



CREATE TABLE Hub_DocNode
(
	Hub_DocNode_SQN       NUMERIC(12) NOT NULL,
	Hub_DocNode_LDTS      DATE NOT NULL,
	Hub_DocNode_RSRC      VARCHAR(18) NULL,
	DocumentNode          CHAR(18) NOT NULL,
	 PRIMARY KEY (Hub_DocNode_SQN)
)
;



CREATE UNIQUE INDEX BK_DocumentNode ON Hub_DocNode
(
	DocumentNode
)
;



CREATE TABLE Lnk_ProdNum_DocNode
(
	Lnk_ProdNum_DocNode_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_DocNode_LDTS  DATE NOT NULL,
	Lnk_ProdNum_DocNode_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_DocNode_SQN       NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ProdNum_DocNode_SQN)FOREIGN KEY R_194 (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN),
	FOREIGN KEY R_195 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductDocument ON Lnk_ProdNum_DocNode
(
	Hub_ProdNum_SQN,
	Hub_DocNode_SQN
)
;



CREATE TABLE Sat_Prod_Doc
(
	Lnk_ProdNum_DocNode_SQN  NUMERIC(12) NOT NULL,
	Sat_Prod_Doc_LDTS     DATE NOT NULL,
	Sat_Prod_Doc_LEDTS    DATE NULL,
	Sat_Prod_Doc_RSRC     VARCHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_ProdNum_DocNode_SQN,Sat_Prod_Doc_LDTS)FOREIGN KEY R_192 (Lnk_ProdNum_DocNode_SQN) REFERENCES Lnk_ProdNum_DocNode(Lnk_ProdNum_DocNode_SQN)
)
;



CREATE TABLE Hub_ShopCartItemID
(
	Hub_ShopCartItemID_SQN  NUMERIC(12) NOT NULL,
	Hub_ShopCartItemID_LDTS  DATE NOT NULL,
	Hub_ShopCartItemID_RSRC  VARCHAR(18) NULL,
	ShoppingCartItemID    INTEGER NOT NULL,
	 PRIMARY KEY (Hub_ShopCartItemID_SQN)
)
;



CREATE UNIQUE INDEX BK_ShopCartItemID ON Hub_ShopCartItemID
(
	ShoppingCartItemID
)
;



CREATE TABLE Sat_ShopCartItem
(
	Hub_ShopCartItemID_SQN  NUMERIC(12) NOT NULL,
	Sat_ShopCartItem_LDTS  DATE NOT NULL,
	Sat_ShopCartItem_LEDTS  DATE NULL,
	Sat_ShopCartItem_RSRC  VARCHAR(18) NULL,
	ShoppingCartID        VARCHAR(50) NOT NULL,
	Quantity              INTEGER NOT NULL,
	DateCreated           datetime NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ShopCartItemID_SQN,Sat_ShopCartItem_LDTS)FOREIGN KEY R_113 (Hub_ShopCartItemID_SQN) REFERENCES Hub_ShopCartItemID(Hub_ShopCartItemID_SQN)
)
;



CREATE TABLE Hub_SOrdNum
(
	Hub_SOrdNum_SQN       NUMERIC(12) NOT NULL,
	Hub_SOrdNum_LDTS      DATE NOT NULL,
	Hub_SOrdNum_RSRC      VARCHAR(18) NULL,
	SalesOrderNumber      VARCHAR(25) NOT NULL,
	 PRIMARY KEY (Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX BK_SalesOrderHeaderID ON Hub_SOrdNum
(
	SalesOrderNumber
)
;



CREATE TABLE Hub_SRsnID
(
	Hub_SRsnID_SQN        NUMERIC(12) NOT NULL,
	Hub_SRsnID_LDTS       DATE NOT NULL,
	Hub_SRsnID_RSRC       VARCHAR(18) NULL,
	SalesReasonID         INTEGER NOT NULL,
	 PRIMARY KEY (Hub_SRsnID_SQN)
)
;



CREATE UNIQUE INDEX BK_SalesReasonID ON Hub_SRsnID
(
	SalesReasonID
)
;



CREATE TABLE Lnk_SOrdNum_SRsnID
(
	Lnk_SOrdNum_SRsnID_SQN  NUMERIC(12) NOT NULL,
	Lnk_SOrdNum_SRsnID_LDTS  DATE NOT NULL,
	Lnk_SOrdNum_SRsnID_RSRC  VARCHAR(18) NULL,
	Hub_SOrdNum_SQN       NUMERIC(12) NULL,
	Hub_SRsnID_SQN        NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_SOrdNum_SRsnID_SQN)FOREIGN KEY R_188 (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	FOREIGN KEY R_189 (Hub_SRsnID_SQN) REFERENCES Hub_SRsnID(Hub_SRsnID_SQN)
)
;



CREATE UNIQUE INDEX AK_SalesOrderHeaderSalesReason ON Lnk_SOrdNum_SRsnID
(
	Hub_SOrdNum_SQN,
	Hub_SRsnID_SQN
)
;



CREATE TABLE Sat_SOrdNum_SRsnID
(
	Lnk_SOrdNum_SRsnID_SQN  NUMERIC(12) NOT NULL,
	Sat_SOrdNum_SRsnID_LDTS  DATE NOT NULL,
	Sat_SOrdNum_SRsnID_LEDTS  DATE NULL,
	Sat_SOrdNum_SRsnID_RSRC  VARCHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_SOrdNum_SRsnID_SQN,Sat_SOrdNum_SRsnID_LDTS)FOREIGN KEY R_191 (Lnk_SOrdNum_SRsnID_SQN) REFERENCES Lnk_SOrdNum_SRsnID(Lnk_SOrdNum_SRsnID_SQN)
)
;



CREATE TABLE Lnk_ProdNum_ShopCartItemID
(
	Lnk_ProdNum_ShopCartItemID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_ShopCartItemID_LDTS  DATE NOT NULL,
	Lnk_ProdNum_ShopCartItemID_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_ShopCartItemID_SQN  NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ProdNum_ShopCartItemID_SQN)FOREIGN KEY R_118 (Hub_ShopCartItemID_SQN) REFERENCES Hub_ShopCartItemID(Hub_ShopCartItemID_SQN),
	FOREIGN KEY R_119 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_ProdNum_ShopCartItemID ON Lnk_ProdNum_ShopCartItemID
(
	Hub_ShopCartItemID_SQN,
	Hub_ProdNum_SQN
)
;



CREATE TABLE Hub_ProdPhotoID
(
	Hub_ProdPhotoID_SQN   NUMERIC(12) NOT NULL,
	Hub_ProdPhotoID_LDTS  DATE NOT NULL,
	Hub_ProdPhotoID_RSRC  VARCHAR(18) NULL,
	ProductPhotoID        INTEGER NOT NULL,
	 PRIMARY KEY (Hub_ProdPhotoID_SQN)
)
;



CREATE UNIQUE INDEX BK_ProdPhotoID ON Hub_ProdPhotoID
(
	ProductPhotoID
)
;



CREATE TABLE Lnk_ProdNum_ProdPhotoID
(
	Lnk_ProdNum_ProdPhotoID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_ProdPhotoID_LDTS  DATE NOT NULL,
	Lnk_ProdNum_ProdPhotoID_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_ProdPhotoID_SQN   NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ProdNum_ProdPhotoID_SQN)FOREIGN KEY R_108 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	FOREIGN KEY R_109 (Hub_ProdPhotoID_SQN) REFERENCES Hub_ProdPhotoID(Hub_ProdPhotoID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_ProdNum_ProdPhotoID ON Lnk_ProdNum_ProdPhotoID
(
	Hub_ProdNum_SQN,
	Hub_ProdPhotoID_SQN
)
;



CREATE TABLE Sat_Prod_ProdPhoto
(
	Lnk_ProdNum_ProdPhotoID_SQN  NUMERIC(12) NOT NULL,
	Sat_ProdNum_ProdPhotoID_LDTS  DATE NOT NULL,
	Sat_ProdNum_ProdPhotoID_LEDTS  DATE NULL,
	Sat_ProdNum_ProdPhotoID_RSRC  VARCHAR(18) NULL,
	Primary               BIT NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_ProdNum_ProdPhotoID_SQN,Sat_ProdNum_ProdPhotoID_LDTS)FOREIGN KEY R_107 (Lnk_ProdNum_ProdPhotoID_SQN) REFERENCES Lnk_ProdNum_ProdPhotoID(Lnk_ProdNum_ProdPhotoID_SQN)
)
;



CREATE TABLE Sat_ProdPhoto
(
	Hub_ProdPhotoID_SQN   NUMERIC(12) NOT NULL,
	Sat_ProdPhoto_LDTS    DATE NOT NULL,
	Sat_ProdPhoto_LEDTS   DATE NULL,
	Sat_ProdPhoto_RSRC    VARCHAR(18) NULL,
	ThumbNailPhoto        BINARY NULL,
	ThumbnailPhotoFileName  VARCHAR(50) NULL,
	LargePhoto            BINARY NULL,
	LargePhotoFileName    VARCHAR(50) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ProdPhotoID_SQN,Sat_ProdPhoto_LDTS)FOREIGN KEY R_110 (Hub_ProdPhotoID_SQN) REFERENCES Hub_ProdPhotoID(Hub_ProdPhotoID_SQN)
)
;



CREATE TABLE Hub_SOfrID
(
	Hub_SOfrID_SQN        NUMERIC(12) NOT NULL,
	Hub_SOfrID_LDTS       DATE NOT NULL,
	Hub_SOfrID_RSRC       VARCHAR(18) NULL,
	SpecialOfferID        INTEGER NOT NULL,
	 PRIMARY KEY (Hub_SOfrID_SQN)
)
;



CREATE UNIQUE INDEX BK_SpecialOfferID ON Hub_SOfrID
(
	SpecialOfferID
)
;



CREATE TABLE Sat_SOfr
(
	Hub_SOfrID_SQN        NUMERIC(12) NOT NULL,
	Sat_SOfr_LDTS         DATE NOT NULL,
	Sat_SOfr_LEDTS        DATE NULL,
	Sat_SOfr_RSRC         VARCHAR(18) NULL,
	Description           VARCHAR(255) NOT NULL,
	DiscountPct           DECIMAL(10,4) NOT NULL,
	Type                  VARCHAR(50) NOT NULL,
	Category              VARCHAR(50) NOT NULL,
	StartDate             datetime NOT NULL,
	EndDate               datetime NOT NULL,
	MinQty                INTEGER NOT NULL,
	MaxQty                INTEGER NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_SOfrID_SQN,Sat_SOfr_LDTS)FOREIGN KEY R_182 (Hub_SOfrID_SQN) REFERENCES Hub_SOfrID(Hub_SOfrID_SQN)
)
;



CREATE TABLE Lnk_ProdNum_SOrdNum_SOfrID
(
	Lnk_ProdNum_SOrdNum_SOfrID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_SOrdNum_SOfrID_LDTS  DATE NOT NULL,
	Lnk_ProdNum_SOrdNum_SOfrID_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_SOrdNum_SQN       NUMERIC(12) NULL,
	Hub_SOfrID_SQN        NUMERIC(12) NULL,
	SalesOrderDetailID    INTEGER NOT NULL,
	 PRIMARY KEY (Lnk_ProdNum_SOrdNum_SOfrID_SQN)FOREIGN KEY R_174 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	FOREIGN KEY R_176 (Hub_SOfrID_SQN) REFERENCES Hub_SOfrID(Hub_SOfrID_SQN),
	FOREIGN KEY R_186 (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_SpecialOfferProduct ON Lnk_ProdNum_SOrdNum_SOfrID
(
	Hub_ProdNum_SQN,
	Hub_SOfrID_SQN,
	SalesOrderDetailID,
	Hub_SOrdNum_SQN
)
;



CREATE TABLE Sat_SOrdDet
(
	Lnk_ProdNum_SOrdID_SOfrID_SQN  NUMERIC(12) NOT NULL,
	Sat_SOrdDet_LDTS      DATE NOT NULL,
	Sat_SOrdDet_LEDTS     DATE NULL,
	Sat_SOrdDet_RSRC      VARCHAR(18) NULL,
	CarrierTrackingNumber  VARCHAR(25) NULL,
	OrderQty              smallint NOT NULL,
	UnitPrice             DECIMAL(19,4) NOT NULL,
	UnitPriceDiscount     DECIMAL(19,4) NOT NULL,
	LineTotal             numeric(38,6) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_ProdNum_SOrdID_SOfrID_SQN,Sat_SOrdDet_LDTS)FOREIGN KEY R_181 (Lnk_ProdNum_SOrdID_SOfrID_SQN) REFERENCES Lnk_ProdNum_SOrdNum_SOfrID(Lnk_ProdNum_SOrdNum_SOfrID_SQN)
)
;



CREATE TABLE Hub_LocID
(
	Hub_LocID_SQN         NUMERIC(12) NOT NULL,
	Hub_LocID_LDTS        DATE NOT NULL,
	Hub_LocID_RSRC        VARCHAR(18) NULL,
	LocationID            smallint NOT NULL,
	 PRIMARY KEY (Hub_LocID_SQN)
)
;



CREATE UNIQUE INDEX BK_LocationID ON Hub_LocID
(
	LocationID
)
;



CREATE TABLE Sat_Loc
(
	Hub_LocID_SQN         NUMERIC(12) NOT NULL,
	Sat_Loc_LDTS          DATE NOT NULL,
	Sat_Loc_LEDTS         DATE NULL,
	Sat_Loc_RSRC          VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	CostRate              DECIMAL(10,4) NOT NULL,
	Availability          decimal(8,2) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_LocID_SQN,Sat_Loc_LDTS)FOREIGN KEY R_161 (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
;



CREATE UNIQUE INDEX AK_Location_Name ON Sat_Loc
(
	Name
)
;



CREATE TABLE Sat_ProdNum_SOrdNum_SOfrID
(
	Lnk_ProdNum_SOrdNum_SOfrID_SQN  NUMERIC(12) NOT NULL,
	Sat_ProdNum_SOrdNum_SOfrID_LDTS  DATE NOT NULL,
	Sat_ProdNum_SOrdNum_SOfrID_LEDTS  DATE NULL,
	Sat_ProdNum_SOrdNum_SOfrID_RSRC  VARCHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_ProdNum_SOrdNum_SOfrID_SQN,Sat_ProdNum_SOrdNum_SOfrID_LDTS)FOREIGN KEY R_175 (Lnk_ProdNum_SOrdNum_SOfrID_SQN) REFERENCES Lnk_ProdNum_SOrdNum_SOfrID(Lnk_ProdNum_SOrdNum_SOfrID_SQN)
)
;



CREATE TABLE Hub_TransID
(
	Hub_TransID_SQN       NUMERIC(12) NOT NULL,
	Hub_TransID_LDTS      DATE NOT NULL,
	Hub_TransID_RSRC      VARCHAR(18) NULL,
	TransactionID         INTEGER NOT NULL,
	 PRIMARY KEY (Hub_TransID_SQN)
)
;



CREATE UNIQUE INDEX BK_TransID ON Hub_TransID
(
	TransactionID
)
;



CREATE TABLE Sat_TransHist
(
	Hub_TransID_SQN       NUMERIC(12) NOT NULL,
	Sat_TransHist_LDTS    DATE NOT NULL,
	Sat_TransHist_LEDTS   DATE NULL,
	Sat_TransHist_RSRC    VARCHAR(18) NULL,
	TransactionID         INTEGER NOT NULL,
	ReferenceOrderID      INTEGER NOT NULL,
	ReferenceOrderLineID  INTEGER NOT NULL,
	TransactionDate       datetime NOT NULL,
	TransactionType       CHAR(1) NOT NULL,
	Quantity              INTEGER NOT NULL,
	ActualCost            DECIMAL(19,4) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_TransID_SQN,Sat_TransHist_LDTS)FOREIGN KEY R_97 (Hub_TransID_SQN) REFERENCES Hub_TransID(Hub_TransID_SQN)
)
;



CREATE INDEX IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID ON Sat_TransHist
(
	ReferenceOrderID,
	ReferenceOrderLineID
)
;



CREATE TABLE Sat_ProdListPriceHist
(
	Hub_ProdNum_SQN       NUMERIC(12) NOT NULL,
	Sat_ProdListPriceHist_LDTS  DATE NOT NULL,
	Sat_ProdListPriceHist_LEDTS  DATE NULL,
	Sat_ProdListPriceHist_RSRC  VARCHAR(18) NULL,
	StartDate             datetime NOT NULL,
	EndDate               datetime NULL,
	ListPrice             DECIMAL(19,4) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ProdNum_SQN,Sat_ProdListPriceHist_LDTS)FOREIGN KEY R_95 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE TABLE Sat_ProdCostHist
(
	Hub_ProdNum_SQN       NUMERIC(12) NOT NULL,
	Sat_ProdCostHist_LDTS  DATE NOT NULL,
	Sat_ProdCostHist_LEDTS  DATE NULL,
	Sat_ProdCostHist_RSRC  VARCHAR(18) NULL,
	StartDate             datetime NOT NULL,
	EndDate               datetime NULL,
	StandardCost          DECIMAL(19,4) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ProdNum_SQN,Sat_ProdCostHist_LDTS)FOREIGN KEY R_94 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE TABLE Sat_ProdRev
(
	Hub_ProdNum_SQN       NUMERIC(12) NOT NULL,
	Sat_ProdRev_LDTS      DATE NOT NULL,
	Sat_ProdRev_LEDTS     DATE NULL,
	Sat_ProdRev_RSRC      VARCHAR(18) NULL,
	ProductReviewID       INTEGER NOT NULL,
	ReviewerName          VARCHAR(50) NOT NULL,
	ReviewDate            datetime NOT NULL,
	EmailAddress          VARCHAR(50) NOT NULL,
	Rating                INTEGER NOT NULL,
	Comments              VARCHAR(3850) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ProdNum_SQN,Sat_ProdRev_LDTS)FOREIGN KEY R_93 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE INDEX IX_ProductReview_ProductID_Name ON Sat_ProdRev
(
	ReviewerName
)
;



CREATE TABLE Hub_Wrk_Ord
(
	Hub_WOID_SQN          NUMERIC(12) NOT NULL,
	Hub_WOID_LDTS         DATE NOT NULL,
	Hub_WOID_RSRC         VARCHAR(18) NULL,
	WorkOrderID           INTEGER NOT NULL,
	 PRIMARY KEY (Hub_WOID_SQN)
)
;



CREATE UNIQUE INDEX BK_WorkOrderID ON Hub_Wrk_Ord
(
	WorkOrderID
)
;



CREATE TABLE Sat_Wrk_Ord
(
	Hub_WOID_SQN          NUMERIC(12) NOT NULL,
	Sat_WOID_LDTS         DATE NOT NULL,
	Sat_WOID_LEDTS        DATE NULL,
	Sat_WOID_RSRC         VARCHAR(18) NULL,
	OrderQty              INTEGER NOT NULL,
	StockedQty            INTEGER NOT NULL,
	ScrappedQty           smallint NOT NULL,
	StartDate             datetime NOT NULL,
	EndDate               datetime NULL,
	DueDate               datetime NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_WOID_SQN,Sat_WOID_LDTS)FOREIGN KEY R_164 (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN)
)
;



CREATE TABLE Hub_EmpID
(
	Hub_EmpID_SQN         NUMERIC(12) NOT NULL,
	Hub_EmpID_LDTS        DATE NOT NULL,
	Hub_EmpID_RSRC        VARCHAR(18) NULL,
	EmployeeID            INTEGER NOT NULL,
	 PRIMARY KEY (Hub_EmpID_SQN)
)
;



CREATE UNIQUE INDEX BK_EmployeeID ON Hub_EmpID
(
	EmployeeID
)
;



CREATE TABLE Sat_EmpPayHist
(
	Hub_EmpID_SQN         NUMERIC(12) NOT NULL,
	Sat_EmpPayHist_LDTS   DATE NOT NULL,
	Sat_EmpPayHist_LEDTS  DATE NULL,
	Sat_EmpPayHist_RSRC   VARCHAR(18) NULL,
	RateChangeDate        datetime NOT NULL,
	Rate                  DECIMAL(19,4) NOT NULL,
	PayFrequency          tinyint NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_EmpID_SQN,Sat_EmpPayHist_LDTS)FOREIGN KEY R_206 (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
;



CREATE TABLE ErrorLog
(
	ErrorLogID            INTEGER NOT NULL,
	ErrorTime             datetime NOT NULL,
	UserName              VARCHAR(20) NOT NULL,
	ErrorNumber           INTEGER NOT NULL,
	ErrorSeverity         INTEGER NULL,
	ErrorState            INTEGER NULL,
	ErrorProcedure        VARCHAR(126) NULL,
	ErrorLine             INTEGER NULL,
	ErrorMessage          VARCHAR(4000) NOT NULL,
	 PRIMARY KEY (ErrorLogID)
)
;



CREATE TABLE DatabaseLog
(
	DatabaseLogID         INTEGER NOT NULL,
	PostTime              datetime NOT NULL,
	DatabaseUser          VARCHAR(20) NOT NULL,
	Event                 VARCHAR(20) NOT NULL,
	Schema                VARCHAR(20) NULL,
	Object                VARCHAR(20) NULL,
	TSQL                  VARCHAR(4000) NOT NULL,
	XmlEvent              LONG VARCHAR NOT NULL,
	 PRIMARY KEY (DatabaseLogID)
)
;



CREATE TABLE TransactionHistoryArchive
(
	TransactionID         INTEGER NOT NULL,
	ProductID             INTEGER NOT NULL,
	ReferenceOrderID      INTEGER NOT NULL,
	ReferenceOrderLineID  INTEGER NOT NULL,
	TransactionDate       datetime NOT NULL,
	TransactionType       CHAR(1) NOT NULL,
	Quantity              INTEGER NOT NULL,
	ActualCost            DECIMAL(19,4) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (TransactionID)
)
;



CREATE INDEX IX_TransactionHistoryArchive_ProductID ON TransactionHistoryArchive
(
	ProductID
)
;



CREATE INDEX IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLine ON TransactionHistoryArchive
(
	ReferenceOrderID,
	ReferenceOrderLineID
)
;



CREATE TABLE AWBuildVersion
(
	SystemInformationID   tinyint NOT NULL,
	Database_Version      VARCHAR(25) NOT NULL,
	VersionDate           datetime NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (SystemInformationID)
)
;



CREATE TABLE Lnk_ProdNum_TransID
(
	Lnk_ProdNum_TransID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_TransID_LDTS  DATE NOT NULL,
	Lnk_ProdNum_TransID_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_TransID_SQN       NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ProdNum_TransID_SQN)FOREIGN KEY R_104 (Hub_TransID_SQN) REFERENCES Hub_TransID(Hub_TransID_SQN),
	FOREIGN KEY R_105 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_TransactionHistory ON Lnk_ProdNum_TransID
(
	Hub_TransID_SQN,
	Hub_ProdNum_SQN
)
;



CREATE TABLE Hub_CCID
(
	Hub_CCID_SQN          NUMERIC(12) NOT NULL,
	Hub_CCID_LDTS         DATE NOT NULL,
	Hub_CCID_RSRC         VARCHAR(18) NULL,
	CreditCardID          INTEGER NOT NULL,
	 PRIMARY KEY (Hub_CCID_SQN)
)
;



CREATE UNIQUE INDEX BK_CreditCardID ON Hub_CCID
(
	CreditCardID
)
;



CREATE TABLE Sat_CC
(
	Hub_CCID_SQN          NUMERIC(12) NOT NULL,
	Sat_CC_LDTS           DATE NOT NULL,
	Sat_CC_LEDTS          DATE NULL,
	Sat_CC_RSRC           VARCHAR(18) NULL,
	CardType              VARCHAR(50) NOT NULL,
	CardNumber            VARCHAR(25) NOT NULL,
	ExpMonth              tinyint NOT NULL,
	ExpYear               smallint NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_CCID_SQN,Sat_CC_LDTS)FOREIGN KEY R_198 (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN)
)
;



CREATE UNIQUE INDEX AK_CreditCard_CardNumber ON Sat_CC
(
	CardNumber
)
;



CREATE TABLE Hub_JobCandID
(
	Hub_JobCandID_SQN     NUMERIC(12) NOT NULL,
	Hub_JobCandID_LDTS    DATE NOT NULL,
	Hub_JobCandID_RSRC    VARCHAR(18) NULL,
	JobCandidateID        INTEGER NOT NULL,
	 PRIMARY KEY (Hub_JobCandID_SQN)
)
;



CREATE UNIQUE INDEX BK_JobCandidateID ON Hub_JobCandID
(
	JobCandidateID
)
;



CREATE TABLE Sat_JobCand
(
	Hub_JobCandID_SQN     NUMERIC(12) NOT NULL,
	Sat_JobCand_LDTS      DATE NOT NULL,
	Sat_JobCand_LEDTS     DATE NULL,
	Sat_JobCand_RSRC      VARCHAR(18) NULL,
	Resume                LONG VARCHAR NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_JobCandID_SQN,Sat_JobCand_LDTS)FOREIGN KEY R_209 (Hub_JobCandID_SQN) REFERENCES Hub_JobCandID(Hub_JobCandID_SQN)
)
;



CREATE TABLE Lnk_WOID_LocID
(
	Lnk_WOID_LocID_WOOpSeqID_SQN  NUMERIC(12) NOT NULL,
	Lnk_WOID_LocID_WOOpSeqID_LDTS  DATE NOT NULL,
	Lnk_WOID_LocID_WOOpSeqID_RSRC  VARCHAR(18) NULL,
	Hub_WOID_SQN          NUMERIC(12) NULL,
	Hub_LocID_SQN         NUMERIC(12) NULL,
	Oper_Seq              smallint NOT NULL,
	 PRIMARY KEY (Lnk_WOID_LocID_WOOpSeqID_SQN)FOREIGN KEY R_168 (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN),
	FOREIGN KEY R_169 (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
;



CREATE UNIQUE INDEX AK_WorkOrderRouting ON Lnk_WOID_LocID
(
	Hub_WOID_SQN,
	Hub_LocID_SQN,
	Oper_Seq
)
;



CREATE TABLE Sat_WOID_LocID
(
	Lnk_WOID_LocID_SQN    NUMERIC(12) NOT NULL,
	Sat_WOID_LocID_LDTS   DATE NOT NULL,
	Sat_WOID_LocID_LEDTS  DATE NULL,
	Sat_WOID_LocID_RSRC   VARCHAR(18) NULL,
	ScheduledStartDate    datetime NOT NULL,
	ScheduledEndDate      datetime NOT NULL,
	ActualStartDate       datetime NULL,
	ActualEndDate         datetime NULL,
	ActualResourceHrs     decimal(9,4) NULL,
	PlannedCost           DECIMAL(19,4) NOT NULL,
	ActualCost            DECIMAL(19,4) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_WOID_LocID_SQN,Sat_WOID_LocID_LDTS)FOREIGN KEY R_180 (Lnk_WOID_LocID_SQN) REFERENCES Lnk_WOID_LocID(Lnk_WOID_LocID_WOOpSeqID_SQN)
)
;



CREATE TABLE Hub_PersID
(
	Hub_PersID_SQN        NUMERIC(12) NOT NULL,
	Hub_PersID_LDTS       DATE NOT NULL,
	Hub_PersID_RSRC       VARCHAR(18) NULL,
	PersonID              INTEGER NOT NULL,
	 PRIMARY KEY (Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX BK_PersonID ON Hub_PersID
(
	PersonID
)
;



CREATE TABLE Hub_BusEntID
(
	Hub_BusEntID_SQN      NUMERIC(12) NOT NULL,
	Hub_BusEntID_LDTS     DATE NOT NULL,
	Hub_BusEntID_RSRC     VARCHAR(18) NULL,
	BusinessEntityID      INTEGER NOT NULL,
	 PRIMARY KEY (Hub_BusEntID_SQN)
)
;



CREATE UNIQUE INDEX BK_BusinessEntityID ON Hub_BusEntID
(
	BusinessEntityID
)
;



CREATE TABLE Lnk_PersID_BusEntID
(
	Lnk_PersID_BusEntID_SQN  NUMERIC(12) NOT NULL,
	Lnk_PersID_BusEntID_LDTS  DATE NOT NULL,
	Lnk_PersID_BusEntID_RSRC  VARCHAR(18) NULL,
	Hub_BusEntID_SQN      NUMERIC(12) NULL,
	Hub_PersID_SQN        NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_PersID_BusEntID_SQN)FOREIGN KEY R_269 (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	FOREIGN KEY R_270 (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_PersID_BEID ON Lnk_PersID_BusEntID
(
	Hub_PersID_SQN,
	Hub_BusEntID_SQN
)
;



CREATE TABLE Hub_ScrapID
(
	Hub_ScrapID_SQN       NUMERIC(12) NOT NULL,
	Hub_ScrapID_LDTS      DATE NOT NULL,
	Hub_ScrapID_RSRC      VARCHAR(18) NULL,
	ScrapReasonID         smallint NOT NULL,
	 PRIMARY KEY (Hub_ScrapID_SQN)
)
;



CREATE UNIQUE INDEX BK_ScrapReasonID ON Hub_ScrapID
(
	ScrapReasonID
)
;



CREATE TABLE Lnk_Wrk_Ord_ScrapID
(
	Lnk_WOID_ScrapID_SQN  NUMERIC(12) NOT NULL,
	Lnk_WOID_ScrapID_LDTS  DATE NOT NULL,
	Lnk_WOID_ScrapID_RSRC  VARCHAR(18) NULL,
	Hub_WOID_SQN          NUMERIC(12) NOT NULL,
	Hub_ScrapID_SQN       NUMERIC(12) NOT NULL,
	 PRIMARY KEY (Lnk_WOID_ScrapID_SQN)FOREIGN KEY R_165 (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN),
	FOREIGN KEY R_166 (Hub_ScrapID_SQN) REFERENCES Hub_ScrapID(Hub_ScrapID_SQN)
)
;



CREATE UNIQUE INDEX AK_ScrapReason ON Lnk_Wrk_Ord_ScrapID
(
	Hub_WOID_SQN,
	Hub_ScrapID_SQN
)
;



CREATE TABLE Lnk_SOrdNum_CCID
(
	Lnk_SOrdNum_CCID_SQN  NUMERIC(12) NOT NULL,
	Lnk_SOrdNum_CCID_LDTS  DATE NOT NULL,
	Lnk_SOrdNum_CCID_RSRC  VARCHAR(18) NULL,
	Hub_SOrdNum_SQN       NUMERIC(12) NULL,
	Hub_CCID_SQN          NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_SOrdNum_CCID_SQN)FOREIGN KEY R_196 (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	FOREIGN KEY R_197 (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_Add ON Lnk_SOrdNum_CCID
(
	Hub_SOrdNum_SQN,
	Hub_CCID_SQN
)
;



CREATE TABLE Sat_Scrap
(
	Hub_ScrapID_SQN       NUMERIC(12) NOT NULL,
	Sat_Scrap_LDTS        DATE NOT NULL,
	Sat_Scrap_LEDTS       DATE NULL,
	Sat_Scrap_RSRC        VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ScrapID_SQN,Sat_Scrap_LDTS)FOREIGN KEY R_167 (Hub_ScrapID_SQN) REFERENCES Hub_ScrapID(Hub_ScrapID_SQN)
)
;



CREATE UNIQUE INDEX AK_ScrapReason_Name ON Sat_Scrap
(
	Name
)
;



CREATE TABLE Sat_Prod
(
	Hub_ProdNum_SQN       NUMERIC(12) NOT NULL,
	Sat_Prod_LDTS         DATE NOT NULL,
	Sat_Prod_LEDTS        DATE NULL,
	Sat_Prod_RSRC         VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	MakeFlag              BIT NOT NULL,
	FinishedGoodsFlag     BIT NOT NULL,
	Color                 VARCHAR(15) NULL,
	SafetyStockLevel      smallint NOT NULL,
	ReorderPoint          smallint NOT NULL,
	StandardCost          DECIMAL(19,4) NOT NULL,
	ListPrice             DECIMAL(19,4) NOT NULL,
	Size                  VARCHAR(5) NULL,
	Weight                decimal(8,2) NULL,
	DaysToManufacture     INTEGER NOT NULL,
	ProductLine           CHAR(2) NULL,
	Class                 CHAR(2) NULL,
	Style                 CHAR(2) NULL,
	SellStartDate         datetime NOT NULL,
	SellEndDate           datetime NULL,
	DiscontinuedDate      datetime NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ProdNum_SQN,Sat_Prod_LDTS)FOREIGN KEY R_92 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Product_Name ON Sat_Prod
(
	Name
)
;



CREATE TABLE Lnk_SOrdNum_AddID
(
	Lnk_SOrdNum_AddID_SQN  NUMERIC(12) NOT NULL,
	Lnk_SOrdNum_AddID_LDTS  DATE NOT NULL,
	Lnk_SOrdNum_AddID_RSRC  VARCHAR(18) NULL,
	Hub_SOrdNum_SQN       NUMERIC(12) NULL,
	Hub_AddID_BillTo_SQN  NUMERIC(12) NULL,
	Hub_AddID_ShipTo_SQN  NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_SOrdNum_AddID_SQN)FOREIGN KEY R_287 (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	FOREIGN KEY R_288 (Hub_AddID_BillTo_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN),
	FOREIGN KEY R_290 (Hub_AddID_ShipTo_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_Add ON Lnk_SOrdNum_AddID
(
	Hub_SOrdNum_SQN,
	Hub_AddID_BillTo_SQN,
	Hub_AddID_ShipTo_SQN
)
;



CREATE TABLE Lnk_ProdNum_WOID
(
	Lnk_ProdNum_WOID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_WOID_LDTS  DATE NOT NULL,
	Lnk_ProdNum_WOID_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_WOID_SQN          NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ProdNum_WOID_SQN)FOREIGN KEY R_162 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	FOREIGN KEY R_163 (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN)
)
;



CREATE UNIQUE INDEX AK_WorkOrder ON Lnk_ProdNum_WOID
(
	Hub_ProdNum_SQN,
	Hub_WOID_SQN
)
;



CREATE TABLE Lnk_DocNode_EmpID
(
	Lnk_DocNode_EmpID_SQN  NUMERIC(12) NOT NULL,
	Lnk_DocNode_EmpID_LDTS  DATE NOT NULL,
	Lnk_DocNode_EmpID_RSRC  VARCHAR(18) NULL,
	Hub_EmpID_SQN         NUMERIC(12) NOT NULL,
	Hub_DocNode_SQN       NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_DocNode_EmpID_SQN)FOREIGN KEY R_203 (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	FOREIGN KEY R_204 (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_DocNode_Emp ON Lnk_DocNode_EmpID
(
	Hub_EmpID_SQN,
	Hub_DocNode_SQN
)
;



CREATE TABLE Lnk_ProdNum_LocID
(
	Lnk_ProdNum_LocID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_LocID_LDTS  DATE NOT NULL,
	Lnk_ProdINum_LocID_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_LocID_SQN         NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ProdNum_LocID_SQN)FOREIGN KEY R_159 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	FOREIGN KEY R_160 (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductInventory ON Lnk_ProdNum_LocID
(
	Hub_ProdNum_SQN,
	Hub_LocID_SQN
)
;



CREATE TABLE Sat_Prod_Loc
(
	Lnk_ProdNum_LocID_SQN  NUMERIC(12) NOT NULL,
	Sat_Prod_Loc_LDTS     DATE NOT NULL,
	Sat_Prod_Loc_LEDTS    DATE NULL,
	Sat_Prod_Loc_RSRC     VARCHAR(18) NULL,
	Shelf                 VARCHAR(10) NOT NULL,
	Bin                   tinyint NOT NULL,
	Quantity              smallint NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_ProdNum_LocID_SQN,Sat_Prod_Loc_LDTS)FOREIGN KEY R_158 (Lnk_ProdNum_LocID_SQN) REFERENCES Lnk_ProdNum_LocID(Lnk_ProdNum_LocID_SQN)
)
;



CREATE TABLE Sat_Pers
(
	Hub_PersID_SQN        NUMERIC(12) NOT NULL,
	Sat_Pers_LDTS         DATE NOT NULL,
	Sat_Pers_LEDTS        DATE NULL,
	Sat_Pers_RSRC         VARCHAR(18) NULL,
	PersonType            CHAR(2) NOT NULL,
	NameStyle             BIT NOT NULL,
	Title                 VARCHAR(8) NULL,
	FirstName             VARCHAR(50) NOT NULL,
	MiddleName            VARCHAR(50) NULL,
	LastName              VARCHAR(50) NOT NULL,
	Suffix                VARCHAR(10) NULL,
	EmailPromotion        INTEGER NOT NULL,
	AdditionalContactInfo  LONG VARCHAR NULL,
	Demographics          LONG VARCHAR NULL,
	rowguid               INTEGER NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_PersID_SQN,Sat_Pers_LDTS)FOREIGN KEY R_202 (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX AK_Person_rowguid ON Sat_Pers
(
	rowguid
)
;



CREATE INDEX IX_Person_LastName_FirstName_MiddleName ON Sat_Pers
(
	LastName,
	FirstName,
	MiddleName
)
;



CREATE TABLE Sat_Emp
(
	Hub_EmpID_SQN         NUMERIC(12) NOT NULL,
	Sat_Emp_LDTS          DATE NOT NULL,
	Sat_Emp_LEDTS         DATE NULL,
	Sat_Emp_RSRC          VARCHAR(18) NULL,
	NationalIDNumber      VARCHAR(15) NOT NULL,
	LoginID               VARCHAR(256) NOT NULL,
	OrganizationNode      CHAR(18) NOT NULL,
	OrganizationLevel     smallint NULL,
	JobTitle              VARCHAR(50) NOT NULL,
	BirthDate             date NOT NULL,
	MaritalStatus         CHAR(1) NOT NULL,
	Gender                CHAR(1) NOT NULL,
	HireDate              date NOT NULL,
	SalariedFlag          BIT NOT NULL,
	VacationHours         smallint NOT NULL,
	SickLeaveHours        smallint NOT NULL,
	CurrentFlag           BIT NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_EmpID_SQN,Sat_Emp_LDTS)FOREIGN KEY R_205 (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
;



CREATE UNIQUE INDEX AK_Employee_OrganizationNode ON Sat_Emp
(
	OrganizationNode
)
;



CREATE UNIQUE INDEX AK_Employee_OrganizationLevel_OrganizationNode ON Sat_Emp
(
	OrganizationLevel,
	OrganizationNode
)
;



CREATE UNIQUE INDEX AK_Employee_LoginID ON Sat_Emp
(
	LoginID
)
;



CREATE UNIQUE INDEX AK_Employee_NationalIDNumber ON Sat_Emp
(
	NationalIDNumber
)
;



CREATE TABLE Hub_ProdDescID
(
	Hub_ProdDescID_SQN    NUMERIC(12) NOT NULL,
	Hub_ProdDescID_LDTS   DATE NOT NULL,
	Hub_ProdDescID_RSRC   VARCHAR(18) NULL,
	ProductDescriptionID  INTEGER NOT NULL,
	 PRIMARY KEY (Hub_ProdDescID_SQN)
)
;



CREATE UNIQUE INDEX BK_ProductDescriptionID ON Hub_ProdDescID
(
	ProductDescriptionID
)
;



CREATE TABLE Sat_ProdDesc
(
	Hub_ProdDescID_SQN    NUMERIC(12) NOT NULL,
	Sat_ProdDesc_LDTS     DATE NOT NULL,
	Sat_ProdDesc_LEDTS    DATE NULL,
	Sat_ProdDesc_RSRC     VARCHAR(18) NULL,
	Description           VARCHAR(400) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ProdDescID_SQN,Sat_ProdDesc_LDTS)FOREIGN KEY R_149 (Hub_ProdDescID_SQN) REFERENCES Hub_ProdDescID(Hub_ProdDescID_SQN)
)
;



CREATE TABLE Hub_CultID
(
	Hub_CultID_SQN        NUMERIC(12) NOT NULL,
	Hub_CultID_LDTS       DATE NOT NULL,
	Hub_CultID_RSRC       VARCHAR(18) NULL,
	CultureID             CHAR(6) NOT NULL,
	 PRIMARY KEY (Hub_CultID_SQN)
)
;



CREATE UNIQUE INDEX BK_CultureID ON Hub_CultID
(
	CultureID
)
;



CREATE TABLE Sat_Cult
(
	Hub_CultID_SQN        NUMERIC(12) NOT NULL,
	Sat_Cult_LDTS         DATE NOT NULL,
	Sat_Cult_LEDTS        DATE NULL,
	Sat_Cult_RSRC         VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_CultID_SQN,Sat_Cult_LDTS)FOREIGN KEY R_148 (Hub_CultID_SQN) REFERENCES Hub_CultID(Hub_CultID_SQN)
)
;



CREATE UNIQUE INDEX AK_Culture_Name ON Sat_Cult
(
	Name
)
;



CREATE TABLE Hub_ModID
(
	Hub_ModID_SQN         NUMERIC(12) NOT NULL,
	Hub_ModID_LDTS        DATE NOT NULL,
	Hub_ModID_RSRC        VARCHAR(18) NULL,
	ProductModelID        INTEGER NOT NULL,
	 PRIMARY KEY (Hub_ModID_SQN)
)
;



CREATE UNIQUE INDEX BK_ProductModelID ON Hub_ModID
(
	ProductModelID
)
;



CREATE TABLE Lnk_ModID_ProdDescID_CultID
(
	Lnk_ModID_ProdDescID_CultID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ModID_ProdDescID_CultID_LDTS  DATE NOT NULL,
	Lnk_ModID_ProdDescID_CultID_RSRC  VARCHAR(18) NULL,
	Hub_ModID_SQN         NUMERIC(12) NOT NULL,
	Hub_CultID_SQN        NUMERIC(12) NULL,
	Hub_ProdDescID_SQN    NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ModID_ProdDescID_CultID_SQN)FOREIGN KEY R_151 (Hub_CultID_SQN) REFERENCES Hub_CultID(Hub_CultID_SQN),
	FOREIGN KEY R_152 (Hub_ProdDescID_SQN) REFERENCES Hub_ProdDescID(Hub_ProdDescID_SQN),
	FOREIGN KEY R_153 (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductModelProductDescriptionCulture ON Lnk_ModID_ProdDescID_CultID
(
	Hub_CultID_SQN,
	Hub_ProdDescID_SQN,
	Hub_ModID_SQN
)
;



CREATE TABLE Sat_ProdMod_ProdDesc_Cult
(
	Lnk_ModID_ProdDescID_CultID_SQN  NUMERIC(12) NOT NULL,
	Sat_Mod_ProdDesc_Cult_LDTS  DATE NOT NULL,
	Sat_Mod_ProdDesc_Cult__LEDTS  DATE NULL,
	Sat_Mod_ProdDesc_Cult__RSRC  VARCHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_ModID_ProdDescID_CultID_SQN,Sat_Mod_ProdDesc_Cult_LDTS)FOREIGN KEY R_150 (Lnk_ModID_ProdDescID_CultID_SQN) REFERENCES Lnk_ModID_ProdDescID_CultID(Lnk_ModID_ProdDescID_CultID_SQN)
)
;



CREATE TABLE Hub_IllID
(
	Hub_IllID_SQN         NUMERIC(12) NOT NULL,
	Hub_IllID_LDTS        DATE NOT NULL,
	Hub_IllID_RSRC        VARCHAR(18) NULL,
	IllustrationID        INTEGER NOT NULL,
	 PRIMARY KEY (Hub_IllID_SQN)
)
;



CREATE UNIQUE INDEX BK_IllustrationID ON Hub_IllID
(
	IllustrationID
)
;



CREATE TABLE Lnk_ModID_IllID
(
	Lnk_ModID_IllID_SQN   NUMERIC(12) NOT NULL,
	Lnk_ModID_IllID_LDTS  DATE NOT NULL,
	Lnk_ModID_IllID_RSRC  VARCHAR(18) NULL,
	Hub_ModID_SQN         NUMERIC(12) NULL,
	Hub_IllID_SQN         NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ModID_IllID_SQN)FOREIGN KEY R_145 (Hub_IllID_SQN) REFERENCES Hub_IllID(Hub_IllID_SQN),
	FOREIGN KEY R_146 (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductModelIllustration ON Lnk_ModID_IllID
(
	Hub_IllID_SQN,
	Hub_ModID_SQN
)
;



CREATE TABLE Sat_ProdMod_Ill
(
	Lnk_ModID_IllID_SQN   NUMERIC(12) NOT NULL,
	Sat_ProdMod_Ill_LDTS  DATE NOT NULL,
	Sat_ProdMod_Ill_LEDTS  DATE NULL,
	Sat_ProdMod_Ill_RSRC  VARCHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_ModID_IllID_SQN,Sat_ProdMod_Ill_LDTS)FOREIGN KEY R_147 (Lnk_ModID_IllID_SQN) REFERENCES Lnk_ModID_IllID(Lnk_ModID_IllID_SQN)
)
;



CREATE TABLE Sat_Illustraion
(
	Hub_IllID_SQN         NUMERIC(12) NOT NULL,
	Sat_Ill_LDTS          DATE NOT NULL,
	Sat_Ill_LEDTS         DATE NULL,
	Sat_Ill_RSRC          VARCHAR(18) NULL,
	Diagram               LONG VARCHAR NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_IllID_SQN,Sat_Ill_LDTS)FOREIGN KEY R_144 (Hub_IllID_SQN) REFERENCES Hub_IllID(Hub_IllID_SQN)
)
;



CREATE TABLE Hub_POID
(
	Hub_POID_SQN          NUMERIC(12) NOT NULL,
	Hub_POID_LDTS         DATE NOT NULL,
	Hub_POID_RSRC         VARCHAR(18) NULL,
	PurchaseOrderID       INTEGER NOT NULL,
	 PRIMARY KEY (Hub_POID_SQN)
)
;



CREATE UNIQUE INDEX BK_PurchaseOrderHeaderID ON Hub_POID
(
	PurchaseOrderID
)
;



CREATE TABLE Sat_POHead
(
	Hub_POID_SQN          NUMERIC(12) NOT NULL,
	Sat_POHead_LDTS       DATE NOT NULL,
	Sat_POHead_LEDTS      DATE NULL,
	Sat_POHead_RSRC       VARCHAR(18) NULL,
	RevisionNumber        tinyint NOT NULL,
	Status                tinyint NOT NULL,
	OrderDate             datetime NOT NULL,
	ShipDate              datetime NULL,
	SubTotal              DECIMAL(19,4) NOT NULL,
	TaxAmt                DECIMAL(19,4) NOT NULL,
	Freight               DECIMAL(19,4) NOT NULL,
	TotalDue              DECIMAL(19,4) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_POID_SQN,Sat_POHead_LDTS)FOREIGN KEY R_232 (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
;



CREATE TABLE Lnk_EmpID_JobCandID
(
	Lnk_EmpID_JobCandID_SQN  NUMERIC(12) NOT NULL,
	Lnk_EmpID_JobCandID_LDTS  DATE NOT NULL,
	Lnk_EmpID_JobCandID_RSRC  VARCHAR(18) NULL,
	Hub_EmpID_SQN         NUMERIC(12) NULL,
	Hub_JobCandID_SQN     NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_EmpID_JobCandID_SQN)FOREIGN KEY R_207 (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	FOREIGN KEY R_208 (Hub_JobCandID_SQN) REFERENCES Hub_JobCandID(Hub_JobCandID_SQN)
)
;



CREATE UNIQUE INDEX AK_JobCandidate ON Lnk_EmpID_JobCandID
(
	Hub_EmpID_SQN,
	Hub_JobCandID_SQN
)
;



CREATE TABLE Lnk_ProdNum_ModID
(
	Lnk_ProdNum_ModID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_ModID_LDTS  DATE NOT NULL,
	Lnk_ProdNum_ModID_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_ModID_SQN         NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ProdNum_ModID_SQN)FOREIGN KEY R_139 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	FOREIGN KEY R_142 (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductModel ON Lnk_ProdNum_ModID
(
	Hub_ProdNum_SQN,
	Hub_ModID_SQN
)
;



CREATE TABLE Sat_Mod
(
	Hub_ModID_SQN         NUMERIC(12) NOT NULL,
	Sat_Mod_LDTS          DATE NOT NULL,
	Sat_Mod_LEDTS         DATE NULL,
	Sat_Mod_RSRC          VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	CatalogDescription    LONG VARCHAR NULL,
	Instructions          LONG VARCHAR NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ModID_SQN,Sat_Mod_LDTS)FOREIGN KEY R_143 (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductModel_Name ON Sat_Mod
(
	Name
)
;



CREATE TABLE Sat_SRsn
(
	Hub_SRsnID_SQN        NUMERIC(12) NOT NULL,
	Sat_SRsn_LDTS         DATE NOT NULL,
	Sat_SRsn_LEDTS        DATE NULL,
	Sat_SRsn_RSRC         VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ReasonType            VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_SRsnID_SQN,Sat_SRsn_LDTS)FOREIGN KEY R_190 (Hub_SRsnID_SQN) REFERENCES Hub_SRsnID(Hub_SRsnID_SQN)
)
;



CREATE TABLE Lnk_PersID_CCID
(
	Lnk_PersID_CCID_SQN   NUMERIC(12) NOT NULL,
	Lnk_PersID_CCID_LDTS  DATE NOT NULL,
	Lnk_PersID_CCID_RSRC  VARCHAR(18) NULL,
	Hub_PersID_SQN        NUMERIC(12) NULL,
	Hub_CCID_SQN          NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_PersID_CCID_SQN)FOREIGN KEY R_199 (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN),
	FOREIGN KEY R_201 (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX AK_PersonCreditCard ON Lnk_PersID_CCID
(
	Hub_PersID_SQN,
	Hub_CCID_SQN
)
;



CREATE TABLE Sat_PersID_CCID
(
	Lnk_PersID_CCID_SQN   NUMERIC(12) NOT NULL,
	Sat_PersID_CCID_LDTS  DATE NOT NULL,
	Sat_PersID_CCID_LEDTS  DATE NULL,
	Sat_PersID_CCID_RSRC  VARCHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_PersID_CCID_SQN,Sat_PersID_CCID_LDTS)FOREIGN KEY R_200 (Lnk_PersID_CCID_SQN) REFERENCES Lnk_PersID_CCID(Lnk_PersID_CCID_SQN)
)
;



CREATE TABLE Sat_SOrd
(
	Hub_SOrdNum_SQN       NUMERIC(12) NOT NULL,
	Sat_SOrd_LDTS         DATE NOT NULL,
	Sat_SOrd_LEDTS        DATE NULL,
	Sat_SOrd_RSRC         VARCHAR(18) NULL,
	RevisionNumber        tinyint NOT NULL,
	OrderDate             datetime NOT NULL,
	DueDate               datetime NOT NULL,
	ShipDate              datetime NULL,
	Status                tinyint NOT NULL,
	OnlineOrderFlag       BIT NOT NULL,
	PurchaseOrderNumber   VARCHAR(25) NULL,
	AccountNumber         VARCHAR(15) NULL,
	CreditCardApprovalCode  varchar(15) NULL,
	SubTotal              DECIMAL(19,4) NOT NULL,
	TaxAmt                DECIMAL(19,4) NOT NULL,
	Freight               DECIMAL(19,4) NOT NULL,
	TotalDue              DECIMAL(19,4) NOT NULL,
	Comment               VARCHAR(128) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_SOrdNum_SQN,Sat_SOrd_LDTS)FOREIGN KEY R_187 (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE TABLE Sat_Doc
(
	Hub_DocNode_SQN       NUMERIC(12) NOT NULL,
	Sat_Doc_LDTS          DATE NOT NULL,
	Sat_Doc_LEDTS         DATE NULL,
	Sat_Doc_RSRC          VARCHAR(18) NULL,
	DocumentLevel         smallint NULL,
	Title                 VARCHAR(50) NOT NULL,
	FolderFlag            bit NOT NULL,
	FileName              VARCHAR(400) NOT NULL,
	FileExtension         VARCHAR(8) NOT NULL,
	Revision              CHAR(5) NOT NULL,
	ChangeNumber          INTEGER NOT NULL,
	Status                tinyint NOT NULL,
	DocumentSummary       VARCHAR(4000) NULL,
	Document              BINARY NULL,
	ModifiedDate          datetime NOT NULL,
	PersonID              CHAR(18) NULL,
	 PRIMARY KEY (Hub_DocNode_SQN,Sat_Doc_LDTS)FOREIGN KEY R_193 (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN)
)
;



CREATE UNIQUE INDEX AK_Document_DocumentLevel_DocumentNode ON Sat_Doc
(
	DocumentLevel
)
;



CREATE INDEX IX_Document_FileName_Revision ON Sat_Doc
(
	FileName,
	Revision
)
;



CREATE TABLE Hub_VendNum
(
	Hub_VendNum_SQN       NUMERIC(12) NOT NULL,
	Hub_VendNum_LDTS      DATE NOT NULL,
	Hub_VendNum_RSRC      VARCHAR(18) NULL,
	AccountNumber         VARCHAR(15) NOT NULL,
	 PRIMARY KEY (Hub_VendNum_SQN)
)
;



CREATE UNIQUE INDEX BK_AccountNumber ON Hub_VendNum
(
	AccountNumber
)
;



CREATE TABLE Lnk_BusEntID_VendNum
(
	Lnk_BusEntID_VendNum_SQN  NUMERIC(12) NOT NULL,
	Lnk_BusEntID_VendNum_LDTS  DATE NOT NULL,
	Lnk_BusEntID_VendNum_RSRC  VARCHAR(18) NULL,
	Hub_BusEntID_SQN      NUMERIC(12) NULL,
	Hub_VendNum_SQN       NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_BusEntID_VendNum_SQN)FOREIGN KEY R_272 (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	FOREIGN KEY R_275 (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_BusEntID_AcctNum ON Lnk_BusEntID_VendNum
(
	Hub_BusEntID_SQN,
	Hub_VendNum_SQN
)
;



CREATE TABLE Hub_EmailAddID
(
	Hub_EmailAddID_SQN    NUMERIC(12) NOT NULL,
	Hub_EmailAddID_LDTS   DATE NOT NULL,
	Hub_EmailAddID_RSRC   VARCHAR(18) NULL,
	EmailAddressID        INTEGER NOT NULL,
	 PRIMARY KEY (Hub_EmailAddID_SQN)
)
;



CREATE UNIQUE INDEX BK_EmailAddressID ON Hub_EmailAddID
(
	EmailAddressID
)
;



CREATE TABLE Lnk_PersID_EmailAddID
(
	Lnk_PersID_EmailAddID_SQN  NUMERIC(12) NOT NULL,
	Lnk_PersID_EmailAddID_LDTS  DATE NOT NULL,
	Lnk_PersID_EmailAddID_RSRC  VARCHAR(18) NULL,
	Hub_PersID_SQN        NUMERIC(12) NULL,
	Hub_EmailAddID_SQN    NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_PersID_EmailAddID_SQN)FOREIGN KEY R_217 (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	FOREIGN KEY R_218 (Hub_EmailAddID_SQN) REFERENCES Hub_EmailAddID(Hub_EmailAddID_SQN)
)
;



CREATE UNIQUE INDEX AK_EmailAddress ON Lnk_PersID_EmailAddID
(
	Hub_PersID_SQN,
	Hub_EmailAddID_SQN
)
;



CREATE TABLE Hub_ShiftID
(
	Hub_ShiftID_SQN       NUMERIC(12) NOT NULL,
	Hub_ShiftID_LDTS      DATE NOT NULL,
	Hub_ShiftID_RSRC      VARCHAR(18) NULL,
	ShiftID               tinyint NOT NULL,
	 PRIMARY KEY (Hub_ShiftID_SQN)
)
;



CREATE UNIQUE INDEX BK_ShiftID ON Hub_ShiftID
(
	ShiftID
)
;



CREATE TABLE Hub_DepID
(
	Hub_DepID_SQN         NUMERIC(12) NOT NULL,
	Hub_DepID_LDTS        DATE NOT NULL,
	Hub_DepID_RSRC        VARCHAR(18) NULL,
	DepartmentID          smallint NOT NULL,
	 PRIMARY KEY (Hub_DepID_SQN)
)
;



CREATE UNIQUE INDEX BK_DepartmentID ON Hub_DepID
(
	DepartmentID
)
;



CREATE TABLE Lnk_EmpID_DepID_ShiftID
(
	Lnk_EmpID_DepID_ShiftID_SQN  NUMERIC(12) NOT NULL,
	Lnk_EmpID_DepID_ShiftID_LDTS  DATE NOT NULL,
	Lnk_EmpID_DepID_ShiftID_RSRC  VARCHAR(18) NULL,
	Hub_EmpID_SQN         NUMERIC(12) NULL,
	Hub_DepID_SQN         NUMERIC(12) NULL,
	Hub_ShiftID_SQN       NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_EmpID_DepID_ShiftID_SQN)FOREIGN KEY R_210 (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	FOREIGN KEY R_212 (Hub_ShiftID_SQN) REFERENCES Hub_ShiftID(Hub_ShiftID_SQN),
	FOREIGN KEY R_214 (Hub_DepID_SQN) REFERENCES Hub_DepID(Hub_DepID_SQN)
)
;



CREATE UNIQUE INDEX AK_EmployeeDepartmentHistory ON Lnk_EmpID_DepID_ShiftID
(
	Hub_EmpID_SQN,
	Hub_ShiftID_SQN,
	Hub_DepID_SQN
)
;



CREATE TABLE Sat_EmpID_DepID_ShiftID
(
	Lnk_EmpID_DepID_ShiftID_SQN  NUMERIC(12) NOT NULL,
	Sat_EmpID_DepID_ShiftID_LDTS  DATE NOT NULL,
	Sat_EmpID_DepID_ShiftID_LEDTS  DATE NULL,
	Sat_EmpID_DepID_ShiftID_RSRC  VARCHAR(18) NULL,
	StartDate             date NOT NULL,
	EndDate               date NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_EmpID_DepID_ShiftID_SQN,Sat_EmpID_DepID_ShiftID_LDTS)FOREIGN KEY R_211 (Lnk_EmpID_DepID_ShiftID_SQN) REFERENCES Lnk_EmpID_DepID_ShiftID(Lnk_EmpID_DepID_ShiftID_SQN)
)
;



CREATE TABLE Sat_Dep
(
	Hub_DepID_SQN         NUMERIC(12) NOT NULL,
	Sat_Dep_LDTS          DATE NOT NULL,
	Sat_Dep_LEDTS         DATE NULL,
	Sat_Dep_RSRC          VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	GroupName             VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_DepID_SQN,Sat_Dep_LDTS)FOREIGN KEY R_215 (Hub_DepID_SQN) REFERENCES Hub_DepID(Hub_DepID_SQN)
)
;



CREATE UNIQUE INDEX AK_Department_Name ON Sat_Dep
(
	Name
)
;



CREATE TABLE Hub_CntryRgnCd
(
	Hub_CntryRgnCd_SQN    NUMERIC(12) NOT NULL,
	Hub_CntryRgnCd_LDTS   DATE NOT NULL,
	Hub_CntryRgnCd_RSRC   VARCHAR(18) NULL,
	CountryRegionCode     VARCHAR(3) NOT NULL,
	 PRIMARY KEY (Hub_CntryRgnCd_SQN)
)
;



CREATE UNIQUE INDEX BK_CountryRegionCode ON Hub_CntryRgnCd
(
	CountryRegionCode
)
;



CREATE TABLE Hub_CrncyCd
(
	Hub_CrncyCd_SQN       NUMERIC(12) NOT NULL,
	Hub_CrncyCd_LDTS      DATE NOT NULL,
	Hub_CrncyCd_RSRC      VARCHAR(18) NULL,
	CurrencyCode          CHAR(3) NOT NULL,
	 PRIMARY KEY (Hub_CrncyCd_SQN)
)
;



CREATE UNIQUE INDEX BK_CurrencyCode ON Hub_CrncyCd
(
	CurrencyCode
)
;



CREATE TABLE Lnk_CntryRgnID_CrncyCd
(
	Lnk_CntryRgnID_CrncyCd_SQN  NUMERIC(12) NOT NULL,
	Lnk_CntryRgnID_CrncyCd_LDTS  DATE NOT NULL,
	Lnk_CntryRgnID_CrncyCd_RSRC  VARCHAR(18) NULL,
	Hub_CntryRgnCd_SQN    NUMERIC(12) NULL,
	Hub_CrncyCd_SQN       NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_CntryRgnID_CrncyCd_SQN)FOREIGN KEY R_301 (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN),
	FOREIGN KEY R_303 (Hub_CrncyCd_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_CntryRgnID_Crncy ON Lnk_CntryRgnID_CrncyCd
(
	Hub_CntryRgnCd_SQN,
	Hub_CrncyCd_SQN
)
;



CREATE TABLE Sat_CntryRgn_Crncy
(
	Lnk_CntryRgnID_CrncyCd_SQN  NUMERIC(12) NOT NULL,
	Sat_CntryRgn_Crncy_LDTS  DATE NOT NULL,
	Sat_CntryRgn_Crncy_LEDTS  DATE NULL,
	Sat_CntryRgn_Crncy_RSRC  VARCHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_CntryRgnID_CrncyCd_SQN,Sat_CntryRgn_Crncy_LDTS)FOREIGN KEY R_305 (Lnk_CntryRgnID_CrncyCd_SQN) REFERENCES Lnk_CntryRgnID_CrncyCd(Lnk_CntryRgnID_CrncyCd_SQN)
)
;



CREATE TABLE Sat_Shift
(
	Hub_ShiftID_SQN       NUMERIC(12) NOT NULL,
	Sat_Shift_LDTS        DATE NULL,
	Sat_Shift_LEDTS       DATE NULL,
	Sat_Shift_RSRC        VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	StartTime             time NOT NULL,
	EndTime               time NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ShiftID_SQN,Sat_Shift_LDTS)FOREIGN KEY R_213 (Hub_ShiftID_SQN) REFERENCES Hub_ShiftID(Hub_ShiftID_SQN)
)
;



CREATE UNIQUE INDEX AK_Shift_Name ON Sat_Shift
(
	Name
)
;



CREATE UNIQUE INDEX AK_Shift_StartTime_EndTime ON Sat_Shift
(
	StartTime,
	EndTime
)
;



CREATE TABLE Sat_Vend
(
	Hub_VendNum_SQN       NUMERIC(12) NOT NULL,
	Sat_Vend_LDTS         DATE NOT NULL,
	Sat_Vend_LEDTS        DATE NULL,
	Sat_Vend_RSRC         VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	CreditRating          tinyint NOT NULL,
	PreferredVendorStatus  BIT NOT NULL,
	ActiveFlag            BIT NOT NULL,
	PurchasingWebServiceURL  VARCHAR(1024) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_VendNum_SQN,Sat_Vend_LDTS)FOREIGN KEY R_228 (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN)
)
;



CREATE TABLE Hub_UntMsrCd
(
	Hub_UntMsrCd_SQN      NUMERIC(12) NOT NULL,
	Hub_UntMsrCd_LDTS     DATE NOT NULL,
	Hub_UntMsrCd_RSRC     VARCHAR(18) NULL,
	UnitMeasureCode       CHAR(3) NOT NULL,
	 PRIMARY KEY (Hub_UntMsrCd_SQN)
)
;



CREATE UNIQUE INDEX BK_UnitMeasureCode ON Hub_UntMsrCd
(
	UnitMeasureCode
)
;



CREATE TABLE Lnk_ProdNum_VendNum_UntMsrCd
(
	Lnk_ProdNum_VendNum_UntMsrCd_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_VendNum_UntMsrCd_LDTS  VARCHAR(18) NULL,
	Lnk_ProdNum_VendNum_UntMsrCd_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_VendNum_SQN       NUMERIC(12) NULL,
	Hub_UntMsrCd_SQN      NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ProdNum_VendNum_UntMsrCd_SQN)FOREIGN KEY R_225 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	FOREIGN KEY R_227 (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN),
	FOREIGN KEY R_314 (Hub_UntMsrCd_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
;



CREATE UNIQUE INDEX AK_ProductVendor ON Lnk_ProdNum_VendNum_UntMsrCd
(
	Hub_ProdNum_SQN,
	Hub_VendNum_SQN,
	Hub_UntMsrCd_SQN
)
;



CREATE TABLE Sat_ProdNum_VendNum_UntMsrCd
(
	Lnk_ProdNum_VendNum_UntMsrCd_SQN  NUMERIC(12) NOT NULL,
	Sat_ProdNum_VendNum_UntMsrCd_LDTS  DATE NOT NULL,
	Sat_ProdNum_VendNum_UntMsrCd_LEDTS  DATE NULL,
	Sat_ProdNum_VendNum_UntMsrCd_RSRC  VARCHAR(18) NULL,
	AverageLeadTime       INTEGER NOT NULL,
	StandardPrice         DECIMAL(19,4) NOT NULL,
	LastReceiptCost       DECIMAL(19,4) NULL,
	LastReceiptDate       datetime NULL,
	MinOrderQty           INTEGER NOT NULL,
	MaxOrderQty           INTEGER NOT NULL,
	OnOrderQty            INTEGER NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_ProdNum_VendNum_UntMsrCd_SQN,Sat_ProdNum_VendNum_UntMsrCd_LDTS)FOREIGN KEY R_226 (Lnk_ProdNum_VendNum_UntMsrCd_SQN) REFERENCES Lnk_ProdNum_VendNum_UntMsrCd(Lnk_ProdNum_VendNum_UntMsrCd_SQN)
)
;



CREATE TABLE Lnk_EmpID_POID
(
	Lnk_EmpID_POID_SQN    NUMERIC(12) NOT NULL,
	Lnk_EmpID_POID_LDTS   DATE NOT NULL,
	Lnk_EmpID_POID_RSRC   VARCHAR(18) NULL,
	Hub_EmpID_SQN         NUMERIC(12) NULL,
	Hub_POID_SQN          NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_EmpID_POID_SQN)FOREIGN KEY R_240 (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN),
	FOREIGN KEY R_241 (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_EmpID_POID ON Lnk_EmpID_POID
(
	Hub_POID_SQN,
	Hub_EmpID_SQN
)
;



CREATE TABLE Hub_ShpMthdID
(
	Hub_ShpMthID_SQN      NUMERIC(12) NOT NULL,
	Hub_ShpMthID_LDTS     DATE NOT NULL,
	Hub_ShpMthID_RSRC     VARCHAR(18) NULL,
	ShipMethodID          INTEGER NOT NULL,
	 PRIMARY KEY (Hub_ShpMthID_SQN)
)
;



CREATE UNIQUE INDEX BK_ShipMethodID ON Hub_ShpMthdID
(
	ShipMethodID
)
;



CREATE TABLE Lnk_POID_ShpMthdID
(
	Lnk_POID_ShpMthdID_SQN  NUMERIC(12) NOT NULL,
	Lnk_POID_ShpMthdID_LDTS  DATE NOT NULL,
	Lnk_POID_ShpMthdID_RSRC  VARCHAR(18) NULL,
	Hub_POID_SQN          NUMERIC(12) NULL,
	Hub_ShpMthID_SQN      NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_POID_ShpMthdID_SQN)FOREIGN KEY R_235 (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN),
	FOREIGN KEY R_236 (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_POID_ShPMthdID ON Lnk_POID_ShpMthdID
(
	Hub_POID_SQN,
	Hub_ShpMthID_SQN
)
;



CREATE TABLE Lnk_VendNum_POID
(
	Lnk_VendNum_POID_SQN  NUMERIC(12) NOT NULL,
	Lnk_VendNum_POID_LDTS  DATE NOT NULL,
	Lnk_VendNum_POID_RSRC  VARCHAR(18) NULL,
	Hub_VendNum_SQN       NUMERIC(12) NULL,
	Hub_POID_SQN          NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_VendNum_POID_SQN)FOREIGN KEY R_233 (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN),
	FOREIGN KEY R_234 (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_AcctNum_POID ON Lnk_VendNum_POID
(
	Hub_VendNum_SQN,
	Hub_POID_SQN
)
;



CREATE TABLE Hub_CustID
(
	Hub_CustID_SQN        NUMERIC(12) NOT NULL,
	Hub_CustID_LDTS       DATE NOT NULL,
	Hub_CustID_RSRC       VARCHAR(18) NULL,
	CustomerID            INTEGER NOT NULL,
	 PRIMARY KEY (Hub_CustID_SQN)
)
;



CREATE UNIQUE INDEX BK_CustomerID ON Hub_CustID
(
	CustomerID
)
;



CREATE TABLE Sat_Cust
(
	Hub_CustID_SQN        NUMERIC(12) NOT NULL,
	Sat_Cust_LDTS         DATE NOT NULL,
	Sat_Cust_LEDTS        DATE NULL,
	Sat_Cust_RSRC         VARCHAR(18) NULL,
	PersonID              CHAR(18) NULL,
	StoreID               CHAR(18) NULL,
	TerritoryID           CHAR(18) NULL,
	AccountNumber         varchar(10) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_CustID_SQN,Sat_Cust_LDTS)FOREIGN KEY R_253 (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN)
)
;



CREATE UNIQUE INDEX AK_Customer_AccountNumber ON Sat_Cust
(
	AccountNumber
)
;



CREATE TABLE Hub_PNTID
(
	Hub_PNTID_SQN         NUMERIC(12) NOT NULL,
	Hub_PNTID_LDTS        DATE NOT NULL,
	Hub_PNTID_RSRC        VARCHAR(18) NULL,
	PhoneNumberTypeID     INTEGER NOT NULL,
	 PRIMARY KEY (Hub_PNTID_SQN)
)
;



CREATE UNIQUE INDEX BK_PhoneNumberTypeID ON Hub_PNTID
(
	PhoneNumberTypeID
)
;



CREATE TABLE Sat_PNT
(
	Hub_PNTID_SQN         NUMERIC(12) NOT NULL,
	Sat_PNT_LDTS          DATE NOT NULL,
	Sat_PNT_LEDTS         DATE NULL,
	Sat_PNT_RSRC          VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_PNTID_SQN,Sat_PNT_LDTS)FOREIGN KEY R_224 (Hub_PNTID_SQN) REFERENCES Hub_PNTID(Hub_PNTID_SQN)
)
;



CREATE TABLE Hub_Phon
(
	Hub_Phon_SQN          NUMERIC(12) NOT NULL,
	Hub_Phon_LDTS         DATE NOT NULL,
	Hub_Phon_RSRC         VARCHAR(18) NULL,
	PhoneNumber           VARCHAR(25) NOT NULL,
	 PRIMARY KEY (Hub_Phon_SQN)
)
;



CREATE UNIQUE INDEX BK_PhoneNumber ON Hub_Phon
(
	PhoneNumber
)
;



CREATE TABLE Sat_Phon
(
	Hub_Phon_SQN          NUMERIC(12) NOT NULL,
	Sat_Phon_LDTS         DATE NOT NULL,
	Sat_Phon_LEDTS        DATE NULL,
	Sat_Phon_RSRC         VARCHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_Phon_SQN,Sat_Phon_LDTS)FOREIGN KEY R_222 (Hub_Phon_SQN) REFERENCES Hub_Phon(Hub_Phon_SQN)
)
;



CREATE TABLE Lnk_PersID_Phon_PNTID
(
	Lnk_PersID_Phon_PNTID_SQN  NUMERIC(12) NOT NULL,
	Lnk_PersID_Phon_PNTID_LDTS  DATE NOT NULL,
	Lnk_PersID_Phon_PNTID_RSRC  VARCHAR(18) NULL,
	Hub_PersID_SQN        NUMERIC(12) NULL,
	Hub_Phon_SQN          NUMERIC(12) NULL,
	Hub_PNTID_SQN         NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_PersID_Phon_PNTID_SQN)FOREIGN KEY R_220 (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	FOREIGN KEY R_221 (Hub_Phon_SQN) REFERENCES Hub_Phon(Hub_Phon_SQN),
	FOREIGN KEY R_223 (Hub_PNTID_SQN) REFERENCES Hub_PNTID(Hub_PNTID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_PersID_Phon_PNTID ON Lnk_PersID_Phon_PNTID
(
	Hub_PersID_SQN,
	Hub_Phon_SQN,
	Hub_PNTID_SQN
)
;



CREATE TABLE Sat_EmailAdd
(
	Hub_EmailAddID_SQN    NUMERIC(12) NOT NULL,
	Sat_EmailAdd_LDTS     DATE NOT NULL,
	Sat_EmailAdd_LEDTS    DATE NULL,
	Sat_EmailAdd_RSRC     VARCHAR(18) NULL,
	EmailAddress          VARCHAR(50) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_EmailAddID_SQN,Sat_EmailAdd_LDTS)FOREIGN KEY R_219 (Hub_EmailAddID_SQN) REFERENCES Hub_EmailAddID(Hub_EmailAddID_SQN)
)
;



CREATE INDEX IX_EmailAddress_EmailAddress ON Sat_EmailAdd
(
	EmailAddress
)
;



CREATE TABLE Lnk_SOrdNum_ShpMthdID
(
	Lnk_SOrdNum_ShpMthdID_SQN  NUMERIC(12) NOT NULL,
	Lnk_SOrdNum_ShpMthdID_LDTS  DATE NOT NULL,
	Lnk_SOrdNum_ShpMthdID_RSRC  VARCHAR(18) NULL,
	Hub_SOrdNum_SQN       NUMERIC(12) NULL,
	Hub_ShpMthID_SQN      NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_SOrdNum_ShpMthdID_SQN)FOREIGN KEY R_238 (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN),
	FOREIGN KEY R_239 (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_POID_ShPMthdID ON Lnk_SOrdNum_ShpMthdID
(
	Hub_ShpMthID_SQN,
	Hub_SOrdNum_SQN
)
;



CREATE TABLE Sat_Pswrd
(
	Hub_PersID_SQN        NUMERIC(12) NOT NULL,
	Sat_Pswrd_LDTS        DATE NOT NULL,
	Sat_Pswrd_LEDTS       DATE NULL,
	Sat_Pswrd_RSRC        VARCHAR(18) NULL,
	PasswordHash          varchar(128) NOT NULL,
	PasswordSalt          varchar(10) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_PersID_SQN,Sat_Pswrd_LDTS)FOREIGN KEY R_216 (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE TABLE Lnk_ProdNum_POID
(
	Lnk_ProdNum_POID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_POID_LDTS  DATE NOT NULL,
	Lnk_ProdNum_POID_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_POID_SQN          NUMERIC(12) NULL,
	PurchaseOrderDetailID  INTEGER NOT NULL,
	 PRIMARY KEY (Lnk_ProdNum_POID_SQN)FOREIGN KEY R_229 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	FOREIGN KEY R_231 (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
;



CREATE UNIQUE INDEX AK_PurchaseOrderDetail ON Lnk_ProdNum_POID
(
	Hub_ProdNum_SQN,
	PurchaseOrderDetailID,
	Hub_POID_SQN
)
;



CREATE TABLE Sat_PODetail
(
	Lnk_ProdNum_POID_SQN  NUMERIC(12) NOT NULL,
	Sat_PODetail_LDTS     DATE NOT NULL,
	Sat_PODetail_LEDTS    DATE NULL,
	Sat_PODetail_RSRC     VARCHAR(18) NULL,
	DueDate               datetime NOT NULL,
	OrderQty              smallint NOT NULL,
	ProductID             CHAR(18) NOT NULL,
	UnitPrice             DECIMAL(19,4) NOT NULL,
	LineTotal             DECIMAL(19,4) NOT NULL,
	ReceivedQty           decimal(8,2) NOT NULL,
	RejectedQty           decimal(8,2) NOT NULL,
	StockedQty            decimal(9,2) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_ProdNum_POID_SQN,Sat_PODetail_LDTS)FOREIGN KEY R_230 (Lnk_ProdNum_POID_SQN) REFERENCES Lnk_ProdNum_POID(Lnk_ProdNum_POID_SQN)
)
;



CREATE TABLE Sat_ShpMthd
(
	Hub_ShpMthID_SQN      NUMERIC(12) NOT NULL,
	Sat_ShpMthd_LDTS      DATE NOT NULL,
	Sat_ShpMthd_LEDTS     DATE NULL,
	Sat_ShpMthd_RSRC      VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ShipBase              DECIMAL(19,4) NOT NULL,
	ShipRate              DECIMAL(19,4) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_ShpMthID_SQN,Sat_ShpMthd_LDTS)FOREIGN KEY R_237 (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN)
)
;



CREATE UNIQUE INDEX AK_ShipMethod_Name ON Sat_ShpMthd
(
	Name
)
;



CREATE TABLE Hub_SaleTaxRtID
(
	Hub_SaleTaxRtID_SQN   NUMERIC(12) NOT NULL,
	Hub_SaleTaxRtID_LDTS  DATE NOT NULL,
	Hub_SaleTaxRtID_RSRC  VARCHAR(18) NULL,
	SalesTaxRateID        INTEGER NOT NULL,
	 PRIMARY KEY (Hub_SaleTaxRtID_SQN)
)
;



CREATE UNIQUE INDEX BK_SalesTaxRateID ON Hub_SaleTaxRtID
(
	SalesTaxRateID
)
;



CREATE TABLE Lnk_StProvID_SaleTaxRtID
(
	Lnk_StProvID_SaleTaxRtID_SQN  NUMERIC(12) NOT NULL,
	Lnk_StProvID_SaleTaxRtID_LDTS  DATE NOT NULL,
	Lnk_StProvID_SaleTaxRtID_RSRC  VARCHAR(18) NULL,
	Hub_StProvID_SQN      NUMERIC(12) NULL,
	Hub_SaleTaxRtID_SQN   NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_StProvID_SaleTaxRtID_SQN)FOREIGN KEY R_295 (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN),
	FOREIGN KEY R_296 (Hub_SaleTaxRtID_SQN) REFERENCES Hub_SaleTaxRtID(Hub_SaleTaxRtID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_StProvID_SaleTaxRtID ON Lnk_StProvID_SaleTaxRtID
(
	Hub_StProvID_SQN,
	Hub_SaleTaxRtID_SQN
)
;



CREATE TABLE Hub_Store
(
	Hub_Store_SQN         NUMERIC(12) NOT NULL,
	Hub_Store_LDTS        DATE NOT NULL,
	Hub_Store_RSRC        VARCHAR(18) NULL,
	BusinessEntityID      CHAR(18) NOT NULL,
	 PRIMARY KEY (Hub_Store_SQN)
)
;



CREATE UNIQUE INDEX BK_BusinessEntityID ON Hub_Store
(
	BusinessEntityID
)
;



CREATE TABLE Lnk_BusEntID_Store
(
	Lnk_BusEntID_Store_SQN  NUMERIC(12) NOT NULL,
	Lnk_BusEntID_Store_LDTS  DATE NOT NULL,
	Lnk_BusEntID_Store_RSRC  VARCHAR(18) NULL,
	Hub_BusEntID_SQN      NUMERIC(12) NULL,
	Hub_Store_SQN         NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_BusEntID_Store_SQN)FOREIGN KEY R_271 (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	FOREIGN KEY R_274 (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_BEID_Store ON Lnk_BusEntID_Store
(
	Hub_BusEntID_SQN,
	Hub_Store_SQN
)
;



CREATE TABLE Hub_SalePers
(
	Hub_SalePers_SQN      NUMERIC(12) NOT NULL,
	Hub_SalePers_LDTS     DATE NOT NULL,
	Hub_SalePers_RSRC     VARCHAR(18) NULL,
	EmployeeID            CHAR(18) NOT NULL,
	 PRIMARY KEY (Hub_SalePers_SQN)
)
;



CREATE UNIQUE INDEX BK_SalesPersonID ON Hub_SalePers
(
	EmployeeID
)
;



CREATE TABLE Lnk_EmpID_SalePers
(
	Lnk_EmpID_SalePers_SQN  NUMERIC(12) NOT NULL,
	Lnk_EmpID_SalePers_LDTS  DATE NOT NULL,
	Lnk_EmpID_SalePers_RSRC  VARCHAR(18) NULL,
	Hub_EmpID_SQN         NUMERIC(12) NULL,
	Hub_SalePers_SQN      NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_EmpID_SalePers_SQN)FOREIGN KEY R_242 (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	FOREIGN KEY R_243 (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_EmpID_SalePers ON Lnk_EmpID_SalePers
(
	Hub_EmpID_SQN,
	Hub_SalePers_SQN
)
;



CREATE TABLE Lnk_SalePers_Store
(
	Lnk_SalePers_Store_SQN  NUMERIC(12) NOT NULL,
	Lnk_SalePers_Store_LDTS  DATE NOT NULL,
	Lnk_SalePers_Store_RSRC  VARCHAR(18) NULL,
	Hub_Store_SQN         NUMERIC(12) NULL,
	Hub_SalePers_SQN      NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_SalePers_Store_SQN)FOREIGN KEY R_250 (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	FOREIGN KEY R_251 (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SalePers_Store ON Lnk_SalePers_Store
(
	Hub_SalePers_SQN,
	Hub_Store_SQN
)
;



CREATE TABLE Hub_BOMID
(
	Hub_BOMID_SQN         NUMERIC(12) NOT NULL,
	Hub_BOMID_LDTS        DATE NOT NULL,
	Hub_BOMID_RSRC        VARCHAR(18) NULL,
	BillOfMaterialsID     INTEGER NOT NULL,
	 PRIMARY KEY (Hub_BOMID_SQN)
)
;



CREATE UNIQUE INDEX BK_BillOfMaterialsID ON Hub_BOMID
(
	BillOfMaterialsID
)
;



CREATE TABLE Sat_BOM
(
	Hub_BOMID_SQN         NUMERIC(12) NOT NULL,
	Sat_BOM_LDTS          DATE NOT NULL,
	Sat_BOM_LEDTS         DATE NULL,
	Sat_BOM_RSRC          VARCHAR(18) NULL,
	StartDate             datetime NOT NULL,
	EndDate               datetime NULL,
	BOMLevel              smallint NOT NULL,
	PerAssemblyQty        decimal(8,2) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_BOMID_SQN,Sat_BOM_LDTS)FOREIGN KEY R_320 (Hub_BOMID_SQN) REFERENCES Hub_BOMID(Hub_BOMID_SQN)
)
;



CREATE UNIQUE INDEX AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate ON Sat_BOM
(
	StartDate
)
;



CREATE TABLE Sat_StProv
(
	Hub_StProvID_SQN      NUMERIC(12) NOT NULL,
	Sat_StProv_LDTS       DATE NOT NULL,
	Sat_StProv_LEDTS      DATE NULL,
	Sat_StProv_RSRC       VARCHAR(18) NULL,
	StateProvinceCode     CHAR(3) NOT NULL,
	CountryRegionCode     CHAR(18) NOT NULL,
	IsOnlyStateProvinceFlag  BIT NOT NULL,
	Name                  VARCHAR(50) NOT NULL,
	TerritoryID           CHAR(18) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_StProvID_SQN,Sat_StProv_LDTS)FOREIGN KEY R_297 (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
;



CREATE UNIQUE INDEX AK_StateProvince_Name ON Sat_StProv
(
	Name
)
;



CREATE UNIQUE INDEX AK_StateProvince_StateProvinceCode_CountryRegionCode ON Sat_StProv
(
	StateProvinceCode,
	CountryRegionCode
)
;



CREATE TABLE Lnk_StProvID_CntryRgnCd
(
	Lnk_StProvID_CntryRgnCd_SQN  NUMERIC(12) NOT NULL,
	Lnk_StProvID_CntryRgnCd_LDTS  DATE NOT NULL,
	Lnk_StProvID_CntryRgnCd_RSRC  VARCHAR(18) NULL,
	Hub_StProvID_SQN      NUMERIC(12) NULL,
	Hub_CntryRgnCd_SQN    NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_StProvID_CntryRgnCd_SQN)FOREIGN KEY R_299 (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN),
	FOREIGN KEY R_302 (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_StProvID_CntryRgnID ON Lnk_StProvID_CntryRgnCd
(
	Hub_CntryRgnCd_SQN,
	Hub_StProvID_SQN
)
;



CREATE TABLE Sat_SaleTaxRt
(
	Hub_SaleTaxRtID_SQN   NUMERIC(12) NOT NULL,
	Sat_SaleTaxRt_LDTS    DATE NOT NULL,
	Sat_SaleTaxRt_LEDTS   DATE NULL,
	Sat_SaleTaxRt_RSRC    VARCHAR(18) NULL,
	TaxType               tinyint NOT NULL,
	TaxRate               DECIMAL(10,4) NOT NULL,
	Name                  VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_SaleTaxRtID_SQN,Sat_SaleTaxRt_LDTS)FOREIGN KEY R_298 (Hub_SaleTaxRtID_SQN) REFERENCES Hub_SaleTaxRtID(Hub_SaleTaxRtID_SQN)
)
;



CREATE UNIQUE INDEX AK_SalesTaxRate_StateProvinceID_TaxType ON Sat_SaleTaxRt
(
	TaxType
)
;



CREATE TABLE Sat_SalePers
(
	Hub_SalePers_SQN      NUMERIC(12) NOT NULL,
	Sat_SalePersLDTS      DATE NOT NULL,
	Sat_SalePersLEDTS     DATE NULL,
	Sat_SalePers_RSRC     VARCHAR(18) NULL,
	TerritoryID           CHAR(18) NULL,
	SalesQuota            DECIMAL(19,4) NULL,
	Bonus                 DECIMAL(19,4) NOT NULL,
	CommissionPct         DECIMAL(10,4) NOT NULL,
	SalesYTD              DECIMAL(19,4) NOT NULL,
	SalesLastYear         DECIMAL(19,4) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_SalePers_SQN,Sat_SalePersLDTS)FOREIGN KEY R_244 (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
;



CREATE TABLE Hub_SaleTerID
(
	Hub_SaleTerID_SQN     NUMERIC(12) NOT NULL,
	Hub_SaleTerID_LDTS    DATE NOT NULL,
	Hub_SaleTerID_RSRC    VARCHAR(18) NULL,
	TerritoryID           INTEGER NOT NULL,
	 PRIMARY KEY (Hub_SaleTerID_SQN)
)
;



CREATE UNIQUE INDEX BK_SalesTerritoryID ON Hub_SaleTerID
(
	TerritoryID
)
;



CREATE TABLE Lnk_SalePers_SaleTerID
(
	Lnk_SalePers_SaleTerID_SQN  NUMERIC(12) NOT NULL,
	Lnk_SalePers_SaleTerID_LDTS  DATE NOT NULL,
	Lnk_SalePers_SaleTerID_RSRC  VARCHAR(18) NULL,
	Hub_SalePers_SQN      NUMERIC(12) NULL,
	Hub_SaleTerID_SQN     NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_SalePers_SaleTerID_SQN)FOREIGN KEY R_266 (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	FOREIGN KEY R_267 (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SalePers_SaleTer ON Lnk_SalePers_SaleTerID
(
	Hub_SalePers_SQN,
	Hub_SaleTerID_SQN
)
;



CREATE TABLE Sat_SaleTerHist
(
	Lnk_SalePers_SaleTerID_SQN  NUMERIC(12) NOT NULL,
	Sat_SaleTerHist_LDTS  DATE NOT NULL,
	Sat_SaleTerHist_LEDTS  DATE NULL,
	Sat_SaleTerHist_RSRC  VARCHAR(18) NULL,
	StartDate             datetime NOT NULL,
	EndDate               datetime NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_SalePers_SaleTerID_SQN,Sat_SaleTerHist_LDTS)FOREIGN KEY R_265 (Lnk_SalePers_SaleTerID_SQN) REFERENCES Lnk_SalePers_SaleTerID(Lnk_SalePers_SaleTerID_SQN)
)
;



CREATE TABLE Sat_Store
(
	Hub_Store_SQN         NUMERIC(12) NOT NULL,
	Sat_Store_LDTS        DATE NOT NULL,
	Sat_Store_LEDTS       DATE NULL,
	Sat_Store_RSRC        VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	Demographics          LONG VARCHAR NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_Store_SQN,Sat_Store_LDTS)FOREIGN KEY R_252 (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
;



CREATE TABLE Lnk_Cust_SaleTerID
(
	Lnk_Cust_SaleTerID_SQN  NUMERIC(12) NOT NULL,
	Lnk_Cust_SaleTerID_LDTS  DATE NOT NULL,
	Lnk_Cust_SaleTerID_SRC  VARCHAR(18) NULL,
	Hub_CustID_SQN        NUMERIC(12) NULL,
	Hub_SaleTerID_SQN     NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_Cust_SaleTerID_SQN)FOREIGN KEY R_261 (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	FOREIGN KEY R_262 (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_Cust_SaleTerID ON Lnk_Cust_SaleTerID
(
	Hub_CustID_SQN,
	Hub_SaleTerID_SQN
)
;



CREATE TABLE Sat_Crncy
(
	Hub_CrncyCd_SQN       NUMERIC(12) NOT NULL,
	Sat_Crncy_LDTS        DATE NOT NULL,
	Sat_Crncy_LEDTS       DATE NULL,
	Sat_Crncy_RSRC        VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_CrncyCd_SQN,Sat_Crncy_LDTS)FOREIGN KEY R_306 (Hub_CrncyCd_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
;



CREATE UNIQUE INDEX AK_Currency_Name ON Sat_Crncy
(
	Name
)
;



CREATE TABLE Lnk_SOrdNum_SalePers
(
	Lnk_SOrdNum_SalePers_SQN  NUMERIC(12) NOT NULL,
	Lnk_SOrdNum_SalePers_LDTS  DATE NOT NULL,
	Lnk_SOrdNum_SalePers_RSRC  VARCHAR(18) NULL,
	Hub_SOrdNum_SQN       NUMERIC(12) NULL,
	Hub_SalePers_SQN      NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_SOrdNum_SalePers_SQN)FOREIGN KEY R_246 (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	FOREIGN KEY R_247 (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SOrdID_SalePers ON Lnk_SOrdNum_SalePers
(
	Hub_SalePers_SQN,
	Hub_SOrdNum_SQN
)
;



CREATE TABLE Sat_SalePersQuotaHist
(
	Hub_SalePers_SQN      NUMERIC(12) NOT NULL,
	Sat_SalePersQuotaHist_LDTS  DATE NOT NULL,
	Sat_SalePersQuotaHist_LEDTS  DATE NULL,
	Sat_SalePersQuotaHist_RSRC  VARCHAR(18) NULL,
	QuotaDate             datetime NOT NULL,
	SalesQuota            DECIMAL(19,4) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_SalePers_SQN,Sat_SalePersQuotaHist_LDTS)FOREIGN KEY R_245 (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
;



CREATE TABLE Hub_CrncyRtID
(
	Hub_CrncyRtID_SQN     NUMERIC(12) NOT NULL,
	Hub_CrncyRtID_LDTS    DATE NOT NULL,
	Hub_CrncyRtID_RSRC    VARCHAR(18) NULL,
	CurrencyRateID        INTEGER NOT NULL,
	 PRIMARY KEY (Hub_CrncyRtID_SQN)
)
;



CREATE UNIQUE INDEX BK_CurrencyRate ON Hub_CrncyRtID
(
	CurrencyRateID
)
;



CREATE TABLE Sat_CrncyRt
(
	Hub_CrncyRtID_SQN     NUMERIC(12) NOT NULL,
	Sat_CrncyRt_LDTS      DATE NOT NULL,
	Sat_CrncyRt_LEDTS     DATE NULL,
	Sat_CrncyRt_RSRC      VARCHAR(18) NULL,
	CurrencyRateDate      datetime NOT NULL,
	AverageRate           DECIMAL(19,4) NOT NULL,
	EndOfDayRate          DECIMAL(19,4) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_CrncyRtID_SQN,Sat_CrncyRt_LDTS)FOREIGN KEY R_310 (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN)
)
;



CREATE UNIQUE INDEX AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode ON Sat_CrncyRt
(
	CurrencyRateDate
)
;



CREATE TABLE Sat_BusEntID
(
	Hub_BusEntID_SQN      NUMERIC(12) NOT NULL,
	Sat_BusEntID_LDTS     DATE NOT NULL,
	Sat_BusEntID_LEDTS    DATE NULL,
	Sat_BusEntID_RSRC     VARCHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_BusEntID_SQN,Sat_BusEntID_LDTS)FOREIGN KEY R_268 (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN)
)
;



CREATE TABLE Lnk_EmpID_PersID
(
	Lnk_EmpID_PersID_SQN  NUMERIC(12) NOT NULL,
	Lnk_EmpID_PersID_LDTS  DATE NOT NULL,
	Lnk_EmpID_PersID_RSRC  VARCHAR(18) NULL,
	Hub_PersID_SQN        NUMERIC(12) NULL,
	Hub_EmpID_SQN         NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_EmpID_PersID_SQN)FOREIGN KEY R_248 (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	FOREIGN KEY R_249 (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_EmpID_PersID ON Lnk_EmpID_PersID
(
	Hub_EmpID_SQN,
	Hub_PersID_SQN
)
;



CREATE TABLE Lnk_CustID_Store
(
	Lnk_CustID_Store_SQN  NUMERIC(12) NOT NULL,
	Lnk_CustID_Store_LDTS  DATE NOT NULL,
	Lnk_CustID_Store_RSRC  VARCHAR(18) NULL,
	Hub_CustID_SQN        NUMERIC(12) NULL,
	Hub_Store_SQN         NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_CustID_Store_SQN)FOREIGN KEY R_254 (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN),
	FOREIGN KEY R_255 (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_CustID_Store ON Lnk_CustID_Store
(
	Hub_Store_SQN,
	Hub_CustID_SQN
)
;



CREATE TABLE Lnk_PersID_CustID
(
	Lnk_PersID_CustID_SQN  NUMERIC(12) NOT NULL,
	Lnk_PersID_CustID_LDTS  DATE NOT NULL,
	Lnk_PersID_CustID_RSRC  VARCHAR(18) NULL,
	Hub_PersID_SQN        NUMERIC(12) NULL,
	Hub_CustID_SQN        NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_PersID_CustID_SQN)FOREIGN KEY R_256 (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	FOREIGN KEY R_257 (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_PersID_CustID ON Lnk_PersID_CustID
(
	Hub_CustID_SQN,
	Hub_PersID_SQN
)
;



CREATE TABLE Hub_AddTypID
(
	Hub_AddTypID_SQN      NUMERIC(12) NOT NULL,
	Hub_AddTypID_LDTS     DATE NOT NULL,
	Hub_AddTypID_RSRC     VARCHAR(18) NULL,
	AddressTypeID         INTEGER NOT NULL,
	 PRIMARY KEY (Hub_AddTypID_SQN)
)
;



CREATE UNIQUE INDEX BK_AddressTypeID ON Hub_AddTypID
(
	AddressTypeID
)
;



CREATE TABLE Sat_AddTyp
(
	Hub_AddTypID_SQN      NUMERIC(12) NOT NULL,
	Sat_AddTyp_LDTS       DATE NOT NULL,
	Sat_AddTyp_LEDTS      DATE NULL,
	Sat_AddTyp_RSRC       VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_AddTypID_SQN,Sat_AddTyp_LDTS)FOREIGN KEY R_285 (Hub_AddTypID_SQN) REFERENCES Hub_AddTypID(Hub_AddTypID_SQN)
)
;



CREATE UNIQUE INDEX AK_AddressType_Name ON Sat_AddTyp
(
	Name
)
;



CREATE TABLE Sat_SaleTer
(
	Hub_SaleTerID_SQN     NUMERIC(12) NOT NULL,
	Sat_SaleTer_LDTS      DATE NOT NULL,
	Sat_SaleTer_LEDTS     DATE NULL,
	Sat_SaleTer_RSRC      VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	CountryRegionCode     VARCHAR(3) NOT NULL,
	Group                 VARCHAR(50) NOT NULL,
	SalesYTD              DECIMAL(19,4) NOT NULL,
	SalesLastYear         DECIMAL(19,4) NOT NULL,
	CostYTD               DECIMAL(19,4) NOT NULL,
	CostLastYear          DECIMAL(19,4) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_SaleTerID_SQN,Sat_SaleTer_LDTS)FOREIGN KEY R_260 (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
;



CREATE UNIQUE INDEX AK_SalesTerritory_Name ON Sat_SaleTer
(
	Name
)
;



CREATE TABLE Lnk_ProdNum_UntMsrCd
(
	Lnk_ProdNum_UntMsrCd_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_UntMsrCd_LDTS  DATE NOT NULL,
	Lnk_ProdNum_UntMsrCd_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_SQN       NUMERIC(12) NULL,
	Hub_UntMsrCd_Wt_SQN   NUMERIC(12) NULL,
	Hub_UntMsrCd_Size_SQN  NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ProdNum_UntMsrCd_SQN)FOREIGN KEY R_315 (Hub_UntMsrCd_Wt_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN),
	FOREIGN KEY R_316 (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	FOREIGN KEY R_319 (Hub_UntMsrCd_Size_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_VendNum_UntMsrCd ON Lnk_ProdNum_UntMsrCd
(
	Hub_UntMsrCd_Wt_SQN,
	Hub_ProdNum_SQN,
	Hub_UntMsrCd_Size_SQN
)
;



CREATE TABLE Sat_UntMsr
(
	Sat_UntMsr_LDTS       DATE NOT NULL,
	Hub_UntMsrCd_SQN      NUMERIC(12) NOT NULL,
	Sat_UntMsr_LEDTS      DATE NULL,
	Sat_UntMsr_RSRC       VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Sat_UntMsr_LDTS,Hub_UntMsrCd_SQN)FOREIGN KEY R_313 (Hub_UntMsrCd_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
;



CREATE UNIQUE INDEX AK_UnitMeasure_Name ON Sat_UntMsr
(
	Name
)
;



CREATE TABLE Lnk_CrncyCd_CrncyRtID
(
	Lnk_CrncyCd_CrncyRtID_SQN  NUMERIC(12) NOT NULL,
	Lnk_CrncyCd_CrncyRtID_LDTS  DATE NOT NULL,
	Lnk_CrncyCd_CrncyRtID_RSRC  VARCHAR(18) NULL,
	Hub_CrncyRtID_SQN     NUMERIC(12) NULL,
	Hub_CrncyCd_From_SQN  NUMERIC(12) NULL,
	Hub_CrncyCd_To_SQN    NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_CrncyCd_CrncyRtID_SQN)FOREIGN KEY R_307 (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN),
	FOREIGN KEY R_308 (Hub_CrncyCd_From_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN),
	FOREIGN KEY R_309 (Hub_CrncyCd_To_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_CrncyCd_CrncyRtID ON Lnk_CrncyCd_CrncyRtID
(
	Hub_CrncyRtID_SQN,
	Hub_CrncyCd_From_SQN,
	Hub_CrncyCd_To_SQN
)
;



CREATE TABLE Lnk_SOrdNum_CrncyRtID
(
	Lnk_SOrdNum_CrncyRtID_SQN  NUMERIC(12) NOT NULL,
	Lnk_SOrdNum_CrncyRtID_LDTS  DATE NOT NULL,
	Lnk_SOrdNum_CrncyRtID_RSRC  VARCHAR(18) NULL,
	Hub_SOrdNum_SQN       NUMERIC(12) NULL,
	Hub_CrncyRtID_SQN     NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_SOrdNum_CrncyRtID_SQN)FOREIGN KEY R_311 (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN),
	FOREIGN KEY R_312 (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_CrncyRtID ON Lnk_SOrdNum_CrncyRtID
(
	Hub_CrncyRtID_SQN,
	Hub_SOrdNum_SQN
)
;



CREATE TABLE Sat_CntryRgn
(
	Hub_CntryRgnCd_SQN    NUMERIC(12) NOT NULL,
	Sat_CntryRgn_LDTS     DATE NOT NULL,
	Sat_CntryRgn_LEDTS    DATE NULL,
	Sat_CntryRgn_RSRC     VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_CntryRgnCd_SQN,Sat_CntryRgn_LDTS)FOREIGN KEY R_304 (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN)
)
;



CREATE UNIQUE INDEX AK_CountryRegion_Name ON Sat_CntryRgn
(
	Name
)
;



CREATE TABLE Lnk_SaleTerID_StProvID
(
	Lnk_SaleTerID_StProvID_SQN  NUMERIC(12) NOT NULL,
	Lnk_SaleTerID_StProvID_LDTS  DATE NOT NULL,
	Lnk_SaleTerID_StProvID_RSRC  VARCHAR(18) NULL,
	Hub_StProvID_SQN      NUMERIC(12) NULL,
	Hub_SaleTerID_SQN     NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_SaleTerID_StProvID_SQN)FOREIGN KEY R_293 (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN),
	FOREIGN KEY R_294 (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SaleTerID_StProvID ON Lnk_SaleTerID_StProvID
(
	Hub_SaleTerID_SQN,
	Hub_StProvID_SQN
)
;



CREATE TABLE Lnk_CustID_SOrdNum
(
	Lnk_CustID_SOrdNum_SQN  NUMERIC(12) NOT NULL,
	Lnk_CustID_SOrdNum_LDTS  DATE NOT NULL,
	Lnk_CustID_SOrdNum_RSRC  VARCHAR(18) NULL,
	Hub_SOrdNum_SQN       NUMERIC(12) NULL,
	Hub_CustID_SQN        NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_CustID_SOrdNum_SQN)FOREIGN KEY R_258 (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	FOREIGN KEY R_259 (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_CustID_SOrdNum ON Lnk_CustID_SOrdNum
(
	Hub_SOrdNum_SQN,
	Hub_CustID_SQN
)
;



CREATE TABLE Sat_Add
(
	Hub_AddID_SQN         NUMERIC(12) NOT NULL,
	Sat_Add_LDTS          DATE NOT NULL,
	Sat_Add_LEDTS         DATE NULL,
	Sat_Add_RSRC          VARCHAR(18) NULL,
	AddressLine1          VARCHAR(60) NOT NULL,
	AddressLine2          VARCHAR(60) NULL,
	City                  VARCHAR(30) NOT NULL,
	StateProvinceID       CHAR(18) NOT NULL,
	PostalCode            VARCHAR(15) NOT NULL,
	SpatialLocation       CHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_AddID_SQN,Sat_Add_LDTS)FOREIGN KEY R_286 (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
;



CREATE UNIQUE INDEX IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_Postal ON Sat_Add
(
	AddressLine1,
	AddressLine2,
	City,
	StateProvinceID,
	PostalCode
)
;



CREATE TABLE Lnk_BusEntID_AddID_AddTypID
(
	Lnk_BusEntID_AddID_AddTypID_SQN  NUMERIC(12) NOT NULL,
	Lnk_BusEntID_AddID_AddTypID_LDTS  DATE NOT NULL,
	Lnk_BusEntID_AddID_AddTypID_RSRC  VARCHAR(18) NULL,
	Hub_BusEntID_SQN      NUMERIC(12) NULL,
	Hub_AddID_SQN         NUMERIC(12) NULL,
	Hub_AddTypID_SQN      NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_BusEntID_AddID_AddTypID_SQN)FOREIGN KEY R_281 (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	FOREIGN KEY R_282 (Hub_AddTypID_SQN) REFERENCES Hub_AddTypID(Hub_AddTypID_SQN),
	FOREIGN KEY R_283 (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_BusEntID_AddID ON Lnk_BusEntID_AddID_AddTypID
(
	Hub_BusEntID_SQN,
	Hub_AddTypID_SQN,
	Hub_AddID_SQN
)
;



CREATE TABLE Sat_BusEntID_AddID_AddTypID
(
	Lnk_BusEntID_AddID_AddTypID_SQN  NUMERIC(12) NOT NULL,
	Sat_BusEntID_AddID_AddTypID_LDTS  DATE NOT NULL,
	Sat_BusEntID_AddID_AddTypID_LEDTS  DATE NULL,
	Sat_BusEntID_AddID_AddTypID_RSRC  VARCHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_BusEntID_AddID_AddTypID_SQN,Sat_BusEntID_AddID_AddTypID_LDTS)FOREIGN KEY R_284 (Lnk_BusEntID_AddID_AddTypID_SQN) REFERENCES Lnk_BusEntID_AddID_AddTypID(Lnk_BusEntID_AddID_AddTypID_SQN)
)
;



CREATE TABLE Lnk_ProdNum_BOMID
(
	Lnk_ProdNum_BOMID_SQN  NUMERIC(12) NOT NULL,
	Lnk_ProdNum_BOMID_LDTS  DATE NOT NULL,
	Lnk_ProdNum_BOMID_RSRC  VARCHAR(18) NULL,
	Hub_ProdNum_Asmbly_SQN  NUMERIC(12) NULL,
	Hub_ProdNum_Comp_SQN  NUMERIC(12) NULL,
	Hub_BOMID_SQN         NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_ProdNum_BOMID_SQN)FOREIGN KEY R_323 (Hub_ProdNum_Comp_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	FOREIGN KEY R_324 (Hub_ProdNum_Asmbly_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	FOREIGN KEY R_325 (Hub_BOMID_SQN) REFERENCES Hub_BOMID(Hub_BOMID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_BOM_Heir ON Lnk_ProdNum_BOMID
(
	Hub_ProdNum_Comp_SQN,
	Hub_ProdNum_Asmbly_SQN,
	Hub_BOMID_SQN
)
;



CREATE TABLE Hub_CntTypID
(
	Hub_CntTypID_SQN      NUMERIC(12) NOT NULL,
	Hub_CntTypID_LDTS     DATE NOT NULL,
	Hub_CntTypID_RSRC     VARCHAR(18) NULL,
	ContactTypeID         INTEGER NOT NULL,
	 PRIMARY KEY (Hub_CntTypID_SQN)
)
;



CREATE UNIQUE INDEX BK_ContactTypeID ON Hub_CntTypID
(
	ContactTypeID
)
;



CREATE TABLE Sat_CntTyp
(
	Hub_CntTypID_SQN      NUMERIC(12) NOT NULL,
	Sat_CntTyp_LDTS       DATE NOT NULL,
	Sat_CntTyp_LEDTS      DATE NULL,
	Sat_CntTyp_RSRC       VARCHAR(18) NULL,
	Name                  VARCHAR(50) NOT NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Hub_CntTypID_SQN,Sat_CntTyp_LDTS)FOREIGN KEY R_277 (Hub_CntTypID_SQN) REFERENCES Hub_CntTypID(Hub_CntTypID_SQN)
)
;



CREATE UNIQUE INDEX AK_ContactType_Name ON Sat_CntTyp
(
	Name
)
;



CREATE TABLE Lnk_PersID_BusEntID_CntTypID
(
	Lnk_PersID_BusEntID_CntTypID_SQN  NUMERIC(12) NOT NULL,
	Lnk_PersID_BusEntID_CntTypID_LDTS  DATE NOT NULL,
	Lnk_PersID_BusEntID_CntTypID_RSRC  VARCHAR(18) NULL,
	Hub_BusEntID_SQN      NUMERIC(12) NULL,
	Hub_PersID_SQN        NUMERIC(12) NULL,
	Hub_CntTypID_SQN      NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_PersID_BusEntID_CntTypID_SQN)FOREIGN KEY R_278 (Hub_CntTypID_SQN) REFERENCES Hub_CntTypID(Hub_CntTypID_SQN),
	FOREIGN KEY R_279 (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	FOREIGN KEY R_280 (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_PersID_BusEntID_CntTypID ON Lnk_PersID_BusEntID_CntTypID
(
	Hub_CntTypID_SQN,
	Hub_BusEntID_SQN,
	Hub_PersID_SQN
)
;



CREATE TABLE Sat_BusEnt_Cnt
(
	Lnk_PersID_BusEntID_CntTypID_SQN  NUMERIC(12) NOT NULL,
	Sat_BusEnt_Cnt_LDTS   DATE NOT NULL,
	Sat_BusEnt_Cnt_LEDTS  DATE NULL,
	Sat_BusEnt_Cnt_RSRC   VARCHAR(18) NULL,
	ModifiedDate          datetime NOT NULL,
	 PRIMARY KEY (Lnk_PersID_BusEntID_CntTypID_SQN,Sat_BusEnt_Cnt_LDTS)FOREIGN KEY R_276 (Lnk_PersID_BusEntID_CntTypID_SQN) REFERENCES Lnk_PersID_BusEntID_CntTypID(Lnk_PersID_BusEntID_CntTypID_SQN)
)
;



CREATE TABLE Lnk_SOrdNum_SaleTerID
(
	Lnk_SOrdNum_SaleTerID_SQN  NUMERIC(12) NOT NULL,
	Lnk_SOrdNum_SaleTerID_LDTS  DATE NOT NULL,
	Lnk_SOrdNum_SaleTerID_RSRC  VARCHAR(18) NULL,
	Hub_SOrdNum_SQN       NUMERIC(12) NULL,
	Hub_SaleTerID_SQN     NUMERIC(12) NULL,
	 PRIMARY KEY (Lnk_SOrdNum_SaleTerID_SQN)FOREIGN KEY R_263 (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN),
	FOREIGN KEY R_264 (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_SaleTerID ON Lnk_SOrdNum_SaleTerID
(
	Hub_SaleTerID_SQN,
	Hub_SOrdNum_SQN
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


