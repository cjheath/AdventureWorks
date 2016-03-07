
CREATE TABLE Hub_ProdSubCatID
(
	Hub_ProdSubCatID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdSubCaID_tSQN'  ,
	Hub_ProdSubCatID_LDTS  DATE  NOT NULL 
		TITLE 'Hub_ProdSubCatID_LDTS'  ,
	Hub_ProdSubCatID_RSRC  VARCHAR(18)  
		TITLE 'Hub_ProdSubCatID_RSRC'  ,
	ProductSubcategoryID  INTEGER  NOT NULL 
		TITLE 'ProductSubcategoryID'  
)
	 UNIQUE PRIMARY INDEX PK_ProductSubcategory_ProductS
	 (
			Hub_ProdSubCatID_SQN
	 )
;



CREATE UNIQUE INDEX BK_ProductSubcategoryID
 (
		ProductSubcategoryID
 ) ON Hub_ProdSubCatID
;



CREATE TABLE Hub_ProdNum
(
	Hub_ProdNum_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_ProdNum_LDTS      DATE  NOT NULL 
		TITLE 'Hub_ProdNum_LDTS'  ,
	Hub_ProdNum_RSRC      VARCHAR(18)  
		TITLE 'Hub_ProdNum_RSRC'  ,
	ProductNumber         VARCHAR(25)  NOT NULL 
		TITLE 'ProductNumber'  
)
	 UNIQUE PRIMARY INDEX PK_Product_ProductID
	 (
			Hub_ProdNum_SQN
	 )
;



CREATE UNIQUE INDEX BK_ProdNumID
 (
		ProductNumber
 ) ON Hub_ProdNum
;



CREATE TABLE Hub_ProdCatID
(
	Hub_ProdCatID_SQN     NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdCat_SQN'  ,
	Hub_ProdCatID_LDTS    DATE  NOT NULL 
		TITLE 'Hub_ProdCat_LDTS'  ,
	Hub_ProdCatID_RSRC    VARCHAR(18)  
		TITLE 'Hub_ProdCat_RSRC'  ,
	ProductCategoryID     INTEGER  NOT NULL 
		TITLE 'ProductCategoryID'  
)
	 UNIQUE PRIMARY INDEX PK_ProductCategory_ProductCate
	 (
			Hub_ProdCatID_SQN
	 )
;



CREATE UNIQUE INDEX BK_ProductCategoryID
 (
		ProductCategoryID
 ) ON Hub_ProdCatID
;



