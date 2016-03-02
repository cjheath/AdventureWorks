
CREATE TABLE Hub_ProdSubCatID
(
	Hub_ProdSubCatID_SQN numeric(12) IDENTITY ,
	Hub_ProdSubCatID_LDTS datetime NOT NULL ,
	Hub_ProdSubCatID_RSRC univarchar(18) NULL ,
	ProductSubcategoryID int NOT NULL ,
	CONSTRAINT PK_ProductSubcategory_ProductS PRIMARY KEY   CLUSTERED (Hub_ProdSubCatID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_ProdSubCatID', Hub_ProdSubCatID_SQN
go



CREATE UNIQUE INDEX BK_ProductSubcategoryID ON Hub_ProdSubCatID
(
	ProductSubcategoryID  ASC
)
go



CREATE TABLE Hub_ProdNum
(
	Hub_ProdNum_SQN      numeric(12) IDENTITY ,
	Hub_ProdNum_LDTS     datetime NOT NULL ,
	Hub_ProdNum_RSRC     univarchar(18) NULL ,
	ProductNumber        univarchar(25) NOT NULL ,
	CONSTRAINT PK_Product_ProductID PRIMARY KEY   CLUSTERED (Hub_ProdNum_SQN  ASC)
)
go



exec sp_primarykey 'Hub_ProdNum', Hub_ProdNum_SQN
go



CREATE UNIQUE INDEX BK_ProdNumID ON Hub_ProdNum
(
	ProductNumber         ASC
)
go



CREATE TABLE Hub_ProdCatID
(
	Hub_ProdCatID_SQN    numeric(12) IDENTITY ,
	Hub_ProdCatID_LDTS   datetime NOT NULL ,
	Hub_ProdCatID_RSRC   univarchar(18) NULL ,
	ProductCategoryID    int NOT NULL ,
	CONSTRAINT PK_ProductCategory_ProductCate PRIMARY KEY   CLUSTERED (Hub_ProdCatID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_ProdCatID', Hub_ProdCatID_SQN
go



CREATE UNIQUE INDEX BK_ProductCategoryID ON Hub_ProdCatID
(
	ProductCategoryID     ASC
)
go



CREATE TABLE Lnk_ProdNum_ProdSubCatID
(
	Lnk_ProdNum_ProdSubCatID_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_ProdSubCatID_LDTS datetime NOT NULL ,
	Lnk_ProdNum_ProdSubCatID_RSRC univarchar(18) NULL ,
	Hub_ProdCatID_SQN    numeric(12) NOT NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_ProdSubCatID_SQN numeric(12) NOT NULL ,
	CONSTRAINT XPKLnk_ProdSubCatID_ProdCatID PRIMARY KEY   CLUSTERED (Lnk_ProdNum_ProdSubCatID_SQN  ASC),
	CONSTRAINT R_131  FOREIGN KEY (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN),
	CONSTRAINT R_133  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_326  FOREIGN KEY (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_ProdSubCatID', Lnk_ProdNum_ProdSubCatID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_ProdSubCatID_ProdCatID ON Lnk_ProdNum_ProdSubCatID
(
	Hub_ProdNum_SQN       ASC,
	Hub_ProdSubCatID_SQN  ASC,
	Hub_ProdCatID_SQN     ASC
)
go



CREATE TABLE Sat_ProdSubCat
(
	Hub_ProdSubCatID_SQN numeric(12) NOT NULL ,
	Sat_ProdSubCat_LDTS  datetime NOT NULL ,
	Sat_ProdSubCat_LEDTS datetime NULL ,
	Sat_ProdSubCat_RSRC  univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SAT_ProductSubcategoryID PRIMARY KEY   CLUSTERED (Hub_ProdSubCatID_SQN  ASC,Sat_ProdSubCat_LDTS  ASC),
	CONSTRAINT R_122  FOREIGN KEY (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN)
)
go



exec sp_primarykey 'Sat_ProdSubCat', Hub_ProdSubCatID_SQN, Sat_ProdSubCat_LDTS
go



CREATE UNIQUE INDEX AK_ProductSubcategory_Name ON Sat_ProdSubCat
(
	Name                  ASC
)
go



CREATE TABLE Lnk_ProdSubCatID_ProdCatID
(
	Lnk_ProdSubCatID_ProdCatID_SQN numeric(12) IDENTITY ,
	Lnk_ProdSubCatID_ProdCatID_LDT datetime NOT NULL ,
	Lnk_ProdSubCatID_ProdCatID_RSR univarchar(18) NULL ,
	Hub_ProdSubCatID_SQN numeric(12) NOT NULL ,
	Hub_ProdCatID_SQN    numeric(12) NOT NULL ,
	CONSTRAINT XPKLnk_ProdSubCatCatID PRIMARY KEY   CLUSTERED (Lnk_ProdSubCatID_ProdCatID_SQN  ASC),
	CONSTRAINT R_128  FOREIGN KEY (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN),
	CONSTRAINT R_129  FOREIGN KEY (Hub_ProdSubCatID_SQN) REFERENCES Hub_ProdSubCatID(Hub_ProdSubCatID_SQN)
)
go



exec sp_primarykey 'Lnk_ProdSubCatID_ProdCatID', Lnk_ProdSubCatID_ProdCatID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_ProdSubCatID_ProdCatID ON Lnk_ProdSubCatID_ProdCatID
(
	Hub_ProdCatID_SQN     ASC,
	Hub_ProdSubCatID_SQN  ASC
)
go



CREATE TABLE Sat_ProdCat
(
	Hub_ProdCatID_SQN    numeric(12) NOT NULL ,
	Sat_ProdCat_LDTS     datetime NOT NULL ,
	Sat_ProdCat_LEDTS    datetime NULL ,
	Sat_ProdCat_RSRC     univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SAT_ProductCategoryID PRIMARY KEY   CLUSTERED (Hub_ProdCatID_SQN  ASC,Sat_ProdCat_LDTS  ASC),
	CONSTRAINT R_121  FOREIGN KEY (Hub_ProdCatID_SQN) REFERENCES Hub_ProdCatID(Hub_ProdCatID_SQN)
)
go



exec sp_primarykey 'Sat_ProdCat', Hub_ProdCatID_SQN, Sat_ProdCat_LDTS
go



CREATE UNIQUE INDEX AK_ProductCategory_Name ON Sat_ProdCat
(
	Name                  ASC
)
go



CREATE TABLE Hub_AddID
(
	Hub_AddID_SQN        numeric(12) IDENTITY ,
	Hub_AddID_RSRC       univarchar(18) NULL ,
	Hub_AddID_LDTS       datetime NOT NULL ,
	AddressID            int NOT NULL ,
	CONSTRAINT PK_Address_AddressID PRIMARY KEY   CLUSTERED (Hub_AddID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_AddID', Hub_AddID_SQN
go



CREATE UNIQUE INDEX BK_AddressID ON Hub_AddID
(
	AddressID             ASC
)
go



CREATE TABLE Hub_StProvID
(
	Hub_StProvID_SQN     numeric(12) IDENTITY ,
	Hub_StProvID_LDTS    datetime NOT NULL ,
	Hub_StProvID_RSRC    univarchar(18) NULL ,
	StateProvinceID      int NOT NULL ,
	CONSTRAINT PK_StateProvince_StateProvince PRIMARY KEY   CLUSTERED (Hub_StProvID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_StProvID', Hub_StProvID_SQN
go



CREATE UNIQUE INDEX BK_StateProvinceID ON Hub_StProvID
(
	StateProvinceID       ASC
)
go



CREATE TABLE Lnk_AddID_StProvID
(
	Lnk_AddID_StProvID_SQN numeric(12) IDENTITY ,
	Lnk_AddID_StProvID_LDTS datetime NOT NULL ,
	Lnk_AddID_StProvID_RSRC univarchar(18) NULL ,
	Hub_AddID_SQN        numeric(12) NULL ,
	Hub_StProvID_SQN     numeric(12) NULL ,
	CONSTRAINT XPKLnk_AddID_StProvID PRIMARY KEY   CLUSTERED (Lnk_AddID_StProvID_SQN  ASC),
	CONSTRAINT R_291  FOREIGN KEY (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN),
	CONSTRAINT R_292  FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
go



exec sp_primarykey 'Lnk_AddID_StProvID', Lnk_AddID_StProvID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_AddID_StProvID ON Lnk_AddID_StProvID
(
	Hub_AddID_SQN         ASC,
	Hub_StProvID_SQN      ASC
)
go



CREATE TABLE Hub_DocNode
(
	Hub_DocNode_SQN      numeric(12) IDENTITY ,
	Hub_DocNode_LDTS     datetime NOT NULL ,
	Hub_DocNode_RSRC     univarchar(18) NULL ,
	DocumentNode         char(18) NOT NULL ,
	CONSTRAINT PK_Document_DocumentNode PRIMARY KEY   CLUSTERED (Hub_DocNode_SQN  ASC)
)
go



exec sp_primarykey 'Hub_DocNode', Hub_DocNode_SQN
go



CREATE UNIQUE INDEX BK_DocumentNode ON Hub_DocNode
(
	DocumentNode          ASC
)
go



CREATE TABLE Lnk_ProdNum_DocNode
(
	Lnk_ProdNum_DocNode_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_DocNode_LDTS datetime NOT NULL ,
	Lnk_ProdNum_DocNode_RSRC univarchar(18) NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_DocNode_SQN      numeric(12) NULL ,
	CONSTRAINT PK_ProductDocument_ProductID_D PRIMARY KEY   CLUSTERED (Lnk_ProdNum_DocNode_SQN  ASC),
	CONSTRAINT R_194  FOREIGN KEY (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN),
	CONSTRAINT R_195  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_DocNode', Lnk_ProdNum_DocNode_SQN
go



CREATE UNIQUE INDEX AK_ProductDocument ON Lnk_ProdNum_DocNode
(
	Hub_ProdNum_SQN       ASC,
	Hub_DocNode_SQN       ASC
)
go



CREATE TABLE Sat_Prod_Doc
(
	Lnk_ProdNum_DocNode_SQN numeric(12) NOT NULL ,
	Sat_Prod_Doc_LDTS    datetime NOT NULL ,
	Sat_Prod_Doc_LEDTS   datetime NULL ,
	Sat_Prod_Doc_RSRC    univarchar(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SAT_ProductDocumentID PRIMARY KEY   CLUSTERED (Lnk_ProdNum_DocNode_SQN  ASC,Sat_Prod_Doc_LDTS  ASC),
	CONSTRAINT R_192  FOREIGN KEY (Lnk_ProdNum_DocNode_SQN) REFERENCES Lnk_ProdNum_DocNode(Lnk_ProdNum_DocNode_SQN)
)
go



exec sp_primarykey 'Sat_Prod_Doc', Lnk_ProdNum_DocNode_SQN, Sat_Prod_Doc_LDTS
go



CREATE TABLE Hub_ShopCartItemID
(
	Hub_ShopCartItemID_SQN numeric(12) IDENTITY ,
	Hub_ShopCartItemID_LDTS datetime NOT NULL ,
	Hub_ShopCartItemID_RSRC univarchar(18) NULL ,
	ShoppingCartItemID   int NOT NULL ,
	CONSTRAINT PK_ShoppingCartItem_ShoppingCa PRIMARY KEY   CLUSTERED (Hub_ShopCartItemID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_ShopCartItemID', Hub_ShopCartItemID_SQN
go



CREATE UNIQUE INDEX BK_ShopCartItemID ON Hub_ShopCartItemID
(
	ShoppingCartItemID    ASC
)
go



CREATE TABLE Sat_ShopCartItem
(
	Hub_ShopCartItemID_SQN numeric(12) NOT NULL ,
	Sat_ShopCartItem_LDTS datetime NOT NULL ,
	Sat_ShopCartItem_LEDTS datetime NULL ,
	Sat_ShopCartItem_RSRC univarchar(18) NULL ,
	ShoppingCartID       univarchar(50) NOT NULL ,
	Quantity             int NOT NULL ,
	DateCreated          datetime NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SAT_ShoppingCartItemID PRIMARY KEY   CLUSTERED (Hub_ShopCartItemID_SQN  ASC,Sat_ShopCartItem_LDTS  ASC),
	CONSTRAINT R_113  FOREIGN KEY (Hub_ShopCartItemID_SQN) REFERENCES Hub_ShopCartItemID(Hub_ShopCartItemID_SQN)
)
go



exec sp_primarykey 'Sat_ShopCartItem', Hub_ShopCartItemID_SQN, Sat_ShopCartItem_LDTS
go



CREATE TABLE Hub_SOrdNum
(
	Hub_SOrdNum_SQN      numeric(12) IDENTITY ,
	Hub_SOrdNum_LDTS     datetime NOT NULL ,
	Hub_SOrdNum_RSRC     univarchar(18) NULL ,
	SalesOrderNumber     univarchar(25) NOT NULL ,
	CONSTRAINT PK_SalesOrderHeader_SalesOrder PRIMARY KEY   CLUSTERED (Hub_SOrdNum_SQN  ASC)
)
go



exec sp_primarykey 'Hub_SOrdNum', Hub_SOrdNum_SQN
go



CREATE UNIQUE INDEX BK_SalesOrderHeaderID ON Hub_SOrdNum
(
	SalesOrderNumber      ASC
)
go



CREATE TABLE Hub_SRsnID
(
	Hub_SRsnID_SQN       numeric(12) IDENTITY ,
	Hub_SRsnID_LDTS      datetime NOT NULL ,
	Hub_SRsnID_RSRC      univarchar(18) NULL ,
	SalesReasonID        int NOT NULL ,
	CONSTRAINT PK_SalesReason_SalesReasonID PRIMARY KEY   CLUSTERED (Hub_SRsnID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_SRsnID', Hub_SRsnID_SQN
go



CREATE UNIQUE INDEX BK_SalesReasonID ON Hub_SRsnID
(
	SalesReasonID         ASC
)
go



CREATE TABLE Lnk_SOrdNum_SRsnID
(
	Lnk_SOrdNum_SRsnID_SQN numeric(12) IDENTITY ,
	Lnk_SOrdNum_SRsnID_LDTS datetime NOT NULL ,
	Lnk_SOrdNum_SRsnID_RSRC univarchar(18) NULL ,
	Hub_SOrdNum_SQN      numeric(12) NULL ,
	Hub_SRsnID_SQN       numeric(12) NULL ,
	CONSTRAINT PK_SalesOrderHeaderSalesReason PRIMARY KEY   CLUSTERED (Lnk_SOrdNum_SRsnID_SQN  ASC),
	CONSTRAINT R_188  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	CONSTRAINT R_189  FOREIGN KEY (Hub_SRsnID_SQN) REFERENCES Hub_SRsnID(Hub_SRsnID_SQN)
)
go



exec sp_primarykey 'Lnk_SOrdNum_SRsnID', Lnk_SOrdNum_SRsnID_SQN
go



CREATE UNIQUE INDEX AK_SalesOrderHeaderSalesReason ON Lnk_SOrdNum_SRsnID
(
	Hub_SOrdNum_SQN       ASC,
	Hub_SRsnID_SQN        ASC
)
go



CREATE TABLE Sat_SOrdNum_SRsnID
(
	Lnk_SOrdNum_SRsnID_SQN numeric(12) NOT NULL ,
	Sat_SOrdNum_SRsnID_LDTS datetime NOT NULL ,
	Sat_SOrdNum_SRsnID_LEDTS datetime NULL ,
	Sat_SOrdNum_SRsnID_RSRC univarchar(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SalesOrderHeaderSalesReason PRIMARY KEY   CLUSTERED (Lnk_SOrdNum_SRsnID_SQN  ASC,Sat_SOrdNum_SRsnID_LDTS  ASC),
	CONSTRAINT R_191  FOREIGN KEY (Lnk_SOrdNum_SRsnID_SQN) REFERENCES Lnk_SOrdNum_SRsnID(Lnk_SOrdNum_SRsnID_SQN)
)
go



exec sp_primarykey 'Sat_SOrdNum_SRsnID', Lnk_SOrdNum_SRsnID_SQN, Sat_SOrdNum_SRsnID_LDTS
go



CREATE TABLE Lnk_ProdNum_ShopCartItemID
(
	Lnk_ProdNum_ShopCartItemID_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_ShopCartItemID_LDT datetime NOT NULL ,
	Lnk_ProdNum_ShopCartItemID_RSR univarchar(18) NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_ShopCartItemID_SQN numeric(12) NULL ,
	CONSTRAINT PK_ShoppingCartItem_ShoppingCa PRIMARY KEY   CLUSTERED (Lnk_ProdNum_ShopCartItemID_SQN  ASC),
	CONSTRAINT R_118  FOREIGN KEY (Hub_ShopCartItemID_SQN) REFERENCES Hub_ShopCartItemID(Hub_ShopCartItemID_SQN),
	CONSTRAINT R_119  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_ShopCartItemID', Lnk_ProdNum_ShopCartItemID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_ProdNum_ShopCartItemID ON Lnk_ProdNum_ShopCartItemID
(
	Hub_ShopCartItemID_SQN  ASC,
	Hub_ProdNum_SQN       ASC
)
go



CREATE TABLE Hub_ProdPhotoID
(
	Hub_ProdPhotoID_SQN  numeric(12) IDENTITY ,
	Hub_ProdPhotoID_LDTS datetime NOT NULL ,
	Hub_ProdPhotoID_RSRC univarchar(18) NULL ,
	ProductPhotoID       int NOT NULL ,
	CONSTRAINT PK_ProductPhoto_ProductPhotoID PRIMARY KEY   CLUSTERED (Hub_ProdPhotoID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_ProdPhotoID', Hub_ProdPhotoID_SQN
go



CREATE UNIQUE INDEX BK_ProdPhotoID ON Hub_ProdPhotoID
(
	ProductPhotoID        ASC
)
go



CREATE TABLE Lnk_ProdNum_ProdPhotoID
(
	Lnk_ProdNum_ProdPhotoID_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_ProdPhotoID_LDTS datetime NOT NULL ,
	Lnk_ProdNum_ProdPhotoID_RSRC univarchar(18) NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_ProdPhotoID_SQN  numeric(12) NULL ,
	CONSTRAINT PK_ProductProductPhoto_Product PRIMARY KEY   NONCLUSTERED (Lnk_ProdNum_ProdPhotoID_SQN  ASC),
	CONSTRAINT R_108  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_109  FOREIGN KEY (Hub_ProdPhotoID_SQN) REFERENCES Hub_ProdPhotoID(Hub_ProdPhotoID_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_ProdPhotoID', Lnk_ProdNum_ProdPhotoID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_ProdNum_ProdPhotoID ON Lnk_ProdNum_ProdPhotoID
(
	Hub_ProdNum_SQN       ASC,
	Hub_ProdPhotoID_SQN   ASC
)
go



CREATE TABLE Sat_Prod_ProdPhoto
(
	Lnk_ProdNum_ProdPhotoID_SQN numeric(12) NOT NULL ,
	Sat_ProdNum_ProdPhotoID_LDTS datetime NOT NULL ,
	Sat_ProdNum_ProdPhotoID_LEDTS datetime NULL ,
	Sat_ProdNum_ProdPhotoID_RSRC univarchar(18) NULL ,
	Primary              bit NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ProductProductPhoto_Product PRIMARY KEY   NONCLUSTERED (Lnk_ProdNum_ProdPhotoID_SQN  ASC,Sat_ProdNum_ProdPhotoID_LDTS  ASC),
	CONSTRAINT R_107  FOREIGN KEY (Lnk_ProdNum_ProdPhotoID_SQN) REFERENCES Lnk_ProdNum_ProdPhotoID(Lnk_ProdNum_ProdPhotoID_SQN)
)
go



exec sp_primarykey 'Sat_Prod_ProdPhoto', Lnk_ProdNum_ProdPhotoID_SQN, Sat_ProdNum_ProdPhotoID_LDTS
go



CREATE TABLE Sat_ProdPhoto
(
	Hub_ProdPhotoID_SQN  numeric(12) NOT NULL ,
	Sat_ProdPhoto_LDTS   datetime NOT NULL ,
	Sat_ProdPhoto_LEDTS  datetime NULL ,
	Sat_ProdPhoto_RSRC   univarchar(18) NULL ,
	ThumbNailPhoto       varbinary NULL ,
	ThumbnailPhotoFileName univarchar(50) NULL ,
	LargePhoto           varbinary NULL ,
	LargePhotoFileName   univarchar(50) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ProductPhoto_ProductPhotoID PRIMARY KEY   CLUSTERED (Hub_ProdPhotoID_SQN  ASC,Sat_ProdPhoto_LDTS  ASC),
	CONSTRAINT R_110  FOREIGN KEY (Hub_ProdPhotoID_SQN) REFERENCES Hub_ProdPhotoID(Hub_ProdPhotoID_SQN)
)
go



exec sp_primarykey 'Sat_ProdPhoto', Hub_ProdPhotoID_SQN, Sat_ProdPhoto_LDTS
go



CREATE TABLE Hub_SOfrID
(
	Hub_SOfrID_SQN       numeric(12) IDENTITY ,
	Hub_SOfrID_LDTS      datetime NOT NULL ,
	Hub_SOfrID_RSRC      univarchar(18) NULL ,
	SpecialOfferID       int NOT NULL ,
	CONSTRAINT PK_SpecialOffer_SpecialOfferID PRIMARY KEY   CLUSTERED (Hub_SOfrID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_SOfrID', Hub_SOfrID_SQN
go



CREATE UNIQUE INDEX BK_SpecialOfferID ON Hub_SOfrID
(
	SpecialOfferID        ASC
)
go



CREATE TABLE Sat_SOfr
(
	Hub_SOfrID_SQN       numeric(12) NOT NULL ,
	Sat_SOfr_LDTS        datetime NOT NULL ,
	Sat_SOfr_LEDTS       datetime NULL ,
	Sat_SOfr_RSRC        univarchar(18) NULL ,
	Description          univarchar(255) NOT NULL ,
	DiscountPct          smallmoney NOT NULL ,
	Type                 univarchar(50) NOT NULL ,
	Category             univarchar(50) NOT NULL ,
	StartDate            datetime NOT NULL ,
	EndDate              datetime NOT NULL ,
	MinQty               int NOT NULL ,
	MaxQty               int NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SpecialOffer_SpecialOfferID PRIMARY KEY   CLUSTERED (Hub_SOfrID_SQN  ASC,Sat_SOfr_LDTS  ASC),
	CONSTRAINT R_182  FOREIGN KEY (Hub_SOfrID_SQN) REFERENCES Hub_SOfrID(Hub_SOfrID_SQN)
)
go



exec sp_primarykey 'Sat_SOfr', Hub_SOfrID_SQN, Sat_SOfr_LDTS
go



CREATE TABLE Lnk_ProdNum_SOrdNum_SOfrID
(
	Lnk_ProdNum_SOrdNum_SOfrID_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_SOrdNum_SOfrID_LDT datetime NOT NULL ,
	Lnk_ProdNum_SOrdNum_SOfrID_RSR univarchar(18) NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_SOrdNum_SQN      numeric(12) NULL ,
	Hub_SOfrID_SQN       numeric(12) NULL ,
	SalesOrderDetailID   int NOT NULL ,
	CONSTRAINT PK_SpecialOfferProduct_Special PRIMARY KEY   CLUSTERED (Lnk_ProdNum_SOrdNum_SOfrID_SQN  ASC),
	CONSTRAINT R_174  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_176  FOREIGN KEY (Hub_SOfrID_SQN) REFERENCES Hub_SOfrID(Hub_SOfrID_SQN),
	CONSTRAINT R_186  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_SOrdNum_SOfrID', Lnk_ProdNum_SOrdNum_SOfrID_SQN
go



CREATE UNIQUE INDEX AK_SpecialOfferProduct ON Lnk_ProdNum_SOrdNum_SOfrID
(
	Hub_ProdNum_SQN       ASC,
	Hub_SOfrID_SQN        ASC,
	SalesOrderDetailID    ASC,
	Hub_SOrdNum_SQN       ASC
)
go



CREATE TABLE Sat_SOrdDet
(
	Lnk_ProdNum_SOrdID_SOfrID_SQN numeric(12) NOT NULL ,
	Sat_SOrdDet_LDTS     datetime NOT NULL ,
	Sat_SOrdDet_LEDTS    datetime NULL ,
	Sat_SOrdDet_RSRC     univarchar(18) NULL ,
	CarrierTrackingNumber univarchar(25) NULL ,
	OrderQty             smallint NOT NULL ,
	UnitPrice            money NOT NULL ,
	UnitPriceDiscount    money NOT NULL ,
	LineTotal            numeric(38,6) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SalesOrderDetail_SalesOrder PRIMARY KEY   CLUSTERED (Lnk_ProdNum_SOrdID_SOfrID_SQN  ASC,Sat_SOrdDet_LDTS  ASC),
	CONSTRAINT R_181  FOREIGN KEY (Lnk_ProdNum_SOrdID_SOfrID_SQN) REFERENCES Lnk_ProdNum_SOrdNum_SOfrID(Lnk_ProdNum_SOrdNum_SOfrID_SQN)
)
go



exec sp_primarykey 'Sat_SOrdDet', Lnk_ProdNum_SOrdID_SOfrID_SQN, Sat_SOrdDet_LDTS
go



CREATE TABLE Hub_LocID
(
	Hub_LocID_SQN        numeric(12) IDENTITY ,
	Hub_LocID_LDTS       datetime NOT NULL ,
	Hub_LocID_RSRC       univarchar(18) NULL ,
	LocationID           smallint NOT NULL ,
	CONSTRAINT PK_Location_LocationID PRIMARY KEY   CLUSTERED (Hub_LocID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_LocID', Hub_LocID_SQN
go



CREATE UNIQUE INDEX BK_LocationID ON Hub_LocID
(
	LocationID            ASC
)
go



CREATE TABLE Sat_Loc
(
	Hub_LocID_SQN        numeric(12) NOT NULL ,
	Sat_Loc_LDTS         datetime NOT NULL ,
	Sat_Loc_LEDTS        datetime NULL ,
	Sat_Loc_RSRC         univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	CostRate             smallmoney NOT NULL ,
	Availability         decimal(8,2) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Location_LocationID PRIMARY KEY   CLUSTERED (Hub_LocID_SQN  ASC,Sat_Loc_LDTS  ASC),
	CONSTRAINT R_161  FOREIGN KEY (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
go



exec sp_primarykey 'Sat_Loc', Hub_LocID_SQN, Sat_Loc_LDTS
go



CREATE UNIQUE INDEX AK_Location_Name ON Sat_Loc
(
	Name                  ASC
)
go



CREATE TABLE Sat_ProdNum_SOrdNum_SOfrID
(
	Lnk_ProdNum_SOrdNum_SOfrID_SQN numeric(12) NOT NULL ,
	Sat_ProdNum_SOrdNum_SOfrID_LDT datetime NOT NULL ,
	Sat_ProdNum_SOrdNum_SOfrID_LED datetime NULL ,
	Sat_ProdNum_SOrdNum_SOfrID_RSR univarchar(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SpecialOfferProduct_Special PRIMARY KEY   CLUSTERED (Lnk_ProdNum_SOrdNum_SOfrID_SQN  ASC,Sat_ProdNum_SOrdNum_SOfrID_LDT  ASC),
	CONSTRAINT R_175  FOREIGN KEY (Lnk_ProdNum_SOrdNum_SOfrID_SQN) REFERENCES Lnk_ProdNum_SOrdNum_SOfrID(Lnk_ProdNum_SOrdNum_SOfrID_SQN)
)
go



exec sp_primarykey 'Sat_ProdNum_SOrdNum_SOfrID', Lnk_ProdNum_SOrdNum_SOfrID_SQN, Sat_ProdNum_SOrdNum_SOfrID_LDT
go



CREATE TABLE Hub_TransID
(
	Hub_TransID_SQN      numeric(12) IDENTITY ,
	Hub_TransID_LDTS     datetime NOT NULL ,
	Hub_TransID_RSRC     univarchar(18) NULL ,
	TransactionID        int NOT NULL ,
	CONSTRAINT PK_TransactionHistory_Transact PRIMARY KEY   CLUSTERED (Hub_TransID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_TransID', Hub_TransID_SQN
go



CREATE UNIQUE INDEX BK_TransID ON Hub_TransID
(
	TransactionID         ASC
)
go



CREATE TABLE Sat_TransHist
(
	Hub_TransID_SQN      numeric(12) NOT NULL ,
	Sat_TransHist_LDTS   datetime NOT NULL ,
	Sat_TransHist_LEDTS  datetime NULL ,
	Sat_TransHist_RSRC   univarchar(18) NULL ,
	TransactionID        int IDENTITY ,
	ReferenceOrderID     int NOT NULL ,
	ReferenceOrderLineID int NOT NULL ,
	TransactionDate      datetime NOT NULL ,
	TransactionType      unichar(1) NOT NULL ,
	Quantity             int NOT NULL ,
	ActualCost           money NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_TransactionHistory_Transact PRIMARY KEY   CLUSTERED (Hub_TransID_SQN  ASC,Sat_TransHist_LDTS  ASC),
	CONSTRAINT R_97  FOREIGN KEY (Hub_TransID_SQN) REFERENCES Hub_TransID(Hub_TransID_SQN)
)
go



exec sp_primarykey 'Sat_TransHist', Hub_TransID_SQN, Sat_TransHist_LDTS
go



CREATE INDEX IX_TransactionHistory_Referenc ON Sat_TransHist
(
	ReferenceOrderID      ASC,
	ReferenceOrderLineID  ASC
)
go



CREATE TABLE Sat_ProdListPriceHist
(
	Hub_ProdNum_SQN      numeric(12) NOT NULL ,
	Sat_ProdListPriceHist_LDTS datetime NOT NULL ,
	Sat_ProdListPriceHist_LEDTS datetime NULL ,
	Sat_ProdListPriceHist_RSRC univarchar(18) NULL ,
	StartDate            datetime NOT NULL ,
	EndDate              datetime NULL ,
	ListPrice            money NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ProductListPriceHistory_Pro PRIMARY KEY   CLUSTERED (Hub_ProdNum_SQN  ASC,Sat_ProdListPriceHist_LDTS  ASC),
	CONSTRAINT R_95  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
go



exec sp_primarykey 'Sat_ProdListPriceHist', Hub_ProdNum_SQN, Sat_ProdListPriceHist_LDTS
go



CREATE TABLE Sat_ProdCostHist
(
	Hub_ProdNum_SQN      numeric(12) NOT NULL ,
	Sat_ProdCostHist_LDTS datetime NOT NULL ,
	Sat_ProdCostHist_LEDTS datetime NULL ,
	Sat_ProdCostHist_RSRC univarchar(18) NULL ,
	StartDate            datetime NOT NULL ,
	EndDate              datetime NULL ,
	StandardCost         money NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ProductCostHistory_ProductI PRIMARY KEY   CLUSTERED (Hub_ProdNum_SQN  ASC,Sat_ProdCostHist_LDTS  ASC),
	CONSTRAINT R_94  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
go



exec sp_primarykey 'Sat_ProdCostHist', Hub_ProdNum_SQN, Sat_ProdCostHist_LDTS
go



CREATE TABLE Sat_ProdRev
(
	Hub_ProdNum_SQN      numeric(12) NOT NULL ,
	Sat_ProdRev_LDTS     datetime NOT NULL ,
	Sat_ProdRev_LEDTS    datetime NULL ,
	Sat_ProdRev_RSRC     univarchar(18) NULL ,
	ProductReviewID      int IDENTITY ,
	ReviewerName         univarchar(50) NOT NULL ,
	ReviewDate           datetime NOT NULL ,
	EmailAddress         univarchar(50) NOT NULL ,
	Rating               int NOT NULL ,
	Comments             univarchar(255) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ProductReview_ProductReview PRIMARY KEY   CLUSTERED (Hub_ProdNum_SQN  ASC,Sat_ProdRev_LDTS  ASC),
	CONSTRAINT R_93  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
go



exec sp_primarykey 'Sat_ProdRev', Hub_ProdNum_SQN, Sat_ProdRev_LDTS
go



CREATE INDEX IX_ProductReview_ProductID_Nam ON Sat_ProdRev
(
	ReviewerName          ASC
)
go



CREATE TABLE Hub_Wrk_Ord
(
	Hub_WOID_SQN         numeric(12) IDENTITY ,
	Hub_WOID_LDTS        datetime NOT NULL ,
	Hub_WOID_RSRC        univarchar(18) NULL ,
	WorkOrderID          int NOT NULL ,
	CONSTRAINT PK_WorkOrder_WorkOrderID PRIMARY KEY   CLUSTERED (Hub_WOID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_Wrk_Ord', Hub_WOID_SQN
go



CREATE UNIQUE INDEX BK_WorkOrderID ON Hub_Wrk_Ord
(
	WorkOrderID           ASC
)
go



CREATE TABLE Sat_Wrk_Ord
(
	Hub_WOID_SQN         numeric(12) NOT NULL ,
	Sat_WOID_LDTS        datetime NOT NULL ,
	Sat_WOID_LEDTS       datetime NULL ,
	Sat_WOID_RSRC        univarchar(18) NULL ,
	OrderQty             int NOT NULL ,
	StockedQty           int NOT NULL ,
	ScrappedQty          smallint NOT NULL ,
	StartDate            datetime NOT NULL ,
	EndDate              datetime NULL ,
	DueDate              datetime NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_WorkOrder_WorkOrderID PRIMARY KEY   CLUSTERED (Hub_WOID_SQN  ASC,Sat_WOID_LDTS  ASC),
	CONSTRAINT R_164  FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN)
)
go



exec sp_primarykey 'Sat_Wrk_Ord', Hub_WOID_SQN, Sat_WOID_LDTS
go



CREATE TABLE Hub_EmpID
(
	Hub_EmpID_SQN        numeric(12) IDENTITY ,
	Hub_EmpID_LDTS       datetime NOT NULL ,
	Hub_EmpID_RSRC       univarchar(18) NULL ,
	EmployeeID           integer NOT NULL ,
	CONSTRAINT PK_Employee_BusinessEntityID PRIMARY KEY   CLUSTERED (Hub_EmpID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_EmpID', Hub_EmpID_SQN
go



CREATE UNIQUE INDEX BK_EmployeeID ON Hub_EmpID
(
	EmployeeID            ASC
)
go



CREATE TABLE Sat_EmpPayHist
(
	Hub_EmpID_SQN        numeric(12) NOT NULL ,
	Sat_EmpPayHist_LDTS  datetime NOT NULL ,
	Sat_EmpPayHist_LEDTS datetime NULL ,
	Sat_EmpPayHist_RSRC  univarchar(18) NULL ,
	RateChangeDate       datetime NOT NULL ,
	Rate                 money NOT NULL ,
	PayFrequency         tinyint NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_EmployeePayHistory_Business PRIMARY KEY   CLUSTERED (Hub_EmpID_SQN  ASC,Sat_EmpPayHist_LDTS  ASC),
	CONSTRAINT R_206  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
go



exec sp_primarykey 'Sat_EmpPayHist', Hub_EmpID_SQN, Sat_EmpPayHist_LDTS
go



CREATE TABLE ErrorLog
(
	ErrorLogID           int IDENTITY ,
	ErrorTime            datetime NOT NULL ,
	UserName             varchar(20) NOT NULL ,
	ErrorNumber          int NOT NULL ,
	ErrorSeverity        int NULL ,
	ErrorState           int NULL ,
	ErrorProcedure       univarchar(126) NULL ,
	ErrorLine            int NULL ,
	ErrorMessage         univarchar(255) NOT NULL ,
	CONSTRAINT PK_ErrorLog_ErrorLogID PRIMARY KEY   CLUSTERED (ErrorLogID  ASC)
)
go



exec sp_primarykey 'ErrorLog', ErrorLogID
go



CREATE TABLE DatabaseLog
(
	DatabaseLogID        int IDENTITY ,
	PostTime             datetime NOT NULL ,
	DatabaseUser         varchar(20) NOT NULL ,
	Event                varchar(20) NOT NULL ,
	Schema               varchar(20) NULL ,
	Object               varchar(20) NULL ,
	TSQL                 nvarchar(255) NOT NULL ,
	XmlEvent             text NOT NULL ,
	CONSTRAINT PK_DatabaseLog_DatabaseLogID PRIMARY KEY   NONCLUSTERED (DatabaseLogID  ASC)
)
go



exec sp_primarykey 'DatabaseLog', DatabaseLogID
go



CREATE TABLE TransactionHistoryArchive
(
	TransactionID        int NOT NULL ,
	ProductID            int NOT NULL ,
	ReferenceOrderID     int NOT NULL ,
	ReferenceOrderLineID int NOT NULL ,
	TransactionDate      datetime NOT NULL ,
	TransactionType      unichar(1) NOT NULL ,
	Quantity             int NOT NULL ,
	ActualCost           money NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_TransactionHistoryArchive_T PRIMARY KEY   CLUSTERED (TransactionID  ASC)
)
go



exec sp_primarykey 'TransactionHistoryArchive', TransactionID
go



CREATE INDEX IX_TransactionHistoryArchive_P ON TransactionHistoryArchive
(
	ProductID             ASC
)
go



CREATE INDEX IX_TransactionHistoryArchive_R ON TransactionHistoryArchive
(
	ReferenceOrderID      ASC,
	ReferenceOrderLineID  ASC
)
go



CREATE TABLE AWBuildVersion
(
	SystemInformationID  tinyint IDENTITY ,
	Database_Version     univarchar(25) NOT NULL ,
	VersionDate          datetime NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_AWBuildVersion_SystemInform PRIMARY KEY   CLUSTERED (SystemInformationID  ASC)
)
go



exec sp_primarykey 'AWBuildVersion', SystemInformationID
go



CREATE TABLE Lnk_ProdNum_TransID
(
	Lnk_ProdNum_TransID_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_TransID_LDTS datetime NOT NULL ,
	Lnk_ProdNum_TransID_RSRC univarchar(18) NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_TransID_SQN      numeric(12) NULL ,
	CONSTRAINT PK_TransactionHistory_Transact PRIMARY KEY   CLUSTERED (Lnk_ProdNum_TransID_SQN  ASC),
	CONSTRAINT R_104  FOREIGN KEY (Hub_TransID_SQN) REFERENCES Hub_TransID(Hub_TransID_SQN),
	CONSTRAINT R_105  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_TransID', Lnk_ProdNum_TransID_SQN
go



CREATE UNIQUE INDEX AK_TransactionHistory ON Lnk_ProdNum_TransID
(
	Hub_TransID_SQN       ASC,
	Hub_ProdNum_SQN       ASC
)
go



CREATE TABLE Hub_CCID
(
	Hub_CCID_SQN         numeric(12) IDENTITY ,
	Hub_CCID_LDTS        datetime NOT NULL ,
	Hub_CCID_RSRC        univarchar(18) NULL ,
	CreditCardID         int NOT NULL ,
	CONSTRAINT PK_CreditCard_CreditCardID PRIMARY KEY   CLUSTERED (Hub_CCID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_CCID', Hub_CCID_SQN
go



CREATE UNIQUE INDEX BK_CreditCardID ON Hub_CCID
(
	CreditCardID          ASC
)
go



CREATE TABLE Sat_CC
(
	Hub_CCID_SQN         numeric(12) NOT NULL ,
	Sat_CC_LDTS          datetime NOT NULL ,
	Sat_CC_LEDTS         datetime NULL ,
	Sat_CC_RSRC          univarchar(18) NULL ,
	CardType             univarchar(50) NOT NULL ,
	CardNumber           univarchar(25) NOT NULL ,
	ExpMonth             tinyint NOT NULL ,
	ExpYear              smallint NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_CreditCard_CreditCardID PRIMARY KEY   CLUSTERED (Hub_CCID_SQN  ASC,Sat_CC_LDTS  ASC),
	CONSTRAINT R_198  FOREIGN KEY (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN)
)
go



exec sp_primarykey 'Sat_CC', Hub_CCID_SQN, Sat_CC_LDTS
go



CREATE UNIQUE INDEX AK_CreditCard_CardNumber ON Sat_CC
(
	CardNumber            ASC
)
go



CREATE TABLE Hub_JobCandID
(
	Hub_JobCandID_SQN    numeric(12) IDENTITY ,
	Hub_JobCandID_LDTS   datetime NOT NULL ,
	Hub_JobCandID_RSRC   univarchar(18) NULL ,
	JobCandidateID       int NOT NULL ,
	CONSTRAINT PK_JobCandidate_JobCandidateID PRIMARY KEY   CLUSTERED (Hub_JobCandID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_JobCandID', Hub_JobCandID_SQN
go



CREATE UNIQUE INDEX BK_JobCandidateID ON Hub_JobCandID
(
	JobCandidateID        ASC
)
go



CREATE TABLE Sat_JobCand
(
	Hub_JobCandID_SQN    numeric(12) NOT NULL ,
	Sat_JobCand_LDTS     datetime NOT NULL ,
	Sat_JobCand_LEDTS    datetime NULL ,
	Sat_JobCand_RSRC     univarchar(18) NULL ,
	Resume               text NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_JobCandidate_JobCandidateID PRIMARY KEY   CLUSTERED (Hub_JobCandID_SQN  ASC,Sat_JobCand_LDTS  ASC),
	CONSTRAINT R_209  FOREIGN KEY (Hub_JobCandID_SQN) REFERENCES Hub_JobCandID(Hub_JobCandID_SQN)
)
go



exec sp_primarykey 'Sat_JobCand', Hub_JobCandID_SQN, Sat_JobCand_LDTS
go



CREATE TABLE Lnk_WOID_LocID
(
	Lnk_WOID_LocID_WOOpSeqID_SQN numeric(12) IDENTITY ,
	Lnk_WOID_LocID_WOOpSeqID_LDTS datetime NOT NULL ,
	Lnk_WOID_LocID_WOOpSeqID_RSRC univarchar(18) NULL ,
	Hub_WOID_SQN         numeric(12) NULL ,
	Hub_LocID_SQN        numeric(12) NULL ,
	Oper_Seq             smallint NOT NULL ,
	CONSTRAINT PK_WorkOrderRouting PRIMARY KEY   CLUSTERED (Lnk_WOID_LocID_WOOpSeqID_SQN  ASC),
	CONSTRAINT R_168  FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN),
	CONSTRAINT R_169  FOREIGN KEY (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
go



exec sp_primarykey 'Lnk_WOID_LocID', Lnk_WOID_LocID_WOOpSeqID_SQN
go



CREATE UNIQUE INDEX AK_WorkOrderRouting ON Lnk_WOID_LocID
(
	Hub_WOID_SQN          ASC,
	Hub_LocID_SQN         ASC,
	Oper_Seq              ASC
)
go



CREATE TABLE Sat_WOID_LocID
(
	Lnk_WOID_LocID_SQN   numeric(12) NOT NULL ,
	Sat_WOID_LocID_LDTS  datetime NOT NULL ,
	Sat_WOID_LocID_LEDTS datetime NULL ,
	Sat_WOID_LocID_RSRC  univarchar(18) NULL ,
	ScheduledStartDate   datetime NOT NULL ,
	ScheduledEndDate     datetime NOT NULL ,
	ActualStartDate      datetime NULL ,
	ActualEndDate        datetime NULL ,
	ActualResourceHrs    decimal(9,4) NULL ,
	PlannedCost          money NOT NULL ,
	ActualCost           money NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_WorkOrderRouting_WorkOrderI PRIMARY KEY   CLUSTERED (Lnk_WOID_LocID_SQN  ASC,Sat_WOID_LocID_LDTS  ASC),
	CONSTRAINT R_180  FOREIGN KEY (Lnk_WOID_LocID_SQN) REFERENCES Lnk_WOID_LocID(Lnk_WOID_LocID_WOOpSeqID_SQN)
)
go



exec sp_primarykey 'Sat_WOID_LocID', Lnk_WOID_LocID_SQN, Sat_WOID_LocID_LDTS
go



CREATE TABLE Hub_PersID
(
	Hub_PersID_SQN       numeric(12) IDENTITY ,
	Hub_PersID_LDTS      datetime NOT NULL ,
	Hub_PersID_RSRC      univarchar(18) NULL ,
	PersonID             integer NOT NULL ,
	CONSTRAINT PK_Person_BusinessEntityID PRIMARY KEY   CLUSTERED (Hub_PersID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_PersID', Hub_PersID_SQN
go



CREATE UNIQUE INDEX BK_PersonID ON Hub_PersID
(
	PersonID              ASC
)
go



CREATE TABLE Hub_BusEntID
(
	Hub_BusEntID_SQN     numeric(12) IDENTITY ,
	Hub_BusEntID_LDTS    datetime NOT NULL ,
	Hub_BusEntID_RSRC    univarchar(18) NULL ,
	BusinessEntityID     int NOT NULL ,
	CONSTRAINT PK_BusinessEntity_BusinessEnti PRIMARY KEY   CLUSTERED (Hub_BusEntID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_BusEntID', Hub_BusEntID_SQN
go



CREATE UNIQUE INDEX BK_BusinessEntityID ON Hub_BusEntID
(
	BusinessEntityID      ASC
)
go



CREATE TABLE Lnk_PersID_BusEntID
(
	Lnk_PersID_BusEntID_SQN numeric(12) IDENTITY ,
	Lnk_PersID_BusEntID_LDTS datetime NOT NULL ,
	Lnk_PersID_BusEntID_RSRC univarchar(18) NULL ,
	Hub_BusEntID_SQN     numeric(12) NULL ,
	Hub_PersID_SQN       numeric(12) NULL ,
	CONSTRAINT XPKLnk_PersID_BEID PRIMARY KEY   CLUSTERED (Lnk_PersID_BusEntID_SQN  ASC),
	CONSTRAINT R_269  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	CONSTRAINT R_270  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN)
)
go



exec sp_primarykey 'Lnk_PersID_BusEntID', Lnk_PersID_BusEntID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_PersID_BEID ON Lnk_PersID_BusEntID
(
	Hub_PersID_SQN        ASC,
	Hub_BusEntID_SQN      ASC
)
go



CREATE TABLE Hub_ScrapID
(
	Hub_ScrapID_SQN      numeric(12) IDENTITY ,
	Hub_ScrapID_LDTS     datetime NOT NULL ,
	Hub_ScrapID_RSRC     univarchar(18) NULL ,
	ScrapReasonID        smallint NOT NULL ,
	CONSTRAINT PK_ScrapReason_ScrapReasonID PRIMARY KEY   CLUSTERED (Hub_ScrapID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_ScrapID', Hub_ScrapID_SQN
go



CREATE UNIQUE INDEX BK_ScrapReasonID ON Hub_ScrapID
(
	ScrapReasonID         ASC
)
go



CREATE TABLE Lnk_Wrk_Ord_ScrapID
(
	Lnk_WOID_ScrapID_SQN numeric(12) IDENTITY ,
	Lnk_WOID_ScrapID_LDTS datetime NOT NULL ,
	Lnk_WOID_ScrapID_RSRC univarchar(18) NULL ,
	Hub_WOID_SQN         numeric(12) NOT NULL ,
	Hub_ScrapID_SQN      numeric(12) NOT NULL ,
	CONSTRAINT PK_ScrapReason_ScrapReasonID PRIMARY KEY   CLUSTERED (Lnk_WOID_ScrapID_SQN  ASC),
	CONSTRAINT R_165  FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN),
	CONSTRAINT R_166  FOREIGN KEY (Hub_ScrapID_SQN) REFERENCES Hub_ScrapID(Hub_ScrapID_SQN)
)
go



exec sp_primarykey 'Lnk_Wrk_Ord_ScrapID', Lnk_WOID_ScrapID_SQN
go



CREATE UNIQUE INDEX AK_ScrapReason ON Lnk_Wrk_Ord_ScrapID
(
	Hub_WOID_SQN          ASC,
	Hub_ScrapID_SQN       ASC
)
go



CREATE TABLE Lnk_SOrdNum_CCID
(
	Lnk_SOrdNum_CCID_SQN numeric(12) IDENTITY ,
	Lnk_SOrdNum_CCID_LDTS datetime NOT NULL ,
	Lnk_SOrdNum_CCID_RSRC univarchar(18) NULL ,
	Hub_SOrdNum_SQN      numeric(12) NULL ,
	Hub_CCID_SQN         numeric(12) NULL ,
	CONSTRAINT XPKLnk_SOrdNum_Add PRIMARY KEY   CLUSTERED (Lnk_SOrdNum_CCID_SQN  ASC),
	CONSTRAINT R_196  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	CONSTRAINT R_197  FOREIGN KEY (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN)
)
go



exec sp_primarykey 'Lnk_SOrdNum_CCID', Lnk_SOrdNum_CCID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_Add ON Lnk_SOrdNum_CCID
(
	Hub_SOrdNum_SQN       ASC,
	Hub_CCID_SQN          ASC
)
go



CREATE TABLE Sat_Scrap
(
	Hub_ScrapID_SQN      numeric(12) NOT NULL ,
	Sat_Scrap_LDTS       datetime NOT NULL ,
	Sat_Scrap_LEDTS      datetime NULL ,
	Sat_Scrap_RSRC       univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ScrapReason_ScrapReasonID PRIMARY KEY   CLUSTERED (Hub_ScrapID_SQN  ASC,Sat_Scrap_LDTS  ASC),
	CONSTRAINT R_167  FOREIGN KEY (Hub_ScrapID_SQN) REFERENCES Hub_ScrapID(Hub_ScrapID_SQN)
)
go



exec sp_primarykey 'Sat_Scrap', Hub_ScrapID_SQN, Sat_Scrap_LDTS
go



CREATE UNIQUE INDEX AK_ScrapReason_Name ON Sat_Scrap
(
	Name                  ASC
)
go



CREATE TABLE Sat_Prod
(
	Hub_ProdNum_SQN      numeric(12) NOT NULL ,
	Sat_Prod_LDTS        datetime NOT NULL ,
	Sat_Prod_LEDTS       datetime NULL ,
	Sat_Prod_RSRC        univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	MakeFlag             bit NOT NULL ,
	FinishedGoodsFlag    bit NOT NULL ,
	Color                univarchar(15) NULL ,
	SafetyStockLevel     smallint NOT NULL ,
	ReorderPoint         smallint NOT NULL ,
	StandardCost         money NOT NULL ,
	ListPrice            money NOT NULL ,
	Size                 univarchar(5) NULL ,
	Weight               decimal(8,2) NULL ,
	DaysToManufacture    int NOT NULL ,
	ProductLine          unichar(2) NULL ,
	Class                unichar(2) NULL ,
	Style                unichar(2) NULL ,
	SellStartDate        datetime NOT NULL ,
	SellEndDate          datetime NULL ,
	DiscontinuedDate     datetime NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Product_ProductID PRIMARY KEY   CLUSTERED (Hub_ProdNum_SQN  ASC,Sat_Prod_LDTS  ASC),
	CONSTRAINT R_92  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN)
)
go



exec sp_primarykey 'Sat_Prod', Hub_ProdNum_SQN, Sat_Prod_LDTS
go



CREATE UNIQUE INDEX AK_Product_Name ON Sat_Prod
(
	Name                  ASC
)
go



CREATE TABLE Lnk_SOrdNum_AddID
(
	Lnk_SOrdNum_AddID_SQN numeric(12) IDENTITY ,
	Lnk_SOrdNum_AddID_LDTS datetime NOT NULL ,
	Lnk_SOrdNum_AddID_RSRC univarchar(18) NULL ,
	Hub_SOrdNum_SQN      numeric(12) NULL ,
	Hub_AddID_BillTo_SQN numeric(12) NULL ,
	Hub_AddID_ShipTo_SQN numeric(12) NULL ,
	CONSTRAINT XPKLnk_SOrdNum_Add PRIMARY KEY   CLUSTERED (Lnk_SOrdNum_AddID_SQN  ASC),
	CONSTRAINT R_287  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN),
	CONSTRAINT R_288  FOREIGN KEY (Hub_AddID_BillTo_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN),
	CONSTRAINT R_290  FOREIGN KEY (Hub_AddID_ShipTo_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
go



exec sp_primarykey 'Lnk_SOrdNum_AddID', Lnk_SOrdNum_AddID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_Add ON Lnk_SOrdNum_AddID
(
	Hub_SOrdNum_SQN       ASC,
	Hub_AddID_BillTo_SQN  ASC,
	Hub_AddID_ShipTo_SQN  ASC
)
go



CREATE TABLE Lnk_ProdNum_WOID
(
	Lnk_ProdNum_WOID_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_WOID_LDTS datetime NOT NULL ,
	Lnk_ProdNum_WOID_RSRC univarchar(18) NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_WOID_SQN         numeric(12) NULL ,
	CONSTRAINT PK_WorkOrder_WorkOrderID PRIMARY KEY   CLUSTERED (Lnk_ProdNum_WOID_SQN  ASC),
	CONSTRAINT R_162  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_163  FOREIGN KEY (Hub_WOID_SQN) REFERENCES Hub_Wrk_Ord(Hub_WOID_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_WOID', Lnk_ProdNum_WOID_SQN
go



CREATE UNIQUE INDEX AK_WorkOrder ON Lnk_ProdNum_WOID
(
	Hub_ProdNum_SQN       ASC,
	Hub_WOID_SQN          ASC
)
go



CREATE TABLE Lnk_DocNode_EmpID
(
	Lnk_DocNode_EmpID_SQN numeric(12) IDENTITY ,
	Lnk_DocNode_EmpID_LDTS datetime NOT NULL ,
	Lnk_DocNode_EmpID_RSRC univarchar(18) NULL ,
	Hub_EmpID_SQN        numeric(12) NOT NULL ,
	Hub_DocNode_SQN      numeric(12) NULL ,
	CONSTRAINT XPKLnk_DocNode_Emp PRIMARY KEY   CLUSTERED (Lnk_DocNode_EmpID_SQN  ASC),
	CONSTRAINT R_203  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT R_204  FOREIGN KEY (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN)
)
go



exec sp_primarykey 'Lnk_DocNode_EmpID', Lnk_DocNode_EmpID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_DocNode_Emp ON Lnk_DocNode_EmpID
(
	Hub_EmpID_SQN         ASC,
	Hub_DocNode_SQN       ASC
)
go



CREATE TABLE Lnk_ProdNum_LocID
(
	Lnk_ProdNum_LocID_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_LocID_LDTS datetime NOT NULL ,
	Lnk_ProdINum_LocID_RSRC univarchar(18) NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_LocID_SQN        numeric(12) NULL ,
	CONSTRAINT PK_ProductInventory_ProductID_ PRIMARY KEY   CLUSTERED (Lnk_ProdNum_LocID_SQN  ASC),
	CONSTRAINT R_159  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_160  FOREIGN KEY (Hub_LocID_SQN) REFERENCES Hub_LocID(Hub_LocID_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_LocID', Lnk_ProdNum_LocID_SQN
go



CREATE UNIQUE INDEX AK_ProductInventory ON Lnk_ProdNum_LocID
(
	Hub_ProdNum_SQN       ASC,
	Hub_LocID_SQN         ASC
)
go



CREATE TABLE Sat_Prod_Loc
(
	Lnk_ProdNum_LocID_SQN numeric(12) NOT NULL ,
	Sat_Prod_Loc_LDTS    datetime NOT NULL ,
	Sat_Prod_Loc_LEDTS   datetime NULL ,
	Sat_Prod_Loc_RSRC    univarchar(18) NULL ,
	Shelf                univarchar(10) NOT NULL ,
	Bin                  tinyint NOT NULL ,
	Quantity             smallint NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ProductInventory_ProductID_ PRIMARY KEY   CLUSTERED (Lnk_ProdNum_LocID_SQN  ASC,Sat_Prod_Loc_LDTS  ASC),
	CONSTRAINT R_158  FOREIGN KEY (Lnk_ProdNum_LocID_SQN) REFERENCES Lnk_ProdNum_LocID(Lnk_ProdNum_LocID_SQN)
)
go



exec sp_primarykey 'Sat_Prod_Loc', Lnk_ProdNum_LocID_SQN, Sat_Prod_Loc_LDTS
go



CREATE TABLE Sat_Pers
(
	Hub_PersID_SQN       numeric(12) NOT NULL ,
	Sat_Pers_LDTS        datetime NOT NULL ,
	Sat_Pers_LEDTS       datetime NULL ,
	Sat_Pers_RSRC        univarchar(18) NULL ,
	PersonType           unichar(2) NOT NULL ,
	NameStyle            bit NOT NULL ,
	Title                univarchar(8) NULL ,
	FirstName            univarchar(50) NOT NULL ,
	MiddleName           univarchar(50) NULL ,
	LastName             univarchar(50) NOT NULL ,
	Suffix               univarchar(10) NULL ,
	EmailPromotion       int NOT NULL ,
	AdditionalContactInfo text NULL ,
	Demographics         text NULL ,
	rowguid              int NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Person_BusinessEntityID PRIMARY KEY   CLUSTERED (Hub_PersID_SQN  ASC,Sat_Pers_LDTS  ASC),
	CONSTRAINT R_202  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
go



exec sp_primarykey 'Sat_Pers', Hub_PersID_SQN, Sat_Pers_LDTS
go



CREATE UNIQUE INDEX AK_Person_rowguid ON Sat_Pers
(
	rowguid               ASC
)
go



CREATE INDEX IX_Person_LastName_FirstName_M ON Sat_Pers
(
	LastName              ASC,
	FirstName             ASC,
	MiddleName            ASC
)
go



CREATE TABLE Sat_Emp
(
	Hub_EmpID_SQN        numeric(12) NOT NULL ,
	Sat_Emp_LDTS         datetime NOT NULL ,
	Sat_Emp_LEDTS        datetime NULL ,
	Sat_Emp_RSRC         univarchar(18) NULL ,
	NationalIDNumber     univarchar(15) NOT NULL ,
	LoginID              univarchar(255) NOT NULL ,
	OrganizationNode     char(18) NOT NULL ,
	OrganizationLevel    smallint NULL ,
	JobTitle             univarchar(50) NOT NULL ,
	BirthDate            date NOT NULL ,
	MaritalStatus        unichar(1) NOT NULL ,
	Gender               unichar(1) NOT NULL ,
	HireDate             date NOT NULL ,
	SalariedFlag         bit NOT NULL ,
	VacationHours        smallint NOT NULL ,
	SickLeaveHours       smallint NOT NULL ,
	CurrentFlag          bit NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Employee_BusinessEntityID PRIMARY KEY   CLUSTERED (Hub_EmpID_SQN  ASC,Sat_Emp_LDTS  ASC),
	CONSTRAINT R_205  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
go



exec sp_primarykey 'Sat_Emp', Hub_EmpID_SQN, Sat_Emp_LDTS
go



CREATE UNIQUE INDEX AK_Employee_OrganizationNode ON Sat_Emp
(
	OrganizationNode      ASC
)
go



CREATE UNIQUE INDEX AK_Employee_OrganizationLevel_ ON Sat_Emp
(
	OrganizationLevel     ASC,
	OrganizationNode      ASC
)
go



CREATE UNIQUE INDEX AK_Employee_LoginID ON Sat_Emp
(
	LoginID               ASC
)
go



CREATE UNIQUE INDEX AK_Employee_NationalIDNumber ON Sat_Emp
(
	NationalIDNumber      ASC
)
go



CREATE TABLE Hub_ProdDescID
(
	Hub_ProdDescID_SQN   numeric(12) IDENTITY ,
	Hub_ProdDescID_LDTS  datetime NOT NULL ,
	Hub_ProdDescID_RSRC  univarchar(18) NULL ,
	ProductDescriptionID int NOT NULL ,
	CONSTRAINT PK_ProductDescription_ProductD PRIMARY KEY   CLUSTERED (Hub_ProdDescID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_ProdDescID', Hub_ProdDescID_SQN
go



CREATE UNIQUE INDEX BK_ProductDescriptionID ON Hub_ProdDescID
(
	ProductDescriptionID  ASC
)
go



CREATE TABLE Sat_ProdDesc
(
	Hub_ProdDescID_SQN   numeric(12) NOT NULL ,
	Sat_ProdDesc_LDTS    datetime NOT NULL ,
	Sat_ProdDesc_LEDTS   datetime NULL ,
	Sat_ProdDesc_RSRC    univarchar(18) NULL ,
	Description          univarchar(255) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ProductDescription_ProductD PRIMARY KEY   CLUSTERED (Hub_ProdDescID_SQN  ASC,Sat_ProdDesc_LDTS  ASC),
	CONSTRAINT R_149  FOREIGN KEY (Hub_ProdDescID_SQN) REFERENCES Hub_ProdDescID(Hub_ProdDescID_SQN)
)
go



exec sp_primarykey 'Sat_ProdDesc', Hub_ProdDescID_SQN, Sat_ProdDesc_LDTS
go



CREATE TABLE Hub_CultID
(
	Hub_CultID_SQN       numeric(12) IDENTITY ,
	Hub_CultID_LDTS      datetime NOT NULL ,
	Hub_CultID_RSRC      univarchar(18) NULL ,
	CultureID            unichar(6) NOT NULL ,
	CONSTRAINT PK_Culture_CultureID PRIMARY KEY   CLUSTERED (Hub_CultID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_CultID', Hub_CultID_SQN
go



CREATE UNIQUE INDEX BK_CultureID ON Hub_CultID
(
	CultureID             ASC
)
go



CREATE TABLE Sat_Cult
(
	Hub_CultID_SQN       numeric(12) NOT NULL ,
	Sat_Cult_LDTS        datetime NOT NULL ,
	Sat_Cult_LEDTS       datetime NULL ,
	Sat_Cult_RSRC        univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Culture_CultureID PRIMARY KEY   CLUSTERED (Hub_CultID_SQN  ASC,Sat_Cult_LDTS  ASC),
	CONSTRAINT R_148  FOREIGN KEY (Hub_CultID_SQN) REFERENCES Hub_CultID(Hub_CultID_SQN)
)
go



exec sp_primarykey 'Sat_Cult', Hub_CultID_SQN, Sat_Cult_LDTS
go



CREATE UNIQUE INDEX AK_Culture_Name ON Sat_Cult
(
	Name                  ASC
)
go



CREATE TABLE Hub_ModID
(
	Hub_ModID_SQN        numeric(12) IDENTITY ,
	Hub_ModID_LDTS       datetime NOT NULL ,
	Hub_ModID_RSRC       univarchar(18) NULL ,
	ProductModelID       int NOT NULL ,
	CONSTRAINT PK_ProductModel_ProductModelID PRIMARY KEY   CLUSTERED (Hub_ModID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_ModID', Hub_ModID_SQN
go



CREATE UNIQUE INDEX BK_ProductModelID ON Hub_ModID
(
	ProductModelID        ASC
)
go



CREATE TABLE Lnk_ModID_ProdDescID_CultID
(
	Lnk_ModID_ProdDescID_CultID_SQ numeric(12) IDENTITY ,
	Lnk_ModID_ProdDescID_CultID_LD datetime NOT NULL ,
	Lnk_ModID_ProdDescID_CultID_RS univarchar(18) NULL ,
	Hub_ModID_SQN        numeric(12) NOT NULL ,
	Hub_CultID_SQN       numeric(12) NULL ,
	Hub_ProdDescID_SQN   numeric(12) NULL ,
	CONSTRAINT PK_ProductModelProductDescript PRIMARY KEY   CLUSTERED (Lnk_ModID_ProdDescID_CultID_SQ  ASC),
	CONSTRAINT R_151  FOREIGN KEY (Hub_CultID_SQN) REFERENCES Hub_CultID(Hub_CultID_SQN),
	CONSTRAINT R_152  FOREIGN KEY (Hub_ProdDescID_SQN) REFERENCES Hub_ProdDescID(Hub_ProdDescID_SQN),
	CONSTRAINT R_153  FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
go



exec sp_primarykey 'Lnk_ModID_ProdDescID_CultID', Lnk_ModID_ProdDescID_CultID_SQ
go



CREATE UNIQUE INDEX AK_ProductModelProductDescript ON Lnk_ModID_ProdDescID_CultID
(
	Hub_CultID_SQN        ASC,
	Hub_ProdDescID_SQN    ASC,
	Hub_ModID_SQN         ASC
)
go



CREATE TABLE Sat_ProdMod_ProdDesc_Cult
(
	Lnk_ModID_ProdDescID_CultID_SQ numeric(12) NOT NULL ,
	Sat_Mod_ProdDesc_Cult_LDTS datetime NOT NULL ,
	Sat_Mod_ProdDesc_Cult__LEDTS datetime NULL ,
	Sat_Mod_ProdDesc_Cult__RSRC univarchar(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ProductModelProductDescript PRIMARY KEY   CLUSTERED (Lnk_ModID_ProdDescID_CultID_SQ  ASC,Sat_Mod_ProdDesc_Cult_LDTS  ASC),
	CONSTRAINT R_150  FOREIGN KEY (Lnk_ModID_ProdDescID_CultID_SQ) REFERENCES Lnk_ModID_ProdDescID_CultID(Lnk_ModID_ProdDescID_CultID_SQ)
)
go



exec sp_primarykey 'Sat_ProdMod_ProdDesc_Cult', Lnk_ModID_ProdDescID_CultID_SQ, Sat_Mod_ProdDesc_Cult_LDTS
go



CREATE TABLE Hub_IllID
(
	Hub_IllID_SQN        numeric(12) IDENTITY ,
	Hub_IllID_LDTS       datetime NOT NULL ,
	Hub_IllID_RSRC       univarchar(18) NULL ,
	IllustrationID       int NOT NULL ,
	CONSTRAINT PK_Illustration_IllustrationID PRIMARY KEY   CLUSTERED (Hub_IllID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_IllID', Hub_IllID_SQN
go



CREATE UNIQUE INDEX BK_IllustrationID ON Hub_IllID
(
	IllustrationID        ASC
)
go



CREATE TABLE Lnk_ModID_IllID
(
	Lnk_ModID_IllID_SQN  numeric(12) IDENTITY ,
	Lnk_ModID_IllID_LDTS datetime NOT NULL ,
	Lnk_ModID_IllID_RSRC univarchar(18) NULL ,
	Hub_ModID_SQN        numeric(12) NULL ,
	Hub_IllID_SQN        numeric(12) NULL ,
	CONSTRAINT PK_ProductModelIllustration_Pr PRIMARY KEY   CLUSTERED (Lnk_ModID_IllID_SQN  ASC),
	CONSTRAINT R_145  FOREIGN KEY (Hub_IllID_SQN) REFERENCES Hub_IllID(Hub_IllID_SQN),
	CONSTRAINT R_146  FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
go



exec sp_primarykey 'Lnk_ModID_IllID', Lnk_ModID_IllID_SQN
go



CREATE UNIQUE INDEX AK_ProductModelIllustration ON Lnk_ModID_IllID
(
	Hub_IllID_SQN         ASC,
	Hub_ModID_SQN         ASC
)
go



CREATE TABLE Sat_ProdMod_Ill
(
	Lnk_ModID_IllID_SQN  numeric(12) NOT NULL ,
	Sat_ProdMod_Ill_LDTS datetime NOT NULL ,
	Sat_ProdMod_Ill_LEDTS datetime NULL ,
	Sat_ProdMod_Ill_RSRC univarchar(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ProductModelIllustration_Pr PRIMARY KEY   CLUSTERED (Lnk_ModID_IllID_SQN  ASC,Sat_ProdMod_Ill_LDTS  ASC),
	CONSTRAINT R_147  FOREIGN KEY (Lnk_ModID_IllID_SQN) REFERENCES Lnk_ModID_IllID(Lnk_ModID_IllID_SQN)
)
go



exec sp_primarykey 'Sat_ProdMod_Ill', Lnk_ModID_IllID_SQN, Sat_ProdMod_Ill_LDTS
go



CREATE TABLE Sat_Illustraion
(
	Hub_IllID_SQN        numeric(12) NOT NULL ,
	Sat_Ill_LDTS         datetime NOT NULL ,
	Sat_Ill_LEDTS        datetime NULL ,
	Sat_Ill_RSRC         univarchar(18) NULL ,
	Diagram              text NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Illustration_IllustrationID PRIMARY KEY   CLUSTERED (Hub_IllID_SQN  ASC,Sat_Ill_LDTS  ASC),
	CONSTRAINT R_144  FOREIGN KEY (Hub_IllID_SQN) REFERENCES Hub_IllID(Hub_IllID_SQN)
)
go



exec sp_primarykey 'Sat_Illustraion', Hub_IllID_SQN, Sat_Ill_LDTS
go



CREATE TABLE Hub_POID
(
	Hub_POID_SQN         numeric(12) IDENTITY ,
	Hub_POID_LDTS        datetime NOT NULL ,
	Hub_POID_RSRC        univarchar(18) NULL ,
	PurchaseOrderID      int NOT NULL ,
	CONSTRAINT PK_PurchaseOrderHeader_Purchas PRIMARY KEY   CLUSTERED (Hub_POID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_POID', Hub_POID_SQN
go



CREATE UNIQUE INDEX BK_PurchaseOrderHeaderID ON Hub_POID
(
	PurchaseOrderID       ASC
)
go



CREATE TABLE Sat_POHead
(
	Hub_POID_SQN         numeric(12) NOT NULL ,
	Sat_POHead_LDTS      datetime NOT NULL ,
	Sat_POHead_LEDTS     datetime NULL ,
	Sat_POHead_RSRC      univarchar(18) NULL ,
	RevisionNumber       tinyint NOT NULL ,
	Status               tinyint NOT NULL ,
	OrderDate            datetime NOT NULL ,
	ShipDate             datetime NULL ,
	SubTotal             money NOT NULL ,
	TaxAmt               money NOT NULL ,
	Freight              money NOT NULL ,
	TotalDue             money NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_PurchaseOrderHeader_Purchas PRIMARY KEY   CLUSTERED (Hub_POID_SQN  ASC,Sat_POHead_LDTS  ASC),
	CONSTRAINT R_232  FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
go



exec sp_primarykey 'Sat_POHead', Hub_POID_SQN, Sat_POHead_LDTS
go



CREATE TABLE Lnk_EmpID_JobCandID
(
	Lnk_EmpID_JobCandID_SQN numeric(12) IDENTITY ,
	Lnk_EmpID_JobCandID_LDTS datetime NOT NULL ,
	Lnk_EmpID_JobCandID_RSRC univarchar(18) NULL ,
	Hub_EmpID_SQN        numeric(12) NULL ,
	Hub_JobCandID_SQN    numeric(12) NULL ,
	CONSTRAINT PK_JobCandidate_JobCandidateID PRIMARY KEY   CLUSTERED (Lnk_EmpID_JobCandID_SQN  ASC),
	CONSTRAINT R_207  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT R_208  FOREIGN KEY (Hub_JobCandID_SQN) REFERENCES Hub_JobCandID(Hub_JobCandID_SQN)
)
go



exec sp_primarykey 'Lnk_EmpID_JobCandID', Lnk_EmpID_JobCandID_SQN
go



CREATE UNIQUE INDEX AK_JobCandidate ON Lnk_EmpID_JobCandID
(
	Hub_EmpID_SQN         ASC,
	Hub_JobCandID_SQN     ASC
)
go



CREATE TABLE Lnk_ProdNum_ModID
(
	Lnk_ProdNum_ModID_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_ModID_LDTS datetime NOT NULL ,
	Lnk_ProdNum_ModID_RSRC univarchar(18) NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_ModID_SQN        numeric(12) NULL ,
	CONSTRAINT PK_ProductModel_ProductModelID PRIMARY KEY   CLUSTERED (Lnk_ProdNum_ModID_SQN  ASC),
	CONSTRAINT R_139  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_142  FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_ModID', Lnk_ProdNum_ModID_SQN
go



CREATE UNIQUE INDEX AK_ProductModel ON Lnk_ProdNum_ModID
(
	Hub_ProdNum_SQN       ASC,
	Hub_ModID_SQN         ASC
)
go



CREATE TABLE Sat_Mod
(
	Hub_ModID_SQN        numeric(12) NOT NULL ,
	Sat_Mod_LDTS         datetime NOT NULL ,
	Sat_Mod_LEDTS        datetime NULL ,
	Sat_Mod_RSRC         univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	CatalogDescription   text NULL ,
	Instructions         text NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ProductModel_ProductModelID PRIMARY KEY   CLUSTERED (Hub_ModID_SQN  ASC,Sat_Mod_LDTS  ASC),
	CONSTRAINT R_143  FOREIGN KEY (Hub_ModID_SQN) REFERENCES Hub_ModID(Hub_ModID_SQN)
)
go



exec sp_primarykey 'Sat_Mod', Hub_ModID_SQN, Sat_Mod_LDTS
go



CREATE UNIQUE INDEX AK_ProductModel_Name ON Sat_Mod
(
	Name                  ASC
)
go



CREATE TABLE Sat_SRsn
(
	Hub_SRsnID_SQN       numeric(12) NOT NULL ,
	Sat_SRsn_LDTS        datetime NOT NULL ,
	Sat_SRsn_LEDTS       datetime NULL ,
	Sat_SRsn_RSRC        univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ReasonType           univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SalesReason_SalesReasonID PRIMARY KEY   CLUSTERED (Hub_SRsnID_SQN  ASC,Sat_SRsn_LDTS  ASC),
	CONSTRAINT R_190  FOREIGN KEY (Hub_SRsnID_SQN) REFERENCES Hub_SRsnID(Hub_SRsnID_SQN)
)
go



exec sp_primarykey 'Sat_SRsn', Hub_SRsnID_SQN, Sat_SRsn_LDTS
go



CREATE TABLE Lnk_PersID_CCID
(
	Lnk_PersID_CCID_SQN  numeric(12) IDENTITY ,
	Lnk_PersID_CCID_LDTS datetime NOT NULL ,
	Lnk_PersID_CCID_RSRC univarchar(18) NULL ,
	Hub_PersID_SQN       numeric(12) NULL ,
	Hub_CCID_SQN         numeric(12) NULL ,
	CONSTRAINT PK_PersonCreditCard_BusinessEn PRIMARY KEY   CLUSTERED (Lnk_PersID_CCID_SQN  ASC),
	CONSTRAINT R_199  FOREIGN KEY (Hub_CCID_SQN) REFERENCES Hub_CCID(Hub_CCID_SQN),
	CONSTRAINT R_201  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
go



exec sp_primarykey 'Lnk_PersID_CCID', Lnk_PersID_CCID_SQN
go



CREATE UNIQUE INDEX AK_PersonCreditCard ON Lnk_PersID_CCID
(
	Hub_PersID_SQN        ASC,
	Hub_CCID_SQN          ASC
)
go



CREATE TABLE Sat_PersID_CCID
(
	Lnk_PersID_CCID_SQN  numeric(12) NOT NULL ,
	Sat_PersID_CCID_LDTS datetime NOT NULL ,
	Sat_PersID_CCID_LEDTS datetime NULL ,
	Sat_PersID_CCID_RSRC univarchar(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_PersonCreditCard_BusinessEn PRIMARY KEY   CLUSTERED (Lnk_PersID_CCID_SQN  ASC,Sat_PersID_CCID_LDTS  ASC),
	CONSTRAINT R_200  FOREIGN KEY (Lnk_PersID_CCID_SQN) REFERENCES Lnk_PersID_CCID(Lnk_PersID_CCID_SQN)
)
go



exec sp_primarykey 'Sat_PersID_CCID', Lnk_PersID_CCID_SQN, Sat_PersID_CCID_LDTS
go



CREATE TABLE Sat_SOrd
(
	Hub_SOrdNum_SQN      numeric(12) NOT NULL ,
	Sat_SOrd_LDTS        datetime NOT NULL ,
	Sat_SOrd_LEDTS       datetime NULL ,
	Sat_SOrd_RSRC        univarchar(18) NULL ,
	RevisionNumber       tinyint NOT NULL ,
	OrderDate            datetime NOT NULL ,
	DueDate              datetime NOT NULL ,
	ShipDate             datetime NULL ,
	Status               tinyint NOT NULL ,
	OnlineOrderFlag      bit NOT NULL ,
	PurchaseOrderNumber  univarchar(25) NULL ,
	AccountNumber        univarchar(15) NULL ,
	CreditCardApprovalCode varchar(15) NULL ,
	SubTotal             money NOT NULL ,
	TaxAmt               money NOT NULL ,
	Freight              money NOT NULL ,
	TotalDue             money NOT NULL ,
	Comment              univarchar(128) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SalesOrderHeader_SalesOrder PRIMARY KEY   CLUSTERED (Hub_SOrdNum_SQN  ASC,Sat_SOrd_LDTS  ASC),
	CONSTRAINT R_187  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
go



exec sp_primarykey 'Sat_SOrd', Hub_SOrdNum_SQN, Sat_SOrd_LDTS
go



CREATE TABLE Sat_Doc
(
	Hub_DocNode_SQN      numeric(12) NOT NULL ,
	Sat_Doc_LDTS         datetime NOT NULL ,
	Sat_Doc_LEDTS        datetime NULL ,
	Sat_Doc_RSRC         univarchar(18) NULL ,
	DocumentLevel        smallint NULL ,
	Title                univarchar(50) NOT NULL ,
	FolderFlag           bit NOT NULL ,
	FileName             univarchar(255) NOT NULL ,
	FileExtension        univarchar(8) NOT NULL ,
	Revision             unichar(5) NOT NULL ,
	ChangeNumber         int NOT NULL ,
	Status               tinyint NOT NULL ,
	DocumentSummary      nvarchar(255) NULL ,
	Document             varbinary NULL ,
	ModifiedDate         datetime NOT NULL ,
	PersonID             char(18) NULL ,
	CONSTRAINT PK_Document_DocumentNode PRIMARY KEY   CLUSTERED (Hub_DocNode_SQN  ASC,Sat_Doc_LDTS  ASC),
	CONSTRAINT R_193  FOREIGN KEY (Hub_DocNode_SQN) REFERENCES Hub_DocNode(Hub_DocNode_SQN)
)
go



exec sp_primarykey 'Sat_Doc', Hub_DocNode_SQN, Sat_Doc_LDTS
go



CREATE UNIQUE INDEX AK_Document_DocumentLevel_Docu ON Sat_Doc
(
	DocumentLevel         ASC
)
go



CREATE INDEX IX_Document_FileName_Revision ON Sat_Doc
(
	FileName              ASC,
	Revision              ASC
)
go



CREATE TABLE Hub_VendNum
(
	Hub_VendNum_SQN      numeric(12) IDENTITY ,
	Hub_VendNum_LDTS     datetime NOT NULL ,
	Hub_VendNum_RSRC     univarchar(18) NULL ,
	AccountNumber        univarchar(15) NOT NULL ,
	CONSTRAINT PK_Vendor_BusinessEntityID PRIMARY KEY   CLUSTERED (Hub_VendNum_SQN  ASC)
)
go



exec sp_primarykey 'Hub_VendNum', Hub_VendNum_SQN
go



CREATE UNIQUE INDEX BK_AccountNumber ON Hub_VendNum
(
	AccountNumber         ASC
)
go



CREATE TABLE Lnk_BusEntID_VendNum
(
	Lnk_BusEntID_VendNum_SQN numeric(12) IDENTITY ,
	Lnk_BusEntID_VendNum_LDTS datetime NOT NULL ,
	Lnk_BusEntID_VendNum_RSRC univarchar(18) NULL ,
	Hub_BusEntID_SQN     numeric(12) NULL ,
	Hub_VendNum_SQN      numeric(12) NULL ,
	CONSTRAINT XPKLnk_BusEntID_AcctNum PRIMARY KEY   CLUSTERED (Lnk_BusEntID_VendNum_SQN  ASC),
	CONSTRAINT R_272  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT R_275  FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN)
)
go



exec sp_primarykey 'Lnk_BusEntID_VendNum', Lnk_BusEntID_VendNum_SQN
go



CREATE UNIQUE INDEX AK_Lnk_BusEntID_AcctNum ON Lnk_BusEntID_VendNum
(
	Hub_BusEntID_SQN      ASC,
	Hub_VendNum_SQN       ASC
)
go



CREATE TABLE Hub_EmailAddID
(
	Hub_EmailAddID_SQN   numeric(12) IDENTITY ,
	Hub_EmailAddID_LDTS  datetime NOT NULL ,
	Hub_EmailAddID_RSRC  univarchar(18) NULL ,
	EmailAddressID       int NOT NULL ,
	CONSTRAINT PK_EmailAddress_BusinessEntity PRIMARY KEY   CLUSTERED (Hub_EmailAddID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_EmailAddID', Hub_EmailAddID_SQN
go



CREATE UNIQUE INDEX BK_EmailAddressID ON Hub_EmailAddID
(
	EmailAddressID        ASC
)
go



CREATE TABLE Lnk_PersID_EmailAddID
(
	Lnk_PersID_EmailAddID_SQN numeric(12) IDENTITY ,
	Lnk_PersID_EmailAddID_LDTS datetime NOT NULL ,
	Lnk_PersID_EmailAddID_RSRC univarchar(18) NULL ,
	Hub_PersID_SQN       numeric(12) NULL ,
	Hub_EmailAddID_SQN   numeric(12) NULL ,
	CONSTRAINT PK_EmailAddress_BusinessEntity PRIMARY KEY   CLUSTERED (Lnk_PersID_EmailAddID_SQN  ASC),
	CONSTRAINT R_217  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	CONSTRAINT R_218  FOREIGN KEY (Hub_EmailAddID_SQN) REFERENCES Hub_EmailAddID(Hub_EmailAddID_SQN)
)
go



exec sp_primarykey 'Lnk_PersID_EmailAddID', Lnk_PersID_EmailAddID_SQN
go



CREATE UNIQUE INDEX AK_EmailAddress ON Lnk_PersID_EmailAddID
(
	Hub_PersID_SQN        ASC,
	Hub_EmailAddID_SQN    ASC
)
go



CREATE TABLE Hub_ShiftID
(
	Hub_ShiftID_SQN      numeric(12) IDENTITY ,
	Hub_ShiftID_LDTS     datetime NOT NULL ,
	Hub_ShiftID_RSRC     univarchar(18) NULL ,
	ShiftID              tinyint NOT NULL ,
	CONSTRAINT PK_Shift_ShiftID PRIMARY KEY   CLUSTERED (Hub_ShiftID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_ShiftID', Hub_ShiftID_SQN
go



CREATE UNIQUE INDEX BK_ShiftID ON Hub_ShiftID
(
	ShiftID               ASC
)
go



CREATE TABLE Hub_DepID
(
	Hub_DepID_SQN        numeric(12) IDENTITY ,
	Hub_DepID_LDTS       datetime NOT NULL ,
	Hub_DepID_RSRC       univarchar(18) NULL ,
	DepartmentID         smallint NOT NULL ,
	CONSTRAINT PK_Department_DepartmentID PRIMARY KEY   CLUSTERED (Hub_DepID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_DepID', Hub_DepID_SQN
go



CREATE UNIQUE INDEX BK_DepartmentID ON Hub_DepID
(
	DepartmentID          ASC
)
go



CREATE TABLE Lnk_EmpID_DepID_ShiftID
(
	Lnk_EmpID_DepID_ShiftID_SQN numeric(12) IDENTITY ,
	Lnk_EmpID_DepID_ShiftID_LDTS datetime NOT NULL ,
	Lnk_EmpID_DepID_ShiftID_RSRC univarchar(18) NULL ,
	Hub_EmpID_SQN        numeric(12) NULL ,
	Hub_DepID_SQN        numeric(12) NULL ,
	Hub_ShiftID_SQN      numeric(12) NULL ,
	CONSTRAINT PK_EmployeeDepartmentHistory PRIMARY KEY   CLUSTERED (Lnk_EmpID_DepID_ShiftID_SQN  ASC),
	CONSTRAINT R_210  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT R_212  FOREIGN KEY (Hub_ShiftID_SQN) REFERENCES Hub_ShiftID(Hub_ShiftID_SQN),
	CONSTRAINT R_214  FOREIGN KEY (Hub_DepID_SQN) REFERENCES Hub_DepID(Hub_DepID_SQN)
)
go



exec sp_primarykey 'Lnk_EmpID_DepID_ShiftID', Lnk_EmpID_DepID_ShiftID_SQN
go



CREATE UNIQUE INDEX AK_EmployeeDepartmentHistory ON Lnk_EmpID_DepID_ShiftID
(
	Hub_EmpID_SQN         ASC,
	Hub_ShiftID_SQN       ASC,
	Hub_DepID_SQN         ASC
)
go



CREATE TABLE Sat_EmpID_DepID_ShiftID
(
	Lnk_EmpID_DepID_ShiftID_SQN numeric(12) NOT NULL ,
	Sat_EmpID_DepID_ShiftID_LDTS datetime NOT NULL ,
	Sat_EmpID_DepID_ShiftID_LEDTS datetime NULL ,
	Sat_EmpID_DepID_ShiftID_RSRC univarchar(18) NULL ,
	StartDate            date NOT NULL ,
	EndDate              date NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_EmployeeDepartmentHistory_B PRIMARY KEY   CLUSTERED (Lnk_EmpID_DepID_ShiftID_SQN  ASC,Sat_EmpID_DepID_ShiftID_LDTS  ASC),
	CONSTRAINT R_211  FOREIGN KEY (Lnk_EmpID_DepID_ShiftID_SQN) REFERENCES Lnk_EmpID_DepID_ShiftID(Lnk_EmpID_DepID_ShiftID_SQN)
)
go



exec sp_primarykey 'Sat_EmpID_DepID_ShiftID', Lnk_EmpID_DepID_ShiftID_SQN, Sat_EmpID_DepID_ShiftID_LDTS
go



CREATE TABLE Sat_Dep
(
	Hub_DepID_SQN        numeric(12) NOT NULL ,
	Sat_Dep_LDTS         datetime NOT NULL ,
	Sat_Dep_LEDTS        datetime NULL ,
	Sat_Dep_RSRC         univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	GroupName            univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Department_DepartmentID PRIMARY KEY   CLUSTERED (Hub_DepID_SQN  ASC,Sat_Dep_LDTS  ASC),
	CONSTRAINT R_215  FOREIGN KEY (Hub_DepID_SQN) REFERENCES Hub_DepID(Hub_DepID_SQN)
)
go



exec sp_primarykey 'Sat_Dep', Hub_DepID_SQN, Sat_Dep_LDTS
go



CREATE UNIQUE INDEX AK_Department_Name ON Sat_Dep
(
	Name                  ASC
)
go



CREATE TABLE Hub_CntryRgnCd
(
	Hub_CntryRgnCd_SQN   numeric(12) IDENTITY ,
	Hub_CntryRgnCd_LDTS  datetime NOT NULL ,
	Hub_CntryRgnCd_RSRC  univarchar(18) NULL ,
	CountryRegionCode    univarchar(3) NOT NULL ,
	CONSTRAINT PK_CountryRegion_CountryRegion PRIMARY KEY   CLUSTERED (Hub_CntryRgnCd_SQN  ASC)
)
go



exec sp_primarykey 'Hub_CntryRgnCd', Hub_CntryRgnCd_SQN
go



CREATE UNIQUE INDEX BK_CountryRegionCode ON Hub_CntryRgnCd
(
	CountryRegionCode     ASC
)
go



CREATE TABLE Hub_CrncyCd
(
	Hub_CrncyCd_SQN      numeric(12) IDENTITY ,
	Hub_CrncyCd_LDTS     datetime NOT NULL ,
	Hub_CrncyCd_RSRC     univarchar(18) NULL ,
	CurrencyCode         unichar(3) NOT NULL ,
	CONSTRAINT PK_Currency_CurrencyCode PRIMARY KEY   CLUSTERED (Hub_CrncyCd_SQN  ASC)
)
go



exec sp_primarykey 'Hub_CrncyCd', Hub_CrncyCd_SQN
go



CREATE UNIQUE INDEX BK_CurrencyCode ON Hub_CrncyCd
(
	CurrencyCode          ASC
)
go



CREATE TABLE Lnk_CntryRgnID_CrncyCd
(
	Lnk_CntryRgnID_CrncyCd_SQN numeric(12) IDENTITY ,
	Lnk_CntryRgnID_CrncyCd_LDTS datetime NOT NULL ,
	Lnk_CntryRgnID_CrncyCd_RSRC univarchar(18) NULL ,
	Hub_CntryRgnCd_SQN   numeric(12) NULL ,
	Hub_CrncyCd_SQN      numeric(12) NULL ,
	CONSTRAINT XPKLnk_CntryRgnID_Crncy PRIMARY KEY   CLUSTERED (Lnk_CntryRgnID_CrncyCd_SQN  ASC),
	CONSTRAINT R_301  FOREIGN KEY (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN),
	CONSTRAINT R_303  FOREIGN KEY (Hub_CrncyCd_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
go



exec sp_primarykey 'Lnk_CntryRgnID_CrncyCd', Lnk_CntryRgnID_CrncyCd_SQN
go



CREATE UNIQUE INDEX AK_Lnk_CntryRgnID_Crncy ON Lnk_CntryRgnID_CrncyCd
(
	Hub_CntryRgnCd_SQN    ASC,
	Hub_CrncyCd_SQN       ASC
)
go



CREATE TABLE Sat_CntryRgn_Crncy
(
	Lnk_CntryRgnID_CrncyCd_SQN numeric(12) NOT NULL ,
	Sat_CntryRgn_Crncy_LDTS datetime NOT NULL ,
	Sat_CntryRgn_Crncy_LEDTS datetime NULL ,
	Sat_CntryRgn_Crncy_RSRC univarchar(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_CountryRegionCurrency_Count PRIMARY KEY   CLUSTERED (Lnk_CntryRgnID_CrncyCd_SQN  ASC,Sat_CntryRgn_Crncy_LDTS  ASC),
	CONSTRAINT R_305  FOREIGN KEY (Lnk_CntryRgnID_CrncyCd_SQN) REFERENCES Lnk_CntryRgnID_CrncyCd(Lnk_CntryRgnID_CrncyCd_SQN)
)
go



exec sp_primarykey 'Sat_CntryRgn_Crncy', Lnk_CntryRgnID_CrncyCd_SQN, Sat_CntryRgn_Crncy_LDTS
go



CREATE TABLE Sat_Shift
(
	Hub_ShiftID_SQN      numeric(12) NOT NULL ,
	Sat_Shift_LDTS       datetime NOT NULL ,
	Sat_Shift_LEDTS      datetime NULL ,
	Sat_Shift_RSRC       univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	StartTime            time NOT NULL ,
	EndTime              time NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Shift_ShiftID PRIMARY KEY   CLUSTERED (Hub_ShiftID_SQN  ASC,Sat_Shift_LDTS  ASC),
	CONSTRAINT R_213  FOREIGN KEY (Hub_ShiftID_SQN) REFERENCES Hub_ShiftID(Hub_ShiftID_SQN)
)
go



exec sp_primarykey 'Sat_Shift', Hub_ShiftID_SQN, Sat_Shift_LDTS
go



CREATE UNIQUE INDEX AK_Shift_Name ON Sat_Shift
(
	Name                  ASC
)
go



CREATE UNIQUE INDEX AK_Shift_StartTime_EndTime ON Sat_Shift
(
	StartTime             ASC,
	EndTime               ASC
)
go



CREATE TABLE Sat_Vend
(
	Hub_VendNum_SQN      numeric(12) NOT NULL ,
	Sat_Vend_LDTS        datetime NOT NULL ,
	Sat_Vend_LEDTS       datetime NULL ,
	Sat_Vend_RSRC        univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	CreditRating         tinyint NOT NULL ,
	PreferredVendorStatus bit NOT NULL ,
	ActiveFlag           bit NOT NULL ,
	PurchasingWebServiceURL univarchar(255) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Vendor_BusinessEntityID PRIMARY KEY   CLUSTERED (Hub_VendNum_SQN  ASC,Sat_Vend_LDTS  ASC),
	CONSTRAINT R_228  FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN)
)
go



exec sp_primarykey 'Sat_Vend', Hub_VendNum_SQN, Sat_Vend_LDTS
go



CREATE TABLE Hub_UntMsrCd
(
	Hub_UntMsrCd_SQN     numeric(12) IDENTITY ,
	Hub_UntMsrCd_LDTS    datetime NOT NULL ,
	Hub_UntMsrCd_RSRC    univarchar(18) NULL ,
	UnitMeasureCode      unichar(3) NOT NULL ,
	CONSTRAINT PK_UnitMeasure_UnitMeasureCode PRIMARY KEY   CLUSTERED (Hub_UntMsrCd_SQN  ASC)
)
go



exec sp_primarykey 'Hub_UntMsrCd', Hub_UntMsrCd_SQN
go



CREATE UNIQUE INDEX BK_UnitMeasureCode ON Hub_UntMsrCd
(
	UnitMeasureCode       ASC
)
go



CREATE TABLE Lnk_ProdNum_VendNum_UntMsrCd
(
	Lnk_ProdNum_VendNum_UntMsrCd_S numeric(12) IDENTITY ,
	Lnk_ProdNum_VendNum_UntMsrCd_L univarchar(18) NULL ,
	Lnk_ProdNum_VendNum_UntMsrCd_R univarchar(18) NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_VendNum_SQN      numeric(12) NULL ,
	Hub_UntMsrCd_SQN     numeric(12) NULL ,
	CONSTRAINT PK_ProductVendor_ProductID_Bus PRIMARY KEY   CLUSTERED (Lnk_ProdNum_VendNum_UntMsrCd_S  ASC),
	CONSTRAINT R_225  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_227  FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN),
	CONSTRAINT R_314  FOREIGN KEY (Hub_UntMsrCd_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_VendNum_UntMsrCd', Lnk_ProdNum_VendNum_UntMsrCd_S
go



CREATE UNIQUE INDEX AK_ProductVendor ON Lnk_ProdNum_VendNum_UntMsrCd
(
	Hub_ProdNum_SQN       ASC,
	Hub_VendNum_SQN       ASC,
	Hub_UntMsrCd_SQN      ASC
)
go



CREATE TABLE Sat_ProdNum_VendNum_UntMsrCd
(
	Lnk_ProdNum_VendNum_UntMsrCd_S numeric(12) NOT NULL ,
	Sat_ProdNum_VendNum_UntMsrCd_L datetime NOT NULL ,
	Sat_ProdNum_VendNum_UntMsrCd_L datetime NULL ,
	Sat_ProdNum_VendNum_UntMsrCd_R univarchar(18) NULL ,
	AverageLeadTime      int NOT NULL ,
	StandardPrice        money NOT NULL ,
	LastReceiptCost      money NULL ,
	LastReceiptDate      datetime NULL ,
	MinOrderQty          int NOT NULL ,
	MaxOrderQty          int NOT NULL ,
	OnOrderQty           int NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ProductVendor_ProductID_Bus PRIMARY KEY   CLUSTERED (Lnk_ProdNum_VendNum_UntMsrCd_S  ASC,Sat_ProdNum_VendNum_UntMsrCd_L  ASC),
	CONSTRAINT R_226  FOREIGN KEY (Lnk_ProdNum_VendNum_UntMsrCd_S) REFERENCES Lnk_ProdNum_VendNum_UntMsrCd(Lnk_ProdNum_VendNum_UntMsrCd_S)
)
go



exec sp_primarykey 'Sat_ProdNum_VendNum_UntMsrCd', Lnk_ProdNum_VendNum_UntMsrCd_S, Sat_ProdNum_VendNum_UntMsrCd_L
go



CREATE TABLE Lnk_EmpID_POID
(
	Lnk_EmpID_POID_SQN   numeric(12) IDENTITY ,
	Lnk_EmpID_POID_LDTS  datetime NOT NULL ,
	Lnk_EmpID_POID_RSRC  univarchar(18) NULL ,
	Hub_EmpID_SQN        numeric(12) NULL ,
	Hub_POID_SQN         numeric(12) NULL ,
	CONSTRAINT XPKLnk_EmpID_POID PRIMARY KEY   CLUSTERED (Lnk_EmpID_POID_SQN  ASC),
	CONSTRAINT R_240  FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN),
	CONSTRAINT R_241  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN)
)
go



exec sp_primarykey 'Lnk_EmpID_POID', Lnk_EmpID_POID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_EmpID_POID ON Lnk_EmpID_POID
(
	Hub_POID_SQN          ASC,
	Hub_EmpID_SQN         ASC
)
go



CREATE TABLE Hub_ShpMthdID
(
	Hub_ShpMthID_SQN     numeric(12) IDENTITY ,
	Hub_ShpMthID_LDTS    datetime NOT NULL ,
	Hub_ShpMthID_RSRC    univarchar(18) NULL ,
	ShipMethodID         int NOT NULL ,
	CONSTRAINT PK_ShipMethod_ShipMethodID PRIMARY KEY   CLUSTERED (Hub_ShpMthID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_ShpMthdID', Hub_ShpMthID_SQN
go



CREATE UNIQUE INDEX BK_ShipMethodID ON Hub_ShpMthdID
(
	ShipMethodID          ASC
)
go



CREATE TABLE Lnk_POID_ShpMthdID
(
	Lnk_POID_ShpMthdID_SQN numeric(12) IDENTITY ,
	Lnk_POID_ShpMthdID_LDTS datetime NOT NULL ,
	Lnk_POID_ShpMthdID_RSRC univarchar(18) NULL ,
	Hub_POID_SQN         numeric(12) NULL ,
	Hub_ShpMthID_SQN     numeric(12) NULL ,
	CONSTRAINT XPKLnk_POID_ShPMthdID PRIMARY KEY   CLUSTERED (Lnk_POID_ShpMthdID_SQN  ASC),
	CONSTRAINT R_235  FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN),
	CONSTRAINT R_236  FOREIGN KEY (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN)
)
go



exec sp_primarykey 'Lnk_POID_ShpMthdID', Lnk_POID_ShpMthdID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_POID_ShPMthdID ON Lnk_POID_ShpMthdID
(
	Hub_POID_SQN          ASC,
	Hub_ShpMthID_SQN      ASC
)
go



CREATE TABLE Lnk_VendNum_POID
(
	Lnk_VendNum_POID_SQN numeric(12) IDENTITY ,
	Lnk_VendNum_POID_LDTS datetime NOT NULL ,
	Lnk_VendNum_POID_RSRC univarchar(18) NULL ,
	Hub_VendNum_SQN      numeric(12) NULL ,
	Hub_POID_SQN         numeric(12) NULL ,
	CONSTRAINT XPKLnk_AcctNum_POID PRIMARY KEY   CLUSTERED (Lnk_VendNum_POID_SQN  ASC),
	CONSTRAINT R_233  FOREIGN KEY (Hub_VendNum_SQN) REFERENCES Hub_VendNum(Hub_VendNum_SQN),
	CONSTRAINT R_234  FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
go



exec sp_primarykey 'Lnk_VendNum_POID', Lnk_VendNum_POID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_AcctNum_POID ON Lnk_VendNum_POID
(
	Hub_VendNum_SQN       ASC,
	Hub_POID_SQN          ASC
)
go



CREATE TABLE Hub_CustID
(
	Hub_CustID_SQN       numeric(12) IDENTITY ,
	Hub_CustID_LDTS      datetime NOT NULL ,
	Hub_CustID_RSRC      univarchar(18) NULL ,
	CustomerID           int NOT NULL ,
	CONSTRAINT PK_Customer_CustomerID PRIMARY KEY   CLUSTERED (Hub_CustID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_CustID', Hub_CustID_SQN
go



CREATE UNIQUE INDEX BK_CustomerID ON Hub_CustID
(
	CustomerID            ASC
)
go



CREATE TABLE Sat_Cust
(
	Hub_CustID_SQN       numeric(12) NOT NULL ,
	Sat_Cust_LDTS        datetime NOT NULL ,
	Sat_Cust_LEDTS       datetime NULL ,
	Sat_Cust_RSRC        univarchar(18) NULL ,
	PersonID             char(18) NULL ,
	StoreID              char(18) NULL ,
	TerritoryID          char(18) NULL ,
	AccountNumber        varchar(10) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Customer_CustomerID PRIMARY KEY   CLUSTERED (Hub_CustID_SQN  ASC,Sat_Cust_LDTS  ASC),
	CONSTRAINT R_253  FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN)
)
go



exec sp_primarykey 'Sat_Cust', Hub_CustID_SQN, Sat_Cust_LDTS
go



CREATE UNIQUE INDEX AK_Customer_AccountNumber ON Sat_Cust
(
	AccountNumber         ASC
)
go



CREATE TABLE Hub_PNTID
(
	Hub_PNTID_SQN        numeric(12) IDENTITY ,
	Hub_PNTID_LDTS       datetime NOT NULL ,
	Hub_PNTID_RSRC       univarchar(18) NULL ,
	PhoneNumberTypeID    int NOT NULL ,
	CONSTRAINT PK_PhoneNumberType_PhoneNumber PRIMARY KEY   CLUSTERED (Hub_PNTID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_PNTID', Hub_PNTID_SQN
go



CREATE UNIQUE INDEX BK_PhoneNumberTypeID ON Hub_PNTID
(
	PhoneNumberTypeID     ASC
)
go



CREATE TABLE Sat_PNT
(
	Hub_PNTID_SQN        numeric(12) NOT NULL ,
	Sat_PNT_LDTS         datetime NOT NULL ,
	Sat_PNT_LEDTS        datetime NULL ,
	Sat_PNT_RSRC         univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_PhoneNumberType_PhoneNumber PRIMARY KEY   CLUSTERED (Hub_PNTID_SQN  ASC,Sat_PNT_LDTS  ASC),
	CONSTRAINT R_224  FOREIGN KEY (Hub_PNTID_SQN) REFERENCES Hub_PNTID(Hub_PNTID_SQN)
)
go



exec sp_primarykey 'Sat_PNT', Hub_PNTID_SQN, Sat_PNT_LDTS
go



CREATE TABLE Hub_Phon
(
	Hub_Phon_SQN         numeric(12) IDENTITY ,
	Hub_Phon_LDTS        datetime NOT NULL ,
	Hub_Phon_RSRC        univarchar(18) NULL ,
	PhoneNumber          univarchar(25) NOT NULL ,
	CONSTRAINT PK_PersonPhone_BusinessEntityI PRIMARY KEY   CLUSTERED (Hub_Phon_SQN  ASC)
)
go



exec sp_primarykey 'Hub_Phon', Hub_Phon_SQN
go



CREATE UNIQUE INDEX BK_PhoneNumber ON Hub_Phon
(
	PhoneNumber           ASC
)
go



CREATE TABLE Sat_Phon
(
	Hub_Phon_SQN         numeric(12) NOT NULL ,
	Sat_Phon_LDTS        datetime NOT NULL ,
	Sat_Phon_LEDTS       datetime NULL ,
	Sat_Phon_RSRC        univarchar(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_PersonPhone_BusinessEntityI PRIMARY KEY   CLUSTERED (Hub_Phon_SQN  ASC,Sat_Phon_LDTS  ASC),
	CONSTRAINT R_222  FOREIGN KEY (Hub_Phon_SQN) REFERENCES Hub_Phon(Hub_Phon_SQN)
)
go



exec sp_primarykey 'Sat_Phon', Hub_Phon_SQN, Sat_Phon_LDTS
go



CREATE TABLE Lnk_PersID_Phon_PNTID
(
	Lnk_PersID_Phon_PNTID_SQN numeric(12) IDENTITY ,
	Lnk_PersID_Phon_PNTID_LDTS datetime NOT NULL ,
	Lnk_PersID_Phon_PNTID_RSRC univarchar(18) NULL ,
	Hub_PersID_SQN       numeric(12) NULL ,
	Hub_Phon_SQN         numeric(12) NULL ,
	Hub_PNTID_SQN        numeric(12) NULL ,
	CONSTRAINT XPKLnk_PersID_Phon_PNTID PRIMARY KEY   CLUSTERED (Lnk_PersID_Phon_PNTID_SQN  ASC),
	CONSTRAINT R_220  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN),
	CONSTRAINT R_221  FOREIGN KEY (Hub_Phon_SQN) REFERENCES Hub_Phon(Hub_Phon_SQN),
	CONSTRAINT R_223  FOREIGN KEY (Hub_PNTID_SQN) REFERENCES Hub_PNTID(Hub_PNTID_SQN)
)
go



exec sp_primarykey 'Lnk_PersID_Phon_PNTID', Lnk_PersID_Phon_PNTID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_PersID_Phon_PNTID ON Lnk_PersID_Phon_PNTID
(
	Hub_PersID_SQN        ASC,
	Hub_Phon_SQN          ASC,
	Hub_PNTID_SQN         ASC
)
go



CREATE TABLE Sat_EmailAdd
(
	Hub_EmailAddID_SQN   numeric(12) NOT NULL ,
	Sat_EmailAdd_LDTS    datetime NOT NULL ,
	Sat_EmailAdd_LEDTS   datetime NULL ,
	Sat_EmailAdd_RSRC    univarchar(18) NULL ,
	EmailAddress         univarchar(50) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_EmailAddress_BusinessEntity PRIMARY KEY   CLUSTERED (Hub_EmailAddID_SQN  ASC,Sat_EmailAdd_LDTS  ASC),
	CONSTRAINT R_219  FOREIGN KEY (Hub_EmailAddID_SQN) REFERENCES Hub_EmailAddID(Hub_EmailAddID_SQN)
)
go



exec sp_primarykey 'Sat_EmailAdd', Hub_EmailAddID_SQN, Sat_EmailAdd_LDTS
go



CREATE INDEX IX_EmailAddress_EmailAddress ON Sat_EmailAdd
(
	EmailAddress          ASC
)
go



CREATE TABLE Lnk_SOrdNum_ShpMthdID
(
	Lnk_SOrdNum_ShpMthdID_SQN numeric(12) IDENTITY ,
	Lnk_SOrdNum_ShpMthdID_LDTS datetime NOT NULL ,
	Lnk_SOrdNum_ShpMthdID_RSRC univarchar(18) NULL ,
	Hub_SOrdNum_SQN      numeric(12) NULL ,
	Hub_ShpMthID_SQN     numeric(12) NULL ,
	CONSTRAINT XPKLnk_POID_ShPMthdID PRIMARY KEY   CLUSTERED (Lnk_SOrdNum_ShpMthdID_SQN  ASC),
	CONSTRAINT R_238  FOREIGN KEY (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN),
	CONSTRAINT R_239  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
go



exec sp_primarykey 'Lnk_SOrdNum_ShpMthdID', Lnk_SOrdNum_ShpMthdID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_POID_ShPMthdID ON Lnk_SOrdNum_ShpMthdID
(
	Hub_ShpMthID_SQN      ASC,
	Hub_SOrdNum_SQN       ASC
)
go



CREATE TABLE Sat_Pswrd
(
	Hub_PersID_SQN       numeric(12) NOT NULL ,
	Sat_Pswrd_LDTS       datetime NOT NULL ,
	Sat_Pswrd_LEDTS      datetime NULL ,
	Sat_Pswrd_RSRC       univarchar(18) NULL ,
	PasswordHash         varchar(128) NOT NULL ,
	PasswordSalt         varchar(10) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Password_BusinessEntityID PRIMARY KEY   CLUSTERED (Hub_PersID_SQN  ASC,Sat_Pswrd_LDTS  ASC),
	CONSTRAINT R_216  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
go



exec sp_primarykey 'Sat_Pswrd', Hub_PersID_SQN, Sat_Pswrd_LDTS
go



CREATE TABLE Lnk_ProdNum_POID
(
	Lnk_ProdNum_POID_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_POID_LDTS datetime NOT NULL ,
	Lnk_ProdNum_POID_RSRC univarchar(18) NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_POID_SQN         numeric(12) NULL ,
	PurchaseOrderDetailID int NOT NULL ,
	CONSTRAINT PK_PurchaseOrderDetail_Purchas PRIMARY KEY   CLUSTERED (Lnk_ProdNum_POID_SQN  ASC),
	CONSTRAINT R_229  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_231  FOREIGN KEY (Hub_POID_SQN) REFERENCES Hub_POID(Hub_POID_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_POID', Lnk_ProdNum_POID_SQN
go



CREATE UNIQUE INDEX AK_PurchaseOrderDetail ON Lnk_ProdNum_POID
(
	Hub_ProdNum_SQN       ASC,
	PurchaseOrderDetailID  ASC,
	Hub_POID_SQN          ASC
)
go



CREATE TABLE Sat_PODetail
(
	Lnk_ProdNum_POID_SQN numeric(12) NOT NULL ,
	Sat_PODetail_LDTS    datetime NOT NULL ,
	Sat_PODetail_LEDTS   datetime NULL ,
	Sat_PODetail_RSRC    univarchar(18) NULL ,
	DueDate              datetime NOT NULL ,
	OrderQty             smallint NOT NULL ,
	ProductID            char(18) NOT NULL ,
	UnitPrice            money NOT NULL ,
	LineTotal            money NOT NULL ,
	ReceivedQty          decimal(8,2) NOT NULL ,
	RejectedQty          decimal(8,2) NOT NULL ,
	StockedQty           decimal(9,2) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_PurchaseOrderDetail_Purchas PRIMARY KEY   CLUSTERED (Lnk_ProdNum_POID_SQN  ASC,Sat_PODetail_LDTS  ASC),
	CONSTRAINT R_230  FOREIGN KEY (Lnk_ProdNum_POID_SQN) REFERENCES Lnk_ProdNum_POID(Lnk_ProdNum_POID_SQN)
)
go



exec sp_primarykey 'Sat_PODetail', Lnk_ProdNum_POID_SQN, Sat_PODetail_LDTS
go



CREATE TABLE Sat_ShpMthd
(
	Hub_ShpMthID_SQN     numeric(12) NOT NULL ,
	Sat_ShpMthd_LDTS     datetime NOT NULL ,
	Sat_ShpMthd_LEDTS    datetime NULL ,
	Sat_ShpMthd_RSRC     univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ShipBase             money NOT NULL ,
	ShipRate             money NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ShipMethod_ShipMethodID PRIMARY KEY   CLUSTERED (Hub_ShpMthID_SQN  ASC,Sat_ShpMthd_LDTS  ASC),
	CONSTRAINT R_237  FOREIGN KEY (Hub_ShpMthID_SQN) REFERENCES Hub_ShpMthdID(Hub_ShpMthID_SQN)
)
go



exec sp_primarykey 'Sat_ShpMthd', Hub_ShpMthID_SQN, Sat_ShpMthd_LDTS
go



CREATE UNIQUE INDEX AK_ShipMethod_Name ON Sat_ShpMthd
(
	Name                  ASC
)
go



CREATE TABLE Hub_SaleTaxRtID
(
	Hub_SaleTaxRtID_SQN  numeric(12) IDENTITY ,
	Hub_SaleTaxRtID_LDTS datetime NOT NULL ,
	Hub_SaleTaxRtID_RSRC univarchar(18) NULL ,
	SalesTaxRateID       int NOT NULL ,
	CONSTRAINT PK_SalesTaxRate_SalesTaxRateID PRIMARY KEY   CLUSTERED (Hub_SaleTaxRtID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_SaleTaxRtID', Hub_SaleTaxRtID_SQN
go



CREATE UNIQUE INDEX BK_SalesTaxRateID ON Hub_SaleTaxRtID
(
	SalesTaxRateID        ASC
)
go



CREATE TABLE Lnk_StProvID_SaleTaxRtID
(
	Lnk_StProvID_SaleTaxRtID_SQN numeric(12) IDENTITY ,
	Lnk_StProvID_SaleTaxRtID_LDTS datetime NOT NULL ,
	Lnk_StProvID_SaleTaxRtID_RSRC univarchar(18) NULL ,
	Hub_StProvID_SQN     numeric(12) NULL ,
	Hub_SaleTaxRtID_SQN  numeric(12) NULL ,
	CONSTRAINT XPKLnk_StProvID_SaleTaxRtID PRIMARY KEY   CLUSTERED (Lnk_StProvID_SaleTaxRtID_SQN  ASC),
	CONSTRAINT R_295  FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN),
	CONSTRAINT R_296  FOREIGN KEY (Hub_SaleTaxRtID_SQN) REFERENCES Hub_SaleTaxRtID(Hub_SaleTaxRtID_SQN)
)
go



exec sp_primarykey 'Lnk_StProvID_SaleTaxRtID', Lnk_StProvID_SaleTaxRtID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_StProvID_SaleTaxRtID ON Lnk_StProvID_SaleTaxRtID
(
	Hub_StProvID_SQN      ASC,
	Hub_SaleTaxRtID_SQN   ASC
)
go



CREATE TABLE Hub_Store
(
	Hub_Store_SQN        numeric(12) IDENTITY ,
	Hub_Store_LDTS       datetime NOT NULL ,
	Hub_Store_RSRC       univarchar(18) NULL ,
	BusinessEntityID     char(18) NOT NULL ,
	CONSTRAINT PK_Store_BusinessEntityID PRIMARY KEY   CLUSTERED (Hub_Store_SQN  ASC)
)
go



exec sp_primarykey 'Hub_Store', Hub_Store_SQN
go



CREATE UNIQUE INDEX BK_BusinessEntityID ON Hub_Store
(
	BusinessEntityID      ASC
)
go



CREATE TABLE Lnk_BusEntID_Store
(
	Lnk_BusEntID_Store_SQN numeric(12) IDENTITY ,
	Lnk_BusEntID_Store_LDTS datetime NOT NULL ,
	Lnk_BusEntID_Store_RSRC univarchar(18) NULL ,
	Hub_BusEntID_SQN     numeric(12) NULL ,
	Hub_Store_SQN        numeric(12) NULL ,
	CONSTRAINT XPKLnk_BEID_Store PRIMARY KEY   CLUSTERED (Lnk_BusEntID_Store_SQN  ASC),
	CONSTRAINT R_271  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT R_274  FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
go



exec sp_primarykey 'Lnk_BusEntID_Store', Lnk_BusEntID_Store_SQN
go



CREATE UNIQUE INDEX AK_Lnk_BEID_Store ON Lnk_BusEntID_Store
(
	Hub_BusEntID_SQN      ASC,
	Hub_Store_SQN         ASC
)
go



CREATE TABLE Hub_SalePers
(
	Hub_SalePers_SQN     numeric(12) IDENTITY ,
	Hub_SalePers_LDTS    datetime NOT NULL ,
	Hub_SalePers_RSRC    univarchar(18) NULL ,
	EmployeeID           char(18) NOT NULL ,
	CONSTRAINT PK_SalesPerson_BusinessEntityI PRIMARY KEY   CLUSTERED (Hub_SalePers_SQN  ASC)
)
go



exec sp_primarykey 'Hub_SalePers', Hub_SalePers_SQN
go



CREATE UNIQUE INDEX BK_SalesPersonID ON Hub_SalePers
(
	EmployeeID            ASC
)
go



CREATE TABLE Lnk_EmpID_SalePers
(
	Lnk_EmpID_SalePers_SQN numeric(12) IDENTITY ,
	Lnk_EmpID_SalePers_LDTS datetime NOT NULL ,
	Lnk_EmpID_SalePers_RSRC univarchar(18) NULL ,
	Hub_EmpID_SQN        numeric(12) NULL ,
	Hub_SalePers_SQN     numeric(12) NULL ,
	CONSTRAINT XPKLnk_EmpID_SalePers PRIMARY KEY   CLUSTERED (Lnk_EmpID_SalePers_SQN  ASC),
	CONSTRAINT R_242  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT R_243  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
go



exec sp_primarykey 'Lnk_EmpID_SalePers', Lnk_EmpID_SalePers_SQN
go



CREATE UNIQUE INDEX AK_Lnk_EmpID_SalePers ON Lnk_EmpID_SalePers
(
	Hub_EmpID_SQN         ASC,
	Hub_SalePers_SQN      ASC
)
go



CREATE TABLE Lnk_SalePers_Store
(
	Lnk_SalePers_Store_SQN numeric(12) IDENTITY ,
	Lnk_SalePers_Store_LDTS datetime NOT NULL ,
	Lnk_SalePers_Store_RSRC univarchar(18) NULL ,
	Hub_Store_SQN        numeric(12) NULL ,
	Hub_SalePers_SQN     numeric(12) NULL ,
	CONSTRAINT XPKLnk_SalePers_Store PRIMARY KEY   CLUSTERED (Lnk_SalePers_Store_SQN  ASC),
	CONSTRAINT R_250  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	CONSTRAINT R_251  FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
go



exec sp_primarykey 'Lnk_SalePers_Store', Lnk_SalePers_Store_SQN
go



CREATE UNIQUE INDEX AK_Lnk_SalePers_Store ON Lnk_SalePers_Store
(
	Hub_SalePers_SQN      ASC,
	Hub_Store_SQN         ASC
)
go



CREATE TABLE Hub_BOMID
(
	Hub_BOMID_SQN        numeric(12) IDENTITY ,
	Hub_BOMID_LDTS       datetime NOT NULL ,
	Hub_BOMID_RSRC       univarchar(18) NULL ,
	BillOfMaterialsID    int NOT NULL ,
	CONSTRAINT PK_BillOfMaterials_BillOfMater PRIMARY KEY   CLUSTERED (Hub_BOMID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_BOMID', Hub_BOMID_SQN
go



CREATE UNIQUE INDEX BK_BillOfMaterialsID ON Hub_BOMID
(
	BillOfMaterialsID     ASC
)
go



CREATE TABLE Sat_BOM
(
	Hub_BOMID_SQN        numeric(12) NOT NULL ,
	Sat_BOM_LDTS         datetime NOT NULL ,
	Sat_BOM_LEDTS        datetime NULL ,
	Sat_BOM_RSRC         univarchar(18) NULL ,
	StartDate            datetime NOT NULL ,
	EndDate              datetime NULL ,
	BOMLevel             smallint NOT NULL ,
	PerAssemblyQty       decimal(8,2) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_BillOfMaterials_BillOfMater PRIMARY KEY   NONCLUSTERED (Hub_BOMID_SQN  ASC,Sat_BOM_LDTS  ASC),
	CONSTRAINT R_320  FOREIGN KEY (Hub_BOMID_SQN) REFERENCES Hub_BOMID(Hub_BOMID_SQN)
)
go



exec sp_primarykey 'Sat_BOM', Hub_BOMID_SQN, Sat_BOM_LDTS
go



CREATE UNIQUE CLUSTERED INDEX AK_BillOfMaterials_ProductAsse ON Sat_BOM
(
	StartDate             ASC
)
go



CREATE TABLE Sat_StProv
(
	Hub_StProvID_SQN     numeric(12) NOT NULL ,
	Sat_StProv_LDTS      datetime NOT NULL ,
	Sat_StProv_LEDTS     datetime NULL ,
	Sat_StProv_RSRC      univarchar(18) NULL ,
	StateProvinceCode    unichar(3) NOT NULL ,
	CountryRegionCode    char(18) NOT NULL ,
	IsOnlyStateProvinceFlag bit NOT NULL ,
	Name                 univarchar(50) NOT NULL ,
	TerritoryID          char(18) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_StateProvince_StateProvince PRIMARY KEY   CLUSTERED (Hub_StProvID_SQN  ASC,Sat_StProv_LDTS  ASC),
	CONSTRAINT R_297  FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
go



exec sp_primarykey 'Sat_StProv', Hub_StProvID_SQN, Sat_StProv_LDTS
go



CREATE UNIQUE INDEX AK_StateProvince_Name ON Sat_StProv
(
	Name                  ASC
)
go



CREATE UNIQUE INDEX AK_StateProvince_StateProvince ON Sat_StProv
(
	StateProvinceCode     ASC,
	CountryRegionCode     ASC
)
go



CREATE TABLE Lnk_StProvID_CntryRgnCd
(
	Lnk_StProvID_CntryRgnCd_SQN numeric(12) IDENTITY ,
	Lnk_StProvID_CntryRgnCd_LDTS datetime NOT NULL ,
	Lnk_StProvID_CntryRgnCd_RSRC univarchar(18) NULL ,
	Hub_StProvID_SQN     numeric(12) NULL ,
	Hub_CntryRgnCd_SQN   numeric(12) NULL ,
	CONSTRAINT XPKLnk_StProvID_CntryRgnID PRIMARY KEY   CLUSTERED (Lnk_StProvID_CntryRgnCd_SQN  ASC),
	CONSTRAINT R_299  FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN),
	CONSTRAINT R_302  FOREIGN KEY (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN)
)
go



exec sp_primarykey 'Lnk_StProvID_CntryRgnCd', Lnk_StProvID_CntryRgnCd_SQN
go



CREATE UNIQUE INDEX AK_Lnk_StProvID_CntryRgnID ON Lnk_StProvID_CntryRgnCd
(
	Hub_CntryRgnCd_SQN    ASC,
	Hub_StProvID_SQN      ASC
)
go



CREATE TABLE Sat_SaleTaxRt
(
	Hub_SaleTaxRtID_SQN  numeric(12) NOT NULL ,
	Sat_SaleTaxRt_LDTS   datetime NOT NULL ,
	Sat_SaleTaxRt_LEDTS  datetime NULL ,
	Sat_SaleTaxRt_RSRC   univarchar(18) NULL ,
	TaxType              tinyint NOT NULL ,
	TaxRate              smallmoney NOT NULL ,
	Name                 univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SalesTaxRate_SalesTaxRateID PRIMARY KEY   CLUSTERED (Hub_SaleTaxRtID_SQN  ASC,Sat_SaleTaxRt_LDTS  ASC),
	CONSTRAINT R_298  FOREIGN KEY (Hub_SaleTaxRtID_SQN) REFERENCES Hub_SaleTaxRtID(Hub_SaleTaxRtID_SQN)
)
go



exec sp_primarykey 'Sat_SaleTaxRt', Hub_SaleTaxRtID_SQN, Sat_SaleTaxRt_LDTS
go



CREATE UNIQUE INDEX AK_SalesTaxRate_StateProvinceI ON Sat_SaleTaxRt
(
	TaxType               ASC
)
go



CREATE TABLE Sat_SalePers
(
	Hub_SalePers_SQN     numeric(12) NOT NULL ,
	Sat_SalePersLDTS     datetime NOT NULL ,
	Sat_SalePersLEDTS    datetime NULL ,
	Sat_SalePers_RSRC    univarchar(18) NULL ,
	TerritoryID          char(18) NULL ,
	SalesQuota           money NULL ,
	Bonus                money NOT NULL ,
	CommissionPct        smallmoney NOT NULL ,
	SalesYTD             money NOT NULL ,
	SalesLastYear        money NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SalesPerson_BusinessEntityI PRIMARY KEY   CLUSTERED (Hub_SalePers_SQN  ASC,Sat_SalePersLDTS  ASC),
	CONSTRAINT R_244  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
go



exec sp_primarykey 'Sat_SalePers', Hub_SalePers_SQN, Sat_SalePersLDTS
go



CREATE TABLE Hub_SaleTerID
(
	Hub_SaleTerID_SQN    numeric(12) IDENTITY ,
	Hub_SaleTerID_LDTS   datetime NOT NULL ,
	Hub_SaleTerID_RSRC   univarchar(18) NULL ,
	TerritoryID          int NOT NULL ,
	CONSTRAINT PK_SalesTerritory_TerritoryID PRIMARY KEY   CLUSTERED (Hub_SaleTerID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_SaleTerID', Hub_SaleTerID_SQN
go



CREATE UNIQUE INDEX BK_SalesTerritoryID ON Hub_SaleTerID
(
	TerritoryID           ASC
)
go



CREATE TABLE Lnk_SalePers_SaleTerID
(
	Lnk_SalePers_SaleTerID_SQN numeric(12) IDENTITY ,
	Lnk_SalePers_SaleTerID_LDTS datetime NOT NULL ,
	Lnk_SalePers_SaleTerID_RSRC univarchar(18) NULL ,
	Hub_SalePers_SQN     numeric(12) NULL ,
	Hub_SaleTerID_SQN    numeric(12) NULL ,
	CONSTRAINT XPKLnk_SalePers_SaleTer PRIMARY KEY   CLUSTERED (Lnk_SalePers_SaleTerID_SQN  ASC),
	CONSTRAINT R_266  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	CONSTRAINT R_267  FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
go



exec sp_primarykey 'Lnk_SalePers_SaleTerID', Lnk_SalePers_SaleTerID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_SalePers_SaleTer ON Lnk_SalePers_SaleTerID
(
	Hub_SalePers_SQN      ASC,
	Hub_SaleTerID_SQN     ASC
)
go



CREATE TABLE Sat_SaleTerHist
(
	Lnk_SalePers_SaleTerID_SQN numeric(12) NOT NULL ,
	Sat_SaleTerHist_LDTS datetime NOT NULL ,
	Sat_SaleTerHist_LEDTS datetime NULL ,
	Sat_SaleTerHist_RSRC univarchar(18) NULL ,
	StartDate            datetime NOT NULL ,
	EndDate              datetime NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SalesTerritoryHistory_Busin PRIMARY KEY   CLUSTERED (Lnk_SalePers_SaleTerID_SQN  ASC,Sat_SaleTerHist_LDTS  ASC),
	CONSTRAINT R_265  FOREIGN KEY (Lnk_SalePers_SaleTerID_SQN) REFERENCES Lnk_SalePers_SaleTerID(Lnk_SalePers_SaleTerID_SQN)
)
go



exec sp_primarykey 'Sat_SaleTerHist', Lnk_SalePers_SaleTerID_SQN, Sat_SaleTerHist_LDTS
go



CREATE TABLE Sat_Store
(
	Hub_Store_SQN        numeric(12) NOT NULL ,
	Sat_Store_LDTS       datetime NOT NULL ,
	Sat_Store_LEDTS      datetime NULL ,
	Sat_Store_RSRC       univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	Demographics         text NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Store_BusinessEntityID PRIMARY KEY   CLUSTERED (Hub_Store_SQN  ASC,Sat_Store_LDTS  ASC),
	CONSTRAINT R_252  FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN)
)
go



exec sp_primarykey 'Sat_Store', Hub_Store_SQN, Sat_Store_LDTS
go



CREATE TABLE Lnk_Cust_SaleTerID
(
	Lnk_Cust_SaleTerID_SQN numeric(12) IDENTITY ,
	Lnk_Cust_SaleTerID_LDTS datetime NOT NULL ,
	Lnk_Cust_SaleTerID_SRC univarchar(18) NULL ,
	Hub_CustID_SQN       numeric(12) NULL ,
	Hub_SaleTerID_SQN    numeric(12) NULL ,
	CONSTRAINT XPKLnk_Cust_SaleTerID PRIMARY KEY   CLUSTERED (Lnk_Cust_SaleTerID_SQN  ASC),
	CONSTRAINT R_261  FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	CONSTRAINT R_262  FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
go



exec sp_primarykey 'Lnk_Cust_SaleTerID', Lnk_Cust_SaleTerID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_Cust_SaleTerID ON Lnk_Cust_SaleTerID
(
	Hub_CustID_SQN        ASC,
	Hub_SaleTerID_SQN     ASC
)
go



CREATE TABLE Sat_Crncy
(
	Hub_CrncyCd_SQN      numeric(12) NOT NULL ,
	Sat_Crncy_LDTS       datetime NOT NULL ,
	Sat_Crncy_LEDTS      datetime NULL ,
	Sat_Crncy_RSRC       univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Currency_CurrencyCode PRIMARY KEY   CLUSTERED (Hub_CrncyCd_SQN  ASC,Sat_Crncy_LDTS  ASC),
	CONSTRAINT R_306  FOREIGN KEY (Hub_CrncyCd_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
go



exec sp_primarykey 'Sat_Crncy', Hub_CrncyCd_SQN, Sat_Crncy_LDTS
go



CREATE UNIQUE INDEX AK_Currency_Name ON Sat_Crncy
(
	Name                  ASC
)
go



CREATE TABLE Lnk_SOrdNum_SalePers
(
	Lnk_SOrdNum_SalePers_SQN numeric(12) IDENTITY ,
	Lnk_SOrdNum_SalePers_LDTS datetime NOT NULL ,
	Lnk_SOrdNum_SalePers_RSRC univarchar(18) NULL ,
	Hub_SOrdNum_SQN      numeric(12) NULL ,
	Hub_SalePers_SQN     numeric(12) NULL ,
	CONSTRAINT XPKLnk_SOrdID_SalePers PRIMARY KEY   CLUSTERED (Lnk_SOrdNum_SalePers_SQN  ASC),
	CONSTRAINT R_246  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN),
	CONSTRAINT R_247  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
go



exec sp_primarykey 'Lnk_SOrdNum_SalePers', Lnk_SOrdNum_SalePers_SQN
go



CREATE UNIQUE INDEX AK_Lnk_SOrdID_SalePers ON Lnk_SOrdNum_SalePers
(
	Hub_SalePers_SQN      ASC,
	Hub_SOrdNum_SQN       ASC
)
go



CREATE TABLE Sat_SalePersQuotaHist
(
	Hub_SalePers_SQN     numeric(12) NOT NULL ,
	Sat_SalePersQuotaHist_LDTS datetime NOT NULL ,
	Sat_SalePersQuotaHist_LEDTS datetime NULL ,
	Sat_SalePersQuotaHist_RSRC univarchar(18) NULL ,
	QuotaDate            datetime NOT NULL ,
	SalesQuota           money NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SalesPersonQuotaHistory_Bus PRIMARY KEY   CLUSTERED (Hub_SalePers_SQN  ASC,Sat_SalePersQuotaHist_LDTS  ASC),
	CONSTRAINT R_245  FOREIGN KEY (Hub_SalePers_SQN) REFERENCES Hub_SalePers(Hub_SalePers_SQN)
)
go



exec sp_primarykey 'Sat_SalePersQuotaHist', Hub_SalePers_SQN, Sat_SalePersQuotaHist_LDTS
go



CREATE TABLE Hub_CrncyRtID
(
	Hub_CrncyRtID_SQN    numeric(12) IDENTITY ,
	Hub_CrncyRtID_LDTS   datetime NOT NULL ,
	Hub_CrncyRtID_RSRC   univarchar(18) NULL ,
	CurrencyRateID       int NOT NULL ,
	CONSTRAINT PK_CurrencyRate_CurrencyRateID PRIMARY KEY   CLUSTERED (Hub_CrncyRtID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_CrncyRtID', Hub_CrncyRtID_SQN
go



CREATE UNIQUE INDEX BK_CurrencyRate ON Hub_CrncyRtID
(
	CurrencyRateID        ASC
)
go



CREATE TABLE Sat_CrncyRt
(
	Hub_CrncyRtID_SQN    numeric(12) NOT NULL ,
	Sat_CrncyRt_LDTS     datetime NOT NULL ,
	Sat_CrncyRt_LEDTS    datetime NULL ,
	Sat_CrncyRt_RSRC     univarchar(18) NULL ,
	CurrencyRateDate     datetime NOT NULL ,
	AverageRate          money NOT NULL ,
	EndOfDayRate         money NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_CurrencyRate_CurrencyRateID PRIMARY KEY   CLUSTERED (Hub_CrncyRtID_SQN  ASC,Sat_CrncyRt_LDTS  ASC),
	CONSTRAINT R_310  FOREIGN KEY (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN)
)
go



exec sp_primarykey 'Sat_CrncyRt', Hub_CrncyRtID_SQN, Sat_CrncyRt_LDTS
go



CREATE UNIQUE INDEX AK_CurrencyRate_CurrencyRateDa ON Sat_CrncyRt
(
	CurrencyRateDate      ASC
)
go



CREATE TABLE Sat_BusEntID
(
	Hub_BusEntID_SQN     numeric(12) NOT NULL ,
	Sat_BusEntID_LDTS    datetime NOT NULL ,
	Sat_BusEntID_LEDTS   datetime NULL ,
	Sat_BusEntID_RSRC    univarchar(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_BusinessEntity_BusinessEnti PRIMARY KEY   CLUSTERED (Hub_BusEntID_SQN  ASC,Sat_BusEntID_LDTS  ASC),
	CONSTRAINT R_268  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN)
)
go



exec sp_primarykey 'Sat_BusEntID', Hub_BusEntID_SQN, Sat_BusEntID_LDTS
go



CREATE TABLE Lnk_EmpID_PersID
(
	Lnk_EmpID_PersID_SQN numeric(12) IDENTITY ,
	Lnk_EmpID_PersID_LDTS datetime NOT NULL ,
	Lnk_EmpID_PersID_RSRC univarchar(18) NULL ,
	Hub_PersID_SQN       numeric(12) NULL ,
	Hub_EmpID_SQN        numeric(12) NULL ,
	CONSTRAINT XPKLnk_EmpID_PersID PRIMARY KEY   CLUSTERED (Lnk_EmpID_PersID_SQN  ASC),
	CONSTRAINT R_248  FOREIGN KEY (Hub_EmpID_SQN) REFERENCES Hub_EmpID(Hub_EmpID_SQN),
	CONSTRAINT R_249  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
go



exec sp_primarykey 'Lnk_EmpID_PersID', Lnk_EmpID_PersID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_EmpID_PersID ON Lnk_EmpID_PersID
(
	Hub_EmpID_SQN         ASC,
	Hub_PersID_SQN        ASC
)
go



CREATE TABLE Lnk_CustID_Store
(
	Lnk_CustID_Store_SQN numeric(12) IDENTITY ,
	Lnk_CustID_Store_LDTS datetime NOT NULL ,
	Lnk_CustID_Store_RSRC univarchar(18) NULL ,
	Hub_CustID_SQN       numeric(12) NULL ,
	Hub_Store_SQN        numeric(12) NULL ,
	CONSTRAINT XPKLnk_CustID_Store PRIMARY KEY   CLUSTERED (Lnk_CustID_Store_SQN  ASC),
	CONSTRAINT R_254  FOREIGN KEY (Hub_Store_SQN) REFERENCES Hub_Store(Hub_Store_SQN),
	CONSTRAINT R_255  FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN)
)
go



exec sp_primarykey 'Lnk_CustID_Store', Lnk_CustID_Store_SQN
go



CREATE UNIQUE INDEX AK_Lnk_CustID_Store ON Lnk_CustID_Store
(
	Hub_Store_SQN         ASC,
	Hub_CustID_SQN        ASC
)
go



CREATE TABLE Lnk_PersID_CustID
(
	Lnk_PersID_CustID_SQN numeric(12) IDENTITY ,
	Lnk_PersID_CustID_LDTS datetime NOT NULL ,
	Lnk_PersID_CustID_RSRC univarchar(18) NULL ,
	Hub_PersID_SQN       numeric(12) NULL ,
	Hub_CustID_SQN       numeric(12) NULL ,
	CONSTRAINT XPKLnk_PersID_CustID PRIMARY KEY   CLUSTERED (Lnk_PersID_CustID_SQN  ASC),
	CONSTRAINT R_256  FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	CONSTRAINT R_257  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
go



exec sp_primarykey 'Lnk_PersID_CustID', Lnk_PersID_CustID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_PersID_CustID ON Lnk_PersID_CustID
(
	Hub_CustID_SQN        ASC,
	Hub_PersID_SQN        ASC
)
go



CREATE TABLE Hub_AddTypID
(
	Hub_AddTypID_SQN     numeric(12) IDENTITY ,
	Hub_AddTypID_LDTS    datetime NOT NULL ,
	Hub_AddTypID_RSRC    univarchar(18) NULL ,
	AddressTypeID        int NOT NULL ,
	CONSTRAINT PK_AddressType_AddressTypeID PRIMARY KEY   CLUSTERED (Hub_AddTypID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_AddTypID', Hub_AddTypID_SQN
go



CREATE UNIQUE INDEX BK_AddressTypeID ON Hub_AddTypID
(
	AddressTypeID         ASC
)
go



CREATE TABLE Sat_AddTyp
(
	Hub_AddTypID_SQN     numeric(12) NOT NULL ,
	Sat_AddTyp_LDTS      datetime NOT NULL ,
	Sat_AddTyp_LEDTS     datetime NULL ,
	Sat_AddTyp_RSRC      univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_AddressType_AddressTypeID PRIMARY KEY   CLUSTERED (Hub_AddTypID_SQN  ASC,Sat_AddTyp_LDTS  ASC),
	CONSTRAINT R_285  FOREIGN KEY (Hub_AddTypID_SQN) REFERENCES Hub_AddTypID(Hub_AddTypID_SQN)
)
go



exec sp_primarykey 'Sat_AddTyp', Hub_AddTypID_SQN, Sat_AddTyp_LDTS
go



CREATE UNIQUE INDEX AK_AddressType_Name ON Sat_AddTyp
(
	Name                  ASC
)
go



CREATE TABLE Sat_SaleTer
(
	Hub_SaleTerID_SQN    numeric(12) NOT NULL ,
	Sat_SaleTer_LDTS     datetime NOT NULL ,
	Sat_SaleTer_LEDTS    datetime NULL ,
	Sat_SaleTer_RSRC     univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	CountryRegionCode    univarchar(3) NOT NULL ,
	Group                univarchar(50) NOT NULL ,
	SalesYTD             money NOT NULL ,
	SalesLastYear        money NOT NULL ,
	CostYTD              money NOT NULL ,
	CostLastYear         money NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_SalesTerritory_TerritoryID PRIMARY KEY   CLUSTERED (Hub_SaleTerID_SQN  ASC,Sat_SaleTer_LDTS  ASC),
	CONSTRAINT R_260  FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN)
)
go



exec sp_primarykey 'Sat_SaleTer', Hub_SaleTerID_SQN, Sat_SaleTer_LDTS
go



CREATE UNIQUE INDEX AK_SalesTerritory_Name ON Sat_SaleTer
(
	Name                  ASC
)
go



CREATE TABLE Lnk_ProdNum_UntMsrCd
(
	Lnk_ProdNum_UntMsrCd_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_UntMsrCd_LDTS datetime NOT NULL ,
	Lnk_ProdNum_UntMsrCd_RSRC univarchar(18) NULL ,
	Hub_ProdNum_SQN      numeric(12) NULL ,
	Hub_UntMsrCd_Wt_SQN  numeric(12) NULL ,
	Hub_UntMsrCd_Size_SQN numeric(12) NULL ,
	CONSTRAINT XPKLnk_VendNum_UntMsrCd PRIMARY KEY   CLUSTERED (Lnk_ProdNum_UntMsrCd_SQN  ASC),
	CONSTRAINT R_315  FOREIGN KEY (Hub_UntMsrCd_Wt_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN),
	CONSTRAINT R_316  FOREIGN KEY (Hub_ProdNum_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_319  FOREIGN KEY (Hub_UntMsrCd_Size_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_UntMsrCd', Lnk_ProdNum_UntMsrCd_SQN
go



CREATE UNIQUE INDEX AK_Lnk_VendNum_UntMsrCd ON Lnk_ProdNum_UntMsrCd
(
	Hub_UntMsrCd_Wt_SQN   ASC,
	Hub_ProdNum_SQN       ASC,
	Hub_UntMsrCd_Size_SQN  ASC
)
go



CREATE TABLE Sat_UntMsr
(
	Sat_UntMsr_LDTS      datetime NOT NULL ,
	Hub_UntMsrCd_SQN     numeric(12) NOT NULL ,
	Sat_UntMsr_LEDTS     datetime NULL ,
	Sat_UntMsr_RSRC      univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_UnitMeasure_UnitMeasureCode PRIMARY KEY   CLUSTERED (Sat_UntMsr_LDTS  ASC,Hub_UntMsrCd_SQN  ASC),
	CONSTRAINT R_313  FOREIGN KEY (Hub_UntMsrCd_SQN) REFERENCES Hub_UntMsrCd(Hub_UntMsrCd_SQN)
)
go



exec sp_primarykey 'Sat_UntMsr', Sat_UntMsr_LDTS, Hub_UntMsrCd_SQN
go



CREATE UNIQUE INDEX AK_UnitMeasure_Name ON Sat_UntMsr
(
	Name                  ASC
)
go



CREATE TABLE Lnk_CrncyCd_CrncyRtID
(
	Lnk_CrncyCd_CrncyRtID_SQN numeric(12) IDENTITY ,
	Lnk_CrncyCd_CrncyRtID_LDTS datetime NOT NULL ,
	Lnk_CrncyCd_CrncyRtID_RSRC univarchar(18) NULL ,
	Hub_CrncyRtID_SQN    numeric(12) NULL ,
	Hub_CrncyCd_From_SQN numeric(12) NULL ,
	Hub_CrncyCd_To_SQN   numeric(12) NULL ,
	CONSTRAINT XPKLnk_CrncyCd_CrncyRtID PRIMARY KEY   CLUSTERED (Lnk_CrncyCd_CrncyRtID_SQN  ASC),
	CONSTRAINT R_307  FOREIGN KEY (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN),
	CONSTRAINT R_308  FOREIGN KEY (Hub_CrncyCd_From_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN),
	CONSTRAINT R_309  FOREIGN KEY (Hub_CrncyCd_To_SQN) REFERENCES Hub_CrncyCd(Hub_CrncyCd_SQN)
)
go



exec sp_primarykey 'Lnk_CrncyCd_CrncyRtID', Lnk_CrncyCd_CrncyRtID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_CrncyCd_CrncyRtID ON Lnk_CrncyCd_CrncyRtID
(
	Hub_CrncyRtID_SQN     ASC,
	Hub_CrncyCd_From_SQN  ASC,
	Hub_CrncyCd_To_SQN    ASC
)
go



CREATE TABLE Lnk_SOrdNum_CrncyRtID
(
	Lnk_SOrdNum_CrncyRtID_SQN numeric(12) IDENTITY ,
	Lnk_SOrdNum_CrncyRtID_LDTS datetime NOT NULL ,
	Lnk_SOrdNum_CrncyRtID_RSRC univarchar(18) NULL ,
	Hub_SOrdNum_SQN      numeric(12) NULL ,
	Hub_CrncyRtID_SQN    numeric(12) NULL ,
	CONSTRAINT XPKLnk_SOrdNum_CrncyRtID PRIMARY KEY   CLUSTERED (Lnk_SOrdNum_CrncyRtID_SQN  ASC),
	CONSTRAINT R_311  FOREIGN KEY (Hub_CrncyRtID_SQN) REFERENCES Hub_CrncyRtID(Hub_CrncyRtID_SQN),
	CONSTRAINT R_312  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
go



exec sp_primarykey 'Lnk_SOrdNum_CrncyRtID', Lnk_SOrdNum_CrncyRtID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_CrncyRtID ON Lnk_SOrdNum_CrncyRtID
(
	Hub_CrncyRtID_SQN     ASC,
	Hub_SOrdNum_SQN       ASC
)
go



CREATE TABLE Sat_CntryRgn
(
	Hub_CntryRgnCd_SQN   numeric(12) NOT NULL ,
	Sat_CntryRgn_LDTS    datetime NOT NULL ,
	Sat_CntryRgn_LEDTS   datetime NULL ,
	Sat_CntryRgn_RSRC    univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_CountryRegion_CountryRegion PRIMARY KEY   CLUSTERED (Hub_CntryRgnCd_SQN  ASC,Sat_CntryRgn_LDTS  ASC),
	CONSTRAINT R_304  FOREIGN KEY (Hub_CntryRgnCd_SQN) REFERENCES Hub_CntryRgnCd(Hub_CntryRgnCd_SQN)
)
go



exec sp_primarykey 'Sat_CntryRgn', Hub_CntryRgnCd_SQN, Sat_CntryRgn_LDTS
go



CREATE UNIQUE INDEX AK_CountryRegion_Name ON Sat_CntryRgn
(
	Name                  ASC
)
go



CREATE TABLE Lnk_SaleTerID_StProvID
(
	Lnk_SaleTerID_StProvID_SQN numeric(12) IDENTITY ,
	Lnk_SaleTerID_StProvID_LDTS datetime NOT NULL ,
	Lnk_SaleTerID_StProvID_RSRC univarchar(18) NULL ,
	Hub_StProvID_SQN     numeric(12) NULL ,
	Hub_SaleTerID_SQN    numeric(12) NULL ,
	CONSTRAINT XPKLnk_SaleTerID_StProvID PRIMARY KEY   CLUSTERED (Lnk_SaleTerID_StProvID_SQN  ASC),
	CONSTRAINT R_293  FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN),
	CONSTRAINT R_294  FOREIGN KEY (Hub_StProvID_SQN) REFERENCES Hub_StProvID(Hub_StProvID_SQN)
)
go



exec sp_primarykey 'Lnk_SaleTerID_StProvID', Lnk_SaleTerID_StProvID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_SaleTerID_StProvID ON Lnk_SaleTerID_StProvID
(
	Hub_SaleTerID_SQN     ASC,
	Hub_StProvID_SQN      ASC
)
go



CREATE TABLE Lnk_CustID_SOrdNum
(
	Lnk_CustID_SOrdNum_SQN numeric(12) IDENTITY ,
	Lnk_CustID_SOrdNum_LDTS datetime NOT NULL ,
	Lnk_CustID_SOrdNum_RSRC univarchar(18) NULL ,
	Hub_SOrdNum_SQN      numeric(12) NULL ,
	Hub_CustID_SQN       numeric(12) NULL ,
	CONSTRAINT XPKLnk_CustID_SOrdNum PRIMARY KEY   CLUSTERED (Lnk_CustID_SOrdNum_SQN  ASC),
	CONSTRAINT R_258  FOREIGN KEY (Hub_CustID_SQN) REFERENCES Hub_CustID(Hub_CustID_SQN),
	CONSTRAINT R_259  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
go



exec sp_primarykey 'Lnk_CustID_SOrdNum', Lnk_CustID_SOrdNum_SQN
go



CREATE UNIQUE INDEX AK_Lnk_CustID_SOrdNum ON Lnk_CustID_SOrdNum
(
	Hub_SOrdNum_SQN       ASC,
	Hub_CustID_SQN        ASC
)
go



CREATE TABLE Sat_Add
(
	Hub_AddID_SQN        numeric(12) NOT NULL ,
	Sat_Add_LDTS         datetime NOT NULL ,
	Sat_Add_LEDTS        datetime NULL ,
	Sat_Add_RSRC         univarchar(18) NULL ,
	AddressLine1         univarchar(60) NOT NULL ,
	AddressLine2         univarchar(60) NULL ,
	City                 univarchar(30) NOT NULL ,
	StateProvinceID      char(18) NOT NULL ,
	PostalCode           univarchar(15) NOT NULL ,
	SpatialLocation      char(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_Address_AddressID PRIMARY KEY   CLUSTERED (Hub_AddID_SQN  ASC,Sat_Add_LDTS  ASC),
	CONSTRAINT R_286  FOREIGN KEY (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
go



exec sp_primarykey 'Sat_Add', Hub_AddID_SQN, Sat_Add_LDTS
go



CREATE UNIQUE INDEX IX_Address_AddressLine1_Addres ON Sat_Add
(
	AddressLine1          ASC,
	AddressLine2          ASC,
	City                  ASC,
	StateProvinceID       ASC,
	PostalCode            ASC
)
go



CREATE TABLE Lnk_BusEntID_AddID_AddTypID
(
	Lnk_BusEntID_AddID_AddTypID_SQ numeric(12) IDENTITY ,
	Lnk_BusEntID_AddID_AddTypID_LD datetime NOT NULL ,
	Lnk_BusEntID_AddID_AddTypID_RS univarchar(18) NULL ,
	Hub_BusEntID_SQN     numeric(12) NULL ,
	Hub_AddID_SQN        numeric(12) NULL ,
	Hub_AddTypID_SQN     numeric(12) NULL ,
	CONSTRAINT XPKLnk_BusEntID_AddID PRIMARY KEY   CLUSTERED (Lnk_BusEntID_AddID_AddTypID_SQ  ASC),
	CONSTRAINT R_281  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT R_282  FOREIGN KEY (Hub_AddTypID_SQN) REFERENCES Hub_AddTypID(Hub_AddTypID_SQN),
	CONSTRAINT R_283  FOREIGN KEY (Hub_AddID_SQN) REFERENCES Hub_AddID(Hub_AddID_SQN)
)
go



exec sp_primarykey 'Lnk_BusEntID_AddID_AddTypID', Lnk_BusEntID_AddID_AddTypID_SQ
go



CREATE UNIQUE INDEX AK_Lnk_BusEntID_AddID ON Lnk_BusEntID_AddID_AddTypID
(
	Hub_BusEntID_SQN      ASC,
	Hub_AddTypID_SQN      ASC,
	Hub_AddID_SQN         ASC
)
go



CREATE TABLE Sat_BusEntID_AddID_AddTypID
(
	Lnk_BusEntID_AddID_AddTypID_SQ numeric(12) NOT NULL ,
	Sat_BusEntID_AddID_AddTypID_LD datetime NOT NULL ,
	Sat_BusEntID_AddID_AddTypID_LE datetime NULL ,
	Sat_BusEntID_AddID_AddTypID_RS univarchar(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_BusinessEntityAddress_Busin PRIMARY KEY   CLUSTERED (Lnk_BusEntID_AddID_AddTypID_SQ  ASC,Sat_BusEntID_AddID_AddTypID_LD  ASC),
	CONSTRAINT R_284  FOREIGN KEY (Lnk_BusEntID_AddID_AddTypID_SQ) REFERENCES Lnk_BusEntID_AddID_AddTypID(Lnk_BusEntID_AddID_AddTypID_SQ)
)
go



exec sp_primarykey 'Sat_BusEntID_AddID_AddTypID', Lnk_BusEntID_AddID_AddTypID_SQ, Sat_BusEntID_AddID_AddTypID_LD
go



CREATE TABLE Lnk_ProdNum_BOMID
(
	Lnk_ProdNum_BOMID_SQN numeric(12) IDENTITY ,
	Lnk_ProdNum_BOMID_LDTS datetime NOT NULL ,
	Lnk_ProdNum_BOMID_RSRC univarchar(18) NULL ,
	Hub_ProdNum_Asmbly_SQN numeric(12) NULL ,
	Hub_ProdNum_Comp_SQN numeric(12) NULL ,
	Hub_BOMID_SQN        numeric(12) NULL ,
	CONSTRAINT XPKLnk_BOM_Heir PRIMARY KEY   CLUSTERED (Lnk_ProdNum_BOMID_SQN  ASC),
	CONSTRAINT R_323  FOREIGN KEY (Hub_ProdNum_Comp_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_324  FOREIGN KEY (Hub_ProdNum_Asmbly_SQN) REFERENCES Hub_ProdNum(Hub_ProdNum_SQN),
	CONSTRAINT R_325  FOREIGN KEY (Hub_BOMID_SQN) REFERENCES Hub_BOMID(Hub_BOMID_SQN)
)
go



exec sp_primarykey 'Lnk_ProdNum_BOMID', Lnk_ProdNum_BOMID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_BOM_Heir ON Lnk_ProdNum_BOMID
(
	Hub_ProdNum_Comp_SQN  ASC,
	Hub_ProdNum_Asmbly_SQN  ASC,
	Hub_BOMID_SQN         ASC
)
go



CREATE TABLE Hub_CntTypID
(
	Hub_CntTypID_SQN     numeric(12) IDENTITY ,
	Hub_CntTypID_LDTS    datetime NOT NULL ,
	Hub_CntTypID_RSRC    univarchar(18) NULL ,
	ContactTypeID        int NOT NULL ,
	CONSTRAINT PK_ContactType_ContactTypeID PRIMARY KEY   CLUSTERED (Hub_CntTypID_SQN  ASC)
)
go



exec sp_primarykey 'Hub_CntTypID', Hub_CntTypID_SQN
go



CREATE UNIQUE INDEX BK_ContactTypeID ON Hub_CntTypID
(
	ContactTypeID         ASC
)
go



CREATE TABLE Sat_CntTyp
(
	Hub_CntTypID_SQN     numeric(12) NOT NULL ,
	Sat_CntTyp_LDTS      datetime NOT NULL ,
	Sat_CntTyp_LEDTS     datetime NULL ,
	Sat_CntTyp_RSRC      univarchar(18) NULL ,
	Name                 univarchar(50) NOT NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_ContactType_ContactTypeID PRIMARY KEY   CLUSTERED (Hub_CntTypID_SQN  ASC,Sat_CntTyp_LDTS  ASC),
	CONSTRAINT R_277  FOREIGN KEY (Hub_CntTypID_SQN) REFERENCES Hub_CntTypID(Hub_CntTypID_SQN)
)
go



exec sp_primarykey 'Sat_CntTyp', Hub_CntTypID_SQN, Sat_CntTyp_LDTS
go



CREATE UNIQUE INDEX AK_ContactType_Name ON Sat_CntTyp
(
	Name                  ASC
)
go



CREATE TABLE Lnk_PersID_BusEntID_CntTypID
(
	Lnk_PersID_BusEntID_CntTypID_S numeric(12) IDENTITY ,
	Lnk_PersID_BusEntID_CntTypID_L datetime NOT NULL ,
	Lnk_PersID_BusEntID_CntTypID_R univarchar(18) NULL ,
	Hub_BusEntID_SQN     numeric(12) NULL ,
	Hub_PersID_SQN       numeric(12) NULL ,
	Hub_CntTypID_SQN     numeric(12) NULL ,
	CONSTRAINT XPKLnk_PersID_BusEntID_CntTypI PRIMARY KEY   CLUSTERED (Lnk_PersID_BusEntID_CntTypID_S  ASC),
	CONSTRAINT R_278  FOREIGN KEY (Hub_CntTypID_SQN) REFERENCES Hub_CntTypID(Hub_CntTypID_SQN),
	CONSTRAINT R_279  FOREIGN KEY (Hub_BusEntID_SQN) REFERENCES Hub_BusEntID(Hub_BusEntID_SQN),
	CONSTRAINT R_280  FOREIGN KEY (Hub_PersID_SQN) REFERENCES Hub_PersID(Hub_PersID_SQN)
)
go



exec sp_primarykey 'Lnk_PersID_BusEntID_CntTypID', Lnk_PersID_BusEntID_CntTypID_S
go



CREATE UNIQUE INDEX AK_Lnk_PersID_BusEntID_CntTypI ON Lnk_PersID_BusEntID_CntTypID
(
	Hub_CntTypID_SQN      ASC,
	Hub_BusEntID_SQN      ASC,
	Hub_PersID_SQN        ASC
)
go



CREATE TABLE Sat_BusEnt_Cnt
(
	Lnk_PersID_BusEntID_CntTypID_S numeric(12) NOT NULL ,
	Sat_BusEnt_Cnt_LDTS  datetime NOT NULL ,
	Sat_BusEnt_Cnt_LEDTS datetime NULL ,
	Sat_BusEnt_Cnt_RSRC  univarchar(18) NULL ,
	ModifiedDate         datetime NOT NULL ,
	CONSTRAINT PK_BusinessEntityContact_Busin PRIMARY KEY   CLUSTERED (Lnk_PersID_BusEntID_CntTypID_S  ASC,Sat_BusEnt_Cnt_LDTS  ASC),
	CONSTRAINT R_276  FOREIGN KEY (Lnk_PersID_BusEntID_CntTypID_S) REFERENCES Lnk_PersID_BusEntID_CntTypID(Lnk_PersID_BusEntID_CntTypID_S)
)
go



exec sp_primarykey 'Sat_BusEnt_Cnt', Lnk_PersID_BusEntID_CntTypID_S, Sat_BusEnt_Cnt_LDTS
go



CREATE TABLE Lnk_SOrdNum_SaleTerID
(
	Lnk_SOrdNum_SaleTerID_SQN numeric(12) IDENTITY ,
	Lnk_SOrdNum_SaleTerID_LDTS datetime NOT NULL ,
	Lnk_SOrdNum_SaleTerID_RSRC univarchar(18) NULL ,
	Hub_SOrdNum_SQN      numeric(12) NULL ,
	Hub_SaleTerID_SQN    numeric(12) NULL ,
	CONSTRAINT XPKLnk_SOrdNum_SaleTerID PRIMARY KEY   CLUSTERED (Lnk_SOrdNum_SaleTerID_SQN  ASC),
	CONSTRAINT R_263  FOREIGN KEY (Hub_SaleTerID_SQN) REFERENCES Hub_SaleTerID(Hub_SaleTerID_SQN),
	CONSTRAINT R_264  FOREIGN KEY (Hub_SOrdNum_SQN) REFERENCES Hub_SOrdNum(Hub_SOrdNum_SQN)
)
go



exec sp_primarykey 'Lnk_SOrdNum_SaleTerID', Lnk_SOrdNum_SaleTerID_SQN
go



CREATE UNIQUE INDEX AK_Lnk_SOrdNum_SaleTerID ON Lnk_SOrdNum_SaleTerID
(
	Hub_SaleTerID_SQN     ASC,
	Hub_SOrdNum_SQN       ASC
)
go



exec sp_foreignkey 'Lnk_ProdNum_ProdSubCatID', 'Hub_ProdSubCatID' , 
	Hub_ProdSubCatID_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_ProdSubCatID', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_ProdSubCatID', 'Hub_ProdCatID' , 
	Hub_ProdCatID_SQN
go



exec sp_foreignkey 'Sat_ProdSubCat', 'Hub_ProdSubCatID' , 
	Hub_ProdSubCatID_SQN
go



exec sp_foreignkey 'Lnk_ProdSubCatID_ProdCatID', 'Hub_ProdCatID' , 
	Hub_ProdCatID_SQN
go


exec sp_foreignkey 'Lnk_ProdSubCatID_ProdCatID', 'Hub_ProdSubCatID' , 
	Hub_ProdSubCatID_SQN
go



exec sp_foreignkey 'Sat_ProdCat', 'Hub_ProdCatID' , 
	Hub_ProdCatID_SQN
go



exec sp_foreignkey 'Lnk_AddID_StProvID', 'Hub_AddID' , 
	Hub_AddID_SQN
go


exec sp_foreignkey 'Lnk_AddID_StProvID', 'Hub_StProvID' , 
	Hub_StProvID_SQN
go



exec sp_foreignkey 'Lnk_ProdNum_DocNode', 'Hub_DocNode' , 
	Hub_DocNode_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_DocNode', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go



exec sp_foreignkey 'Sat_Prod_Doc', 'Lnk_ProdNum_DocNode' , 
	Lnk_ProdNum_DocNode_SQN
go



exec sp_foreignkey 'Sat_ShopCartItem', 'Hub_ShopCartItemID' , 
	Hub_ShopCartItemID_SQN
go



exec sp_foreignkey 'Lnk_SOrdNum_SRsnID', 'Hub_SOrdNum' , 
	Hub_SOrdNum_SQN
go


exec sp_foreignkey 'Lnk_SOrdNum_SRsnID', 'Hub_SRsnID' , 
	Hub_SRsnID_SQN
go



exec sp_foreignkey 'Sat_SOrdNum_SRsnID', 'Lnk_SOrdNum_SRsnID' , 
	Lnk_SOrdNum_SRsnID_SQN
go



exec sp_foreignkey 'Lnk_ProdNum_ShopCartItemID', 'Hub_ShopCartItemID' , 
	Hub_ShopCartItemID_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_ShopCartItemID', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go



exec sp_foreignkey 'Lnk_ProdNum_ProdPhotoID', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_ProdPhotoID', 'Hub_ProdPhotoID' , 
	Hub_ProdPhotoID_SQN
go



exec sp_foreignkey 'Sat_Prod_ProdPhoto', 'Lnk_ProdNum_ProdPhotoID' , 
	Lnk_ProdNum_ProdPhotoID_SQN
go



exec sp_foreignkey 'Sat_ProdPhoto', 'Hub_ProdPhotoID' , 
	Hub_ProdPhotoID_SQN
go



exec sp_foreignkey 'Sat_SOfr', 'Hub_SOfrID' , 
	Hub_SOfrID_SQN
go



exec sp_foreignkey 'Lnk_ProdNum_SOrdNum_SOfrID', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_SOrdNum_SOfrID', 'Hub_SOfrID' , 
	Hub_SOfrID_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_SOrdNum_SOfrID', 'Hub_SOrdNum' , 
	Hub_SOrdNum_SQN
go



exec sp_foreignkey 'Sat_SOrdDet', 'Lnk_ProdNum_SOrdNum_SOfrID' , 
	Lnk_ProdNum_SOrdID_SOfrID_SQN
go



exec sp_foreignkey 'Sat_Loc', 'Hub_LocID' , 
	Hub_LocID_SQN
go



exec sp_foreignkey 'Sat_ProdNum_SOrdNum_SOfrID', 'Lnk_ProdNum_SOrdNum_SOfrID' , 
	Lnk_ProdNum_SOrdNum_SOfrID_SQN
go



exec sp_foreignkey 'Sat_TransHist', 'Hub_TransID' , 
	Hub_TransID_SQN
go



exec sp_foreignkey 'Sat_ProdListPriceHist', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go



exec sp_foreignkey 'Sat_ProdCostHist', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go



exec sp_foreignkey 'Sat_ProdRev', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go



exec sp_foreignkey 'Sat_Wrk_Ord', 'Hub_Wrk_Ord' , 
	Hub_WOID_SQN
go



exec sp_foreignkey 'Sat_EmpPayHist', 'Hub_EmpID' , 
	Hub_EmpID_SQN
go



exec sp_foreignkey 'Lnk_ProdNum_TransID', 'Hub_TransID' , 
	Hub_TransID_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_TransID', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go



exec sp_foreignkey 'Sat_CC', 'Hub_CCID' , 
	Hub_CCID_SQN
go



exec sp_foreignkey 'Sat_JobCand', 'Hub_JobCandID' , 
	Hub_JobCandID_SQN
go



exec sp_foreignkey 'Lnk_WOID_LocID', 'Hub_Wrk_Ord' , 
	Hub_WOID_SQN
go


exec sp_foreignkey 'Lnk_WOID_LocID', 'Hub_LocID' , 
	Hub_LocID_SQN
go



exec sp_foreignkey 'Sat_WOID_LocID', 'Lnk_WOID_LocID' , 
	Lnk_WOID_LocID_SQN
go



exec sp_foreignkey 'Lnk_PersID_BusEntID', 'Hub_PersID' , 
	Hub_PersID_SQN
go


exec sp_foreignkey 'Lnk_PersID_BusEntID', 'Hub_BusEntID' , 
	Hub_BusEntID_SQN
go



exec sp_foreignkey 'Lnk_Wrk_Ord_ScrapID', 'Hub_Wrk_Ord' , 
	Hub_WOID_SQN
go


exec sp_foreignkey 'Lnk_Wrk_Ord_ScrapID', 'Hub_ScrapID' , 
	Hub_ScrapID_SQN
go



exec sp_foreignkey 'Lnk_SOrdNum_CCID', 'Hub_SOrdNum' , 
	Hub_SOrdNum_SQN
go


exec sp_foreignkey 'Lnk_SOrdNum_CCID', 'Hub_CCID' , 
	Hub_CCID_SQN
go



exec sp_foreignkey 'Sat_Scrap', 'Hub_ScrapID' , 
	Hub_ScrapID_SQN
go



exec sp_foreignkey 'Sat_Prod', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go



exec sp_foreignkey 'Lnk_SOrdNum_AddID', 'Hub_SOrdNum' , 
	Hub_SOrdNum_SQN
go


exec sp_foreignkey 'Lnk_SOrdNum_AddID', 'Hub_AddID' , 
	Hub_AddID_BillTo_SQN
go


exec sp_foreignkey 'Lnk_SOrdNum_AddID', 'Hub_AddID' , 
	Hub_AddID_ShipTo_SQN
go



exec sp_foreignkey 'Lnk_ProdNum_WOID', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_WOID', 'Hub_Wrk_Ord' , 
	Hub_WOID_SQN
go



exec sp_foreignkey 'Lnk_DocNode_EmpID', 'Hub_EmpID' , 
	Hub_EmpID_SQN
go


exec sp_foreignkey 'Lnk_DocNode_EmpID', 'Hub_DocNode' , 
	Hub_DocNode_SQN
go



exec sp_foreignkey 'Lnk_ProdNum_LocID', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_LocID', 'Hub_LocID' , 
	Hub_LocID_SQN
go



exec sp_foreignkey 'Sat_Prod_Loc', 'Lnk_ProdNum_LocID' , 
	Lnk_ProdNum_LocID_SQN
go



exec sp_foreignkey 'Sat_Pers', 'Hub_PersID' , 
	Hub_PersID_SQN
go



exec sp_foreignkey 'Sat_Emp', 'Hub_EmpID' , 
	Hub_EmpID_SQN
go



exec sp_foreignkey 'Sat_ProdDesc', 'Hub_ProdDescID' , 
	Hub_ProdDescID_SQN
go



exec sp_foreignkey 'Sat_Cult', 'Hub_CultID' , 
	Hub_CultID_SQN
go



exec sp_foreignkey 'Lnk_ModID_ProdDescID_CultID', 'Hub_CultID' , 
	Hub_CultID_SQN
go


exec sp_foreignkey 'Lnk_ModID_ProdDescID_CultID', 'Hub_ProdDescID' , 
	Hub_ProdDescID_SQN
go


exec sp_foreignkey 'Lnk_ModID_ProdDescID_CultID', 'Hub_ModID' , 
	Hub_ModID_SQN
go



exec sp_foreignkey 'Sat_ProdMod_ProdDesc_Cult', 'Lnk_ModID_ProdDescID_CultID' , 
	Lnk_ModID_ProdDescID_CultID_SQ
go



exec sp_foreignkey 'Lnk_ModID_IllID', 'Hub_IllID' , 
	Hub_IllID_SQN
go


exec sp_foreignkey 'Lnk_ModID_IllID', 'Hub_ModID' , 
	Hub_ModID_SQN
go



exec sp_foreignkey 'Sat_ProdMod_Ill', 'Lnk_ModID_IllID' , 
	Lnk_ModID_IllID_SQN
go



exec sp_foreignkey 'Sat_Illustraion', 'Hub_IllID' , 
	Hub_IllID_SQN
go



exec sp_foreignkey 'Sat_POHead', 'Hub_POID' , 
	Hub_POID_SQN
go



exec sp_foreignkey 'Lnk_EmpID_JobCandID', 'Hub_EmpID' , 
	Hub_EmpID_SQN
go


exec sp_foreignkey 'Lnk_EmpID_JobCandID', 'Hub_JobCandID' , 
	Hub_JobCandID_SQN
go



exec sp_foreignkey 'Lnk_ProdNum_ModID', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_ModID', 'Hub_ModID' , 
	Hub_ModID_SQN
go



exec sp_foreignkey 'Sat_Mod', 'Hub_ModID' , 
	Hub_ModID_SQN
go



exec sp_foreignkey 'Sat_SRsn', 'Hub_SRsnID' , 
	Hub_SRsnID_SQN
go



exec sp_foreignkey 'Lnk_PersID_CCID', 'Hub_CCID' , 
	Hub_CCID_SQN
go


exec sp_foreignkey 'Lnk_PersID_CCID', 'Hub_PersID' , 
	Hub_PersID_SQN
go



exec sp_foreignkey 'Sat_PersID_CCID', 'Lnk_PersID_CCID' , 
	Lnk_PersID_CCID_SQN
go



exec sp_foreignkey 'Sat_SOrd', 'Hub_SOrdNum' , 
	Hub_SOrdNum_SQN
go



exec sp_foreignkey 'Sat_Doc', 'Hub_DocNode' , 
	Hub_DocNode_SQN
go



exec sp_foreignkey 'Lnk_BusEntID_VendNum', 'Hub_BusEntID' , 
	Hub_BusEntID_SQN
go


exec sp_foreignkey 'Lnk_BusEntID_VendNum', 'Hub_VendNum' , 
	Hub_VendNum_SQN
go



exec sp_foreignkey 'Lnk_PersID_EmailAddID', 'Hub_PersID' , 
	Hub_PersID_SQN
go


exec sp_foreignkey 'Lnk_PersID_EmailAddID', 'Hub_EmailAddID' , 
	Hub_EmailAddID_SQN
go



exec sp_foreignkey 'Lnk_EmpID_DepID_ShiftID', 'Hub_EmpID' , 
	Hub_EmpID_SQN
go


exec sp_foreignkey 'Lnk_EmpID_DepID_ShiftID', 'Hub_ShiftID' , 
	Hub_ShiftID_SQN
go


exec sp_foreignkey 'Lnk_EmpID_DepID_ShiftID', 'Hub_DepID' , 
	Hub_DepID_SQN
go



exec sp_foreignkey 'Sat_EmpID_DepID_ShiftID', 'Lnk_EmpID_DepID_ShiftID' , 
	Lnk_EmpID_DepID_ShiftID_SQN
go



exec sp_foreignkey 'Sat_Dep', 'Hub_DepID' , 
	Hub_DepID_SQN
go



exec sp_foreignkey 'Lnk_CntryRgnID_CrncyCd', 'Hub_CntryRgnCd' , 
	Hub_CntryRgnCd_SQN
go


exec sp_foreignkey 'Lnk_CntryRgnID_CrncyCd', 'Hub_CrncyCd' , 
	Hub_CrncyCd_SQN
go



exec sp_foreignkey 'Sat_CntryRgn_Crncy', 'Lnk_CntryRgnID_CrncyCd' , 
	Lnk_CntryRgnID_CrncyCd_SQN
go



exec sp_foreignkey 'Sat_Shift', 'Hub_ShiftID' , 
	Hub_ShiftID_SQN
go



exec sp_foreignkey 'Sat_Vend', 'Hub_VendNum' , 
	Hub_VendNum_SQN
go



exec sp_foreignkey 'Lnk_ProdNum_VendNum_UntMsrCd', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_VendNum_UntMsrCd', 'Hub_VendNum' , 
	Hub_VendNum_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_VendNum_UntMsrCd', 'Hub_UntMsrCd' , 
	Hub_UntMsrCd_SQN
go



exec sp_foreignkey 'Sat_ProdNum_VendNum_UntMsrCd', 'Lnk_ProdNum_VendNum_UntMsrCd' , 
	Lnk_ProdNum_VendNum_UntMsrCd_S
go



exec sp_foreignkey 'Lnk_EmpID_POID', 'Hub_POID' , 
	Hub_POID_SQN
go


exec sp_foreignkey 'Lnk_EmpID_POID', 'Hub_EmpID' , 
	Hub_EmpID_SQN
go



exec sp_foreignkey 'Lnk_POID_ShpMthdID', 'Hub_POID' , 
	Hub_POID_SQN
go


exec sp_foreignkey 'Lnk_POID_ShpMthdID', 'Hub_ShpMthdID' , 
	Hub_ShpMthID_SQN
go



exec sp_foreignkey 'Lnk_VendNum_POID', 'Hub_VendNum' , 
	Hub_VendNum_SQN
go


exec sp_foreignkey 'Lnk_VendNum_POID', 'Hub_POID' , 
	Hub_POID_SQN
go



exec sp_foreignkey 'Sat_Cust', 'Hub_CustID' , 
	Hub_CustID_SQN
go



exec sp_foreignkey 'Sat_PNT', 'Hub_PNTID' , 
	Hub_PNTID_SQN
go



exec sp_foreignkey 'Sat_Phon', 'Hub_Phon' , 
	Hub_Phon_SQN
go



exec sp_foreignkey 'Lnk_PersID_Phon_PNTID', 'Hub_PersID' , 
	Hub_PersID_SQN
go


exec sp_foreignkey 'Lnk_PersID_Phon_PNTID', 'Hub_Phon' , 
	Hub_Phon_SQN
go


exec sp_foreignkey 'Lnk_PersID_Phon_PNTID', 'Hub_PNTID' , 
	Hub_PNTID_SQN
go



exec sp_foreignkey 'Sat_EmailAdd', 'Hub_EmailAddID' , 
	Hub_EmailAddID_SQN
go



exec sp_foreignkey 'Lnk_SOrdNum_ShpMthdID', 'Hub_ShpMthdID' , 
	Hub_ShpMthID_SQN
go


exec sp_foreignkey 'Lnk_SOrdNum_ShpMthdID', 'Hub_SOrdNum' , 
	Hub_SOrdNum_SQN
go



exec sp_foreignkey 'Sat_Pswrd', 'Hub_PersID' , 
	Hub_PersID_SQN
go



exec sp_foreignkey 'Lnk_ProdNum_POID', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_POID', 'Hub_POID' , 
	Hub_POID_SQN
go



exec sp_foreignkey 'Sat_PODetail', 'Lnk_ProdNum_POID' , 
	Lnk_ProdNum_POID_SQN
go



exec sp_foreignkey 'Sat_ShpMthd', 'Hub_ShpMthdID' , 
	Hub_ShpMthID_SQN
go



exec sp_foreignkey 'Lnk_StProvID_SaleTaxRtID', 'Hub_StProvID' , 
	Hub_StProvID_SQN
go


exec sp_foreignkey 'Lnk_StProvID_SaleTaxRtID', 'Hub_SaleTaxRtID' , 
	Hub_SaleTaxRtID_SQN
go



exec sp_foreignkey 'Lnk_BusEntID_Store', 'Hub_BusEntID' , 
	Hub_BusEntID_SQN
go


exec sp_foreignkey 'Lnk_BusEntID_Store', 'Hub_Store' , 
	Hub_Store_SQN
go



exec sp_foreignkey 'Lnk_EmpID_SalePers', 'Hub_EmpID' , 
	Hub_EmpID_SQN
go


exec sp_foreignkey 'Lnk_EmpID_SalePers', 'Hub_SalePers' , 
	Hub_SalePers_SQN
go



exec sp_foreignkey 'Lnk_SalePers_Store', 'Hub_SalePers' , 
	Hub_SalePers_SQN
go


exec sp_foreignkey 'Lnk_SalePers_Store', 'Hub_Store' , 
	Hub_Store_SQN
go



exec sp_foreignkey 'Sat_BOM', 'Hub_BOMID' , 
	Hub_BOMID_SQN
go



exec sp_foreignkey 'Sat_StProv', 'Hub_StProvID' , 
	Hub_StProvID_SQN
go



exec sp_foreignkey 'Lnk_StProvID_CntryRgnCd', 'Hub_StProvID' , 
	Hub_StProvID_SQN
go


exec sp_foreignkey 'Lnk_StProvID_CntryRgnCd', 'Hub_CntryRgnCd' , 
	Hub_CntryRgnCd_SQN
go



exec sp_foreignkey 'Sat_SaleTaxRt', 'Hub_SaleTaxRtID' , 
	Hub_SaleTaxRtID_SQN
go



exec sp_foreignkey 'Sat_SalePers', 'Hub_SalePers' , 
	Hub_SalePers_SQN
go



exec sp_foreignkey 'Lnk_SalePers_SaleTerID', 'Hub_SalePers' , 
	Hub_SalePers_SQN
go


exec sp_foreignkey 'Lnk_SalePers_SaleTerID', 'Hub_SaleTerID' , 
	Hub_SaleTerID_SQN
go



exec sp_foreignkey 'Sat_SaleTerHist', 'Lnk_SalePers_SaleTerID' , 
	Lnk_SalePers_SaleTerID_SQN
go



exec sp_foreignkey 'Sat_Store', 'Hub_Store' , 
	Hub_Store_SQN
go



exec sp_foreignkey 'Lnk_Cust_SaleTerID', 'Hub_CustID' , 
	Hub_CustID_SQN
go


exec sp_foreignkey 'Lnk_Cust_SaleTerID', 'Hub_SaleTerID' , 
	Hub_SaleTerID_SQN
go



exec sp_foreignkey 'Sat_Crncy', 'Hub_CrncyCd' , 
	Hub_CrncyCd_SQN
go



exec sp_foreignkey 'Lnk_SOrdNum_SalePers', 'Hub_SalePers' , 
	Hub_SalePers_SQN
go


exec sp_foreignkey 'Lnk_SOrdNum_SalePers', 'Hub_SOrdNum' , 
	Hub_SOrdNum_SQN
go



exec sp_foreignkey 'Sat_SalePersQuotaHist', 'Hub_SalePers' , 
	Hub_SalePers_SQN
go



exec sp_foreignkey 'Sat_CrncyRt', 'Hub_CrncyRtID' , 
	Hub_CrncyRtID_SQN
go



exec sp_foreignkey 'Sat_BusEntID', 'Hub_BusEntID' , 
	Hub_BusEntID_SQN
go



exec sp_foreignkey 'Lnk_EmpID_PersID', 'Hub_EmpID' , 
	Hub_EmpID_SQN
go


exec sp_foreignkey 'Lnk_EmpID_PersID', 'Hub_PersID' , 
	Hub_PersID_SQN
go



exec sp_foreignkey 'Lnk_CustID_Store', 'Hub_Store' , 
	Hub_Store_SQN
go


exec sp_foreignkey 'Lnk_CustID_Store', 'Hub_CustID' , 
	Hub_CustID_SQN
go



exec sp_foreignkey 'Lnk_PersID_CustID', 'Hub_CustID' , 
	Hub_CustID_SQN
go


exec sp_foreignkey 'Lnk_PersID_CustID', 'Hub_PersID' , 
	Hub_PersID_SQN
go



exec sp_foreignkey 'Sat_AddTyp', 'Hub_AddTypID' , 
	Hub_AddTypID_SQN
go



exec sp_foreignkey 'Sat_SaleTer', 'Hub_SaleTerID' , 
	Hub_SaleTerID_SQN
go



exec sp_foreignkey 'Lnk_ProdNum_UntMsrCd', 'Hub_UntMsrCd' , 
	Hub_UntMsrCd_Wt_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_UntMsrCd', 'Hub_ProdNum' , 
	Hub_ProdNum_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_UntMsrCd', 'Hub_UntMsrCd' , 
	Hub_UntMsrCd_Size_SQN
go



exec sp_foreignkey 'Sat_UntMsr', 'Hub_UntMsrCd' , 
	Hub_UntMsrCd_SQN
go



exec sp_foreignkey 'Lnk_CrncyCd_CrncyRtID', 'Hub_CrncyRtID' , 
	Hub_CrncyRtID_SQN
go


exec sp_foreignkey 'Lnk_CrncyCd_CrncyRtID', 'Hub_CrncyCd' , 
	Hub_CrncyCd_From_SQN
go


exec sp_foreignkey 'Lnk_CrncyCd_CrncyRtID', 'Hub_CrncyCd' , 
	Hub_CrncyCd_To_SQN
go



exec sp_foreignkey 'Lnk_SOrdNum_CrncyRtID', 'Hub_CrncyRtID' , 
	Hub_CrncyRtID_SQN
go


exec sp_foreignkey 'Lnk_SOrdNum_CrncyRtID', 'Hub_SOrdNum' , 
	Hub_SOrdNum_SQN
go



exec sp_foreignkey 'Sat_CntryRgn', 'Hub_CntryRgnCd' , 
	Hub_CntryRgnCd_SQN
go



exec sp_foreignkey 'Lnk_SaleTerID_StProvID', 'Hub_SaleTerID' , 
	Hub_SaleTerID_SQN
go


exec sp_foreignkey 'Lnk_SaleTerID_StProvID', 'Hub_StProvID' , 
	Hub_StProvID_SQN
go



exec sp_foreignkey 'Lnk_CustID_SOrdNum', 'Hub_CustID' , 
	Hub_CustID_SQN
go


exec sp_foreignkey 'Lnk_CustID_SOrdNum', 'Hub_SOrdNum' , 
	Hub_SOrdNum_SQN
go



exec sp_foreignkey 'Sat_Add', 'Hub_AddID' , 
	Hub_AddID_SQN
go



exec sp_foreignkey 'Lnk_BusEntID_AddID_AddTypID', 'Hub_BusEntID' , 
	Hub_BusEntID_SQN
go


exec sp_foreignkey 'Lnk_BusEntID_AddID_AddTypID', 'Hub_AddTypID' , 
	Hub_AddTypID_SQN
go


exec sp_foreignkey 'Lnk_BusEntID_AddID_AddTypID', 'Hub_AddID' , 
	Hub_AddID_SQN
go



exec sp_foreignkey 'Sat_BusEntID_AddID_AddTypID', 'Lnk_BusEntID_AddID_AddTypID' , 
	Lnk_BusEntID_AddID_AddTypID_SQ
go



exec sp_foreignkey 'Lnk_ProdNum_BOMID', 'Hub_ProdNum' , 
	Hub_ProdNum_Comp_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_BOMID', 'Hub_ProdNum' , 
	Hub_ProdNum_Asmbly_SQN
go


exec sp_foreignkey 'Lnk_ProdNum_BOMID', 'Hub_BOMID' , 
	Hub_BOMID_SQN
go



exec sp_foreignkey 'Sat_CntTyp', 'Hub_CntTypID' , 
	Hub_CntTypID_SQN
go



exec sp_foreignkey 'Lnk_PersID_BusEntID_CntTypID', 'Hub_CntTypID' , 
	Hub_CntTypID_SQN
go


exec sp_foreignkey 'Lnk_PersID_BusEntID_CntTypID', 'Hub_BusEntID' , 
	Hub_BusEntID_SQN
go


exec sp_foreignkey 'Lnk_PersID_BusEntID_CntTypID', 'Hub_PersID' , 
	Hub_PersID_SQN
go



exec sp_foreignkey 'Sat_BusEnt_Cnt', 'Lnk_PersID_BusEntID_CntTypID' , 
	Lnk_PersID_BusEntID_CntTypID_S
go



exec sp_foreignkey 'Lnk_SOrdNum_SaleTerID', 'Hub_SaleTerID' , 
	Hub_SaleTerID_SQN
go


exec sp_foreignkey 'Lnk_SOrdNum_SaleTerID', 'Hub_SOrdNum' , 
	Hub_SOrdNum_SQN
go