CREATE TABLE Lnk_ProdNum_ProdSubCatID
(
	Lnk_ProdNum_ProdSubCatID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_ProdSubCatID_SQN'  ,
	Lnk_ProdNum_ProdSubCatID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_ProdSubCatID_ProdCatID_LDTS'  ,
	Lnk_ProdNum_ProdSubCatID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_ProdCatID_ProdSubCatID_RSRC'  ,
	Hub_ProdCatID_SQN     NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdCat_SQN'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_ProdSubCatID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdSubCaID_tSQN'  ,
	CONSTRAINT  R_131  FOREIGN KEY (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN),
	CONSTRAINT  R_133  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT  R_326  FOREIGN KEY (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_ProdSubCatID_ProdCatID
	 (
			Lnk_ProdNum_ProdSubCatID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_ProdSubCatID_ProdCatID
 (
		Hub_ProdNum_SQN,
		Hub_ProdSubCatID_SQN,
		Hub_ProdCatID_SQN
 ) ON Lnk_ProdNum_ProdSubCatID
;



CREATE TABLE Sat_ProdSubCat
(
	Hub_ProdSubCatID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdSubCaID_tSQN'  ,
	Sat_ProdSubCat_LDTS   DATE  NOT NULL 
		TITLE 'Hub_ProdSubCatID_LDTS'  ,
	Sat_ProdSubCat_LEDTS  DATE  
		TITLE 'Sat_ProdSubCat_LEDTS'  ,
	Sat_ProdSubCat_RSRC   VARCHAR(18)  
		TITLE 'Hub_ProdSubCatID_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_122  FOREIGN KEY (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SAT_ProductSubcategoryID
	 (
			Hub_ProdSubCatID_SQN,
			Sat_ProdSubCat_LDTS
	 )
;



CREATE UNIQUE INDEX AK_ProductSubcategory_Name
 (
		Name
 ) ON Sat_ProdSubCat
;



CREATE TABLE Lnk_ProdSubCatID_ProdCatID
(
	Lnk_ProdSubCatID_ProdCatID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdSubCatID_ProdCatID_SQN'  ,
	Lnk_ProdSubCatID_ProdCatID_LDT  DATE  NOT NULL 
		TITLE 'Lnk_ProdSubCatID_ProdCatID_LDTS'  ,
	Lnk_ProdSubCatID_ProdCatID_RSR  VARCHAR(18)  
		TITLE 'Lnk_ProdCatID_ProdSubCatID_RSRC'  ,
	Hub_ProdSubCatID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdSubCaID_tSQN'  ,
	Hub_ProdCatID_SQN     NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdCat_SQN'  ,
	CONSTRAINT  R_128  FOREIGN KEY (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN),
	CONSTRAINT  R_129  FOREIGN KEY (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_ProdSubCatCatID
	 (
			Lnk_ProdSubCatID_ProdCatID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_ProdSubCatID_ProdCatID
 (
		Hub_ProdCatID_SQN,
		Hub_ProdSubCatID_SQN
 ) ON Lnk_ProdSubCatID_ProdCatID
;



CREATE TABLE Sat_ProdCat
(
	Hub_ProdCatID_SQN     NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdCat_SQN'  ,
	Sat_ProdCat_LDTS      DATE  NOT NULL 
		TITLE 'Hub_ProdCat_LDTS'  ,
	Sat_ProdCat_LEDTS     DATE  
		TITLE 'Sat_ProdCat_LEDTS'  ,
	Sat_ProdCat_RSRC      VARCHAR(18)  
		TITLE 'Hub_ProdCat_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_121  FOREIGN KEY (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SAT_ProductCategoryID
	 (
			Hub_ProdCatID_SQN,
			Sat_ProdCat_LDTS
	 )
;



CREATE UNIQUE INDEX AK_ProductCategory_Name
 (
		Name
 ) ON Sat_ProdCat
;



CREATE TABLE Hub_AddID
(
	Hub_AddID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_AddID_SQN'  ,
	Hub_AddID_RSRC        VARCHAR(18)  
		TITLE 'Hub_AddID_RSRC'  ,
	Hub_AddID_LDTS        DATE  NOT NULL 
		TITLE 'Hub_AddID_LDTS'  ,
	AddressID             INTEGER  NOT NULL 
		TITLE 'AddressID'  
)
	 UNIQUE PRIMARY INDEX PK_Address_AddressID
	 (
			Hub_AddID_SQN
	 )
;



CREATE UNIQUE INDEX BK_AddressID
 (
		AddressID
 ) ON Hub_AddID
;



CREATE TABLE Hub_StProvID
(
	Hub_StProvID_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_StProvID_SQN'  ,
	Hub_StProvID_LDTS     DATE  NOT NULL 
		TITLE 'Hub_StProvID_LDTS'  ,
	Hub_StProvID_RSRC     VARCHAR(18)  
		TITLE 'Hub_StProvID_RSRC'  ,
	StateProvinceID       INTEGER  NOT NULL 
		TITLE 'StateProvinceID'  
)
	 UNIQUE PRIMARY INDEX PK_StateProvince_StateProvince
	 (
			Hub_StProvID_SQN
	 )
;



CREATE UNIQUE INDEX BK_StateProvinceID
 (
		StateProvinceID
 ) ON Hub_StProvID
;



CREATE TABLE Lnk_AddID_StProvID
(
	Lnk_AddID_StProvID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_AddID_StProvID_SQN'  ,
	Lnk_AddID_StProvID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_AddID_StProvID_LDTS'  ,
	Lnk_AddID_StProvID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_AddID_StProvID_RSRC'  ,
	Hub_AddID_SQN         NUMERIC(12)  
		TITLE 'Hub_AddID_SQN'  ,
	Hub_StProvID_SQN      NUMERIC(12)  
		TITLE 'Hub_StProvID_SQN'  ,
	CONSTRAINT  R_291  FOREIGN KEY (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN),
	CONSTRAINT  R_292  FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_AddID_StProvID
	 (
			Lnk_AddID_StProvID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_AddID_StProvID
 (
		Hub_AddID_SQN,
		Hub_StProvID_SQN
 ) ON Lnk_AddID_StProvID
;



CREATE TABLE Hub_DocNode
(
	Hub_DocNode_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_DocNode_SQN'  ,
	Hub_DocNode_LDTS      DATE  NOT NULL 
		TITLE 'Hub_DocNode_LDTS'  ,
	Hub_DocNode_RSRC      VARCHAR(18)  
		TITLE 'Hub_DocNode_RSRC'  ,
	DocumentNode          CHAR(18)  NOT NULL 
		TITLE 'DocumentNode'  
)
	 UNIQUE PRIMARY INDEX PK_Document_DocumentNode
	 (
			Hub_DocNode_SQN
	 )
;



CREATE UNIQUE INDEX BK_DocumentNode
 (
		DocumentNode
 ) ON Hub_DocNode
;



CREATE TABLE Lnk_ProdNum_DocNode
(
	Lnk_ProdNum_DocNode_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_DocID_SQN'  ,
	Lnk_ProdNum_DocNode_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_ProdID_DocID_LDTS'  ,
	Lnk_ProdNum_DocNode_RSRC  VARCHAR(18)  
		TITLE 'Lnk_ProdID_DocID_RSRC'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_DocNode_SQN       NUMERIC(12)  
		TITLE 'Hub_DocNode_SQN'  ,
	CONSTRAINT  R_194  FOREIGN KEY (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN),
	CONSTRAINT  R_195  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductDocument_ProductID_D
	 (
			Lnk_ProdNum_DocNode_SQN
	 )
;



CREATE UNIQUE INDEX AK_ProductDocument
 (
		Hub_ProdNum_SQN,
		Hub_DocNode_SQN
 ) ON Lnk_ProdNum_DocNode
;



CREATE TABLE Sat_Prod_Doc
(
	Lnk_ProdNum_DocNode_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_DocID_SQN'  ,
	Sat_Prod_Doc_LDTS     DATE  NOT NULL 
		TITLE 'Sat_Prod_Doc_LDTS'  ,
	Sat_Prod_Doc_LEDTS    DATE  
		TITLE 'Sat_Prod_Doc_LEDTS'  ,
	Sat_Prod_Doc_RSRC     VARCHAR(18)  
		TITLE 'Sat_Prod_Doc_RSRC'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_192  FOREIGN KEY (Lnk_ProdNum_DocNode_SQN) REFERENCES Lnk_ProdNum_DocNode(Lnk_ProdNum_DocNode_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SAT_ProductDocumentID
	 (
			Lnk_ProdNum_DocNode_SQN,
			Sat_Prod_Doc_LDTS
	 )
;



CREATE TABLE Hub_ShopCartItemID
(
	Hub_ShopCartItemID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ShopCartItemID_SQN'  ,
	Hub_ShopCartItemID_LDTS  DATE  NOT NULL 
		TITLE 'Hub_ShopCartItemID_LDTS'  ,
	Hub_ShopCartItemID_RSRC  VARCHAR(18)  
		TITLE 'Hub_ShopCartItemID_RSRC'  ,
	ShoppingCartItemID    INTEGER  NOT NULL 
		TITLE 'ShoppingCartItemID'  
)
	 UNIQUE PRIMARY INDEX PK_ShoppingCartItem_ShoppingCa
	 (
			Hub_ShopCartItemID_SQN
	 )
;



CREATE UNIQUE INDEX BK_ShopCartItemID
 (
		ShoppingCartItemID
 ) ON Hub_ShopCartItemID
;



CREATE TABLE Sat_ShopCartItem
(
	Hub_ShopCartItemID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ShopCartItemID_SQN'  ,
	Sat_ShopCartItem_LDTS  DATE  NOT NULL 
		TITLE 'Sat_ShopCartItem_LDTS'  ,
	Sat_ShopCartItem_LEDTS  DATE  
		TITLE 'Sat_ShopCartItem_LEDTS'  ,
	Sat_ShopCartItem_RSRC  VARCHAR(18)  
		TITLE 'Sat_ShopCartItem_RSRC'  ,
	ShoppingCartID        VARCHAR(50)  NOT NULL 
		TITLE 'ShoppingCartID'  ,
	Quantity              INTEGER  NOT NULL 
		TITLE 'Quantity'  ,
	DateCreated           TIMESTAMP  NOT NULL 
		TITLE 'DateCreated'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_113  FOREIGN KEY (Hub_ShopCartItemID_SQN) REFERENCES Hub_ShopCartItemID(Hub_ShopCartItemID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SAT_ShoppingCartItemID
	 (
			Hub_ShopCartItemID_SQN,
			Sat_ShopCartItem_LDTS
	 )
;



CREATE TABLE Hub_SOrdNum
(
	Hub_SOrdNum_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SOrdID_SQN'  ,
	Hub_SOrdNum_LDTS      DATE  NOT NULL 
		TITLE 'Hub_SOrdID_LDTS'  ,
	Hub_SOrdNum_RSRC      VARCHAR(18)  
		TITLE 'Hub_SOrdID_RSRC'  ,
	SalesOrderNumber      VARCHAR(25)  NOT NULL 
		TITLE 'SalesOrderNumber'  
)
	 UNIQUE PRIMARY INDEX PK_SalesOrderHeader_SalesOrder
	 (
			Hub_SOrdNum_SQN
	 )
;



CREATE UNIQUE INDEX BK_SalesOrderHeaderID
 (
		SalesOrderNumber
 ) ON Hub_SOrdNum
;



CREATE TABLE Hub_SRsnID
(
	Hub_SRsnID_SQN        NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SRsnID_SQN'  ,
	Hub_SRsnID_LDTS       DATE  NOT NULL 
		TITLE 'Hub_SRsnID_LDTS'  ,
	Hub_SRsnID_RSRC       VARCHAR(18)  
		TITLE 'Hub_SRsnID_RSRC'  ,
	SalesReasonID         INTEGER  NOT NULL 
		TITLE 'SalesReasonID'  
)
	 UNIQUE PRIMARY INDEX PK_SalesReason_SalesReasonID
	 (
			Hub_SRsnID_SQN
	 )
;



CREATE UNIQUE INDEX BK_SalesReasonID
 (
		SalesReasonID
 ) ON Hub_SRsnID
;



CREATE TABLE Lnk_SOrdNum_SRsnID
(
	Lnk_SOrdNum_SRsnID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SOrdNum_SRsnID_SQN'  ,
	Lnk_SOrdNum_SRsnID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_SOrdNum_SRsnID_LDTS'  ,
	Lnk_SOrdNum_SRsnID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_SOrdNum_SRsnID_RSRC'  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_SOrdID_SQN'  ,
	Hub_SRsnID_SQN        NUMERIC(12)  
		TITLE 'Hub_SRsnID_SQN'  ,
	CONSTRAINT  R_188  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	CONSTRAINT  R_189  FOREIGN KEY (Hub_SRsnID_SQN) REFERENCES Hub_SRsnID(Hub_SRsnID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SalesOrderHeaderSalesReason
	 (
			Lnk_SOrdNum_SRsnID_SQN
	 )
;



CREATE UNIQUE INDEX AK_SalesOrderHeaderSalesReason
 (
		Hub_SOrdNum_SQN,
		Hub_SRsnID_SQN
 ) ON Lnk_SOrdNum_SRsnID
;



CREATE TABLE Sat_SOrdNum_SRsnID
(
	Lnk_SOrdNum_SRsnID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SOrdNum_SRsnID_SQN'  ,
	Sat_SOrdNum_SRsnID_LDTS  DATE  NOT NULL 
		TITLE 'Sat_SOrdNum_SRsnID_LDTS'  ,
	Sat_SOrdNum_SRsnID_LEDTS  DATE  
		TITLE 'Sat_SOrdNum_SRsnID_LEDTS'  ,
	Sat_SOrdNum_SRsnID_RSRC  VARCHAR(18)  
		TITLE 'Sat_SOrdNum_SRsnID_RSRC'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_191  FOREIGN KEY (Lnk_SOrdNum_SRsnID_SQN) REFERENCES Lnk_SOrdNum_SRsnID(Lnk_SOrdNum_SRsnID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SalesOrderHeaderSalesReason
	 (
			Lnk_SOrdNum_SRsnID_SQN,
			Sat_SOrdNum_SRsnID_LDTS
	 )
;



CREATE TABLE Lnk_ProdNum_ShopCartItemID
(
	Lnk_ProdNum_ShopCartItemID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdNum_ShopCartItemID_SQN'  ,
	Lnk_ProdNum_ShopCartItemID_LDT  DATE  NOT NULL 
		TITLE 'Lnk_ProdNum_ShopCartItemID_LDTS'  ,
	Lnk_ProdNum_ShopCartItemID_RSR  VARCHAR(18)  
		TITLE 'Lnk_ProdNum_ShopCartItemID_RSRC'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_ShopCartItemID_SQN  NUMERIC(12)  
		TITLE 'Hub_ShopCartItemID_SQN'  ,
	CONSTRAINT  R_118  FOREIGN KEY (Hub_ShopCartItemID_SQN) REFERENCES Hub_ShopCartItemID(Hub_ShopCartItemID_SQN),
	CONSTRAINT  R_119  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ShoppingCartItem_ShoppingCa
	 (
			Lnk_ProdNum_ShopCartItemID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_ProdNum_ShopCartItemID
 (
		Hub_ShopCartItemID_SQN,
		Hub_ProdNum_SQN
 ) ON Lnk_ProdNum_ShopCartItemID
;



CREATE TABLE Hub_ProdPhotoID
(
	Hub_ProdPhotoID_SQN   NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdPhotoID_SQN'  ,
	Hub_ProdPhotoID_LDTS  DATE  NOT NULL 
		TITLE 'Hub_ProdPhotoID_LDTS'  ,
	Hub_ProdPhotoID_RSRC  VARCHAR(18)  
		TITLE 'Hub_ProdPhotoID_RSRC'  ,
	ProductPhotoID        INTEGER  NOT NULL 
		TITLE 'ProductPhotoID'  
)
	 UNIQUE PRIMARY INDEX PK_ProductPhoto_ProductPhotoID
	 (
			Hub_ProdPhotoID_SQN
	 )
;



CREATE UNIQUE INDEX BK_ProdPhotoID
 (
		ProductPhotoID
 ) ON Hub_ProdPhotoID
;



CREATE TABLE Lnk_ProdNum_ProdPhotoID
(
	Lnk_ProdNum_ProdPhotoID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdNum_ProdPhotoID_SQN'  ,
	Lnk_ProdNum_ProdPhotoID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_ProductID_ProductPhotoID_LDTS'  ,
	Lnk_ProdNum_ProdPhotoID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_ProductID_ProductPhotoID_RSRC'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_ProdPhotoID_SQN   NUMERIC(12)  
		TITLE 'Hub_ProdPhotoID_SQN'  ,
	CONSTRAINT  PK_ProductProductPhoto_Product PRIMARY KEY (Lnk_ProdNum_ProdPhotoID_SQN),
	CONSTRAINT  R_108  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT  R_109  FOREIGN KEY (Hub_ProdPhotoID_SQN) REFERENCES Hub_ProdPhotoID(Hub_ProdPhotoID_SQN)
)
;



CREATE UNIQUE INDEX AK_Lnk_ProdNum_ProdPhotoID
 (
		Hub_ProdNum_SQN,
		Hub_ProdPhotoID_SQN
 ) ON Lnk_ProdNum_ProdPhotoID
;



CREATE TABLE Sat_Prod_ProdPhoto
(
	Lnk_ProdNum_ProdPhotoID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdNum_ProdPhotoID_SQN'  ,
	Sat_ProdNum_ProdPhotoID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_ProductID_ProductPhotoID_LDTS'  ,
	Sat_ProdNum_ProdPhotoID_LEDTS  DATE  
		TITLE 'Sat_ProductID_ProductPhotoID_LEDTS'  ,
	Sat_ProdNum_ProdPhotoID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_ProductID_ProductPhotoID_RSRC'  ,
	Primary               BYTEINT  NOT NULL 
		TITLE 'Primary'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  PK_ProductProductPhoto_Product PRIMARY KEY (Lnk_ProdNum_ProdPhotoID_SQN,Sat_ProdNum_ProdPhotoID_LDTS),
	CONSTRAINT  R_107  FOREIGN KEY (Lnk_ProdNum_ProdPhotoID_SQN) REFERENCES Lnk_ProdNum_ProdPhotoID(Lnk_ProdNum_ProdPhotoID_SQN)
)
;



CREATE TABLE Sat_ProdPhoto
(
	Hub_ProdPhotoID_SQN   NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdPhotoID_SQN'  ,
	Sat_ProdPhoto_LDTS    DATE  NOT NULL 
		TITLE 'Hub_ProductPhotoID_LDTS'  ,
	Sat_ProdPhoto_LEDTS   DATE  
		TITLE 'Sat_ProductPhotoID_LEDTS'  ,
	Sat_ProdPhoto_RSRC    VARCHAR(18)  
		TITLE 'Hub_ProductPhotoID_RSRC'  ,
	ThumbNailPhoto        LONG VARGRAPHIC  
		TITLE 'ThumbNailPhoto'  ,
	ThumbnailPhotoFileName  VARCHAR(50)  
		TITLE 'ThumbnailPhotoFileName'  ,
	LargePhoto            LONG VARGRAPHIC  
		TITLE 'LargePhoto'  ,
	LargePhotoFileName    VARCHAR(50)  
		TITLE 'LargePhotoFileName'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_110  FOREIGN KEY (Hub_ProdPhotoID_SQN) REFERENCES Hub_ProdPhotoID(Hub_ProdPhotoID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductPhoto_ProductPhotoID
	 (
			Hub_ProdPhotoID_SQN,
			Sat_ProdPhoto_LDTS
	 )
;



CREATE TABLE Hub_SOfrID
(
	Hub_SOfrID_SQN        NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SOfrID_SQN'  ,
	Hub_SOfrID_LDTS       DATE  NOT NULL 
		TITLE 'Hub_SOfrID_LDTS'  ,
	Hub_SOfrID_RSRC       VARCHAR(18)  
		TITLE 'Hub_SOfrID_RSRC'  ,
	SpecialOfferID        INTEGER  NOT NULL 
		TITLE 'SpecialOfferID'  
)
	 UNIQUE PRIMARY INDEX PK_SpecialOffer_SpecialOfferID
	 (
			Hub_SOfrID_SQN
	 )
;



CREATE UNIQUE INDEX BK_SpecialOfferID
 (
		SpecialOfferID
 ) ON Hub_SOfrID
;



CREATE TABLE Sat_SOfr
(
	Hub_SOfrID_SQN        NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SOfrID_SQN'  ,
	Sat_SOfr_LDTS         DATE  NOT NULL 
		TITLE 'Sat_SOfr_LDTS'  ,
	Sat_SOfr_LEDTS        DATE  
		TITLE 'Sat_SOfr_LEDTS'  ,
	Sat_SOfr_RSRC         VARCHAR(18)  
		TITLE 'Sat_SOfr_RSRC'  ,
	Description           VARCHAR(255)  NOT NULL 
		TITLE 'Description'  ,
	DiscountPct           DECIMAL(10,4)  NOT NULL 
		TITLE 'DiscountPct'  ,
	Type                  VARCHAR(50)  NOT NULL 
		TITLE 'Type'  ,
	Category              VARCHAR(50)  NOT NULL 
		TITLE 'Category'  ,
	StartDate             TIMESTAMP  NOT NULL 
		TITLE 'StartDate'  ,
	EndDate               TIMESTAMP  NOT NULL 
		TITLE 'EndDate'  ,
	MinQty                INTEGER  NOT NULL 
		TITLE 'MinQty'  ,
	MaxQty                INTEGER  
		TITLE 'MaxQty'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_182  FOREIGN KEY (Hub_SOfrID_SQN) REFERENCES Hub_SOfrID(Hub_SOfrID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SpecialOffer_SpecialOfferID
	 (
			Hub_SOfrID_SQN,
			Sat_SOfr_LDTS
	 )
;



CREATE TABLE Lnk_ProdNum_SOrdNum_SOfrID
(
	Lnk_ProdNum_SOrdNum_SOfrID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_SOrdDetID_SOfrID_SQN'  ,
	Lnk_ProdNum_SOrdNum_SOfrID_LDT  DATE  NOT NULL 
		TITLE 'Lnk_ProdID_SOrdDetID_SOfrID_LDTS'  ,
	Lnk_ProdNum_SOrdNum_SOfrID_RSR  VARCHAR(18)  
		TITLE 'Lnk_ProdID_SOrdDetID_SOfrID_RSRC'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_SOrdID_SQN'  ,
	Hub_SOfrID_SQN        NUMERIC(12)  
		TITLE 'Hub_SOfrID_SQN'  ,
	SalesOrderDetailID    INTEGER  NOT NULL 
		TITLE 'SalesOrderDetailID'  ,
	CONSTRAINT  R_174  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT  R_176  FOREIGN KEY (Hub_SOfrID_SQN) REFERENCES Hub_SOfrID(Hub_SOfrID_SQN),
	CONSTRAINT  R_186  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SpecialOfferProduct_Special
	 (
			Lnk_ProdNum_SOrdNum_SOfrID_SQN
	 )
;



CREATE UNIQUE INDEX AK_SpecialOfferProduct
 (
		Hub_ProdNum_SQN,
		Hub_SOfrID_SQN,
		SalesOrderDetailID,
		Hub_SOrdNum_SQN
 ) ON Lnk_ProdNum_SOrdNum_SOfrID
;



CREATE TABLE Sat_SOrdDet
(
	Lnk_ProdNum_SOrdID_SOfrID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_SOrdDetID_SOfrID_SQN'  ,
	Sat_SOrdDet_LDTS      DATE  NOT NULL 
		TITLE 'Sat_SOrdDet_LDTS'  ,
	Sat_SOrdDet_LEDTS     DATE  
		TITLE 'Sat_SOrdDet_LEDTS'  ,
	Sat_SOrdDet_RSRC      VARCHAR(18)  
		TITLE 'Sat_SOrdDet_RSRC'  ,
	CarrierTrackingNumber  VARCHAR(25)  
		TITLE 'CarrierTrackingNumber'  ,
	OrderQty              smallint  NOT NULL 
		TITLE 'OrderQty'  ,
	UnitPrice             DECIMAL(19,4)  NOT NULL 
		TITLE 'UnitPrice'  ,
	UnitPriceDiscount     DECIMAL(19,4)  NOT NULL 
		TITLE 'UnitPriceDiscount'  ,
	LineTotal             numeric(38,6)  NOT NULL 
		TITLE 'LineTotal'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_181  FOREIGN KEY (Lnk_ProdNum_SOrdID_SOfrID_SQN) REFERENCES Lnk_ProdNum_SOrdNum_SOfrID(Lnk_ProdNum_SOrdNum_SOfrID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SalesOrderDetail_SalesOrder
	 (
			Lnk_ProdNum_SOrdID_SOfrID_SQN,
			Sat_SOrdDet_LDTS
	 )
;



CREATE TABLE Hub_LocID
(
	Hub_LocID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_LocID_SQN'  ,
	Hub_LocID_LDTS        DATE  NOT NULL 
		TITLE 'Hub_LocID_LDTS'  ,
	Hub_LocID_RSRC        VARCHAR(18)  
		TITLE 'Hub_LocID_RSRC'  ,
	LocationID            smallint  NOT NULL 
		TITLE 'LocationID'  
)
	 UNIQUE PRIMARY INDEX PK_Location_LocationID
	 (
			Hub_LocID_SQN
	 )
;



CREATE UNIQUE INDEX BK_LocationID
 (
		LocationID
 ) ON Hub_LocID
;



CREATE TABLE Sat_Loc
(
	Hub_LocID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_LocID_SQN'  ,
	Sat_Loc_LDTS          DATE  NOT NULL 
		TITLE 'Sat_Loc_LDTS'  ,
	Sat_Loc_LEDTS         DATE  
		TITLE 'Sat_Loc_LEDTS'  ,
	Sat_Loc_RSRC          VARCHAR(18)  
		TITLE 'Sat_Loc_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	CostRate              DECIMAL(10,4)  NOT NULL 
		TITLE 'CostRate'  ,
	Availability          decimal(8,2)  NOT NULL 
		TITLE 'Availability'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_161  FOREIGN KEY (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Location_LocationID
	 (
			Hub_LocID_SQN,
			Sat_Loc_LDTS
	 )
;



CREATE UNIQUE INDEX AK_Location_Name
 (
		Name
 ) ON Sat_Loc
;



CREATE TABLE Sat_ProdNum_SOrdNum_SOfrID
(
	Lnk_ProdNum_SOrdNum_SOfrID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_SOrdDetID_SOfrID_SQN'  ,
	Sat_ProdNum_SOrdNum_SOfrID_LDT  DATE  NOT NULL 
		TITLE 'Sat_ProdID_SOrdDetID_SOfrID_LDTS'  ,
	Sat_ProdNum_SOrdNum_SOfrID_LED  DATE  
		TITLE 'Sat_ProdID_SOrdDetID_SOfrID_LEDTS'  ,
	Sat_ProdNum_SOrdNum_SOfrID_RSR  VARCHAR(18)  
		TITLE 'Sat_ProdID_SOrdDetID_SOfrID_RSRC'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_175  FOREIGN KEY (Lnk_ProdNum_SOrdNum_SOfrID_SQN) REFERENCES Lnk_ProdNum_SOrdNum_SOfrID(Lnk_ProdNum_SOrdNum_SOfrID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SpecialOfferProduct_Special
	 (
			Lnk_ProdNum_SOrdNum_SOfrID_SQN,
			Sat_ProdNum_SOrdNum_SOfrID_LDT
	 )
;



CREATE TABLE Hub_TransID
(
	Hub_TransID_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_TransactionID_SQN'  ,
	Hub_TransID_LDTS      DATE  NOT NULL 
		TITLE 'Hub_TransactionID_LDTS'  ,
	Hub_TransID_RSRC      VARCHAR(18)  
		TITLE 'Hub_TransactionID_RSRC'  ,
	TransactionID         INTEGER  NOT NULL 
		TITLE 'TransactionID'  
)
	 UNIQUE PRIMARY INDEX PK_TransactionHistory_Transact
	 (
			Hub_TransID_SQN
	 )
;



CREATE UNIQUE INDEX BK_TransID
 (
		TransactionID
 ) ON Hub_TransID
;



CREATE TABLE Sat_TransHist
(
	Hub_TransID_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_TransactionID_SQN'  ,
	Sat_TransHist_LDTS    DATE  NOT NULL 
		TITLE 'Hub_TransactionID_LDTS'  ,
	Sat_TransHist_LEDTS   DATE  
		TITLE 'Sat_TransctionHistory_LEDTS'  ,
	Sat_TransHist_RSRC    VARCHAR(18)  
		TITLE 'Hub_TransactionID_RSRC'  ,
	TransactionID         INTEGER  NOT NULL 
		TITLE 'TransactionID'  ,
	ReferenceOrderID      INTEGER  NOT NULL 
		TITLE 'ReferenceOrderID'  ,
	ReferenceOrderLineID  INTEGER  NOT NULL 
		TITLE 'ReferenceOrderLineID'  ,
	TransactionDate       TIMESTAMP  NOT NULL 
		TITLE 'TransactionDate'  ,
	TransactionType       CHAR(1)  NOT NULL 
		TITLE 'TransactionType'  ,
	Quantity              INTEGER  NOT NULL 
		TITLE 'Quantity'  ,
	ActualCost            DECIMAL(19,4)  NOT NULL 
		TITLE 'ActualCost'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_97  FOREIGN KEY (Hub_TransID_SQN) REFERENCES Hub_TransID(Hub_TransID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_TransactionHistory_Transact
	 (
			Hub_TransID_SQN,
			Sat_TransHist_LDTS
	 )
;



CREATE INDEX IX_TransactionHistory_Referenc
 (
		ReferenceOrderID,
		ReferenceOrderLineID
 ) ON Sat_TransHist
;



CREATE TABLE Sat_ProdListPriceHist
(
	Hub_ProdNum_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdNum_SQN'  ,
	Sat_ProdListPriceHist_LDTS  DATE  NOT NULL 
		TITLE 'Sat_ProdListPriceHist_LDTS'  ,
	Sat_ProdListPriceHist_LEDTS  DATE  
		TITLE 'Sat_ProdListPriceHist_LEDTS'  ,
	Sat_ProdListPriceHist_RSRC  VARCHAR(18)  
		TITLE 'Sat_ProdListPriceHist_RSRC'  ,
	StartDate             TIMESTAMP  NOT NULL 
		TITLE 'StartDate'  ,
	EndDate               TIMESTAMP  
		TITLE 'EndDate'  ,
	ListPrice             DECIMAL(19,4)  NOT NULL 
		TITLE 'ListPrice'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_95  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductListPriceHistory_Pro
	 (
			Hub_ProdNum_SQN,
			Sat_ProdListPriceHist_LDTS
	 )
;



CREATE TABLE Sat_ProdCostHist
(
	Hub_ProdNum_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdNum_SQN'  ,
	Sat_ProdCostHist_LDTS  DATE  NOT NULL 
		TITLE 'Sat_ProdCostHist_LDTS'  ,
	Sat_ProdCostHist_LEDTS  DATE  
		TITLE 'Sat_ProdCostHist_LEDTS'  ,
	Sat_ProdCostHist_RSRC  VARCHAR(18)  
		TITLE 'Sat_ProdCostHist_RSRC'  ,
	StartDate             TIMESTAMP  NOT NULL 
		TITLE 'StartDate'  ,
	EndDate               TIMESTAMP  
		TITLE 'EndDate'  ,
	StandardCost          DECIMAL(19,4)  NOT NULL 
		TITLE 'StandardCost'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_94  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductCostHistory_ProductI
	 (
			Hub_ProdNum_SQN,
			Sat_ProdCostHist_LDTS
	 )
;



CREATE TABLE Sat_ProdRev
(
	Hub_ProdNum_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdNum_SQN'  ,
	Sat_ProdRev_LDTS      DATE  NOT NULL 
		TITLE 'Sat_ProdRev_LDTS'  ,
	Sat_ProdRev_LEDTS     DATE  
		TITLE 'Sat_ProdRev_LEDTS'  ,
	Sat_ProdRev_RSRC      VARCHAR(18)  
		TITLE 'Sat_ProdRev_RSRC'  ,
	ProductReviewID       INTEGER  NOT NULL 
		TITLE 'ProductReviewID'  ,
	ReviewerName          VARCHAR(50)  NOT NULL 
		TITLE 'ReviewerName'  ,
	ReviewDate            TIMESTAMP  NOT NULL 
		TITLE 'ReviewDate'  ,
	EmailAddress          VARCHAR(50)  NOT NULL 
		TITLE 'EmailAddress'  ,
	Rating                INTEGER  NOT NULL 
		TITLE 'Rating'  ,
	Comments              VARCHAR(3850)  
		TITLE 'Comments'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_93  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductReview_ProductReview
	 (
			Hub_ProdNum_SQN,
			Sat_ProdRev_LDTS
	 )
;



CREATE INDEX IX_ProductReview_ProductID_Nam
 (
		ReviewerName
 ) ON Sat_ProdRev
;



CREATE TABLE Hub_Wrk_Ord
(
	Hub_WOID_SQN          NUMERIC(12)  NOT NULL 
		TITLE 'Hub_WOID_SQN'  ,
	Hub_WOID_LDTS         DATE  NOT NULL 
		TITLE 'Hub_WOID_LDTS'  ,
	Hub_WOID_RSRC         VARCHAR(18)  
		TITLE 'Hub_WOID_RSRC'  ,
	WorkOrderID           INTEGER  NOT NULL 
		TITLE 'WorkOrderID'  
)
	 UNIQUE PRIMARY INDEX PK_WorkOrder_WorkOrderID
	 (
			Hub_WOID_SQN
	 )
;



CREATE UNIQUE INDEX BK_WorkOrderID
 (
		WorkOrderID
 ) ON Hub_Wrk_Ord
;



CREATE TABLE Sat_Wrk_Ord
(
	Hub_WOID_SQN          NUMERIC(12)  NOT NULL 
		TITLE 'Hub_WOID_SQN'  ,
	Sat_WOID_LDTS         DATE  NOT NULL 
		TITLE 'Sat_WOID_LDTS'  ,
	Sat_WOID_LEDTS        DATE  
		TITLE 'Sat_WOID_LEDTS'  ,
	Sat_WOID_RSRC         VARCHAR(18)  
		TITLE 'Sat_WOID_RSRC'  ,
	OrderQty              INTEGER  NOT NULL 
		TITLE 'OrderQty'  ,
	StockedQty            INTEGER  NOT NULL 
		TITLE 'StockedQty'  ,
	ScrappedQty           smallint  NOT NULL 
		TITLE 'ScrappedQty'  ,
	StartDate             TIMESTAMP  NOT NULL 
		TITLE 'StartDate'  ,
	EndDate               TIMESTAMP  
		TITLE 'EndDate'  ,
	DueDate               TIMESTAMP  NOT NULL 
		TITLE 'DueDate'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_164  FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_WorkOrder_WorkOrderID
	 (
			Hub_WOID_SQN,
			Sat_WOID_LDTS
	 )
;



CREATE TABLE Hub_EmpID
(
	Hub_EmpID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_EmpID_SQN'  ,
	Hub_EmpID_LDTS        DATE  NOT NULL 
		TITLE 'Hub_EmpID_LDTS'  ,
	Hub_EmpID_RSRC        VARCHAR(18)  
		TITLE 'Hub_EmpID_RSRC'  ,
	EmployeeID            INTEGER  NOT NULL 
		TITLE 'EmployeeID'  
)
	 UNIQUE PRIMARY INDEX PK_Employee_BusinessEntityID
	 (
			Hub_EmpID_SQN
	 )
;



CREATE UNIQUE INDEX BK_EmployeeID
 (
		EmployeeID
 ) ON Hub_EmpID
;



CREATE TABLE Sat_EmpPayHist
(
	Hub_EmpID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_EmpID_SQN'  ,
	Sat_EmpPayHist_LDTS   DATE  NOT NULL 
		TITLE 'Sat_EmpPayHist_LDTS'  ,
	Sat_EmpPayHist_LEDTS  DATE  
		TITLE 'Sat_EmpPayHist_LEDTS'  ,
	Sat_EmpPayHist_RSRC   VARCHAR(18)  
		TITLE 'Sat_EmpPayHist_RSRC'  ,
	RateChangeDate        TIMESTAMP  NOT NULL 
		TITLE 'RateChangeDate'  ,
	Rate                  DECIMAL(19,4)  NOT NULL 
		TITLE 'Rate'  ,
	PayFrequency          BYTEINT  NOT NULL 
		TITLE 'PayFrequency'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_206  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_EmployeePayHistory_Business
	 (
			Hub_EmpID_SQN,
			Sat_EmpPayHist_LDTS
	 )
;



CREATE TABLE ErrorLog
(
	ErrorLogID            INTEGER  NOT NULL 
		TITLE 'ErrorLogID'  ,
	ErrorTime             TIMESTAMP  NOT NULL 
		TITLE 'ErrorTime'  ,
	UserName              VARCHAR(20)  NOT NULL 
		TITLE 'UserName'  ,
	ErrorNumber           INTEGER  NOT NULL 
		TITLE 'ErrorNumber'  ,
	ErrorSeverity         INTEGER  
		TITLE 'ErrorSeverity'  ,
	ErrorState            INTEGER  
		TITLE 'ErrorState'  ,
	ErrorProcedure        VARCHAR(126)  
		TITLE 'ErrorProcedure'  ,
	ErrorLine             INTEGER  
		TITLE 'ErrorLine'  ,
	ErrorMessage          VARCHAR(4000)  NOT NULL 
		TITLE 'ErrorMessage'  
)
	 UNIQUE PRIMARY INDEX PK_ErrorLog_ErrorLogID
	 (
			ErrorLogID
	 )
;



CREATE TABLE DatabaseLog
(
	DatabaseLogID         INTEGER  NOT NULL 
		TITLE 'DatabaseLogID'  ,
	PostTime              TIMESTAMP  NOT NULL 
		TITLE 'PostTime'  ,
	DatabaseUser          VARCHAR(20)  NOT NULL 
		TITLE 'DatabaseUser'  ,
	Event                 VARCHAR(20)  NOT NULL 
		TITLE 'Event'  ,
	Schema                VARCHAR(20)  
		TITLE 'Schema'  ,
	Object                VARCHAR(20)  
		TITLE 'Object'  ,
	TSQL                  VARCHAR(4000)  NOT NULL 
		TITLE 'TSQL'  ,
	XmlEvent              LONG VARCHAR  NOT NULL 
		TITLE 'XmlEvent'  ,
	CONSTRAINT  PK_DatabaseLog_DatabaseLogID PRIMARY KEY (DatabaseLogID)
)
;



CREATE TABLE TransactionHistoryArchive
(
	TransactionID         INTEGER  NOT NULL 
		TITLE 'TransactionID'  ,
	ProductID             INTEGER  NOT NULL 
		TITLE 'ProductID'  ,
	ReferenceOrderID      INTEGER  NOT NULL 
		TITLE 'ReferenceOrderID'  ,
	ReferenceOrderLineID  INTEGER  NOT NULL 
		TITLE 'ReferenceOrderLineID'  ,
	TransactionDate       TIMESTAMP  NOT NULL 
		TITLE 'TransactionDate'  ,
	TransactionType       CHAR(1)  NOT NULL 
		TITLE 'TransactionType'  ,
	Quantity              INTEGER  NOT NULL 
		TITLE 'Quantity'  ,
	ActualCost            DECIMAL(19,4)  NOT NULL 
		TITLE 'ActualCost'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  
)
	 UNIQUE PRIMARY INDEX PK_TransactionHistoryArchive_T
	 (
			TransactionID
	 )
;



CREATE INDEX IX_TransactionHistoryArchive_P
 (
		ProductID
 ), INDEX IX_TransactionHistoryArchive_R
 (
		ReferenceOrderID,
		ReferenceOrderLineID
 ) ON TransactionHistoryArchive
;



CREATE TABLE AWBuildVersion
(
	SystemInformationID   BYTEINT  NOT NULL 
		TITLE 'SystemInformationID'  ,
	Database_Version      VARCHAR(25)  NOT NULL 
		TITLE 'Database Version'  ,
	VersionDate           TIMESTAMP  NOT NULL 
		TITLE 'VersionDate'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  
)
	 UNIQUE PRIMARY INDEX PK_AWBuildVersion_SystemInform
	 (
			SystemInformationID
	 )
;



CREATE TABLE Lnk_ProdNum_TransID
(
	Lnk_ProdNum_TransID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProductID_TransactionID_SQN'  ,
	Lnk_ProdNum_TransID_LDTS  DATE  NOT NULL 
		TITLE 'Hub_TransactionID_LDTS'  ,
	Lnk_ProdNum_TransID_RSRC  VARCHAR(18)  
		TITLE 'Hub_TransactionID_RSRC'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_TransID_SQN       NUMERIC(12)  
		TITLE 'Hub_TransactionID_SQN'  ,
	CONSTRAINT  R_104  FOREIGN KEY (Hub_TransID_SQN) REFERENCES Hub_TransID(Hub_TransID_SQN),
	CONSTRAINT  R_105  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
	 UNIQUE PRIMARY INDEX PK_TransactionHistory_Transact
	 (
			Lnk_ProdNum_TransID_SQN
	 )
;



CREATE UNIQUE INDEX AK_TransactionHistory
 (
		Hub_TransID_SQN,
		Hub_ProdNum_SQN
 ) ON Lnk_ProdNum_TransID
;



CREATE TABLE Hub_CCID
(
	Hub_CCID_SQN          NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CCID_SQN'  ,
	Hub_CCID_LDTS         DATE  NOT NULL 
		TITLE 'Hub_CCID_LDTS'  ,
	Hub_CCID_RSRC         VARCHAR(18)  
		TITLE 'Hub_CCID_RSRC'  ,
	CreditCardID          INTEGER  NOT NULL 
		TITLE 'CreditCardID'  
)
	 UNIQUE PRIMARY INDEX PK_CreditCard_CreditCardID
	 (
			Hub_CCID_SQN
	 )
;



CREATE UNIQUE INDEX BK_CreditCardID
 (
		CreditCardID
 ) ON Hub_CCID
;



CREATE TABLE Sat_CC
(
	Hub_CCID_SQN          NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CCID_SQN'  ,
	Sat_CC_LDTS           DATE  NOT NULL 
		TITLE 'Sat_CC_LDTS'  ,
	Sat_CC_LEDTS          DATE  
		TITLE 'Sat_CC_LEDTS'  ,
	Sat_CC_RSRC           VARCHAR(18)  
		TITLE 'Sat_CC_RSRC'  ,
	CardType              VARCHAR(50)  NOT NULL 
		TITLE 'CardType'  ,
	CardNumber            VARCHAR(25)  NOT NULL 
		TITLE 'CardNumber'  ,
	ExpMonth              BYTEINT  NOT NULL 
		TITLE 'ExpMonth'  ,
	ExpYear               smallint  NOT NULL 
		TITLE 'ExpYear'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_198  FOREIGN KEY (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_CreditCard_CreditCardID
	 (
			Hub_CCID_SQN,
			Sat_CC_LDTS
	 )
;



CREATE UNIQUE INDEX AK_CreditCard_CardNumber
 (
		CardNumber
 ) ON Sat_CC
;



CREATE TABLE Hub_JobCandID
(
	Hub_JobCandID_SQN     NUMERIC(12)  NOT NULL 
		TITLE 'Hub_JobCandID_SQN'  ,
	Hub_JobCandID_LDTS    DATE  NOT NULL 
		TITLE 'Hub_JobCandID_LDTS'  ,
	Hub_JobCandID_RSRC    VARCHAR(18)  
		TITLE 'Hub_JobCandID_RSRC'  ,
	JobCandidateID        INTEGER  NOT NULL 
		TITLE 'JobCandidateID'  
)
	 UNIQUE PRIMARY INDEX PK_JobCandidate_JobCandidateID
	 (
			Hub_JobCandID_SQN
	 )
;



CREATE UNIQUE INDEX BK_JobCandidateID
 (
		JobCandidateID
 ) ON Hub_JobCandID
;



CREATE TABLE Sat_JobCand
(
	Hub_JobCandID_SQN     NUMERIC(12)  NOT NULL 
		TITLE 'Hub_JobCandID_SQN'  ,
	Sat_JobCand_LDTS      DATE  NOT NULL 
		TITLE 'Sat_JobCand_LDTS'  ,
	Sat_JobCand_LEDTS     DATE  
		TITLE 'Sat_JobCand_LEDTS'  ,
	Sat_JobCand_RSRC      VARCHAR(18)  
		TITLE 'Sat_JobCand_RSRC'  ,
	Resume                LONG VARCHAR  
		TITLE 'Resume'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_209  FOREIGN KEY (Hub_JobCandID_SQN) REFERENCES Hub_JobCandID(Hub_JobCandID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_JobCandidate_JobCandidateID
	 (
			Hub_JobCandID_SQN,
			Sat_JobCand_LDTS
	 )
;



CREATE TABLE Lnk_WOID_LocID
(
	Lnk_WOID_LocID_WOOpSeqID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_WOID_LocID_WOOpSeqID_SQN'  ,
	Lnk_WOID_LocID_WOOpSeqID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_WOID_LocID_WOOpSeqID_LDTS'  ,
	Lnk_WOID_LocID_WOOpSeqID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_WOID_LocID_WOOpSeqID_RSRC'  ,
	Hub_WOID_SQN          NUMERIC(12)  
		TITLE 'Hub_WOID_SQN'  ,
	Hub_LocID_SQN         NUMERIC(12)  
		TITLE 'Hub_LocID_SQN'  ,
	Oper_Seq              smallint  NOT NULL 
		TITLE 'OperationSequence'  ,
	CONSTRAINT  R_168  FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN),
	CONSTRAINT  R_169  FOREIGN KEY (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_WorkOrderRouting
	 (
			Lnk_WOID_LocID_WOOpSeqID_SQN
	 )
;



CREATE UNIQUE INDEX AK_WorkOrderRouting
 (
		Hub_WOID_SQN,
		Hub_LocID_SQN,
		Oper_Seq
 ) ON Lnk_WOID_LocID
;



CREATE TABLE Sat_WOID_LocID
(
	Lnk_WOID_LocID_SQN    NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_WOID_LocID_WOOpSeqID_SQN'  ,
	Sat_WOID_LocID_LDTS   DATE  NOT NULL 
		TITLE 'Sat_WOOpSeq_LDTS'  ,
	Sat_WOID_LocID_LEDTS  DATE  
		TITLE 'Sat_WOOpSeq_LEDTS'  ,
	Sat_WOID_LocID_RSRC   VARCHAR(18)  
		TITLE 'Sat_WOOpSeq_RSRC'  ,
	ScheduledStartDate    TIMESTAMP  NOT NULL 
		TITLE 'ScheduledStartDate'  ,
	ScheduledEndDate      TIMESTAMP  NOT NULL 
		TITLE 'ScheduledEndDate'  ,
	ActualStartDate       TIMESTAMP  
		TITLE 'ActualStartDate'  ,
	ActualEndDate         TIMESTAMP  
		TITLE 'ActualEndDate'  ,
	ActualResourceHrs     decimal(9,4)  
		TITLE 'ActualResourceHrs'  ,
	PlannedCost           DECIMAL(19,4)  NOT NULL 
		TITLE 'PlannedCost'  ,
	ActualCost            DECIMAL(19,4)  
		TITLE 'ActualCost'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_180  FOREIGN KEY (Lnk_WOID_LocID_SQN) REFERENCES Lnk_WOID_LocID(Lnk_WOID_LocID_WOOpSeqID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_WorkOrderRouting_WorkOrderI
	 (
			Lnk_WOID_LocID_SQN,
			Sat_WOID_LocID_LDTS
	 )
;



CREATE TABLE Hub_PersID
(
	Hub_PersID_SQN        NUMERIC(12)  NOT NULL 
		TITLE 'Hub_PersID_SQN'  ,
	Hub_PersID_LDTS       DATE  NOT NULL 
		TITLE 'Hub_PersID_LDTS'  ,
	Hub_PersID_RSRC       VARCHAR(18)  
		TITLE 'Hub_PersID_RSRC'  ,
	PersonID              INTEGER  NOT NULL 
		TITLE 'PersonID'  
)
	 UNIQUE PRIMARY INDEX PK_Person_BusinessEntityID
	 (
			Hub_PersID_SQN
	 )
;



CREATE UNIQUE INDEX BK_PersonID
 (
		PersonID
 ) ON Hub_PersID
;



CREATE TABLE Hub_BusEntID
(
	Hub_BusEntID_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_BusEntID_SQN'  ,
	Hub_BusEntID_LDTS     DATE  NOT NULL 
		TITLE 'Hub_BusEntID_LDTS'  ,
	Hub_BusEntID_RSRC     VARCHAR(18)  
		TITLE 'Hub_BusEntID_RSRC'  ,
	BusinessEntityID      INTEGER  NOT NULL 
		TITLE 'BusinessEntityID'  
)
	 UNIQUE PRIMARY INDEX PK_BusinessEntity_BusinessEnti
	 (
			Hub_BusEntID_SQN
	 )
;



CREATE UNIQUE INDEX BK_BusinessEntityID
 (
		BusinessEntityID
 ) ON Hub_BusEntID
;



CREATE TABLE Lnk_PersID_BusEntID
(
	Lnk_PersID_BusEntID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_PersID_BusEntID_SQN'  ,
	Lnk_PersID_BusEntID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_PersID_BusEntID_LDTS'  ,
	Lnk_PersID_BusEntID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_PersID_BusEntID_RSRC'  ,
	Hub_BusEntID_SQN      NUMERIC(12)  
		TITLE 'Hub_BusEntID_SQN'  ,
	Hub_PersID_SQN        NUMERIC(12)  
		TITLE 'Hub_PersID_SQN'  ,
	CONSTRAINT  R_269  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	CONSTRAINT  R_270  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_PersID_BEID
	 (
			Lnk_PersID_BusEntID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_PersID_BEID
 (
		Hub_PersID_SQN,
		Hub_BusEntID_SQN
 ) ON Lnk_PersID_BusEntID
;



CREATE TABLE Hub_ScrapID
(
	Hub_ScrapID_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ScrapID_SQN'  ,
	Hub_ScrapID_LDTS      DATE  NOT NULL 
		TITLE 'Hub_ScrapID_LDTS'  ,
	Hub_ScrapID_RSRC      VARCHAR(18)  
		TITLE 'Hub_ScrapID_RSRC'  ,
	ScrapReasonID         smallint  NOT NULL 
		TITLE 'ScrapReasonID'  
)
	 UNIQUE PRIMARY INDEX PK_ScrapReason_ScrapReasonID
	 (
			Hub_ScrapID_SQN
	 )
;



CREATE UNIQUE INDEX BK_ScrapReasonID
 (
		ScrapReasonID
 ) ON Hub_ScrapID
;



CREATE TABLE Lnk_Wrk_Ord_ScrapID
(
	Lnk_WOID_ScrapID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_WOID_ScrapID_SQN'  ,
	Lnk_WOID_ScrapID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_WOID_ScrapID_LDTS'  ,
	Lnk_WOID_ScrapID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_WOID_ScrapID_RSRC'  ,
	Hub_WOID_SQN          NUMERIC(12)  NOT NULL 
		TITLE 'Hub_WOID_SQN'  ,
	Hub_ScrapID_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ScrapID_SQN'  ,
	CONSTRAINT  R_165  FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN),
	CONSTRAINT  R_166  FOREIGN KEY (Hub_ScrapID_SQN) REFERENCES Hub_ScrapID(Hub_ScrapID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ScrapReason_ScrapReasonID
	 (
			Lnk_WOID_ScrapID_SQN
	 )
;



CREATE UNIQUE INDEX AK_ScrapReason
 (
		Hub_WOID_SQN,
		Hub_ScrapID_SQN
 ) ON Lnk_Wrk_Ord_ScrapID
;



CREATE TABLE Lnk_SOrdNum_CCID
(
	Lnk_SOrdNum_CCID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SOrdNum_CCID_SQN'  ,
	Lnk_SOrdNum_CCID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_SOrdNum_CCID_LDTS'  ,
	Lnk_SOrdNum_CCID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_SOrdNum_CCID_RSRC'  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_SOrdID_SQN'  ,
	Hub_CCID_SQN          NUMERIC(12)  
		TITLE 'Hub_CCID_SQN'  ,
	CONSTRAINT  R_196  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	CONSTRAINT  R_197  FOREIGN KEY (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_SOrdNum_Add
	 (
			Lnk_SOrdNum_CCID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_Add
 (
		Hub_SOrdNum_SQN,
		Hub_CCID_SQN
 ) ON Lnk_SOrdNum_CCID
;



CREATE TABLE Sat_Scrap
(
	Hub_ScrapID_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ScrapID_SQN'  ,
	Sat_Scrap_LDTS        DATE  NOT NULL 
		TITLE 'Sat_Scrap_LDTS'  ,
	Sat_Scrap_LEDTS       DATE  
		TITLE 'Sat_Scrap_LEDTS'  ,
	Sat_Scrap_RSRC        VARCHAR(18)  
		TITLE 'Sat_Scrap_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_167  FOREIGN KEY (Hub_ScrapID_SQN) REFERENCES Hub_ScrapID(Hub_ScrapID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ScrapReason_ScrapReasonID
	 (
			Hub_ScrapID_SQN,
			Sat_Scrap_LDTS
	 )
;



CREATE UNIQUE INDEX AK_ScrapReason_Name
 (
		Name
 ) ON Sat_Scrap
;



CREATE TABLE Sat_Prod
(
	Hub_ProdNum_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdNum_SQN'  ,
	Sat_Prod_LDTS         DATE  NOT NULL 
		TITLE 'Sat_Prod_LDTS'  ,
	Sat_Prod_LEDTS        DATE  
		TITLE 'Sat_Prod_LEDTS'  ,
	Sat_Prod_RSRC         VARCHAR(18)  
		TITLE 'Sat_Prod_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	MakeFlag              BYTEINT  NOT NULL 
		TITLE 'MakeFlag'  ,
	FinishedGoodsFlag     BYTEINT  NOT NULL 
		TITLE 'FinishedGoodsFlag'  ,
	Color                 VARCHAR(15)  
		TITLE 'Color'  ,
	SafetyStockLevel      smallint  NOT NULL 
		TITLE 'SafetyStockLevel'  ,
	ReorderPoint          smallint  NOT NULL 
		TITLE 'ReorderPoint'  ,
	StandardCost          DECIMAL(19,4)  NOT NULL 
		TITLE 'StandardCost'  ,
	ListPrice             DECIMAL(19,4)  NOT NULL 
		TITLE 'ListPrice'  ,
	Size                  VARCHAR(5)  
		TITLE 'Size'  ,
	Weight                decimal(8,2)  
		TITLE 'Weight'  ,
	DaysToManufacture     INTEGER  NOT NULL 
		TITLE 'DaysToManufacture'  ,
	ProductLine           CHAR(2)  
		TITLE 'ProductLine'  ,
	Class                 CHAR(2)  
		TITLE 'Class'  ,
	Style                 CHAR(2)  
		TITLE 'Style'  ,
	SellStartDate         TIMESTAMP  NOT NULL 
		TITLE 'SellStartDate'  ,
	SellEndDate           TIMESTAMP  
		TITLE 'SellEndDate'  ,
	DiscontinuedDate      TIMESTAMP  
		TITLE 'DiscontinuedDate'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_92  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Product_ProductID
	 (
			Hub_ProdNum_SQN,
			Sat_Prod_LDTS
	 )
;



CREATE UNIQUE INDEX AK_Product_Name
 (
		Name
 ) ON Sat_Prod
;



CREATE TABLE Lnk_SOrdNum_AddID
(
	Lnk_SOrdNum_AddID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SOrdNum_AddID_SQN'  ,
	Lnk_SOrdNum_AddID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_SOrdNum_AddID_LDTS'  ,
	Lnk_SOrdNum_AddID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_SOrdNum_AddID_RSRC'  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_SOrdID_SQN'  ,
	Hub_AddID_BillTo_SQN  NUMERIC(12)  
		TITLE 'Hub_AddID_SQN'  ,
	Hub_AddID_ShipTo_SQN  NUMERIC(12)  
		TITLE 'Hub_AddID_SQN'  ,
	CONSTRAINT  R_287  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	CONSTRAINT  R_288  FOREIGN KEY (Hub_AddID_BillTo_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN),
	CONSTRAINT  R_290  FOREIGN KEY (Hub_AddID_ShipTo_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_SOrdNum_Add
	 (
			Lnk_SOrdNum_AddID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_Add
 (
		Hub_SOrdNum_SQN,
		Hub_AddID_BillTo_SQN,
		Hub_AddID_ShipTo_SQN
 ) ON Lnk_SOrdNum_AddID
;



CREATE TABLE Lnk_ProdNum_WOID
(
	Lnk_ProdNum_WOID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_WOID_SQN'  ,
	Lnk_ProdNum_WOID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_ProdID_WOID_LDTS'  ,
	Lnk_ProdNum_WOID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_ProdID_WOID_RSRC'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_WOID_SQN          NUMERIC(12)  
		TITLE 'Hub_WOID_SQN'  ,
	CONSTRAINT  R_162  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT  R_163  FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_WorkOrder_WorkOrderID
	 (
			Lnk_ProdNum_WOID_SQN
	 )
;



CREATE UNIQUE INDEX AK_WorkOrder
 (
		Hub_ProdNum_SQN,
		Hub_WOID_SQN
 ) ON Lnk_ProdNum_WOID
;



CREATE TABLE Lnk_DocNode_EmpID
(
	Lnk_DocNode_EmpID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_DocNode_PersID_SQN'  ,
	Lnk_DocNode_EmpID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_DocNode_PersID_LDTS'  ,
	Lnk_DocNode_EmpID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_DocNode_PersID_RSRC'  ,
	Hub_EmpID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_EmpID_SQN'  ,
	Hub_DocNode_SQN       NUMERIC(12)  
		TITLE 'Hub_DocNode_SQN'  ,
	CONSTRAINT  R_203  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT  R_204  FOREIGN KEY (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_DocNode_Emp
	 (
			Lnk_DocNode_EmpID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_DocNode_Emp
 (
		Hub_EmpID_SQN,
		Hub_DocNode_SQN
 ) ON Lnk_DocNode_EmpID
;



CREATE TABLE Lnk_ProdNum_LocID
(
	Lnk_ProdNum_LocID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_LocID_SQN'  ,
	Lnk_ProdNum_LocID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_ProdID_LocID_LDTS'  ,
	Lnk_ProdINum_LocID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_ProdID_LocID_RSRC'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_LocID_SQN         NUMERIC(12)  
		TITLE 'Hub_LocID_SQN'  ,
	CONSTRAINT  R_159  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT  R_160  FOREIGN KEY (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductInventory_ProductID_
	 (
			Lnk_ProdNum_LocID_SQN
	 )
;



CREATE UNIQUE INDEX AK_ProductInventory
 (
		Hub_ProdNum_SQN,
		Hub_LocID_SQN
 ) ON Lnk_ProdNum_LocID
;



CREATE TABLE Sat_Prod_Loc
(
	Lnk_ProdNum_LocID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_LocID_SQN'  ,
	Sat_Prod_Loc_LDTS     DATE  NOT NULL 
		TITLE 'Sat_Prod_Inv_LDTS'  ,
	Sat_Prod_Loc_LEDTS    DATE  
		TITLE 'Sat_Prod_Inv_LEDTS'  ,
	Sat_Prod_Loc_RSRC     VARCHAR(18)  
		TITLE 'Sat_Prod_Inv_RSRC'  ,
	Shelf                 VARCHAR(10)  NOT NULL 
		TITLE 'Shelf'  ,
	Bin                   BYTEINT  NOT NULL 
		TITLE 'Bin'  ,
	Quantity              smallint  NOT NULL 
		TITLE 'Quantity'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_158  FOREIGN KEY (Lnk_ProdNum_LocID_SQN) REFERENCES Lnk_ProdNum_LocID(Lnk_ProdNum_LocID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductInventory_ProductID_
	 (
			Lnk_ProdNum_LocID_SQN,
			Sat_Prod_Loc_LDTS
	 )
;



CREATE TABLE Sat_Pers
(
	Hub_PersID_SQN        NUMERIC(12)  NOT NULL 
		TITLE 'Hub_PersID_SQN'  ,
	Sat_Pers_LDTS         DATE  NOT NULL 
		TITLE 'Sat_Pers_LDTS'  ,
	Sat_Pers_LEDTS        DATE  
		TITLE 'Sat_Pers_LEDTS'  ,
	Sat_Pers_RSRC         VARCHAR(18)  
		TITLE 'Sat_Pers_RSRC'  ,
	PersonType            CHAR(2)  NOT NULL 
		TITLE 'PersonType'  ,
	NameStyle             BYTEINT  NOT NULL 
		TITLE 'NameStyle'  ,
	Title                 VARCHAR(8)  
		TITLE 'Title'  ,
	FirstName             VARCHAR(50)  NOT NULL 
		TITLE 'FirstName'  ,
	MiddleName            VARCHAR(50)  
		TITLE 'MiddleName'  ,
	LastName              VARCHAR(50)  NOT NULL 
		TITLE 'LastName'  ,
	Suffix                VARCHAR(10)  
		TITLE 'Suffix'  ,
	EmailPromotion        INTEGER  NOT NULL 
		TITLE 'EmailPromotion'  ,
	AdditionalContactInfo  LONG VARCHAR  
		TITLE 'AdditionalContactInfo'  ,
	Demographics          LONG VARCHAR  
		TITLE 'Demographics'  ,
	rowguid               INTEGER  NOT NULL 
		TITLE 'rowguid'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_202  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Person_BusinessEntityID
	 (
			Hub_PersID_SQN,
			Sat_Pers_LDTS
	 )
;



CREATE UNIQUE INDEX AK_Person_rowguid
 (
		rowguid
 ), INDEX IX_Person_LastName_FirstName_M
 (
		LastName,
		FirstName,
		MiddleName
 ) ON Sat_Pers
;



CREATE TABLE Sat_Emp
(
	Hub_EmpID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_EmpID_SQN'  ,
	Sat_Emp_LDTS          DATE  NOT NULL 
		TITLE 'Sat_Emp_LDTS'  ,
	Sat_Emp_LEDTS         DATE  
		TITLE 'Sat_Emp_LEDTS'  ,
	Sat_Emp_RSRC          VARCHAR(18)  
		TITLE 'Sat_Emp_RSRC'  ,
	NationalIDNumber      VARCHAR(15)  NOT NULL 
		TITLE 'NationalIDNumber'  ,
	LoginID               VARCHAR(256)  NOT NULL 
		TITLE 'LoginID'  ,
	OrganizationNode      CHAR(18)  NOT NULL 
		TITLE 'OrganizationNode'  ,
	OrganizationLevel     smallint  
		TITLE 'OrganizationLevel'  ,
	JobTitle              VARCHAR(50)  NOT NULL 
		TITLE 'JobTitle'  ,
	BirthDate             date  NOT NULL 
		TITLE 'BirthDate'  ,
	MaritalStatus         CHAR(1)  NOT NULL 
		TITLE 'MaritalStatus'  ,
	Gender                CHAR(1)  NOT NULL 
		TITLE 'Gender'  ,
	HireDate              date  NOT NULL 
		TITLE 'HireDate'  ,
	SalariedFlag          BYTEINT  NOT NULL 
		TITLE 'SalariedFlag'  ,
	VacationHours         smallint  NOT NULL 
		TITLE 'VacationHours'  ,
	SickLeaveHours        smallint  NOT NULL 
		TITLE 'SickLeaveHours'  ,
	CurrentFlag           BYTEINT  NOT NULL 
		TITLE 'CurrentFlag'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_205  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Employee_BusinessEntityID
	 (
			Hub_EmpID_SQN,
			Sat_Emp_LDTS
	 )
;



CREATE UNIQUE INDEX AK_Employee_LoginID
 (
		LoginID
 ), UNIQUE INDEX AK_Employee_NationalIDNumber
 (
		NationalIDNumber
 ), UNIQUE INDEX AK_Employee_OrganizationLevel_
 (
		OrganizationLevel,
		OrganizationNode
 ), UNIQUE INDEX AK_Employee_OrganizationNode
 (
		OrganizationNode
 ) ON Sat_Emp
;



CREATE TABLE Hub_ProdDescID
(
	Hub_ProdDescID_SQN    NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdDescID_SQN'  ,
	Hub_ProdDescID_LDTS   DATE  NOT NULL 
		TITLE 'Hub_ProdDescID_LDTS'  ,
	Hub_ProdDescID_RSRC   VARCHAR(18)  
		TITLE 'Hub_ProdDescID_RSRC'  ,
	ProductDescriptionID  INTEGER  NOT NULL 
		TITLE 'ProductDescriptionID'  
)
	 UNIQUE PRIMARY INDEX PK_ProductDescription_ProductD
	 (
			Hub_ProdDescID_SQN
	 )
;



CREATE UNIQUE INDEX BK_ProductDescriptionID
 (
		ProductDescriptionID
 ) ON Hub_ProdDescID
;



CREATE TABLE Sat_ProdDesc
(
	Hub_ProdDescID_SQN    NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ProdDescID_SQN'  ,
	Sat_ProdDesc_LDTS     DATE  NOT NULL 
		TITLE 'Sat_ProdDesc_LDTS'  ,
	Sat_ProdDesc_LEDTS    DATE  
		TITLE 'Sat_ProdDesc_LEDTS'  ,
	Sat_ProdDesc_RSRC     VARCHAR(18)  
		TITLE 'Sat_ProdDesc_RSRC'  ,
	Description           VARCHAR(400)  NOT NULL 
		TITLE 'Description'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_149  FOREIGN KEY (Hub_ProdDescID_SQN) REFERENCES Hub_ProdDescID(Hub_ProdDescID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductDescription_ProductD
	 (
			Hub_ProdDescID_SQN,
			Sat_ProdDesc_LDTS
	 )
;



CREATE TABLE Hub_CultID
(
	Hub_CultID_SQN        NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CultID_SQN'  ,
	Hub_CultID_LDTS       DATE  NOT NULL 
		TITLE 'Hub_CultID_LDTS'  ,
	Hub_CultID_RSRC       VARCHAR(18)  
		TITLE 'Hub_CultID_RSRC'  ,
	CultureID             CHAR(6)  NOT NULL 
		TITLE 'CultureID'  
)
	 UNIQUE PRIMARY INDEX PK_Culture_CultureID
	 (
			Hub_CultID_SQN
	 )
;



CREATE UNIQUE INDEX BK_CultureID
 (
		CultureID
 ) ON Hub_CultID
;



CREATE TABLE Sat_Cult
(
	Hub_CultID_SQN        NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CultID_SQN'  ,
	Sat_Cult_LDTS         DATE  NOT NULL 
		TITLE 'Sat_Cult_LDTS'  ,
	Sat_Cult_LEDTS        DATE  
		TITLE 'Sat_Cult_LEDTS'  ,
	Sat_Cult_RSRC         VARCHAR(18)  
		TITLE 'Sat_Cult_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_148  FOREIGN KEY (Hub_CultID_SQN) REFERENCES Hub_CultID(Hub_CultID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Culture_CultureID
	 (
			Hub_CultID_SQN,
			Sat_Cult_LDTS
	 )
;



CREATE UNIQUE INDEX AK_Culture_Name
 (
		Name
 ) ON Sat_Cult
;



CREATE TABLE Hub_ModID
(
	Hub_ModID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_PodMod_SQN'  ,
	Hub_ModID_LDTS        DATE  NOT NULL 
		TITLE 'Hub_ProdModID_LDTS'  ,
	Hub_ModID_RSRC        VARCHAR(18)  
		TITLE 'Hub_ProdModID_RSRC'  ,
	ProductModelID        INTEGER  NOT NULL 
		TITLE 'ProductModelID'  
)
	 UNIQUE PRIMARY INDEX PK_ProductModel_ProductModelID
	 (
			Hub_ModID_SQN
	 )
;



CREATE UNIQUE INDEX BK_ProductModelID
 (
		ProductModelID
 ) ON Hub_ModID
;



CREATE TABLE Lnk_ModID_ProdDescID_CultID
(
	Lnk_ModID_ProdDescID_CultID_SQ  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdModID_ProdDescID_CultID_SQN'  ,
	Lnk_ModID_ProdDescID_CultID_LD  DATE  NOT NULL 
		TITLE 'Lnk_ProdModID_ProdDescID_CultID_LDTS'  ,
	Lnk_ModID_ProdDescID_CultID_RS  VARCHAR(18)  
		TITLE 'Lnk_ProdModID_ProdDescID_CultID_RSRC'  ,
	Hub_ModID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_PodMod_SQN'  ,
	Hub_CultID_SQN        NUMERIC(12)  
		TITLE 'Hub_CultID_SQN'  ,
	Hub_ProdDescID_SQN    NUMERIC(12)  
		TITLE 'Hub_ProdDescID_SQN'  ,
	CONSTRAINT  R_151  FOREIGN KEY (Hub_CultID_SQN) REFERENCES Hub_CultID(Hub_CultID_SQN),
	CONSTRAINT  R_152  FOREIGN KEY (Hub_ProdDescID_SQN) REFERENCES Hub_ProdDescID(Hub_ProdDescID_SQN),
	CONSTRAINT  R_153  FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductModelProductDescript
	 (
			Lnk_ModID_ProdDescID_CultID_SQ
	 )
;



CREATE UNIQUE INDEX AK_ProductModelProductDescript
 (
		Hub_CultID_SQN,
		Hub_ProdDescID_SQN,
		Hub_ModID_SQN
 ) ON Lnk_ModID_ProdDescID_CultID
;



CREATE TABLE Sat_ProdMod_ProdDesc_Cult
(
	Lnk_ModID_ProdDescID_CultID_SQ  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdModID_ProdDescID_CultID_SQN'  ,
	Sat_Mod_ProdDesc_Cult_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_ProdModID_ProdDescID_CultID_LDTS'  ,
	Sat_Mod_ProdDesc_Cult__LEDTS  DATE  
		TITLE 'Lnk_ProdModID_ProdDescID_CultID_LEDTS'  ,
	Sat_Mod_ProdDesc_Cult__RSRC  VARCHAR(18)  
		TITLE 'Lnk_ProdModID_ProdDescID_CultID_RSRC'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_150  FOREIGN KEY (Lnk_ModID_ProdDescID_CultID_SQ) REFERENCES Lnk_ModID_ProdDescID_CultID(Lnk_ModID_ProdDescID_CultID_SQ)
)
	 UNIQUE PRIMARY INDEX PK_ProductModelProductDescript
	 (
			Lnk_ModID_ProdDescID_CultID_SQ,
			Sat_Mod_ProdDesc_Cult_LDTS
	 )
;



CREATE TABLE Hub_IllID
(
	Hub_IllID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_IllID_SQN'  ,
	Hub_IllID_LDTS        DATE  NOT NULL 
		TITLE 'Hub_IllID_LDTS'  ,
	Hub_IllID_RSRC        VARCHAR(18)  
		TITLE 'Hub_IllID_RSRC'  ,
	IllustrationID        INTEGER  NOT NULL 
		TITLE 'IllustrationID'  
)
	 UNIQUE PRIMARY INDEX PK_Illustration_IllustrationID
	 (
			Hub_IllID_SQN
	 )
;



CREATE UNIQUE INDEX BK_IllustrationID
 (
		IllustrationID
 ) ON Hub_IllID
;



CREATE TABLE Lnk_ModID_IllID
(
	Lnk_ModID_IllID_SQN   NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdModID_IllID_SQN'  ,
	Lnk_ModID_IllID_LDTS  DATE  NOT NULL 
		TITLE 'LNK_ProdModID_IllID_LDTS'  ,
	Lnk_ModID_IllID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_ProdModID_IllID_RSRC'  ,
	Hub_ModID_SQN         NUMERIC(12)  
		TITLE 'Hub_PodMod_SQN'  ,
	Hub_IllID_SQN         NUMERIC(12)  
		TITLE 'Hub_IllID_SQN'  ,
	CONSTRAINT  R_145  FOREIGN KEY (Hub_IllID_SQN) REFERENCES Hub_IllID(Hub_IllID_SQN),
	CONSTRAINT  R_146  FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductModelIllustration_Pr
	 (
			Lnk_ModID_IllID_SQN
	 )
;



CREATE UNIQUE INDEX AK_ProductModelIllustration
 (
		Hub_IllID_SQN,
		Hub_ModID_SQN
 ) ON Lnk_ModID_IllID
;



CREATE TABLE Sat_ProdMod_Ill
(
	Lnk_ModID_IllID_SQN   NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdModID_IllID_SQN'  ,
	Sat_ProdMod_Ill_LDTS  DATE  NOT NULL 
		TITLE 'LNK_ProdModID_IllID_LDTS'  ,
	Sat_ProdMod_Ill_LEDTS  DATE  
		TITLE 'Sat_ProdModID_IllID_LEDTS'  ,
	Sat_ProdMod_Ill_RSRC  VARCHAR(18)  
		TITLE 'Lnk_ProdModID_IllID_RSRC'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_147  FOREIGN KEY (Lnk_ModID_IllID_SQN) REFERENCES Lnk_ModID_IllID(Lnk_ModID_IllID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductModelIllustration_Pr
	 (
			Lnk_ModID_IllID_SQN,
			Sat_ProdMod_Ill_LDTS
	 )
;



CREATE TABLE Sat_Illustraion
(
	Hub_IllID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_IllID_SQN'  ,
	Sat_Ill_LDTS          DATE  NOT NULL 
		TITLE 'Hub_IllID_LDTS'  ,
	Sat_Ill_LEDTS         DATE  
		TITLE 'Sat_Ill_LEDTS'  ,
	Sat_Ill_RSRC          VARCHAR(18)  
		TITLE 'Hub_IllID_RSRC'  ,
	Diagram               LONG VARCHAR  
		TITLE 'Diagram'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_144  FOREIGN KEY (Hub_IllID_SQN) REFERENCES Hub_IllID(Hub_IllID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Illustration_IllustrationID
	 (
			Hub_IllID_SQN,
			Sat_Ill_LDTS
	 )
;



CREATE TABLE Hub_POID
(
	Hub_POID_SQN          NUMERIC(12)  NOT NULL 
		TITLE 'Hub_POID_SQN'  ,
	Hub_POID_LDTS         DATE  NOT NULL 
		TITLE 'Hub_POID_LDTS'  ,
	Hub_POID_RSRC         VARCHAR(18)  
		TITLE 'Hub_POID_RSRC'  ,
	PurchaseOrderID       INTEGER  NOT NULL 
		TITLE 'PurchaseOrderID'  
)
	 UNIQUE PRIMARY INDEX PK_PurchaseOrderHeader_Purchas
	 (
			Hub_POID_SQN
	 )
;



CREATE UNIQUE INDEX BK_PurchaseOrderHeaderID
 (
		PurchaseOrderID
 ) ON Hub_POID
;



CREATE TABLE Sat_POHead
(
	Hub_POID_SQN          NUMERIC(12)  NOT NULL 
		TITLE 'Hub_POID_SQN'  ,
	Sat_POHead_LDTS       DATE  NOT NULL 
		TITLE 'Sat_POHead_LDTS'  ,
	Sat_POHead_LEDTS      DATE  
		TITLE 'Sat_POHead_LEDTS'  ,
	Sat_POHead_RSRC       VARCHAR(18)  
		TITLE 'Sat_POHead_RSRC'  ,
	RevisionNumber        BYTEINT  NOT NULL 
		TITLE 'RevisionNumber'  ,
	Status                BYTEINT  NOT NULL 
		TITLE 'Status'  ,
	OrderDate             TIMESTAMP  NOT NULL 
		TITLE 'OrderDate'  ,
	ShipDate              TIMESTAMP  
		TITLE 'ShipDate'  ,
	SubTotal              DECIMAL(19,4)  NOT NULL 
		TITLE 'SubTotal'  ,
	TaxAmt                DECIMAL(19,4)  NOT NULL 
		TITLE 'TaxAmt'  ,
	Freight               DECIMAL(19,4)  NOT NULL 
		TITLE 'Freight'  ,
	TotalDue              DECIMAL(19,4)  NOT NULL 
		TITLE 'TotalDue'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_232  FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_PurchaseOrderHeader_Purchas
	 (
			Hub_POID_SQN,
			Sat_POHead_LDTS
	 )
;



CREATE TABLE Lnk_EmpID_JobCandID
(
	Lnk_EmpID_JobCandID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_EmpID_JobCandID_SQN'  ,
	Lnk_EmpID_JobCandID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_EmpID_JobCandID_LDTS'  ,
	Lnk_EmpID_JobCandID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_EmpID_JobCandID_RSRC'  ,
	Hub_EmpID_SQN         NUMERIC(12)  
		TITLE 'Hub_EmpID_SQN'  ,
	Hub_JobCandID_SQN     NUMERIC(12)  
		TITLE 'Hub_JobCandID_SQN'  ,
	CONSTRAINT  R_207  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT  R_208  FOREIGN KEY (Hub_JobCandID_SQN) REFERENCES Hub_JobCandID(Hub_JobCandID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_JobCandidate_JobCandidateID
	 (
			Lnk_EmpID_JobCandID_SQN
	 )
;



CREATE UNIQUE INDEX AK_JobCandidate
 (
		Hub_EmpID_SQN,
		Hub_JobCandID_SQN
 ) ON Lnk_EmpID_JobCandID
;



CREATE TABLE Lnk_ProdNum_ModID
(
	Lnk_ProdNum_ModID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdMod_SQN'  ,
	Lnk_ProdNum_ModID_LDTS  DATE  NOT NULL 
		TITLE 'Hub_ProdModID_LDTS'  ,
	Lnk_ProdNum_ModID_RSRC  VARCHAR(18)  
		TITLE 'Hub_ProdModID_RSRC'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_ModID_SQN         NUMERIC(12)  
		TITLE 'Hub_PodMod_SQN'  ,
	CONSTRAINT  R_139  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT  R_142  FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductModel_ProductModelID
	 (
			Lnk_ProdNum_ModID_SQN
	 )
;



CREATE UNIQUE INDEX AK_ProductModel
 (
		Hub_ProdNum_SQN,
		Hub_ModID_SQN
 ) ON Lnk_ProdNum_ModID
;



CREATE TABLE Sat_Mod
(
	Hub_ModID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_PodMod_SQN'  ,
	Sat_Mod_LDTS          DATE  NOT NULL 
		TITLE 'Hub_ProdModID_LDTS'  ,
	Sat_Mod_LEDTS         DATE  
		TITLE 'Sat_ProdMod_LEDTS'  ,
	Sat_Mod_RSRC          VARCHAR(18)  
		TITLE 'Hub_ProdModID_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	CatalogDescription    LONG VARCHAR  
		TITLE 'CatalogDescription'  ,
	Instructions          LONG VARCHAR  
		TITLE 'Instructions'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_143  FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductModel_ProductModelID
	 (
			Hub_ModID_SQN,
			Sat_Mod_LDTS
	 )
;



CREATE UNIQUE INDEX AK_ProductModel_Name
 (
		Name
 ) ON Sat_Mod
;



CREATE TABLE Sat_SRsn
(
	Hub_SRsnID_SQN        NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SRsnID_SQN'  ,
	Sat_SRsn_LDTS         DATE  NOT NULL 
		TITLE 'Sat_SRsn_LDTS'  ,
	Sat_SRsn_LEDTS        DATE  
		TITLE 'Sat_SRsn_LEDTS'  ,
	Sat_SRsn_RSRC         VARCHAR(18)  
		TITLE 'Sat_SRsn_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ReasonType            VARCHAR(50)  NOT NULL 
		TITLE 'ReasonType'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_190  FOREIGN KEY (Hub_SRsnID_SQN) REFERENCES Hub_SRsnID(Hub_SRsnID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SalesReason_SalesReasonID
	 (
			Hub_SRsnID_SQN,
			Sat_SRsn_LDTS
	 )
;



CREATE TABLE Lnk_PersID_CCID
(
	Lnk_PersID_CCID_SQN   NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_PersID_CCID_SQN'  ,
	Lnk_PersID_CCID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_PersID_CCID_LDTS'  ,
	Lnk_PersID_CCID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_PersID_CCID_RSRC'  ,
	Hub_PersID_SQN        NUMERIC(12)  
		TITLE 'Hub_PersID_SQN'  ,
	Hub_CCID_SQN          NUMERIC(12)  
		TITLE 'Hub_CCID_SQN'  ,
	CONSTRAINT  R_199  FOREIGN KEY (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN),
	CONSTRAINT  R_201  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_PersonCreditCard_BusinessEn
	 (
			Lnk_PersID_CCID_SQN
	 )
;



CREATE UNIQUE INDEX AK_PersonCreditCard
 (
		Hub_PersID_SQN,
		Hub_CCID_SQN
 ) ON Lnk_PersID_CCID
;



CREATE TABLE Sat_PersID_CCID
(
	Lnk_PersID_CCID_SQN   NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_PersID_CCID_SQN'  ,
	Sat_PersID_CCID_LDTS  DATE  NOT NULL 
		TITLE 'Sat_PersID_CCID_LDTS'  ,
	Sat_PersID_CCID_LEDTS  DATE  
		TITLE 'Sat_PersID_CCID_LEDTS'  ,
	Sat_PersID_CCID_RSRC  VARCHAR(18)  
		TITLE 'Sat_PersID_CCID_RSRC'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_200  FOREIGN KEY (Lnk_PersID_CCID_SQN) REFERENCES Lnk_PersID_CCID(Lnk_PersID_CCID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_PersonCreditCard_BusinessEn
	 (
			Lnk_PersID_CCID_SQN,
			Sat_PersID_CCID_LDTS
	 )
;



CREATE TABLE Sat_SOrd
(
	Hub_SOrdNum_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SOrdID_SQN'  ,
	Sat_SOrd_LDTS         DATE  NOT NULL 
		TITLE 'Sat_SOrd_LDTS'  ,
	Sat_SOrd_LEDTS        DATE  
		TITLE 'Sat_SOrd_LEDTS'  ,
	Sat_SOrd_RSRC         VARCHAR(18)  
		TITLE 'Sat_SOrd_RSRC'  ,
	RevisionNumber        BYTEINT  NOT NULL 
		TITLE 'RevisionNumber'  ,
	OrderDate             TIMESTAMP  NOT NULL 
		TITLE 'OrderDate'  ,
	DueDate               TIMESTAMP  NOT NULL 
		TITLE 'DueDate'  ,
	ShipDate              TIMESTAMP  
		TITLE 'ShipDate'  ,
	Status                BYTEINT  NOT NULL 
		TITLE 'Status'  ,
	OnlineOrderFlag       BYTEINT  NOT NULL 
		TITLE 'OnlineOrderFlag'  ,
	PurchaseOrderNumber   VARCHAR(25)  
		TITLE 'PurchaseOrderNumber'  ,
	AccountNumber         VARCHAR(15)  
		TITLE 'AccountNumber'  ,
	CreditCardApprovalCode  varchar(15)  
		TITLE 'CreditCardApprovalCode'  ,
	SubTotal              DECIMAL(19,4)  NOT NULL 
		TITLE 'SubTotal'  ,
	TaxAmt                DECIMAL(19,4)  NOT NULL 
		TITLE 'TaxAmt'  ,
	Freight               DECIMAL(19,4)  NOT NULL 
		TITLE 'Freight'  ,
	TotalDue              DECIMAL(19,4)  NOT NULL 
		TITLE 'TotalDue'  ,
	Comment               VARCHAR(128)  
		TITLE 'Comment'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_187  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SalesOrderHeader_SalesOrder
	 (
			Hub_SOrdNum_SQN,
			Sat_SOrd_LDTS
	 )
;



CREATE TABLE Sat_Doc
(
	Hub_DocNode_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_DocNode_SQN'  ,
	Sat_Doc_LDTS          DATE  NOT NULL 
		TITLE 'Sat_Doc_LDTS'  ,
	Sat_Doc_LEDTS         DATE  
		TITLE 'Sat_Doc_LEDTS'  ,
	Sat_Doc_RSRC          VARCHAR(18)  
		TITLE 'Sat_Doc_RSRC'  ,
	DocumentLevel         smallint  
		TITLE 'DocumentLevel'  ,
	Title                 VARCHAR(50)  NOT NULL 
		TITLE 'Title'  ,
	FolderFlag            BYTEINT  NOT NULL 
		TITLE 'FolderFlag'  ,
	FileName              VARCHAR(400)  NOT NULL 
		TITLE 'FileName'  ,
	FileExtension         VARCHAR(8)  NOT NULL 
		TITLE 'FileExtension'  ,
	Revision              CHAR(5)  NOT NULL 
		TITLE 'Revision'  ,
	ChangeNumber          INTEGER  NOT NULL 
		TITLE 'ChangeNumber'  ,
	Status                BYTEINT  NOT NULL 
		TITLE 'Status'  ,
	DocumentSummary       VARCHAR(4000)  
		TITLE 'DocumentSummary'  ,
	Document              LONG VARGRAPHIC  
		TITLE 'Document'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	PersonID              CHAR(18)  
		TITLE 'PersonID'  ,
	CONSTRAINT  R_193  FOREIGN KEY (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Document_DocumentNode
	 (
			Hub_DocNode_SQN,
			Sat_Doc_LDTS
	 )
;



CREATE UNIQUE INDEX AK_Document_DocumentLevel_Docu
 (
		DocumentLevel
 ), INDEX IX_Document_FileName_Revision
 (
		FileName,
		Revision
 ) ON Sat_Doc
;



CREATE TABLE Hub_VendNum
(
	Hub_VendNum_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_AcctNum_SQN'  ,
	Hub_VendNum_LDTS      DATE  NOT NULL 
		TITLE 'Hub_AcctNum_LDTS'  ,
	Hub_VendNum_RSRC      VARCHAR(18)  
		TITLE 'Hub_AcctNum_RSRC'  ,
	AccountNumber         VARCHAR(15)  NOT NULL 
		TITLE 'AccountNumber'  
)
	 UNIQUE PRIMARY INDEX PK_Vendor_BusinessEntityID
	 (
			Hub_VendNum_SQN
	 )
;



CREATE UNIQUE INDEX BK_AccountNumber
 (
		AccountNumber
 ) ON Hub_VendNum
;



CREATE TABLE Lnk_BusEntID_VendNum
(
	Lnk_BusEntID_VendNum_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_BustEntID_VendNum_SQN'  ,
	Lnk_BusEntID_VendNum_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_BustEntID_VendNum_LDTS'  ,
	Lnk_BusEntID_VendNum_RSRC  VARCHAR(18)  
		TITLE 'Lnk_BustEntID_VendNum_RSRC'  ,
	Hub_BusEntID_SQN      NUMERIC(12)  
		TITLE 'Hub_BusEntID_SQN'  ,
	Hub_VendNum_SQN       NUMERIC(12)  
		TITLE 'Hub_AcctNum_SQN'  ,
	CONSTRAINT  R_272  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT  R_275  FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_BusEntID_AcctNum
	 (
			Lnk_BusEntID_VendNum_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_BusEntID_AcctNum
 (
		Hub_BusEntID_SQN,
		Hub_VendNum_SQN
 ) ON Lnk_BusEntID_VendNum
;



CREATE TABLE Hub_EmailAddID
(
	Hub_EmailAddID_SQN    NUMERIC(12)  NOT NULL 
		TITLE 'Hub_EmailAddID_SQN'  ,
	Hub_EmailAddID_LDTS   DATE  NOT NULL 
		TITLE 'Hub_EmailAddID_LDTS'  ,
	Hub_EmailAddID_RSRC   VARCHAR(18)  
		TITLE 'Hub_EmailAddID_RSRC'  ,
	EmailAddressID        INTEGER  NOT NULL 
		TITLE 'EmailAddressID'  
)
	 UNIQUE PRIMARY INDEX PK_EmailAddress_BusinessEntity
	 (
			Hub_EmailAddID_SQN
	 )
;



CREATE UNIQUE INDEX BK_EmailAddressID
 (
		EmailAddressID
 ) ON Hub_EmailAddID
;



CREATE TABLE Lnk_PersID_EmailAddID
(
	Lnk_PersID_EmailAddID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_PersID_EmailAddID_SQN'  ,
	Lnk_PersID_EmailAddID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_PersID_EmailAddID_LDTS'  ,
	Lnk_PersID_EmailAddID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_PersID_EmailAddID_RSRC'  ,
	Hub_PersID_SQN        NUMERIC(12)  
		TITLE 'Hub_PersID_SQN'  ,
	Hub_EmailAddID_SQN    NUMERIC(12)  
		TITLE 'Hub_EmailAddID_SQN'  ,
	CONSTRAINT  R_217  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	CONSTRAINT  R_218  FOREIGN KEY (Hub_EmailAddID_SQN) REFERENCES Hub_EmailAddID(Hub_EmailAddID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_EmailAddress_BusinessEntity
	 (
			Lnk_PersID_EmailAddID_SQN
	 )
;



CREATE UNIQUE INDEX AK_EmailAddress
 (
		Hub_PersID_SQN,
		Hub_EmailAddID_SQN
 ) ON Lnk_PersID_EmailAddID
;



CREATE TABLE Hub_ShiftID
(
	Hub_ShiftID_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ShiftID_SQN'  ,
	Hub_ShiftID_LDTS      DATE  NOT NULL 
		TITLE 'Hub_ShiftID_LDTS'  ,
	Hub_ShiftID_RSRC      VARCHAR(18)  
		TITLE 'Hub_ShiftID_RSRC'  ,
	ShiftID               BYTEINT  NOT NULL 
		TITLE 'ShiftID'  
)
	 UNIQUE PRIMARY INDEX PK_Shift_ShiftID
	 (
			Hub_ShiftID_SQN
	 )
;



CREATE UNIQUE INDEX BK_ShiftID
 (
		ShiftID
 ) ON Hub_ShiftID
;



CREATE TABLE Hub_DepID
(
	Hub_DepID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_DepID_SQN'  ,
	Hub_DepID_LDTS        DATE  NOT NULL 
		TITLE 'Hub_DepID_LDTS'  ,
	Hub_DepID_RSRC        VARCHAR(18)  
		TITLE 'Hub_DepID_RSRC'  ,
	DepartmentID          smallint  NOT NULL 
		TITLE 'DepartmentID'  
)
	 UNIQUE PRIMARY INDEX PK_Department_DepartmentID
	 (
			Hub_DepID_SQN
	 )
;



CREATE UNIQUE INDEX BK_DepartmentID
 (
		DepartmentID
 ) ON Hub_DepID
;



CREATE TABLE Lnk_EmpID_DepID_ShiftID
(
	Lnk_EmpID_DepID_ShiftID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_EmpID_DepID_ShiftID_SQN'  ,
	Lnk_EmpID_DepID_ShiftID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_EmpID_DepID_ShiftID_LDTS'  ,
	Lnk_EmpID_DepID_ShiftID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_EmpID_DepID_ShiftID_RSRC'  ,
	Hub_EmpID_SQN         NUMERIC(12)  
		TITLE 'Hub_EmpID_SQN'  ,
	Hub_DepID_SQN         NUMERIC(12)  
		TITLE 'Hub_DepID_SQN'  ,
	Hub_ShiftID_SQN       NUMERIC(12)  
		TITLE 'Hub_ShiftID_SQN'  ,
	CONSTRAINT  R_210  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT  R_212  FOREIGN KEY (Hub_ShiftID_SQN) REFERENCES Hub_ShiftID(Hub_ShiftID_SQN),
	CONSTRAINT  R_214  FOREIGN KEY (Hub_DepID_SQN) REFERENCES Hub_DepID(Hub_DepID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_EmployeeDepartmentHistory
	 (
			Lnk_EmpID_DepID_ShiftID_SQN
	 )
;



CREATE UNIQUE INDEX AK_EmployeeDepartmentHistory
 (
		Hub_EmpID_SQN,
		Hub_ShiftID_SQN,
		Hub_DepID_SQN
 ) ON Lnk_EmpID_DepID_ShiftID
;



CREATE TABLE Sat_EmpID_DepID_ShiftID
(
	Lnk_EmpID_DepID_ShiftID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_EmpID_DepID_ShiftID_SQN'  ,
	Sat_EmpID_DepID_ShiftID_LDTS  DATE  NOT NULL 
		TITLE 'Sat_EmpID_DepID_ShiftID_LDTS'  ,
	Sat_EmpID_DepID_ShiftID_LEDTS  DATE  
		TITLE 'Sat_EmpID_DepID_ShiftID_LEDTS'  ,
	Sat_EmpID_DepID_ShiftID_RSRC  VARCHAR(18)  
		TITLE 'Sat_EmpID_DepID_ShiftID_RSRC'  ,
	StartDate             date  NOT NULL 
		TITLE 'StartDate'  ,
	EndDate               date  
		TITLE 'EndDate'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_211  FOREIGN KEY (Lnk_EmpID_DepID_ShiftID_SQN) REFERENCES Lnk_EmpID_DepID_ShiftID(Lnk_EmpID_DepID_ShiftID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_EmployeeDepartmentHistory_B
	 (
			Lnk_EmpID_DepID_ShiftID_SQN,
			Sat_EmpID_DepID_ShiftID_LDTS
	 )
;



CREATE TABLE Sat_Dep
(
	Hub_DepID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_DepID_SQN'  ,
	Sat_Dep_LDTS          DATE  NOT NULL 
		TITLE 'Sat_Dep_LDTS'  ,
	Sat_Dep_LEDTS         DATE  
		TITLE 'Sat_Dep_LEDTS'  ,
	Sat_Dep_RSRC          VARCHAR(18)  
		TITLE 'Sat_Dep_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	GroupName             VARCHAR(50)  NOT NULL 
		TITLE 'GroupName'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_215  FOREIGN KEY (Hub_DepID_SQN) REFERENCES Hub_DepID(Hub_DepID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Department_DepartmentID
	 (
			Hub_DepID_SQN,
			Sat_Dep_LDTS
	 )
;



CREATE UNIQUE INDEX AK_Department_Name
 (
		Name
 ) ON Sat_Dep
;



CREATE TABLE Hub_CntryRgnCd
(
	Hub_CntryRgnCd_SQN    NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CntryRgnCd_SQN'  ,
	Hub_CntryRgnCd_LDTS   DATE  NOT NULL 
		TITLE 'Hub_CntryRgnCd_LDTS'  ,
	Hub_CntryRgnCd_RSRC   VARCHAR(18)  
		TITLE 'Hub_CntryRgnCd_RSRC'  ,
	CountryRegionCode     VARCHAR(3)  NOT NULL 
		TITLE 'CountryRegionCode'  
)
	 UNIQUE PRIMARY INDEX PK_CountryRegion_CountryRegion
	 (
			Hub_CntryRgnCd_SQN
	 )
;



CREATE UNIQUE INDEX BK_CountryRegionCode
 (
		CountryRegionCode
 ) ON Hub_CntryRgnCd
;



CREATE TABLE Hub_CrncyCd
(
	Hub_CrncyCd_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CrncyCd_SQN'  ,
	Hub_CrncyCd_LDTS      DATE  NOT NULL 
		TITLE 'Hub_CrncyCd_LDTS'  ,
	Hub_CrncyCd_RSRC      VARCHAR(18)  
		TITLE 'Hub_CrncyCd_RSRC'  ,
	CurrencyCode          CHAR(3)  NOT NULL 
		TITLE 'CurrencyCode'  
)
	 UNIQUE PRIMARY INDEX PK_Currency_CurrencyCode
	 (
			Hub_CrncyCd_SQN
	 )
;



CREATE UNIQUE INDEX BK_CurrencyCode
 (
		CurrencyCode
 ) ON Hub_CrncyCd
;



CREATE TABLE Lnk_CntryRgnID_CrncyCd
(
	Lnk_CntryRgnID_CrncyCd_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_CntryRgnID_CrncyCd_SQN'  ,
	Lnk_CntryRgnID_CrncyCd_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_CntryRgnID_CrncyCd_LDTS'  ,
	Lnk_CntryRgnID_CrncyCd_RSRC  VARCHAR(18)  
		TITLE 'Lnk_CntryRgnID_CrncyCd_RSRC'  ,
	Hub_CntryRgnCd_SQN    NUMERIC(12)  
		TITLE 'Hub_CntryRgnCd_SQN'  ,
	Hub_CrncyCd_SQN       NUMERIC(12)  
		TITLE 'Hub_CrncyCd_SQN'  ,
	CONSTRAINT  R_301  FOREIGN KEY (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN),
	CONSTRAINT  R_303  FOREIGN KEY (Hub_CrncyCd_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_CntryRgnID_Crncy
	 (
			Lnk_CntryRgnID_CrncyCd_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_CntryRgnID_Crncy
 (
		Hub_CntryRgnCd_SQN,
		Hub_CrncyCd_SQN
 ) ON Lnk_CntryRgnID_CrncyCd
;



CREATE TABLE Sat_CntryRgn_Crncy
(
	Lnk_CntryRgnID_CrncyCd_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_CntryRgnID_CrncyCd_SQN'  ,
	Sat_CntryRgn_Crncy_LDTS  DATE  NOT NULL 
		TITLE 'Sat_CntryRgn_Crncy_LDTS'  ,
	Sat_CntryRgn_Crncy_LEDTS  DATE  
		TITLE 'Sat_CntryRgn_Crncy_LEDTS'  ,
	Sat_CntryRgn_Crncy_RSRC  VARCHAR(18)  
		TITLE 'Sat_CntryRgn_Crncy_RSRC'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_305  FOREIGN KEY (Lnk_CntryRgnID_CrncyCd_SQN) REFERENCES Lnk_CntryRgnID_CrncyCd(Lnk_CntryRgnID_CrncyCd_SQN)
)
	 UNIQUE PRIMARY INDEX PK_CountryRegionCurrency_Count
	 (
			Lnk_CntryRgnID_CrncyCd_SQN,
			Sat_CntryRgn_Crncy_LDTS
	 )
;



CREATE TABLE Sat_Shift
(
	Hub_ShiftID_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ShiftID_SQN'  ,
	Sat_Shift_LDTS        DATE  NOT NULL 
		TITLE 'Sat_Shift_LDTS'  ,
	Sat_Shift_LEDTS       DATE  
		TITLE 'Sat_Shift_LEDTS'  ,
	Sat_Shift_RSRC        VARCHAR(18)  
		TITLE 'Sat_Shift_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	StartTime             time  NOT NULL 
		TITLE 'StartTime'  ,
	EndTime               time  NOT NULL 
		TITLE 'EndTime'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_213  FOREIGN KEY (Hub_ShiftID_SQN) REFERENCES Hub_ShiftID(Hub_ShiftID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Shift_ShiftID
	 (
			Hub_ShiftID_SQN,
			Sat_Shift_LDTS
	 )
;



CREATE UNIQUE INDEX AK_Shift_Name
 (
		Name
 ), UNIQUE INDEX AK_Shift_StartTime_EndTime
 (
		StartTime,
		EndTime
 ) ON Sat_Shift
;



CREATE TABLE Sat_Vend
(
	Hub_VendNum_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_AcctNum_SQN'  ,
	Sat_Vend_LDTS         DATE  NOT NULL 
		TITLE 'Sat_Vend_LDTS'  ,
	Sat_Vend_LEDTS        DATE  
		TITLE 'Sat_Vend_LEDTS'  ,
	Sat_Vend_RSRC         VARCHAR(18)  
		TITLE 'Sat_Vend_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	CreditRating          BYTEINT  NOT NULL 
		TITLE 'CreditRating'  ,
	PreferredVendorStatus  BYTEINT  NOT NULL 
		TITLE 'PreferredVendorStatus'  ,
	ActiveFlag            BYTEINT  NOT NULL 
		TITLE 'ActiveFlag'  ,
	PurchasingWebServiceURL  VARCHAR(1024)  
		TITLE 'PurchasingWebServiceURL'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_228  FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Vendor_BusinessEntityID
	 (
			Hub_VendNum_SQN,
			Sat_Vend_LDTS
	 )
;



CREATE TABLE Hub_UntMsrCd
(
	Hub_UntMsrCd_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_UntMsrCd_SQN'  ,
	Hub_UntMsrCd_LDTS     DATE  NOT NULL 
		TITLE 'Hub_UntMsrCd_LDTS'  ,
	Hub_UntMsrCd_RSRC     VARCHAR(18)  
		TITLE 'Hub_UntMsrCd_RSRC'  ,
	UnitMeasureCode       CHAR(3)  NOT NULL 
		TITLE 'UnitMeasureCode'  
)
	 UNIQUE PRIMARY INDEX PK_UnitMeasure_UnitMeasureCode
	 (
			Hub_UntMsrCd_SQN
	 )
;



CREATE UNIQUE INDEX BK_UnitMeasureCode
 (
		UnitMeasureCode
 ) ON Hub_UntMsrCd
;



CREATE TABLE Lnk_ProdNum_VendNum_UntMsrCd
(
	Lnk_ProdNum_VendNum_UntMsrCd_S  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_AcctNum_SQN'  ,
	Lnk_ProdNum_VendNum_UntMsrCd_L  VARCHAR(18)  
		TITLE 'Lnk_ProdID_AcctNum_LDTS'  ,
	Lnk_ProdNum_VendNum_UntMsrCd_R  VARCHAR(18)  
		TITLE 'Lnk_ProdID_AcctNum_RSRC'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_VendNum_SQN       NUMERIC(12)  
		TITLE 'Hub_AcctNum_SQN'  ,
	Hub_UntMsrCd_SQN      NUMERIC(12)  
		TITLE 'Hub_UntMsrCd_SQN'  ,
	CONSTRAINT  R_225  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT  R_227  FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN),
	CONSTRAINT  R_314  FOREIGN KEY (Hub_UntMsrCd_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ProductVendor_ProductID_Bus
	 (
			Lnk_ProdNum_VendNum_UntMsrCd_S
	 )
;



CREATE UNIQUE INDEX AK_ProductVendor
 (
		Hub_ProdNum_SQN,
		Hub_VendNum_SQN,
		Hub_UntMsrCd_SQN
 ) ON Lnk_ProdNum_VendNum_UntMsrCd
;



CREATE TABLE Sat_ProdNum_VendNum_UntMsrCd
(
	Lnk_ProdNum_VendNum_UntMsrCd_S  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_AcctNum_SQN'  ,
	Sat_ProdNum_VendNum_UntMsrCd_L  DATE  NOT NULL 
		TITLE 'Sat_ProdID_AcctNum_LDTS'  ,
	Sat_ProdNum_VendNum_UntMsrCd_L  DATE  
		TITLE 'Sat_ProdID_AcctNum_LEDTS'  ,
	Sat_ProdNum_VendNum_UntMsrCd_R  VARCHAR(18)  
		TITLE 'Sat_ProdID_AcctNum_RSRC'  ,
	AverageLeadTime       INTEGER  NOT NULL 
		TITLE 'AverageLeadTime'  ,
	StandardPrice         DECIMAL(19,4)  NOT NULL 
		TITLE 'StandardPrice'  ,
	LastReceiptCost       DECIMAL(19,4)  
		TITLE 'LastReceiptCost'  ,
	LastReceiptDate       TIMESTAMP  
		TITLE 'LastReceiptDate'  ,
	MinOrderQty           INTEGER  NOT NULL 
		TITLE 'MinOrderQty'  ,
	MaxOrderQty           INTEGER  NOT NULL 
		TITLE 'MaxOrderQty'  ,
	OnOrderQty            INTEGER  
		TITLE 'OnOrderQty'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_226  FOREIGN KEY (Lnk_ProdNum_VendNum_UntMsrCd_S) REFERENCES Lnk_ProdNum_VendNum_UntMsrCd(Lnk_ProdNum_VendNum_UntMsrCd_S)
)
	 UNIQUE PRIMARY INDEX PK_ProductVendor_ProductID_Bus
	 (
			Lnk_ProdNum_VendNum_UntMsrCd_S,
			Sat_ProdNum_VendNum_UntMsrCd_L
	 )
;



CREATE TABLE Lnk_EmpID_POID
(
	Lnk_EmpID_POID_SQN    NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_EmpID_POID_SQN'  ,
	Lnk_EmpID_POID_LDTS   DATE  NOT NULL 
		TITLE 'Lnk_EmpID_POID_LDTS'  ,
	Lnk_EmpID_POID_RSRC   VARCHAR(18)  
		TITLE 'Lnk_EmpID_POID_RSRC'  ,
	Hub_EmpID_SQN         NUMERIC(12)  
		TITLE 'Hub_EmpID_SQN'  ,
	Hub_POID_SQN          NUMERIC(12)  
		TITLE 'Hub_POID_SQN'  ,
	CONSTRAINT  R_240  FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN),
	CONSTRAINT  R_241  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_EmpID_POID
	 (
			Lnk_EmpID_POID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_EmpID_POID
 (
		Hub_POID_SQN,
		Hub_EmpID_SQN
 ) ON Lnk_EmpID_POID
;



CREATE TABLE Hub_ShpMthdID
(
	Hub_ShpMthID_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ShpMthID_SQN'  ,
	Hub_ShpMthID_LDTS     DATE  NOT NULL 
		TITLE 'Hub_ShpMthID_LDTS'  ,
	Hub_ShpMthID_RSRC     VARCHAR(18)  
		TITLE 'Hub_ShpMthID_RSRC'  ,
	ShipMethodID          INTEGER  NOT NULL 
		TITLE 'ShipMethodID'  
)
	 UNIQUE PRIMARY INDEX PK_ShipMethod_ShipMethodID
	 (
			Hub_ShpMthID_SQN
	 )
;



CREATE UNIQUE INDEX BK_ShipMethodID
 (
		ShipMethodID
 ) ON Hub_ShpMthdID
;



CREATE TABLE Lnk_POID_ShpMthdID
(
	Lnk_POID_ShpMthdID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_POID_ShpMthdID_SQN'  ,
	Lnk_POID_ShpMthdID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_POID_ShpMthdID_LDTS'  ,
	Lnk_POID_ShpMthdID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_POID_ShpMthdID_RSRC'  ,
	Hub_POID_SQN          NUMERIC(12)  
		TITLE 'Hub_POID_SQN'  ,
	Hub_ShpMthID_SQN      NUMERIC(12)  
		TITLE 'Hub_ShpMthID_SQN'  ,
	CONSTRAINT  R_235  FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN),
	CONSTRAINT  R_236  FOREIGN KEY (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_POID_ShPMthdID
	 (
			Lnk_POID_ShpMthdID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_POID_ShPMthdID
 (
		Hub_POID_SQN,
		Hub_ShpMthID_SQN
 ) ON Lnk_POID_ShpMthdID
;



CREATE TABLE Lnk_VendNum_POID
(
	Lnk_VendNum_POID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_AcctNum_POID_SQN'  ,
	Lnk_VendNum_POID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_AcctNum_POID_LDTS'  ,
	Lnk_VendNum_POID_RSRC  VARCHAR(18)  
		TITLE 'Sat_POHead_RSRC'  ,
	Hub_VendNum_SQN       NUMERIC(12)  
		TITLE 'Hub_AcctNum_SQN'  ,
	Hub_POID_SQN          NUMERIC(12)  
		TITLE 'Hub_POID_SQN'  ,
	CONSTRAINT  R_233  FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN),
	CONSTRAINT  R_234  FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_AcctNum_POID
	 (
			Lnk_VendNum_POID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_AcctNum_POID
 (
		Hub_VendNum_SQN,
		Hub_POID_SQN
 ) ON Lnk_VendNum_POID
;



CREATE TABLE Hub_CustID
(
	Hub_CustID_SQN        NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CustID_SQN'  ,
	Hub_CustID_LDTS       DATE  NOT NULL 
		TITLE 'Hub_CustID_LDTS'  ,
	Hub_CustID_RSRC       VARCHAR(18)  
		TITLE 'Hub_CustID_RSRC'  ,
	CustomerID            INTEGER  NOT NULL 
		TITLE 'CustomerID'  
)
	 UNIQUE PRIMARY INDEX PK_Customer_CustomerID
	 (
			Hub_CustID_SQN
	 )
;



CREATE UNIQUE INDEX BK_CustomerID
 (
		CustomerID
 ) ON Hub_CustID
;



CREATE TABLE Sat_Cust
(
	Hub_CustID_SQN        NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CustID_SQN'  ,
	Sat_Cust_LDTS         DATE  NOT NULL 
		TITLE 'Sat_Cust_LDTS'  ,
	Sat_Cust_LEDTS        DATE  
		TITLE 'Sat_Cust_LEDTS'  ,
	Sat_Cust_RSRC         VARCHAR(18)  
		TITLE 'Sat_Cust_RSRC'  ,
	PersonID              CHAR(18)  
		TITLE 'PersonID'  ,
	StoreID               CHAR(18)  
		TITLE 'StoreID'  ,
	TerritoryID           CHAR(18)  
		TITLE 'TerritoryID'  ,
	AccountNumber         varchar(10)  NOT NULL 
		TITLE 'AccountNumber'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_253  FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Customer_CustomerID
	 (
			Hub_CustID_SQN,
			Sat_Cust_LDTS
	 )
;



CREATE UNIQUE INDEX AK_Customer_AccountNumber
 (
		AccountNumber
 ) ON Sat_Cust
;



CREATE TABLE Hub_PNTID
(
	Hub_PNTID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_PNTID_SQN'  ,
	Hub_PNTID_LDTS        DATE  NOT NULL 
		TITLE 'Hub_PNTID_LDTS'  ,
	Hub_PNTID_RSRC        VARCHAR(18)  
		TITLE 'Hub_PNTID_RSRC'  ,
	PhoneNumberTypeID     INTEGER  NOT NULL 
		TITLE 'PhoneNumberTypeID'  
)
	 UNIQUE PRIMARY INDEX PK_PhoneNumberType_PhoneNumber
	 (
			Hub_PNTID_SQN
	 )
;



CREATE UNIQUE INDEX BK_PhoneNumberTypeID
 (
		PhoneNumberTypeID
 ) ON Hub_PNTID
;



CREATE TABLE Sat_PNT
(
	Hub_PNTID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_PNTID_SQN'  ,
	Sat_PNT_LDTS          DATE  NOT NULL 
		TITLE 'Sat_PNT_LDTS'  ,
	Sat_PNT_LEDTS         DATE  
		TITLE 'Sat_PNT_LEDTS'  ,
	Sat_PNT_RSRC          VARCHAR(18)  
		TITLE 'Sat_PNT_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_224  FOREIGN KEY (Hub_PNTID_SQN) REFERENCES Hub_PNTID(Hub_PNTID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_PhoneNumberType_PhoneNumber
	 (
			Hub_PNTID_SQN,
			Sat_PNT_LDTS
	 )
;



CREATE TABLE Hub_Phon
(
	Hub_Phon_SQN          NUMERIC(12)  NOT NULL 
		TITLE 'Hub_Phon_SQN'  ,
	Hub_Phon_LDTS         DATE  NOT NULL 
		TITLE 'Hub_Phon_LDTS'  ,
	Hub_Phon_RSRC         VARCHAR(18)  
		TITLE 'Hub_Phon_RSRC'  ,
	PhoneNumber           VARCHAR(25)  NOT NULL 
		TITLE 'PhoneNumber'  
)
	 UNIQUE PRIMARY INDEX PK_PersonPhone_BusinessEntityI
	 (
			Hub_Phon_SQN
	 )
;



CREATE UNIQUE INDEX BK_PhoneNumber
 (
		PhoneNumber
 ) ON Hub_Phon
;



CREATE TABLE Sat_Phon
(
	Hub_Phon_SQN          NUMERIC(12)  NOT NULL 
		TITLE 'Hub_Phon_SQN'  ,
	Sat_Phon_LDTS         DATE  NOT NULL 
		TITLE 'Sat_Phon_LDTS'  ,
	Sat_Phon_LEDTS        DATE  
		TITLE 'Sat_Phon_LEDTS'  ,
	Sat_Phon_RSRC         VARCHAR(18)  
		TITLE 'Sat_Phon_RSRC'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_222  FOREIGN KEY (Hub_Phon_SQN) REFERENCES Hub_Phon(Hub_Phon_SQN)
)
	 UNIQUE PRIMARY INDEX PK_PersonPhone_BusinessEntityI
	 (
			Hub_Phon_SQN,
			Sat_Phon_LDTS
	 )
;



CREATE TABLE Lnk_PersID_Phon_PNTID
(
	Lnk_PersID_Phon_PNTID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_PersID_Phon_PNTID_SQN'  ,
	Lnk_PersID_Phon_PNTID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_PersID_Phon_PNTID_LDTS'  ,
	Lnk_PersID_Phon_PNTID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_PersID_Phon_PNTID_RSRC'  ,
	Hub_PersID_SQN        NUMERIC(12)  
		TITLE 'Hub_PersID_SQN'  ,
	Hub_Phon_SQN          NUMERIC(12)  
		TITLE 'Hub_Phon_SQN'  ,
	Hub_PNTID_SQN         NUMERIC(12)  
		TITLE 'Hub_PNTID_SQN'  ,
	CONSTRAINT  R_220  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	CONSTRAINT  R_221  FOREIGN KEY (Hub_Phon_SQN) REFERENCES Hub_Phon(Hub_Phon_SQN),
	CONSTRAINT  R_223  FOREIGN KEY (Hub_PNTID_SQN) REFERENCES Hub_PNTID(Hub_PNTID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_PersID_Phon_PNTID
	 (
			Lnk_PersID_Phon_PNTID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_PersID_Phon_PNTID
 (
		Hub_PersID_SQN,
		Hub_Phon_SQN,
		Hub_PNTID_SQN
 ) ON Lnk_PersID_Phon_PNTID
;



CREATE TABLE Sat_EmailAdd
(
	Hub_EmailAddID_SQN    NUMERIC(12)  NOT NULL 
		TITLE 'Hub_EmailAddID_SQN'  ,
	Sat_EmailAdd_LDTS     DATE  NOT NULL 
		TITLE 'Sat_EmailAdd_LDTS'  ,
	Sat_EmailAdd_LEDTS    DATE  
		TITLE 'Sat_EmailAdd_LEDTS'  ,
	Sat_EmailAdd_RSRC     VARCHAR(18)  
		TITLE 'Sat_EmailAdd_RSRC'  ,
	EmailAddress          VARCHAR(50)  
		TITLE 'EmailAddress'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_219  FOREIGN KEY (Hub_EmailAddID_SQN) REFERENCES Hub_EmailAddID(Hub_EmailAddID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_EmailAddress_BusinessEntity
	 (
			Hub_EmailAddID_SQN,
			Sat_EmailAdd_LDTS
	 )
;



CREATE INDEX IX_EmailAddress_EmailAddress
 (
		EmailAddress
 ) ON Sat_EmailAdd
;



CREATE TABLE Lnk_SOrdNum_ShpMthdID
(
	Lnk_SOrdNum_ShpMthdID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SOrdNum_ShpMthdID_SQN'  ,
	Lnk_SOrdNum_ShpMthdID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_SOrdNum_ShpMthdID_LDTS'  ,
	Lnk_SOrdNum_ShpMthdID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_SOrdNum_ShpMthdID_RSRC'  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_SOrdID_SQN'  ,
	Hub_ShpMthID_SQN      NUMERIC(12)  
		TITLE 'Hub_ShpMthID_SQN'  ,
	CONSTRAINT  R_238  FOREIGN KEY (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN),
	CONSTRAINT  R_239  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_POID_ShPMthdID
	 (
			Lnk_SOrdNum_ShpMthdID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_POID_ShPMthdID
 (
		Hub_ShpMthID_SQN,
		Hub_SOrdNum_SQN
 ) ON Lnk_SOrdNum_ShpMthdID
;



CREATE TABLE Sat_Pswrd
(
	Hub_PersID_SQN        NUMERIC(12)  NOT NULL 
		TITLE 'Hub_PersID_SQN'  ,
	Sat_Pswrd_LDTS        DATE  NOT NULL 
		TITLE 'Sat_Pswrd_LDTS'  ,
	Sat_Pswrd_LEDTS       DATE  
		TITLE 'Sat_Pswrd_LEDTS'  ,
	Sat_Pswrd_RSRC        VARCHAR(18)  
		TITLE 'Sat_Pswrd_RSRC'  ,
	PasswordHash          varchar(128)  NOT NULL 
		TITLE 'PasswordHash'  ,
	PasswordSalt          varchar(10)  NOT NULL 
		TITLE 'PasswordSalt'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_216  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Password_BusinessEntityID
	 (
			Hub_PersID_SQN,
			Sat_Pswrd_LDTS
	 )
;



CREATE TABLE Lnk_ProdNum_POID
(
	Lnk_ProdNum_POID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_POID_SQN'  ,
	Lnk_ProdNum_POID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_ProdID_POID_LDTS'  ,
	Lnk_ProdNum_POID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_ProdID_POID_RSRC'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_POID_SQN          NUMERIC(12)  
		TITLE 'Hub_POID_SQN'  ,
	PurchaseOrderDetailID  INTEGER  NOT NULL 
		TITLE 'PurchaseOrderDetailID'  ,
	CONSTRAINT  R_229  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT  R_231  FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_PurchaseOrderDetail_Purchas
	 (
			Lnk_ProdNum_POID_SQN
	 )
;



CREATE UNIQUE INDEX AK_PurchaseOrderDetail
 (
		Hub_ProdNum_SQN,
		PurchaseOrderDetailID,
		Hub_POID_SQN
 ) ON Lnk_ProdNum_POID
;



CREATE TABLE Sat_PODetail
(
	Lnk_ProdNum_POID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_POID_SQN'  ,
	Sat_PODetail_LDTS     DATE  NOT NULL 
		TITLE 'Sat_PODetail_LDTS'  ,
	Sat_PODetail_LEDTS    DATE  
		TITLE 'Sat_PODetail_LEDTS'  ,
	Sat_PODetail_RSRC     VARCHAR(18)  
		TITLE 'Sat_PODetail_RSRC'  ,
	DueDate               TIMESTAMP  NOT NULL 
		TITLE 'DueDate'  ,
	OrderQty              smallint  NOT NULL 
		TITLE 'OrderQty'  ,
	ProductID             CHAR(18)  NOT NULL 
		TITLE 'ProductID'  ,
	UnitPrice             DECIMAL(19,4)  NOT NULL 
		TITLE 'UnitPrice'  ,
	LineTotal             DECIMAL(19,4)  NOT NULL 
		TITLE 'LineTotal'  ,
	ReceivedQty           decimal(8,2)  NOT NULL 
		TITLE 'ReceivedQty'  ,
	RejectedQty           decimal(8,2)  NOT NULL 
		TITLE 'RejectedQty'  ,
	StockedQty            decimal(9,2)  NOT NULL 
		TITLE 'StockedQty'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_230  FOREIGN KEY (Lnk_ProdNum_POID_SQN) REFERENCES Lnk_ProdNum_POID(Lnk_ProdNum_POID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_PurchaseOrderDetail_Purchas
	 (
			Lnk_ProdNum_POID_SQN,
			Sat_PODetail_LDTS
	 )
;



CREATE TABLE Sat_ShpMthd
(
	Hub_ShpMthID_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_ShpMthID_SQN'  ,
	Sat_ShpMthd_LDTS      DATE  NOT NULL 
		TITLE 'Sat_ShpMthd_LDTS'  ,
	Sat_ShpMthd_LEDTS     DATE  
		TITLE 'Sat_ShpMthd_LEDTS'  ,
	Sat_ShpMthd_RSRC      VARCHAR(18)  
		TITLE 'Sat_ShpMthd_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ShipBase              DECIMAL(19,4)  NOT NULL 
		TITLE 'ShipBase'  ,
	ShipRate              DECIMAL(19,4)  NOT NULL 
		TITLE 'ShipRate'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_237  FOREIGN KEY (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ShipMethod_ShipMethodID
	 (
			Hub_ShpMthID_SQN,
			Sat_ShpMthd_LDTS
	 )
;



CREATE UNIQUE INDEX AK_ShipMethod_Name
 (
		Name
 ) ON Sat_ShpMthd
;



CREATE TABLE Hub_SaleTaxRtID
(
	Hub_SaleTaxRtID_SQN   NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SaleTaxRtID_SQN'  ,
	Hub_SaleTaxRtID_LDTS  DATE  NOT NULL 
		TITLE 'Hub_SaleTaxRtID_LDTS'  ,
	Hub_SaleTaxRtID_RSRC  VARCHAR(18)  
		TITLE 'Hub_SaleTaxRtID_RSRC'  ,
	SalesTaxRateID        INTEGER  NOT NULL 
		TITLE 'SalesTaxRateID'  
)
	 UNIQUE PRIMARY INDEX PK_SalesTaxRate_SalesTaxRateID
	 (
			Hub_SaleTaxRtID_SQN
	 )
;



CREATE UNIQUE INDEX BK_SalesTaxRateID
 (
		SalesTaxRateID
 ) ON Hub_SaleTaxRtID
;



CREATE TABLE Lnk_StProvID_SaleTaxRtID
(
	Lnk_StProvID_SaleTaxRtID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_StProvID_SaleTaxRtID_SQN'  ,
	Lnk_StProvID_SaleTaxRtID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_StProvID_SaleTaxRtID_LDTS'  ,
	Lnk_StProvID_SaleTaxRtID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_StProvID_SaleTaxRtID_RSRC'  ,
	Hub_StProvID_SQN      NUMERIC(12)  
		TITLE 'Hub_StProvID_SQN'  ,
	Hub_SaleTaxRtID_SQN   NUMERIC(12)  
		TITLE 'Hub_SaleTaxRtID_SQN'  ,
	CONSTRAINT  R_295  FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN),
	CONSTRAINT  R_296  FOREIGN KEY (Hub_SaleTaxRtID_SQN) REFERENCES Hub_SaleTaxRtID(Hub_SaleTaxRtID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_StProvID_SaleTaxRtID
	 (
			Lnk_StProvID_SaleTaxRtID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_StProvID_SaleTaxRtID
 (
		Hub_StProvID_SQN,
		Hub_SaleTaxRtID_SQN
 ) ON Lnk_StProvID_SaleTaxRtID
;



CREATE TABLE Hub_Store
(
	Hub_Store_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_Store_SQN'  ,
	Hub_Store_LDTS        DATE  NOT NULL 
		TITLE 'Hub_Store_LDTS'  ,
	Hub_Store_RSRC        VARCHAR(18)  
		TITLE 'Hub_Store_RSRC'  ,
	BusinessEntityID      CHAR(18)  NOT NULL 
		TITLE 'BusinessEntityID'  
)
	 UNIQUE PRIMARY INDEX PK_Store_BusinessEntityID
	 (
			Hub_Store_SQN
	 )
;



CREATE UNIQUE INDEX BK_BusinessEntityID
 (
		BusinessEntityID
 ) ON Hub_Store
;



CREATE TABLE Lnk_BusEntID_Store
(
	Lnk_BusEntID_Store_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_BusEntID_Store_SQN'  ,
	Lnk_BusEntID_Store_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_BusEntID_Store_LDTS'  ,
	Lnk_BusEntID_Store_RSRC  VARCHAR(18)  
		TITLE 'Lnk_BusEntID_Store_RSRC'  ,
	Hub_BusEntID_SQN      NUMERIC(12)  
		TITLE 'Hub_BusEntID_SQN'  ,
	Hub_Store_SQN         NUMERIC(12)  
		TITLE 'Hub_Store_SQN'  ,
	CONSTRAINT  R_271  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT  R_274  FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_BEID_Store
	 (
			Lnk_BusEntID_Store_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_BEID_Store
 (
		Hub_BusEntID_SQN,
		Hub_Store_SQN
 ) ON Lnk_BusEntID_Store
;



CREATE TABLE Hub_SalePers
(
	Hub_SalePers_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SalesPers_SQN'  ,
	Hub_SalePers_LDTS     DATE  NOT NULL 
		TITLE 'Hub_SalesPers_LDTS'  ,
	Hub_SalePers_RSRC     VARCHAR(18)  
		TITLE 'Hub_SalesPers_RSRC'  ,
	EmployeeID            CHAR(18)  NOT NULL 
		TITLE 'EmployeeID'  
)
	 UNIQUE PRIMARY INDEX PK_SalesPerson_BusinessEntityI
	 (
			Hub_SalePers_SQN
	 )
;



CREATE UNIQUE INDEX BK_SalesPersonID
 (
		EmployeeID
 ) ON Hub_SalePers
;



CREATE TABLE Lnk_EmpID_SalePers
(
	Lnk_EmpID_SalePers_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_EmpID_SalePers_SQN'  ,
	Lnk_EmpID_SalePers_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_EmpID_SalePers_LDTS'  ,
	Lnk_EmpID_SalePers_RSRC  VARCHAR(18)  
		TITLE 'Lnk_EmpID_SalePers_RSRC'  ,
	Hub_EmpID_SQN         NUMERIC(12)  
		TITLE 'Hub_EmpID_SQN'  ,
	Hub_SalePers_SQN      NUMERIC(12)  
		TITLE 'Hub_SalesPers_SQN'  ,
	CONSTRAINT  R_242  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT  R_243  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_EmpID_SalePers
	 (
			Lnk_EmpID_SalePers_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_EmpID_SalePers
 (
		Hub_EmpID_SQN,
		Hub_SalePers_SQN
 ) ON Lnk_EmpID_SalePers
;



CREATE TABLE Lnk_SalePers_Store
(
	Lnk_SalePers_Store_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SalePers_Store_SQN'  ,
	Lnk_SalePers_Store_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_SalePers_StoreLDTS'  ,
	Lnk_SalePers_Store_RSRC  VARCHAR(18)  
		TITLE 'Lnk_SalePers_Store_RSRC'  ,
	Hub_Store_SQN         NUMERIC(12)  
		TITLE 'Hub_Store_SQN'  ,
	Hub_SalePers_SQN      NUMERIC(12)  
		TITLE 'Hub_SalesPers_SQN'  ,
	CONSTRAINT  R_250  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	CONSTRAINT  R_251  FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_SalePers_Store
	 (
			Lnk_SalePers_Store_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_SalePers_Store
 (
		Hub_SalePers_SQN,
		Hub_Store_SQN
 ) ON Lnk_SalePers_Store
;



CREATE TABLE Hub_BOMID
(
	Hub_BOMID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_BOMID_SQN'  ,
	Hub_BOMID_LDTS        DATE  NOT NULL 
		TITLE 'Hub_BOMID_LDTS'  ,
	Hub_BOMID_RSRC        VARCHAR(18)  
		TITLE 'Hub_BOMID_RSRC'  ,
	BillOfMaterialsID     INTEGER  NOT NULL 
		TITLE 'BillOfMaterialsID'  
)
	 UNIQUE PRIMARY INDEX PK_BillOfMaterials_BillOfMater
	 (
			Hub_BOMID_SQN
	 )
;



CREATE UNIQUE INDEX BK_BillOfMaterialsID
 (
		BillOfMaterialsID
 ) ON Hub_BOMID
;



CREATE TABLE Sat_BOM
(
	Hub_BOMID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_BOMID_SQN'  ,
	Sat_BOM_LDTS          DATE  NOT NULL 
		TITLE 'Sat_BOM_LDTS'  ,
	Sat_BOM_LEDTS         DATE  
		TITLE 'Sat_BOM_LEDTS'  ,
	Sat_BOM_RSRC          VARCHAR(18)  
		TITLE 'Sat_BOM_RSRC'  ,
	StartDate             TIMESTAMP  NOT NULL 
		TITLE 'StartDate'  ,
	EndDate               TIMESTAMP  
		TITLE 'EndDate'  ,
	BOMLevel              smallint  NOT NULL 
		TITLE 'BOMLevel'  ,
	PerAssemblyQty        decimal(8,2)  NOT NULL 
		TITLE 'PerAssemblyQty'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  PK_BillOfMaterials_BillOfMater PRIMARY KEY (Hub_BOMID_SQN,Sat_BOM_LDTS),
	CONSTRAINT  R_320  FOREIGN KEY (Hub_BOMID_SQN) REFERENCES Hub_BOMID(Hub_BOMID_SQN)
)
	 UNIQUE PRIMARY INDEX AK_BillOfMaterials_ProductAsse
	 (
			StartDate
	 )
;



CREATE TABLE Sat_StProv
(
	Hub_StProvID_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_StProvID_SQN'  ,
	Sat_StProv_LDTS       DATE  NOT NULL 
		TITLE 'Sat_StProv_LDTS'  ,
	Sat_StProv_LEDTS      DATE  
		TITLE 'Sat_StProv_LEDTS'  ,
	Sat_StProv_RSRC       VARCHAR(18)  
		TITLE 'Sat_StProv_RSRC'  ,
	StateProvinceCode     CHAR(3)  NOT NULL 
		TITLE 'StateProvinceCode'  ,
	CountryRegionCode     CHAR(18)  NOT NULL 
		TITLE 'CountryRegionCode'  ,
	IsOnlyStateProvinceFlag  BYTEINT  NOT NULL 
		TITLE 'IsOnlyStateProvinceFlag'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	TerritoryID           CHAR(18)  NOT NULL 
		TITLE 'TerritoryID'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_297  FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_StateProvince_StateProvince
	 (
			Hub_StProvID_SQN,
			Sat_StProv_LDTS
	 )
;



CREATE UNIQUE INDEX AK_StateProvince_Name
 (
		Name
 ), UNIQUE INDEX AK_StateProvince_StateProvince
 (
		StateProvinceCode,
		CountryRegionCode
 ) ON Sat_StProv
;



CREATE TABLE Lnk_StProvID_CntryRgnCd
(
	Lnk_StProvID_CntryRgnCd_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_StProvID_CntryRgnID_SQN'  ,
	Lnk_StProvID_CntryRgnCd_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_StProvID_CntryRgnID_LDTS'  ,
	Lnk_StProvID_CntryRgnCd_RSRC  VARCHAR(18)  
		TITLE 'Lnk_StProvID_CntryRgnID_RSRC'  ,
	Hub_StProvID_SQN      NUMERIC(12)  
		TITLE 'Hub_StProvID_SQN'  ,
	Hub_CntryRgnCd_SQN    NUMERIC(12)  
		TITLE 'Hub_CntryRgnCd_SQN'  ,
	CONSTRAINT  R_299  FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN),
	CONSTRAINT  R_302  FOREIGN KEY (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_StProvID_CntryRgnID
	 (
			Lnk_StProvID_CntryRgnCd_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_StProvID_CntryRgnID
 (
		Hub_CntryRgnCd_SQN,
		Hub_StProvID_SQN
 ) ON Lnk_StProvID_CntryRgnCd
;



CREATE TABLE Sat_SaleTaxRt
(
	Hub_SaleTaxRtID_SQN   NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SaleTaxRtID_SQN'  ,
	Sat_SaleTaxRt_LDTS    DATE  NOT NULL 
		TITLE 'Sat_SaleTaxRt_LDTS'  ,
	Sat_SaleTaxRt_LEDTS   DATE  
		TITLE 'Sat_SaleTaxRt_LEDTS'  ,
	Sat_SaleTaxRt_RSRC    VARCHAR(18)  
		TITLE 'Sat_SaleTaxRt_RSRC'  ,
	TaxType               BYTEINT  NOT NULL 
		TITLE 'TaxType'  ,
	TaxRate               DECIMAL(10,4)  NOT NULL 
		TITLE 'TaxRate'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_298  FOREIGN KEY (Hub_SaleTaxRtID_SQN) REFERENCES Hub_SaleTaxRtID(Hub_SaleTaxRtID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SalesTaxRate_SalesTaxRateID
	 (
			Hub_SaleTaxRtID_SQN,
			Sat_SaleTaxRt_LDTS
	 )
;



CREATE UNIQUE INDEX AK_SalesTaxRate_StateProvinceI
 (
		TaxType
 ) ON Sat_SaleTaxRt
;



CREATE TABLE Sat_SalePers
(
	Hub_SalePers_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SalesPers_SQN'  ,
	Sat_SalePersLDTS      DATE  NOT NULL 
		TITLE 'Sat_SalePersLDTS'  ,
	Sat_SalePersLEDTS     DATE  
		TITLE 'Sat_SalePersLEDTS'  ,
	Sat_SalePers_RSRC     VARCHAR(18)  
		TITLE 'Sat_SalePers_RSRC'  ,
	TerritoryID           CHAR(18)  
		TITLE 'TerritoryID'  ,
	SalesQuota            DECIMAL(19,4)  
		TITLE 'SalesQuota'  ,
	Bonus                 DECIMAL(19,4)  NOT NULL 
		TITLE 'Bonus'  ,
	CommissionPct         DECIMAL(10,4)  NOT NULL 
		TITLE 'CommissionPct'  ,
	SalesYTD              DECIMAL(19,4)  NOT NULL 
		TITLE 'SalesYTD'  ,
	SalesLastYear         DECIMAL(19,4)  NOT NULL 
		TITLE 'SalesLastYear'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_244  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SalesPerson_BusinessEntityI
	 (
			Hub_SalePers_SQN,
			Sat_SalePersLDTS
	 )
;



CREATE TABLE Hub_SaleTerID
(
	Hub_SaleTerID_SQN     NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SaleTerID_SQN'  ,
	Hub_SaleTerID_LDTS    DATE  NOT NULL 
		TITLE 'Hub_SaleTerID_LDTS'  ,
	Hub_SaleTerID_RSRC    VARCHAR(18)  
		TITLE 'Hub_SaleTerID_RSRC'  ,
	TerritoryID           INTEGER  NOT NULL 
		TITLE 'TerritoryID'  
)
	 UNIQUE PRIMARY INDEX PK_SalesTerritory_TerritoryID
	 (
			Hub_SaleTerID_SQN
	 )
;



CREATE UNIQUE INDEX BK_SalesTerritoryID
 (
		TerritoryID
 ) ON Hub_SaleTerID
;



CREATE TABLE Lnk_SalePers_SaleTerID
(
	Lnk_SalePers_SaleTerID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SalePers_SaleTerID_SQN'  ,
	Lnk_SalePers_SaleTerID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_SalePers_SaleTerID_LDTS'  ,
	Lnk_SalePers_SaleTerID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_SalePers_SaleTerID_RSRC'  ,
	Hub_SalePers_SQN      NUMERIC(12)  
		TITLE 'Hub_SalesPers_SQN'  ,
	Hub_SaleTerID_SQN     NUMERIC(12)  
		TITLE 'Hub_SaleTerID_SQN'  ,
	CONSTRAINT  R_266  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	CONSTRAINT  R_267  FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_SalePers_SaleTer
	 (
			Lnk_SalePers_SaleTerID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_SalePers_SaleTer
 (
		Hub_SalePers_SQN,
		Hub_SaleTerID_SQN
 ) ON Lnk_SalePers_SaleTerID
;



CREATE TABLE Sat_SaleTerHist
(
	Lnk_SalePers_SaleTerID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SalePers_SaleTerID_SQN'  ,
	Sat_SaleTerHist_LDTS  DATE  NOT NULL 
		TITLE 'Sat_SaleTerHist_LDTS'  ,
	Sat_SaleTerHist_LEDTS  DATE  
		TITLE 'Sat_SaleTerHist_LEDTS'  ,
	Sat_SaleTerHist_RSRC  VARCHAR(18)  
		TITLE 'Sat_SaleTerHist_RSRC'  ,
	StartDate             TIMESTAMP  NOT NULL 
		TITLE 'StartDate'  ,
	EndDate               TIMESTAMP  
		TITLE 'EndDate'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_265  FOREIGN KEY (Lnk_SalePers_SaleTerID_SQN) REFERENCES Lnk_SalePers_SaleTerID(Lnk_SalePers_SaleTerID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SalesTerritoryHistory_Busin
	 (
			Lnk_SalePers_SaleTerID_SQN,
			Sat_SaleTerHist_LDTS
	 )
;



CREATE TABLE Sat_Store
(
	Hub_Store_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_Store_SQN'  ,
	Sat_Store_LDTS        DATE  NOT NULL 
		TITLE 'Sat_Store_LDTS'  ,
	Sat_Store_LEDTS       DATE  
		TITLE 'Sat_Store_LEDTS'  ,
	Sat_Store_RSRC        VARCHAR(18)  
		TITLE 'Sat_Store_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	Demographics          LONG VARCHAR  
		TITLE 'Demographics'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_252  FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Store_BusinessEntityID
	 (
			Hub_Store_SQN,
			Sat_Store_LDTS
	 )
;



CREATE TABLE Lnk_Cust_SaleTerID
(
	Lnk_Cust_SaleTerID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_Cust_SaleTerID_SQN'  ,
	Lnk_Cust_SaleTerID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_Cust_SaleTerID_LDTS'  ,
	Lnk_Cust_SaleTerID_SRC  VARCHAR(18)  
		TITLE 'RLnk_Cust_SaleTerID_SRC'  ,
	Hub_CustID_SQN        NUMERIC(12)  
		TITLE 'Hub_CustID_SQN'  ,
	Hub_SaleTerID_SQN     NUMERIC(12)  
		TITLE 'Hub_SaleTerID_SQN'  ,
	CONSTRAINT  R_261  FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	CONSTRAINT  R_262  FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_Cust_SaleTerID
	 (
			Lnk_Cust_SaleTerID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_Cust_SaleTerID
 (
		Hub_CustID_SQN,
		Hub_SaleTerID_SQN
 ) ON Lnk_Cust_SaleTerID
;



CREATE TABLE Sat_Crncy
(
	Hub_CrncyCd_SQN       NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CrncyCd_SQN'  ,
	Sat_Crncy_LDTS        DATE  NOT NULL 
		TITLE 'Sat_Crncy_LDTS'  ,
	Sat_Crncy_LEDTS       DATE  
		TITLE 'Sat_Crncy_LEDTS'  ,
	Sat_Crncy_RSRC        VARCHAR(18)  
		TITLE 'Sat_Crncy_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_306  FOREIGN KEY (Hub_CrncyCd_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Currency_CurrencyCode
	 (
			Hub_CrncyCd_SQN,
			Sat_Crncy_LDTS
	 )
;



CREATE UNIQUE INDEX AK_Currency_Name
 (
		Name
 ) ON Sat_Crncy
;



CREATE TABLE Lnk_SOrdNum_SalePers
(
	Lnk_SOrdNum_SalePers_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SOrdNum_SalePers_SQN'  ,
	Lnk_SOrdNum_SalePers_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_SOrdNum_SalePers_LDTS'  ,
	Lnk_SOrdNum_SalePers_RSRC  VARCHAR(18)  
		TITLE 'Lnk_SOrdNum_SalePers_RSRC'  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_SOrdID_SQN'  ,
	Hub_SalePers_SQN      NUMERIC(12)  
		TITLE 'Hub_SalesPers_SQN'  ,
	CONSTRAINT  R_246  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	CONSTRAINT  R_247  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_SOrdID_SalePers
	 (
			Lnk_SOrdNum_SalePers_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_SOrdID_SalePers
 (
		Hub_SalePers_SQN,
		Hub_SOrdNum_SQN
 ) ON Lnk_SOrdNum_SalePers
;



CREATE TABLE Sat_SalePersQuotaHist
(
	Hub_SalePers_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SalesPers_SQN'  ,
	Sat_SalePersQuotaHist_LDTS  DATE  NOT NULL 
		TITLE 'Sat_SalePersQuotaHist_LDTS'  ,
	Sat_SalePersQuotaHist_LEDTS  DATE  
		TITLE 'Sat_SalePersQuotaHist_LEDTS'  ,
	Sat_SalePersQuotaHist_RSRC  VARCHAR(18)  
		TITLE 'Sat_SalePersQuotaHist_RSRC'  ,
	QuotaDate             TIMESTAMP  NOT NULL 
		TITLE 'QuotaDate'  ,
	SalesQuota            DECIMAL(19,4)  NOT NULL 
		TITLE 'SalesQuota'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_245  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SalesPersonQuotaHistory_Bus
	 (
			Hub_SalePers_SQN,
			Sat_SalePersQuotaHist_LDTS
	 )
;



CREATE TABLE Hub_CrncyRtID
(
	Hub_CrncyRtID_SQN     NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CrncyRtID_SQN'  ,
	Hub_CrncyRtID_LDTS    DATE  NOT NULL 
		TITLE 'Hub_CrncyRtID_LDTS'  ,
	Hub_CrncyRtID_RSRC    VARCHAR(18)  
		TITLE 'Hub_CrncyRtID_RSRC'  ,
	CurrencyRateID        INTEGER  NOT NULL 
		TITLE 'CurrencyRateID'  
)
	 UNIQUE PRIMARY INDEX PK_CurrencyRate_CurrencyRateID
	 (
			Hub_CrncyRtID_SQN
	 )
;



CREATE UNIQUE INDEX BK_CurrencyRate
 (
		CurrencyRateID
 ) ON Hub_CrncyRtID
;



CREATE TABLE Sat_CrncyRt
(
	Hub_CrncyRtID_SQN     NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CrncyRtID_SQN'  ,
	Sat_CrncyRt_LDTS      DATE  NOT NULL 
		TITLE 'Sat_CrncyRt_LDTS'  ,
	Sat_CrncyRt_LEDTS     DATE  
		TITLE 'Sat_CrncyRt_LEDTS'  ,
	Sat_CrncyRt_RSRC      VARCHAR(18)  
		TITLE 'Sat_CrncyRt_RSRC'  ,
	CurrencyRateDate      TIMESTAMP  NOT NULL 
		TITLE 'CurrencyRateDate'  ,
	AverageRate           DECIMAL(19,4)  NOT NULL 
		TITLE 'AverageRate'  ,
	EndOfDayRate          DECIMAL(19,4)  NOT NULL 
		TITLE 'EndOfDayRate'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_310  FOREIGN KEY (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_CurrencyRate_CurrencyRateID
	 (
			Hub_CrncyRtID_SQN,
			Sat_CrncyRt_LDTS
	 )
;



CREATE UNIQUE INDEX AK_CurrencyRate_CurrencyRateDa
 (
		CurrencyRateDate
 ) ON Sat_CrncyRt
;



CREATE TABLE Sat_BusEntID
(
	Hub_BusEntID_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_BusEntID_SQN'  ,
	Sat_BusEntID_LDTS     DATE  NOT NULL 
		TITLE 'Sat_BusEntID_LDTS'  ,
	Sat_BusEntID_LEDTS    DATE  
		TITLE 'Sat_BusEntID_LEDTS'  ,
	Sat_BusEntID_RSRC     VARCHAR(18)  
		TITLE 'Sat_BusEntID_RSRC'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_268  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_BusinessEntity_BusinessEnti
	 (
			Hub_BusEntID_SQN,
			Sat_BusEntID_LDTS
	 )
;



CREATE TABLE Lnk_EmpID_PersID
(
	Lnk_EmpID_PersID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_EmpID_PersID_SQN'  ,
	Lnk_EmpID_PersID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_EmpID_PersID_LDTS'  ,
	Lnk_EmpID_PersID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_EmpID_PersID_RSRC'  ,
	Hub_PersID_SQN        NUMERIC(12)  
		TITLE 'Hub_PersID_SQN'  ,
	Hub_EmpID_SQN         NUMERIC(12)  
		TITLE 'Hub_EmpID_SQN'  ,
	CONSTRAINT  R_248  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT  R_249  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_EmpID_PersID
	 (
			Lnk_EmpID_PersID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_EmpID_PersID
 (
		Hub_EmpID_SQN,
		Hub_PersID_SQN
 ) ON Lnk_EmpID_PersID
;



CREATE TABLE Lnk_CustID_Store
(
	Lnk_CustID_Store_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_CustID_Store_SQN'  ,
	Lnk_CustID_Store_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_CustID_Store_LDTS'  ,
	Lnk_CustID_Store_RSRC  VARCHAR(18)  
		TITLE 'Lnk_CustID_Store_RSRC'  ,
	Hub_CustID_SQN        NUMERIC(12)  
		TITLE 'Hub_CustID_SQN'  ,
	Hub_Store_SQN         NUMERIC(12)  
		TITLE 'Hub_Store_SQN'  ,
	CONSTRAINT  R_254  FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN),
	CONSTRAINT  R_255  FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_CustID_Store
	 (
			Lnk_CustID_Store_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_CustID_Store
 (
		Hub_Store_SQN,
		Hub_CustID_SQN
 ) ON Lnk_CustID_Store
;



CREATE TABLE Lnk_PersID_CustID
(
	Lnk_PersID_CustID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_PersID_CustID_SQN'  ,
	Lnk_PersID_CustID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_PersID_CustID_LDTS'  ,
	Lnk_PersID_CustID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_PersID_CustID_RSRC'  ,
	Hub_PersID_SQN        NUMERIC(12)  
		TITLE 'Hub_PersID_SQN'  ,
	Hub_CustID_SQN        NUMERIC(12)  
		TITLE 'Hub_CustID_SQN'  ,
	CONSTRAINT  R_256  FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	CONSTRAINT  R_257  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_PersID_CustID
	 (
			Lnk_PersID_CustID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_PersID_CustID
 (
		Hub_CustID_SQN,
		Hub_PersID_SQN
 ) ON Lnk_PersID_CustID
;



CREATE TABLE Hub_AddTypID
(
	Hub_AddTypID_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_AddTypID_SQN'  ,
	Hub_AddTypID_LDTS     DATE  NOT NULL 
		TITLE 'Hub_AddTypID_LDTS'  ,
	Hub_AddTypID_RSRC     VARCHAR(18)  
		TITLE 'Hub_AddTypID_RSRC'  ,
	AddressTypeID         INTEGER  NOT NULL 
		TITLE 'AddressTypeID'  
)
	 UNIQUE PRIMARY INDEX PK_AddressType_AddressTypeID
	 (
			Hub_AddTypID_SQN
	 )
;



CREATE UNIQUE INDEX BK_AddressTypeID
 (
		AddressTypeID
 ) ON Hub_AddTypID
;



CREATE TABLE Sat_AddTyp
(
	Hub_AddTypID_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_AddTypID_SQN'  ,
	Sat_AddTyp_LDTS       DATE  NOT NULL 
		TITLE 'Sat_AddTyp_LDTS'  ,
	Sat_AddTyp_LEDTS      DATE  
		TITLE 'Sat_AddTyp_LEDTS'  ,
	Sat_AddTyp_RSRC       VARCHAR(18)  
		TITLE 'Sat_AddTyp_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_285  FOREIGN KEY (Hub_AddTypID_SQN) REFERENCES Hub_AddTypID(Hub_AddTypID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_AddressType_AddressTypeID
	 (
			Hub_AddTypID_SQN,
			Sat_AddTyp_LDTS
	 )
;



CREATE UNIQUE INDEX AK_AddressType_Name
 (
		Name
 ) ON Sat_AddTyp
;



CREATE TABLE Sat_SaleTer
(
	Hub_SaleTerID_SQN     NUMERIC(12)  NOT NULL 
		TITLE 'Hub_SaleTerID_SQN'  ,
	Sat_SaleTer_LDTS      DATE  NOT NULL 
		TITLE 'Sat_SaleTer_LDTS'  ,
	Sat_SaleTer_LEDTS     DATE  
		TITLE 'Sat_SaleTer_LEDTS'  ,
	Sat_SaleTer_RSRC      VARCHAR(18)  
		TITLE 'Sat_SaleTer_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	CountryRegionCode     VARCHAR(3)  NOT NULL 
		TITLE 'CountryRegionCode'  ,
	Group                 VARCHAR(50)  NOT NULL 
		TITLE 'Group'  ,
	SalesYTD              DECIMAL(19,4)  NOT NULL 
		TITLE 'SalesYTD'  ,
	SalesLastYear         DECIMAL(19,4)  NOT NULL 
		TITLE 'SalesLastYear'  ,
	CostYTD               DECIMAL(19,4)  NOT NULL 
		TITLE 'CostYTD'  ,
	CostLastYear          DECIMAL(19,4)  NOT NULL 
		TITLE 'CostLastYear'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_260  FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_SalesTerritory_TerritoryID
	 (
			Hub_SaleTerID_SQN,
			Sat_SaleTer_LDTS
	 )
;



CREATE UNIQUE INDEX AK_SalesTerritory_Name
 (
		Name
 ) ON Sat_SaleTer
;



CREATE TABLE Lnk_ProdNum_UntMsrCd
(
	Lnk_ProdNum_UntMsrCd_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_ProdID_UntMsrCd_SQN'  ,
	Lnk_ProdNum_UntMsrCd_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_ProdID_UntMsrCd_LDTS'  ,
	Lnk_ProdNum_UntMsrCd_RSRC  VARCHAR(18)  
		TITLE 'Lnk_ProdID_UntMsrCd_RSRC'  ,
	Hub_ProdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_UntMsrCd_Wt_SQN   NUMERIC(12)  
		TITLE 'Hub_UntMsrCd_SQN'  ,
	Hub_UntMsrCd_Size_SQN  NUMERIC(12)  
		TITLE 'Hub_UntMsrCd_SQN'  ,
	CONSTRAINT  R_315  FOREIGN KEY (Hub_UntMsrCd_Wt_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN),
	CONSTRAINT  R_316  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT  R_319  FOREIGN KEY (Hub_UntMsrCd_Size_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_VendNum_UntMsrCd
	 (
			Lnk_ProdNum_UntMsrCd_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_VendNum_UntMsrCd
 (
		Hub_UntMsrCd_Wt_SQN,
		Hub_ProdNum_SQN,
		Hub_UntMsrCd_Size_SQN
 ) ON Lnk_ProdNum_UntMsrCd
;



CREATE TABLE Sat_UntMsr
(
	Sat_UntMsr_LDTS       DATE  NOT NULL 
		TITLE 'Sat_UntMsr_LDTS'  ,
	Hub_UntMsrCd_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_UntMsrCd_SQN'  ,
	Sat_UntMsr_LEDTS      DATE  
		TITLE 'Sat_UntMsr_LEDTS'  ,
	Sat_UntMsr_RSRC       VARCHAR(18)  
		TITLE 'Sat_UntMsr_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_313  FOREIGN KEY (Hub_UntMsrCd_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
	 UNIQUE PRIMARY INDEX PK_UnitMeasure_UnitMeasureCode
	 (
			Sat_UntMsr_LDTS,
			Hub_UntMsrCd_SQN
	 )
;



CREATE UNIQUE INDEX AK_UnitMeasure_Name
 (
		Name
 ) ON Sat_UntMsr
;



CREATE TABLE Lnk_CrncyCd_CrncyRtID
(
	Lnk_CrncyCd_CrncyRtID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_CrncyCd_CrncyRtID_SQN'  ,
	Lnk_CrncyCd_CrncyRtID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_CrncyCd_CrncyRtID_LDTS'  ,
	Lnk_CrncyCd_CrncyRtID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_CrncyCd_CrncyRtID_RSRC'  ,
	Hub_CrncyRtID_SQN     NUMERIC(12)  
		TITLE 'Hub_CrncyRtID_SQN'  ,
	Hub_CrncyCd_From_SQN  NUMERIC(12)  
		TITLE 'Hub_CrncyCd_SQN'  ,
	Hub_CrncyCd_To_SQN    NUMERIC(12)  
		TITLE 'Hub_CrncyCd_SQN'  ,
	CONSTRAINT  R_307  FOREIGN KEY (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN),
	CONSTRAINT  R_308  FOREIGN KEY (Hub_CrncyCd_From_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN),
	CONSTRAINT  R_309  FOREIGN KEY (Hub_CrncyCd_To_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_CrncyCd_CrncyRtID
	 (
			Lnk_CrncyCd_CrncyRtID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_CrncyCd_CrncyRtID
 (
		Hub_CrncyRtID_SQN,
		Hub_CrncyCd_From_SQN,
		Hub_CrncyCd_To_SQN
 ) ON Lnk_CrncyCd_CrncyRtID
;



CREATE TABLE Lnk_SOrdNum_CrncyRtID
(
	Lnk_SOrdNum_CrncyRtID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SOrdNum_CrncyRtID_SQN'  ,
	Lnk_SOrdNum_CrncyRtID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_SOrdNum_CrncyRtID_LDTS'  ,
	Lnk_SOrdNum_CrncyRtID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_SOrdNum_CrncyRtID_RSRC'  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_SOrdID_SQN'  ,
	Hub_CrncyRtID_SQN     NUMERIC(12)  
		TITLE 'Hub_CrncyRtID_SQN'  ,
	CONSTRAINT  R_311  FOREIGN KEY (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN),
	CONSTRAINT  R_312  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_SOrdNum_CrncyRtID
	 (
			Lnk_SOrdNum_CrncyRtID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_CrncyRtID
 (
		Hub_CrncyRtID_SQN,
		Hub_SOrdNum_SQN
 ) ON Lnk_SOrdNum_CrncyRtID
;



CREATE TABLE Sat_CntryRgn
(
	Hub_CntryRgnCd_SQN    NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CntryRgnCd_SQN'  ,
	Sat_CntryRgn_LDTS     DATE  NOT NULL 
		TITLE 'Sat_CntryRgn_LDTS'  ,
	Sat_CntryRgn_LEDTS    DATE  
		TITLE 'Sat_CntryRgn_LEDTS'  ,
	Sat_CntryRgn_RSRC     VARCHAR(18)  
		TITLE 'Sat_CntryRgn_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_304  FOREIGN KEY (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN)
)
	 UNIQUE PRIMARY INDEX PK_CountryRegion_CountryRegion
	 (
			Hub_CntryRgnCd_SQN,
			Sat_CntryRgn_LDTS
	 )
;



CREATE UNIQUE INDEX AK_CountryRegion_Name
 (
		Name
 ) ON Sat_CntryRgn
;



CREATE TABLE Lnk_SaleTerID_StProvID
(
	Lnk_SaleTerID_StProvID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SaleTerID_StProvID_SQN'  ,
	Lnk_SaleTerID_StProvID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_SaleTerID_StProvID_LDTS'  ,
	Lnk_SaleTerID_StProvID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_SaleTerID_StProvID_RSRC'  ,
	Hub_StProvID_SQN      NUMERIC(12)  
		TITLE 'Hub_StProvID_SQN'  ,
	Hub_SaleTerID_SQN     NUMERIC(12)  
		TITLE 'Hub_SaleTerID_SQN'  ,
	CONSTRAINT  R_293  FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN),
	CONSTRAINT  R_294  FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_SaleTerID_StProvID
	 (
			Lnk_SaleTerID_StProvID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_SaleTerID_StProvID
 (
		Hub_SaleTerID_SQN,
		Hub_StProvID_SQN
 ) ON Lnk_SaleTerID_StProvID
;



CREATE TABLE Lnk_CustID_SOrdNum
(
	Lnk_CustID_SOrdNum_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_CustID_SOrdNum_SQN'  ,
	Lnk_CustID_SOrdNum_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_CustID_SOrdNum_LDTS'  ,
	Lnk_CustID_SOrdNum_RSRC  VARCHAR(18)  
		TITLE 'Lnk_CustID_SOrdNum_RSRC'  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_SOrdID_SQN'  ,
	Hub_CustID_SQN        NUMERIC(12)  
		TITLE 'Hub_CustID_SQN'  ,
	CONSTRAINT  R_258  FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	CONSTRAINT  R_259  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_CustID_SOrdNum
	 (
			Lnk_CustID_SOrdNum_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_CustID_SOrdNum
 (
		Hub_SOrdNum_SQN,
		Hub_CustID_SQN
 ) ON Lnk_CustID_SOrdNum
;



CREATE TABLE Sat_Add
(
	Hub_AddID_SQN         NUMERIC(12)  NOT NULL 
		TITLE 'Hub_AddID_SQN'  ,
	Sat_Add_LDTS          DATE  NOT NULL 
		TITLE 'Sat_Add_LDTS'  ,
	Sat_Add_LEDTS         DATE  
		TITLE 'Sat_Add_LEDTS'  ,
	Sat_Add_RSRC          VARCHAR(18)  
		TITLE 'Sat_Add_RSRC'  ,
	AddressLine1          VARCHAR(60)  NOT NULL 
		TITLE 'AddressLine1'  ,
	AddressLine2          VARCHAR(60)  
		TITLE 'AddressLine2'  ,
	City                  VARCHAR(30)  NOT NULL 
		TITLE 'City'  ,
	StateProvinceID       CHAR(18)  NOT NULL 
		TITLE 'StateProvinceID'  ,
	PostalCode            VARCHAR(15)  NOT NULL 
		TITLE 'PostalCode'  ,
	SpatialLocation       CHAR(18)  
		TITLE 'SpatialLocation'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_286  FOREIGN KEY (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_Address_AddressID
	 (
			Hub_AddID_SQN,
			Sat_Add_LDTS
	 )
;



CREATE UNIQUE INDEX IX_Address_AddressLine1_Addres
 (
		AddressLine1,
		AddressLine2,
		City,
		StateProvinceID,
		PostalCode
 ) ON Sat_Add
;



CREATE TABLE Lnk_BusEntID_AddID_AddTypID
(
	Lnk_BusEntID_AddID_AddTypID_SQ  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_BusEntID_AddID_SQN'  ,
	Lnk_BusEntID_AddID_AddTypID_LD  DATE  NOT NULL 
		TITLE 'Lnk_BusEntID_AddID_LDTS'  ,
	Lnk_BusEntID_AddID_AddTypID_RS  VARCHAR(18)  
		TITLE 'Lnk_BusEntID_AddID_RSRC'  ,
	Hub_BusEntID_SQN      NUMERIC(12)  
		TITLE 'Hub_BusEntID_SQN'  ,
	Hub_AddID_SQN         NUMERIC(12)  
		TITLE 'Hub_AddID_SQN'  ,
	Hub_AddTypID_SQN      NUMERIC(12)  
		TITLE 'Hub_AddTypID_SQN'  ,
	CONSTRAINT  R_281  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT  R_282  FOREIGN KEY (Hub_AddTypID_SQN) REFERENCES Hub_AddTypID(Hub_AddTypID_SQN),
	CONSTRAINT  R_283  FOREIGN KEY (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_BusEntID_AddID
	 (
			Lnk_BusEntID_AddID_AddTypID_SQ
	 )
;



CREATE UNIQUE INDEX AK_Lnk_BusEntID_AddID
 (
		Hub_BusEntID_SQN,
		Hub_AddTypID_SQN,
		Hub_AddID_SQN
 ) ON Lnk_BusEntID_AddID_AddTypID
;



CREATE TABLE Sat_BusEntID_AddID_AddTypID
(
	Lnk_BusEntID_AddID_AddTypID_SQ  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_BusEntID_AddID_SQN'  ,
	Sat_BusEntID_AddID_AddTypID_LD  DATE  NOT NULL 
		TITLE 'Sat_BusEntID_AddID_AddTypID_LDTS'  ,
	Sat_BusEntID_AddID_AddTypID_LE  DATE  
		TITLE 'Sat_BusEntID_AddID_AddTypID_LEDTS'  ,
	Sat_BusEntID_AddID_AddTypID_RS  VARCHAR(18)  
		TITLE 'Sat_BusEntID_AddID_AddTypID_RSRC'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_284  FOREIGN KEY (Lnk_BusEntID_AddID_AddTypID_SQ) REFERENCES Lnk_BusEntID_AddID_AddTypID(Lnk_BusEntID_AddID_AddTypID_SQ)
)
	 UNIQUE PRIMARY INDEX PK_BusinessEntityAddress_Busin
	 (
			Lnk_BusEntID_AddID_AddTypID_SQ,
			Sat_BusEntID_AddID_AddTypID_LD
	 )
;



CREATE TABLE Lnk_ProdNum_BOMID
(
	Lnk_ProdNum_BOMID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_BOM_Heir_SQN'  ,
	Lnk_ProdNum_BOMID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_BOM_Heir_LDTS'  ,
	Lnk_ProdNum_BOMID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_BOM_Heir_RSRC'  ,
	Hub_ProdNum_Asmbly_SQN  NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_ProdNum_Comp_SQN  NUMERIC(12)  
		TITLE 'Hub_ProdNum_SQN'  ,
	Hub_BOMID_SQN         NUMERIC(12)  
		TITLE 'Hub_BOMID_SQN'  ,
	CONSTRAINT  R_323  FOREIGN KEY (Hub_ProdNum_Comp_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT  R_324  FOREIGN KEY (Hub_ProdNum_Asmbly_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT  R_325  FOREIGN KEY (Hub_BOMID_SQN) REFERENCES Hub_BOMID(Hub_BOMID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_BOM_Heir
	 (
			Lnk_ProdNum_BOMID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_BOM_Heir
 (
		Hub_ProdNum_Comp_SQN,
		Hub_ProdNum_Asmbly_SQN,
		Hub_BOMID_SQN
 ) ON Lnk_ProdNum_BOMID
;



CREATE TABLE Hub_CntTypID
(
	Hub_CntTypID_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CntTypID_SQN'  ,
	Hub_CntTypID_LDTS     DATE  NOT NULL 
		TITLE 'Hub_CntTypID_LDTS'  ,
	Hub_CntTypID_RSRC     VARCHAR(18)  
		TITLE 'Hub_CntTypID_RSRC'  ,
	ContactTypeID         INTEGER  NOT NULL 
		TITLE 'ContactTypeID'  
)
	 UNIQUE PRIMARY INDEX PK_ContactType_ContactTypeID
	 (
			Hub_CntTypID_SQN
	 )
;



CREATE UNIQUE INDEX BK_ContactTypeID
 (
		ContactTypeID
 ) ON Hub_CntTypID
;



CREATE TABLE Sat_CntTyp
(
	Hub_CntTypID_SQN      NUMERIC(12)  NOT NULL 
		TITLE 'Hub_CntTypID_SQN'  ,
	Sat_CntTyp_LDTS       DATE  NOT NULL 
		TITLE 'Sat_CntTyp_LDTS'  ,
	Sat_CntTyp_LEDTS      DATE  
		TITLE 'Sat_CntTyp_LEDTS'  ,
	Sat_CntTyp_RSRC       VARCHAR(18)  
		TITLE 'Sat_CntTyp_RSRC'  ,
	Name                  VARCHAR(50)  NOT NULL 
		TITLE 'Name'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_277  FOREIGN KEY (Hub_CntTypID_SQN) REFERENCES Hub_CntTypID(Hub_CntTypID_SQN)
)
	 UNIQUE PRIMARY INDEX PK_ContactType_ContactTypeID
	 (
			Hub_CntTypID_SQN,
			Sat_CntTyp_LDTS
	 )
;



CREATE UNIQUE INDEX AK_ContactType_Name
 (
		Name
 ) ON Sat_CntTyp
;



CREATE TABLE Lnk_PersID_BusEntID_CntTypID
(
	Lnk_PersID_BusEntID_CntTypID_S  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_PersID_BusEntID_CntTypID_SQN'  ,
	Lnk_PersID_BusEntID_CntTypID_L  DATE  NOT NULL 
		TITLE 'Lnk_PersID_BusEntID_CntTypID_LDTS'  ,
	Lnk_PersID_BusEntID_CntTypID_R  VARCHAR(18)  
		TITLE 'Lnk_PersID_BusEntID_CntTypID_RSRC'  ,
	Hub_BusEntID_SQN      NUMERIC(12)  
		TITLE 'Hub_BusEntID_SQN'  ,
	Hub_PersID_SQN        NUMERIC(12)  
		TITLE 'Hub_PersID_SQN'  ,
	Hub_CntTypID_SQN      NUMERIC(12)  
		TITLE 'Hub_CntTypID_SQN'  ,
	CONSTRAINT  R_278  FOREIGN KEY (Hub_CntTypID_SQN) REFERENCES Hub_CntTypID(Hub_CntTypID_SQN),
	CONSTRAINT  R_279  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT  R_280  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_PersID_BusEntID_CntTypI
	 (
			Lnk_PersID_BusEntID_CntTypID_S
	 )
;



CREATE UNIQUE INDEX AK_Lnk_PersID_BusEntID_CntTypI
 (
		Hub_CntTypID_SQN,
		Hub_BusEntID_SQN,
		Hub_PersID_SQN
 ) ON Lnk_PersID_BusEntID_CntTypID
;



CREATE TABLE Sat_BusEnt_Cnt
(
	Lnk_PersID_BusEntID_CntTypID_S  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_PersID_BusEntID_CntTypID_SQN'  ,
	Sat_BusEnt_Cnt_LDTS   DATE  NOT NULL 
		TITLE 'Sat_BusEnt_Cnt_LDTS'  ,
	Sat_BusEnt_Cnt_LEDTS  DATE  
		TITLE 'Sat_BusEnt_Cnt_LEDTS'  ,
	Sat_BusEnt_Cnt_RSRC   VARCHAR(18)  
		TITLE 'Sat_BusEnt_Cnt_RSRC'  ,
	ModifiedDate          TIMESTAMP  NOT NULL 
		TITLE 'ModifiedDate'  ,
	CONSTRAINT  R_276  FOREIGN KEY (Lnk_PersID_BusEntID_CntTypID_S) REFERENCES Lnk_PersID_BusEntID_CntTypID(Lnk_PersID_BusEntID_CntTypID_S)
)
	 UNIQUE PRIMARY INDEX PK_BusinessEntityContact_Busin
	 (
			Lnk_PersID_BusEntID_CntTypID_S,
			Sat_BusEnt_Cnt_LDTS
	 )
;



CREATE TABLE Lnk_SOrdNum_SaleTerID
(
	Lnk_SOrdNum_SaleTerID_SQN  NUMERIC(12)  NOT NULL 
		TITLE 'Lnk_SOrdNum_SaleTerID_SQN'  ,
	Lnk_SOrdNum_SaleTerID_LDTS  DATE  NOT NULL 
		TITLE 'Lnk_SOrdNum_SaleTerID_LDTS'  ,
	Lnk_SOrdNum_SaleTerID_RSRC  VARCHAR(18)  
		TITLE 'Lnk_SOrdNum_SaleTerID_RSRC'  ,
	Hub_SOrdNum_SQN       NUMERIC(12)  
		TITLE 'Hub_SOrdID_SQN'  ,
	Hub_SaleTerID_SQN     NUMERIC(12)  
		TITLE 'Hub_SaleTerID_SQN'  ,
	CONSTRAINT  R_263  FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN),
	CONSTRAINT  R_264  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
	 UNIQUE PRIMARY INDEX XPKLnk_SOrdNum_SaleTerID
	 (
			Lnk_SOrdNum_SaleTerID_SQN
	 )
;



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_SaleTerID
 (
		Hub_SaleTerID_SQN,
		Hub_SOrdNum_SQN
 ) ON Lnk_SOrdNum_SaleTerID
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


