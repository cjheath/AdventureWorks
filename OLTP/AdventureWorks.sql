CREATE TABLE AWBuildVersion (
	-- AWBuild Version has AWBuild Version ID
	AWBuildVersionID                        BIGINT NOT NULL IDENTITY,
	-- Primary index to AWBuild Version over PresenceConstraint over (AWBuild Version ID in "AWBuild Version has AWBuild Version ID") occurs at most one time
	PRIMARY KEY CLUSTERED(AWBuildVersionID)
)
GO

CREATE TABLE Address (
	-- Address has Address ID
	AddressID                               BIGINT NOT NULL IDENTITY,
	-- Address has Address Line1
	AddressLine1                            VARCHAR(60) NOT NULL,
	-- Address is in City that has City Name
	CityName                                VARCHAR(30) NOT NULL,
	-- Address has Postal Code
	PostalCode                              VARCHAR(15) NOT NULL,
	-- Address is in State Province that has State Province ID
	StateProvinceID                         BIGINT NOT NULL,
	-- maybe Address has Address Line2
	AddressLine2                            VARCHAR(60) NULL,
	-- maybe Address is in Spatial Location
	SpatialLocation                         Geography NULL,
	-- Primary index to Address over PresenceConstraint over (Address ID in "Address has Address ID") occurs at most one time
	PRIMARY KEY CLUSTERED(AddressID)
)
GO
CREATE UNIQUE NONCLUSTERED INDEX AddressByAddressLine1CityNamePostalCodeStateProvinceIDAddres ON Address(AddressLine1, CityName, PostalCode, StateProvinceID, AddressLine2) WHERE AddressLine2 IS NOT NULL
GO

CREATE TABLE AddressType (
	-- Address Type has Address Type ID
	AddressTypeID                           BIGINT NOT NULL IDENTITY,
	-- Address Type has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Primary index to Address Type over PresenceConstraint over (Address Type ID in "Address Type has Address Type ID") occurs at most one time
	PRIMARY KEY CLUSTERED(AddressTypeID),
	-- Unique index to Address Type over PresenceConstraint over (Name in "Address Type has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE BillOfMaterials (
	-- Bill Of Materials has Bill Of Materials ID
	BillOfMaterialsID                       BIGINT NOT NULL IDENTITY,
	-- Bill Of Materials has BOM Level
	BOMLevel                                SMALLINT NOT NULL,
	-- Bill Of Materials involves Product and Product has Product ID
	ComponentProductID                      BIGINT NOT NULL,
	-- Bill Of Materials has Per Assembly Qty
	PerAssemblyQty                          DECIMAL NOT NULL,
	-- Bill Of Materials involves Product and Product has Product ID
	ProductAssemblyProductID                BIGINT NOT NULL,
	-- Bill Of Materials involves Date
	StartDate                               datetime NOT NULL,
	-- Bill Of Materials has Unit Measure that has Unit Measure Code
	UnitMeasureCode                         CHAR(3) NOT NULL,
	-- maybe Bill Of Materials is valid until end-Date
	EndDate                                 datetime NULL,
	-- Primary index to Bill Of Materials over PresenceConstraint over (Bill Of Materials ID in "Bill Of Materials has Bill Of Materials ID") occurs at most one time
	PRIMARY KEY CLUSTERED(BillOfMaterialsID),
	-- Unique index to Bill Of Materials over PresenceConstraint over (Product Assembly, Component, Start Date in "Product includes Product from start-Date") occurs at most one time
	UNIQUE NONCLUSTERED(ComponentProductID, ProductAssemblyProductID, StartDate)
)
GO

CREATE TABLE BusinessEntity (
	-- Business Entity has Business Entity ID
	BusinessEntityID                        BIGINT NOT NULL IDENTITY,
	-- Primary index to Business Entity over PresenceConstraint over (Business Entity ID in "Business Entity has Business Entity ID") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityID)
)
GO

CREATE TABLE BusinessEntityAddress (
	-- Business Entity Address involves Business Entity that has Business Entity ID
	BusinessEntityID                        BIGINT NOT NULL,
	-- Business Entity Address involves Address that has Address ID
	AddressID                               BIGINT NOT NULL,
	-- Business Entity Address involves Address Type that has Address Type ID
	AddressTypeID                           BIGINT NOT NULL,
	-- Primary index to Business Entity Address over PresenceConstraint over (Business Entity, Address, Address Type in "Business Entity uses Address as Address Type") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityID, AddressID, AddressTypeID),
	FOREIGN KEY (AddressID) REFERENCES Address (AddressID),
	FOREIGN KEY (AddressTypeID) REFERENCES AddressType (AddressTypeID),
	FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity (BusinessEntityID)
)
GO

CREATE TABLE BusinessEntityContact (
	-- Business Entity Contact involves Business Entity that has Business Entity ID
	BusinessEntityID                        BIGINT NOT NULL,
	-- Business Entity Contact involves Person that is a kind of Business Entity that has Business Entity ID
	PersonID                                BIGINT NOT NULL,
	-- Business Entity Contact involves Contact Type that has Contact Type ID
	ContactTypeID                           BIGINT NOT NULL,
	-- Primary index to Business Entity Contact over PresenceConstraint over (Business Entity, Person, Contact Type in "Business Entity appoints Person as Contact Type") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityID, PersonID, ContactTypeID),
	FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity (BusinessEntityID)
)
GO

CREATE TABLE ContactType (
	-- Contact Type has Contact Type ID
	ContactTypeID                           BIGINT NOT NULL IDENTITY,
	-- Contact Type has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Primary index to Contact Type over PresenceConstraint over (Contact Type ID in "Contact Type has Contact Type ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ContactTypeID),
	-- Unique index to Contact Type over PresenceConstraint over (Name in "Contact Type has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE CountryRegion (
	-- Country Region has Country Region Code
	CountryRegionCode                       VARCHAR(3) NOT NULL,
	-- Country Region has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Primary index to Country Region over PresenceConstraint over (Country Region Code in "Country Region has Country Region Code") occurs at most one time
	PRIMARY KEY CLUSTERED(CountryRegionCode),
	-- Unique index to Country Region over PresenceConstraint over (Name in "Country Region has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE CountryRegionCurrency (
	-- Country Region Currency involves Country Region that has Country Region Code
	CountryRegionCode                       VARCHAR(3) NOT NULL,
	-- Country Region Currency involves Currency that has Currency Code
	CurrencyCode                            CHAR(3) NOT NULL,
	-- Primary index to Country Region Currency over PresenceConstraint over (Country Region, Currency in "Country Region uses Currency") occurs at most one time
	PRIMARY KEY CLUSTERED(CountryRegionCode, CurrencyCode),
	FOREIGN KEY (CountryRegionCode) REFERENCES CountryRegion (CountryRegionCode)
)
GO

CREATE TABLE CreditCard (
	-- Credit Card has Credit Card ID
	CreditCardID                            BIGINT NOT NULL IDENTITY,
	-- Credit Card has Card Number
	CardNumber                              VARCHAR(25) NOT NULL,
	-- Credit Card has Card Type
	CardType                                VARCHAR(50) NOT NULL,
	-- Credit Card has Exp Month
	ExpMonth                                tinyint NOT NULL,
	-- Credit Card has Exp Year
	ExpYear                                 smallint NOT NULL,
	-- Primary index to Credit Card over PresenceConstraint over (Credit Card ID in "Credit Card has Credit Card ID") occurs at most one time
	PRIMARY KEY CLUSTERED(CreditCardID),
	-- Unique index to Credit Card over PresenceConstraint over (Card Number in "Credit Card has Card Number") occurs at most one time
	UNIQUE NONCLUSTERED(CardNumber)
)
GO

CREATE TABLE Culture (
	-- Culture has Culture ID
	CultureID                               BIGINT NOT NULL IDENTITY,
	-- Culture has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Primary index to Culture over PresenceConstraint over (Culture ID in "Culture has Culture ID") occurs at most one time
	PRIMARY KEY CLUSTERED(CultureID),
	-- Unique index to Culture over PresenceConstraint over (Name in "Culture has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE Currency (
	-- Currency has Currency Code
	CurrencyCode                            CHAR(3) NOT NULL,
	-- Currency has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Primary index to Currency over PresenceConstraint over (Currency Code in "Currency has Currency Code") occurs at most one time
	PRIMARY KEY CLUSTERED(CurrencyCode),
	-- Unique index to Currency over PresenceConstraint over (Name in "Currency has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE CurrencyRate (
	-- Currency Rate has Currency Rate ID
	CurrencyRateID                          BIGINT NOT NULL IDENTITY,
	-- Currency Rate applies at Average Rate
	AverageRate                             money NOT NULL,
	-- Currency Rate involves Date
	CurrencyRateDate                        datetime NOT NULL,
	-- Currency Rate has End Of Day Rate
	EndOfDayRate                            money NOT NULL,
	-- Currency Rate involves Currency and Currency has Currency Code
	FromCurrencyCode                        CHAR(3) NOT NULL,
	-- Currency Rate involves Currency and Currency has Currency Code
	ToCurrencyCode                          CHAR(3) NOT NULL,
	-- Primary index to Currency Rate over PresenceConstraint over (Currency Rate ID in "Currency Rate has Currency Rate ID") occurs at most one time
	PRIMARY KEY CLUSTERED(CurrencyRateID),
	-- Unique index to Currency Rate over PresenceConstraint over (From Currency, To Currency, Currency Rate Date in "from-Currency converts to to-Currency on Date") occurs at most one time
	UNIQUE NONCLUSTERED(CurrencyRateDate, FromCurrencyCode, ToCurrencyCode),
	FOREIGN KEY (FromCurrencyCode) REFERENCES Currency (CurrencyCode),
	FOREIGN KEY (ToCurrencyCode) REFERENCES Currency (CurrencyCode)
)
GO

CREATE TABLE Customer (
	-- Customer has Customer ID
	CustomerID                              BIGINT NOT NULL IDENTITY,
	-- Customer has Account Number
	AccountNumber                           VARCHAR(16) NOT NULL,
	-- maybe Customer is Person that is a kind of Business Entity that has Business Entity ID
	PersonID                                BIGINT NULL,
	-- maybe Customer belongs to Sales Territory that has Territory ID
	SalesTerritoryID                        BIGINT NULL,
	-- maybe Customer is Store that is a kind of Business Entity that has Business Entity ID
	StoreID                                 BIGINT NULL,
	-- Primary index to Customer over PresenceConstraint over (Customer ID in "Customer has Customer ID") occurs at most one time
	PRIMARY KEY CLUSTERED(CustomerID),
	-- Unique index to Customer over PresenceConstraint over (Account Number in "Customer has Account Number") occurs at most one time
	UNIQUE NONCLUSTERED(AccountNumber)
)
GO

CREATE TABLE DatabaseLog (
	-- Database Log has Database Log ID
	DatabaseLogID                           BIGINT NOT NULL IDENTITY,
	-- Primary index to Database Log over PresenceConstraint over (Database Log ID in "Database Log has Database Log ID") occurs at most one time
	PRIMARY KEY CLUSTERED(DatabaseLogID)
)
GO

CREATE TABLE Department (
	-- Department has Department ID
	DepartmentID                            BIGINT NOT NULL IDENTITY,
	-- Department has group-Name
	GroupName                               VARCHAR(50) NOT NULL,
	-- Department has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Primary index to Department over PresenceConstraint over (Department ID in "Department has Department ID") occurs at most one time
	PRIMARY KEY CLUSTERED(DepartmentID),
	-- Unique index to Department over PresenceConstraint over (Name in "Department has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE Document (
	-- Document has Document ID
	DocumentID                              hierarchyid NOT NULL,
	-- Folder Flag
	FolderFlag                              BIT,
	-- Document has Change Number
	ChangeNumber                            INTEGER NOT NULL,
	-- Document has Document File Name
	DocumentFileName                        VARCHAR(400) NOT NULL,
	-- Document has Document Revision
	DocumentRevision                        CHAR(5) NOT NULL,
	-- Document has File Extension
	FileExtension                           VARCHAR(8) NOT NULL,
	-- Document is responsibility of Owner and Employee is a kind of Person that is a kind of Business Entity that has Business Entity ID
	OwnerID                                 BIGINT NOT NULL,
	-- Document has Status
	Status                                  TINYINT NOT NULL CHECK((Status >= 1 AND Status <= 3)),
	-- Document has Title
	Title                                   VARCHAR(50) NOT NULL,
	-- maybe Document has Document
	Document                                VARCHAR(MAX) NULL,
	-- maybe Document has Document Summary
	DocumentSummary                         VARCHAR(MAX) NULL,
	-- maybe Document belongs to parent-Document and Document has Document ID
	ParentDocumentID                        hierarchyid NULL,
	-- Primary index to Document over PresenceConstraint over (Document ID in "Document has Document ID") occurs at most one time
	PRIMARY KEY CLUSTERED(DocumentID),
	FOREIGN KEY (ParentDocumentID) REFERENCES Document (DocumentID)
)
GO

CREATE TABLE EmailAddress (
	-- Email Address is used by Person that is a kind of Business Entity that has Business Entity ID
	PersonID                                BIGINT NOT NULL,
	-- Email Address has Email Address ID
	EmailAddressID                          BIGINT NOT NULL IDENTITY,
	-- Email Address has EmailAddress
	EmailAddress                            VARCHAR(50) NOT NULL,
	-- Primary index to Email Address over PresenceConstraint over (Person, Email Address ID in "Email Address is used by Person", "Email Address has Email Address ID") occurs at most one time
	PRIMARY KEY CLUSTERED(PersonID, EmailAddressID)
)
GO

CREATE TABLE Employee (
	-- Employee is a kind of Person that is a kind of Business Entity that has Business Entity ID
	PersonID                                BIGINT NOT NULL,
	-- Current Flag
	CurrentFlag                             BIT,
	-- Salaried Flag
	SalariedFlag                            BIT,
	-- Employee has birth-Date
	BirthDate                               datetime NOT NULL,
	-- Employee has Gender
	Gender                                  CHAR(1) NOT NULL CHECK(Gender = 'F' OR Gender = 'M' OR Gender = 'f' OR Gender = 'm'),
	-- Employee has hire-Date
	HireDate                                datetime NOT NULL,
	-- Employee has Job Title
	JobTitle                                VARCHAR(50) NOT NULL,
	-- Employee has Login ID
	LoginID                                 VARCHAR(256) NOT NULL,
	-- Employee has Marital Status
	MaritalStatus                           CHAR(1) NOT NULL CHECK(MaritalStatus = 'M' OR MaritalStatus = 'S'),
	-- Employee has National ID Number
	NationalIDNumber                        VARCHAR(15) NOT NULL,
	-- Employee belongs to Organization Node and Department has Department ID
	OrganizationNodeDepartmentID            BIGINT NOT NULL,
	-- Employee has sick- leave Hours
	SickLeaveHours                          INTEGER NOT NULL,
	-- Employee has vacation-Hours
	VacationHours                           INTEGER NOT NULL,
	-- maybe Employee was Job Candidate that has Job Candidate ID
	JobCandidateID                          BIGINT NULL,
	-- Primary index to Employee over PresenceConstraint over (Person in "Employee is a kind of Person") occurs at most one time
	PRIMARY KEY CLUSTERED(PersonID),
	FOREIGN KEY (OrganizationNodeDepartmentID) REFERENCES Department (DepartmentID)
)
GO
CREATE UNIQUE NONCLUSTERED INDEX EmployeeByJobCandidateID ON Employee(JobCandidateID) WHERE JobCandidateID IS NOT NULL
GO

CREATE TABLE EmployeeDepartmentHistory (
	-- Employee Department History involves Employee that is a kind of Person that is a kind of Business Entity that has Business Entity ID
	EmployeeID                              BIGINT NOT NULL,
	-- Employee Department History involves Date
	StartDate                               datetime NOT NULL,
	-- Employee Department History involves Department that has Department ID
	DepartmentID                            BIGINT NOT NULL,
	-- Employee Department History involves Shift that has Shift ID
	ShiftID                                 BIGINT NOT NULL,
	-- maybe Employee Department History is valid until end-Date
	EndDate                                 datetime NULL,
	-- Primary index to Employee Department History over PresenceConstraint over (Employee, Start Date, Department, Shift in "Employee started on start-Date in Department working Shift") occurs at most one time
	PRIMARY KEY CLUSTERED(EmployeeID, StartDate, DepartmentID, ShiftID),
	FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee (PersonID)
)
GO

CREATE TABLE EmployeePayHistory (
	-- Employee Pay History involves Employee that is a kind of Person that is a kind of Business Entity that has Business Entity ID
	EmployeeID                              BIGINT NOT NULL,
	-- Employee Pay History involves Date
	RateChangeDate                          datetime NOT NULL,
	-- Employee Pay History is paid at Pay Frequency
	PayFrequency                            tinyint NOT NULL CHECK(PayFrequency = 1 OR PayFrequency = 2),
	-- Employee Pay History is at Rate
	Rate                                    money NOT NULL,
	-- Primary index to Employee Pay History over PresenceConstraint over (Employee, Rate Change Date in "pay of Employee was changed on rate- change Date") occurs at most one time
	PRIMARY KEY CLUSTERED(EmployeeID, RateChangeDate),
	FOREIGN KEY (EmployeeID) REFERENCES Employee (PersonID)
)
GO

CREATE TABLE ErrorLog (
	-- Error Log has Error Log ID
	ErrorLogID                              BIGINT NOT NULL IDENTITY,
	-- Primary index to Error Log over PresenceConstraint over (Error Log ID in "Error Log has Error Log ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ErrorLogID)
)
GO

CREATE TABLE Illustration (
	-- Illustration has Illustration ID
	IllustrationID                          BIGINT NOT NULL IDENTITY,
	-- Illustration has Diagram
	Diagram                                 VARCHAR(MAX) NOT NULL,
	-- Primary index to Illustration over PresenceConstraint over (Illustration ID in "Illustration has Illustration ID") occurs at most one time
	PRIMARY KEY CLUSTERED(IllustrationID)
)
GO

CREATE TABLE JobCandidate (
	-- Job Candidate has Job Candidate ID
	JobCandidateID                          BIGINT NOT NULL IDENTITY,
	-- maybe Job Candidate supplied Resume
	Resume                                  VARCHAR(MAX) NULL,
	-- Primary index to Job Candidate over PresenceConstraint over (Job Candidate ID in "Job Candidate has Job Candidate ID") occurs at most one time
	PRIMARY KEY CLUSTERED(JobCandidateID)
)
GO

CREATE TABLE Location (
	-- Location has Location ID
	LocationID                              BIGINT NOT NULL IDENTITY,
	-- Location has Availability
	Availability                            DECIMAL NOT NULL,
	-- Location has Cost Rate
	CostRate                                smallmoney NOT NULL,
	-- Location has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Primary index to Location over PresenceConstraint over (Location ID in "Location has Location ID") occurs at most one time
	PRIMARY KEY CLUSTERED(LocationID),
	-- Unique index to Location over PresenceConstraint over (Name in "Location has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE Person (
	-- Person is a kind of Business Entity that has Business Entity ID
	BusinessEntityID                        BIGINT NOT NULL,
	-- Name Style
	NameStyle                               BIT,
	-- Person has Email Promotion
	EmailPromotion                          TINYINT NOT NULL CHECK((EmailPromotion >= 0 AND EmailPromotion <= 2)),
	-- Person has first-Name
	FirstName                               VARCHAR(50) NOT NULL,
	-- Person has last-Name
	LastName                                VARCHAR(50) NOT NULL,
	-- Person is of Person Type that has Person Type Code
	PersonTypeCode                          CHAR(2) NOT NULL CHECK(PersonTypeCode = 'EM' OR PersonTypeCode = 'GC' OR PersonTypeCode = 'IN' OR PersonTypeCode = 'SC' OR PersonTypeCode = 'SP' OR PersonTypeCode = 'VC'),
	-- maybe Person has Additional Contact Info
	AdditionalContactInfo                   VARCHAR(MAX) NULL,
	-- maybe Person has Demographics
	Demographics                            VARCHAR(MAX) NULL,
	-- maybe Person has middle-Name
	MiddleName                              VARCHAR(50) NULL,
	-- maybe Person uses Password that has Password Hash
	PasswordHash                            VARCHAR(128) NULL,
	-- maybe Person uses Password that has Password Salt
	PasswordSalt                            VARCHAR(10) NULL,
	-- maybe Person has Suffix
	Suffix                                  VARCHAR(10) NULL,
	-- maybe Person has Title
	Title                                   VARCHAR(8) NULL,
	-- Primary index to Person over PresenceConstraint over (Business Entity in "Person is a kind of Business Entity") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityID),
	FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity (BusinessEntityID)
)
GO

CREATE TABLE PersonCreditCard (
	-- Person Credit Card involves Person that is a kind of Business Entity that has Business Entity ID
	PersonID                                BIGINT NOT NULL,
	-- Person Credit Card involves Credit Card that has Credit Card ID
	CreditCardID                            BIGINT NOT NULL,
	-- Primary index to Person Credit Card over PresenceConstraint over (Person, Credit Card in "Person uses Credit Card") occurs at most one time
	PRIMARY KEY CLUSTERED(PersonID, CreditCardID),
	FOREIGN KEY (CreditCardID) REFERENCES CreditCard (CreditCardID),
	FOREIGN KEY (PersonID) REFERENCES Person (BusinessEntityID)
)
GO

CREATE TABLE PersonPhone (
	-- Person Phone involves Person that is a kind of Business Entity that has Business Entity ID
	PersonID                                BIGINT NOT NULL,
	-- Person Phone involves Phone Number
	PhoneNumber                             VARCHAR(25) NOT NULL,
	-- Person Phone involves Phone Number Type that has Phone Number Type ID
	PhoneNumberTypeID                       BIGINT NOT NULL,
	-- Primary index to Person Phone over PresenceConstraint over (Person, Phone Number, Phone Number Type in "Person uses Phone Number of Phone Number Type") occurs at most one time
	PRIMARY KEY CLUSTERED(PersonID, PhoneNumber, PhoneNumberTypeID),
	FOREIGN KEY (PersonID) REFERENCES Person (BusinessEntityID)
)
GO

CREATE TABLE PhoneNumberType (
	-- Phone Number Type has Phone Number Type ID
	PhoneNumberTypeID                       BIGINT NOT NULL IDENTITY,
	-- Phone Number Type has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Primary index to Phone Number Type over PresenceConstraint over (Phone Number Type ID in "Phone Number Type has Phone Number Type ID") occurs at most one time
	PRIMARY KEY CLUSTERED(PhoneNumberTypeID),
	-- Unique index to Phone Number Type over PresenceConstraint over (Name in "Phone Number Type has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE Product (
	-- Product has Product ID
	ProductID                               BIGINT NOT NULL IDENTITY,
	-- Finished Goods Flag
	FinishedGoodsFlag                       BIT,
	-- Product takes Days To Manufacture of days to manufacture
	DaysToManufacture                       INTEGER NOT NULL,
	-- Product has List Price
	ListPrice                               money NOT NULL,
	-- Product has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Product has Product Number
	ProductNumber                           VARCHAR(25) NOT NULL,
	-- Product should be re-ordered when inventory drops below Reorder Point
	ReorderPoint                            INTEGER NOT NULL,
	-- Product should be stocked at least in Safety Stock Level
	SafetyStockLevel                        INTEGER NOT NULL,
	-- Product was first available on sell- start Date
	SellStartDate                           datetime NOT NULL,
	-- Product has Standard Cost
	StandardCost                            money NOT NULL,
	-- maybe Product is of Class
	Class                                   CHAR(2) NULL CHECK(Class = 'H' OR Class = 'L' OR Class = 'M'),
	-- maybe Product is of Color
	Color                                   VARCHAR(15) NULL,
	-- maybe Product was discontinued on discontinued-Date
	DiscontinuedDate                        datetime NULL,
	-- maybe Product belongs to Product Line that has Product Line Name
	ProductLineName                         CHAR(2) NULL CHECK(ProductLineName = 'M' OR ProductLineName = 'R' OR ProductLineName = 'S' OR ProductLineName = 'T'),
	-- maybe Product is of Product Model that has Product Model ID
	ProductModelID                          BIGINT NULL,
	-- maybe Product belongs to Product Subcategory that has Product Subcategory ID
	ProductSubcategoryID                    BIGINT NULL,
	-- maybe Product is last available on sell- end Date
	SellEndDate                             datetime NULL,
	-- maybe Product has Size
	Size                                    VARCHAR(5) NULL,
	-- maybe Product size is in size-Unit Measure and Unit Measure has Unit Measure Code
	SizeUnitMeasureCode                     CHAR(3) NULL,
	-- maybe Product is of Style
	Style                                   CHAR(2) NULL CHECK(Style = 'M' OR Style = 'U' OR Style = 'W'),
	-- maybe Product has Weight
	Weight                                  DECIMAL NULL,
	-- maybe Product weight is in weight-Unit Measure and Unit Measure has Unit Measure Code
	WeightUnitMeasureCode                   CHAR(3) NULL,
	-- Primary index to Product over PresenceConstraint over (Product ID in "Product has Product ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductID),
	-- Unique index to Product over PresenceConstraint over (Name in "Product has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	-- Unique index to Product over PresenceConstraint over (Product Number in "Product has Product Number") occurs at most one time
	UNIQUE NONCLUSTERED(ProductNumber)
)
GO

CREATE TABLE ProductCategory (
	-- Product Category has Product Category ID
	ProductCategoryID                       BIGINT NOT NULL IDENTITY,
	-- Product Category has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Primary index to Product Category over PresenceConstraint over (Product Category ID in "Product Category has Product Category ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductCategoryID),
	-- Unique index to Product Category over PresenceConstraint over (Name in "Product Category has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE ProductCostHistory (
	-- Product Cost History involves Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Product Cost History involves Date
	StartDate                               datetime NOT NULL,
	-- Product Cost History has Standard Cost
	StandardCost                            money NOT NULL,
	-- maybe Product Cost History is valid until end-Date
	EndDate                                 datetime NULL,
	-- Primary index to Product Cost History over PresenceConstraint over (Product, Start Date in "Product was costed on start-Date") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductID, StartDate),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
)
GO

CREATE TABLE ProductDescription (
	-- Product Description has Product Description ID
	ProductDescriptionID                    BIGINT NOT NULL IDENTITY,
	-- Product Description has Description
	Description                             VARCHAR(400) NOT NULL,
	-- Primary index to Product Description over PresenceConstraint over (Product Description ID in "Product Description has Product Description ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductDescriptionID)
)
GO

CREATE TABLE ProductDocument (
	-- Product Document involves Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Product Document involves Document that has Document ID
	DocumentID                              hierarchyid NOT NULL,
	-- Primary index to Product Document over PresenceConstraint over (Product, Document in "Product is described by Document") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductID, DocumentID),
	FOREIGN KEY (DocumentID) REFERENCES Document (DocumentID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
)
GO

CREATE TABLE ProductInventory (
	-- Product Inventory involves Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Product Inventory involves Location that has Location ID
	LocationID                              BIGINT NOT NULL,
	-- Product Inventory is in Bin
	Bin                                     TINYINT NOT NULL,
	-- Product Inventory has Quantity
	Quantity                                INTEGER NOT NULL,
	-- Product Inventory is on Shelf
	Shelf                                   VARCHAR(10) NOT NULL,
	-- Primary index to Product Inventory over PresenceConstraint over (Product, Location in "Product is available at Location") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductID, LocationID),
	FOREIGN KEY (LocationID) REFERENCES Location (LocationID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
)
GO

CREATE TABLE ProductListPriceHistory (
	-- Product List Price History involves Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Product List Price History involves Date
	StartDate                               datetime NOT NULL,
	-- Product List Price History has List Price
	ListPrice                               money NOT NULL,
	-- maybe Product List Price History is valid until end-Date
	EndDate                                 datetime NULL,
	-- Primary index to Product List Price History over PresenceConstraint over (Product, Start Date in "Product was priced on start-Date") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductID, StartDate),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
)
GO

CREATE TABLE ProductModel (
	-- Product Model has Product Model ID
	ProductModelID                          BIGINT NOT NULL IDENTITY,
	-- Product Model has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- maybe Product Model is described by Catalog Description
	CatalogDescription                      VARCHAR(MAX) NULL,
	-- maybe Product Model has Instructions
	Instructions                            VARCHAR(MAX) NULL,
	-- Primary index to Product Model over PresenceConstraint over (Product Model ID in "Product Model has Product Model ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductModelID),
	-- Unique index to Product Model over PresenceConstraint over (Name in "Product Model has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE ProductModelIllustration (
	-- Product Model Illustration involves Product Model that has Product Model ID
	ProductModelID                          BIGINT NOT NULL,
	-- Product Model Illustration involves Illustration that has Illustration ID
	IllustrationID                          BIGINT NOT NULL,
	-- Primary index to Product Model Illustration over PresenceConstraint over (Product Model, Illustration in "Product Model has Illustration") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductModelID, IllustrationID),
	FOREIGN KEY (IllustrationID) REFERENCES Illustration (IllustrationID),
	FOREIGN KEY (ProductModelID) REFERENCES ProductModel (ProductModelID)
)
GO

CREATE TABLE ProductModelProductDescriptionCulture (
	-- Product Model Product Description Culture involves Product Model that has Product Model ID
	ProductModelID                          BIGINT NOT NULL,
	-- Product Model Product Description Culture involves Product Description that has Product Description ID
	ProductDescriptionID                    BIGINT NOT NULL,
	-- Product Model Product Description Culture involves Culture that has Culture ID
	CultureID                               BIGINT NOT NULL,
	-- Primary index to Product Model Product Description Culture over PresenceConstraint over (Product Model, Product Description, Culture in "Product Model has Product Description for Culture") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductModelID, ProductDescriptionID, CultureID),
	FOREIGN KEY (CultureID) REFERENCES Culture (CultureID),
	FOREIGN KEY (ProductDescriptionID) REFERENCES ProductDescription (ProductDescriptionID),
	FOREIGN KEY (ProductModelID) REFERENCES ProductModel (ProductModelID)
)
GO

CREATE TABLE ProductPhoto (
	-- Product Photo has Product Photo ID
	ProductPhotoID                          BIGINT NOT NULL IDENTITY,
	-- maybe Product Photo has large-Photo
	LargePhoto                              varbinary NULL,
	-- maybe Product Photo has large-Photo File Name
	LargePhotoFileName                      VARCHAR(50) NULL,
	-- maybe Product Photo has thumb- nail Photo
	ThumbNailPhoto                          varbinary NULL,
	-- maybe Product Photo has thumbnail-Photo File Name
	ThumbnailPhotoFileName                  VARCHAR(50) NULL,
	-- Primary index to Product Photo over PresenceConstraint over (Product Photo ID in "Product Photo has Product Photo ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductPhotoID)
)
GO

CREATE TABLE ProductProductPhoto (
	-- Product Product Photo involves Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Product Product Photo involves Product Photo that has Product Photo ID
	ProductPhotoID                          BIGINT NOT NULL,
	-- Primary
	[Primary]                               BIT,
	-- Primary index to Product Product Photo over PresenceConstraint over (Product, Product Photo in "Product has Product Photo") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductID, ProductPhotoID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
	FOREIGN KEY (ProductPhotoID) REFERENCES ProductPhoto (ProductPhotoID)
)
GO

CREATE TABLE ProductReview (
	-- Product Review has Product Review ID
	ProductReviewID                         BIGINT NOT NULL IDENTITY,
	-- Product Review has EmailAddress
	EmailAddress                            VARCHAR(50) NOT NULL,
	-- Product Review involves Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Product Review assigned Rating
	Rating                                  TINYINT NOT NULL CHECK((Rating >= 1 AND Rating <= 5)),
	-- Product Review involves Date
	ReviewDate                              datetime NOT NULL,
	-- Product Review involves Name
	ReviewerName                            VARCHAR(50) NOT NULL,
	-- maybe Product Review has Comments
	Comments                                VARCHAR(3850) NULL,
	-- Primary index to Product Review over PresenceConstraint over (Product Review ID in "Product Review has Product Review ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductReviewID),
	-- Unique index to Product Review over PresenceConstraint over (Product, Reviewer Name in "Product was reviewed by reviewer-Name on review-Date") occurs one time
	UNIQUE NONCLUSTERED(ProductID, ReviewerName),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
)
GO

CREATE TABLE ProductSubcategory (
	-- Product Subcategory has Product Subcategory ID
	ProductSubcategoryID                    BIGINT NOT NULL IDENTITY,
	-- Product Subcategory has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Product Subcategory belongs to Product Category that has Product Category ID
	ProductCategoryID                       BIGINT NOT NULL,
	-- Primary index to Product Subcategory over PresenceConstraint over (Product Subcategory ID in "Product Subcategory has Product Subcategory ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductSubcategoryID),
	-- Unique index to Product Subcategory over PresenceConstraint over (Name in "Product Subcategory has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	FOREIGN KEY (ProductCategoryID) REFERENCES ProductCategory (ProductCategoryID)
)
GO

CREATE TABLE ProductVendor (
	-- Product Vendor involves Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Product Vendor involves Vendor that is a kind of Business Entity that has Business Entity ID
	VendorID                                BIGINT NOT NULL,
	-- Product Vendor averages Average Lead Time days to deliver
	AverageLeadTime                         INTEGER NOT NULL,
	-- Product Vendor has Max Order Qty
	MaxOrderQty                             INTEGER NOT NULL,
	-- Product Vendor has Min Order Qty
	MinOrderQty                             INTEGER NOT NULL,
	-- Product Vendor has On Order Qty
	OnOrderQty                              INTEGER NOT NULL,
	-- Product Vendor asks Standard Price
	StandardPrice                           money NOT NULL,
	-- Product Vendor has Unit Measure that has Unit Measure Code
	UnitMeasureCode                         CHAR(3) NOT NULL,
	-- maybe Product Vendor was paid Last Receipt Cost
	LastReceiptCost                         money NULL,
	-- maybe Product Vendor was paid on last- receipt Date
	LastReceiptDate                         datetime NULL,
	-- Primary index to Product Vendor over PresenceConstraint over (Product, Vendor in "Product is sourced from Vendor") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductID, VendorID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
)
GO

CREATE TABLE PurchaseOrder (
	-- Purchase Order has Purchase Order ID
	PurchaseOrderID                         BIGINT NOT NULL IDENTITY,
	-- Purchase Order was made by Employee that is a kind of Person that is a kind of Business Entity that has Business Entity ID
	EmployeeID                              BIGINT NOT NULL,
	-- Purchase Order freight costs Freight
	Freight                                 money NOT NULL,
	-- Purchase Order was made on order-Date
	OrderDate                               datetime NOT NULL,
	-- Purchase Order has Purchase Order Number
	PurchaseOrderNumber                     VARCHAR(25) NOT NULL,
	-- Purchase Order has Revision Number
	RevisionNumber                          TINYINT NOT NULL,
	-- Purchase Order requests Ship Method that has Ship Method ID
	ShipMethodID                            BIGINT NOT NULL,
	-- Purchase Order has Status and Purchase Order Status has Purchase Order Status Code
	StatusPurchaseOrderStatusCode           TINYINT NOT NULL,
	-- Purchase Order is worth Sub Total
	SubTotal                                money NOT NULL,
	-- Purchase Order includes Tax Amt
	TaxAmt                                  money NOT NULL,
	-- Purchase Order was placed with Vendor that is a kind of Business Entity that has Business Entity ID
	VendorID                                BIGINT NOT NULL,
	-- maybe Purchase Order was shipped on ship-Date
	ShipDate                                datetime NULL,
	-- Primary index to Purchase Order over PresenceConstraint over (Purchase Order ID in "Purchase Order has Purchase Order ID") occurs at most one time
	PRIMARY KEY CLUSTERED(PurchaseOrderID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee (PersonID)
)
GO

CREATE TABLE PurchaseOrderDetail (
	-- Purchase Order Detail belongs to Purchase Order that has Purchase Order ID
	PurchaseOrderID                         BIGINT NOT NULL,
	-- Purchase Order Detail has Purchase Order Detail ID
	PurchaseOrderDetailID                   BIGINT NOT NULL IDENTITY,
	-- Purchase Order Detail has due-Date
	DueDate                                 datetime NOT NULL,
	-- Purchase Order Detail is for Order Qty
	OrderQty                                INTEGER NOT NULL,
	-- Purchase Order Detail is for Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Purchase Order Detail has Received Qty
	ReceivedQty                             DECIMAL NOT NULL,
	-- Purchase Order Detail has Rejected Qty
	RejectedQty                             DECIMAL NOT NULL,
	-- Purchase Order Detail costs Unit Price
	UnitPrice                               money NOT NULL,
	-- Primary index to Purchase Order Detail over PresenceConstraint over (Purchase Order, Purchase Order Detail ID in "Purchase Order includes Purchase Order Detail", "Purchase Order Detail has Purchase Order Detail ID") occurs at most one time
	PRIMARY KEY CLUSTERED(PurchaseOrderID, PurchaseOrderDetailID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
	FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrder (PurchaseOrderID)
)
GO

CREATE TABLE PurchaseOrderStatus (
	-- Purchase Order Status has Purchase Order Status Code
	PurchaseOrderStatusCode                 TINYINT NOT NULL CHECK((PurchaseOrderStatusCode >= 1 AND PurchaseOrderStatusCode <= 8)),
	-- Purchase Order Status is described by Purchase Order Status Text
	PurchaseOrderStatusText                 VARCHAR(15) NOT NULL,
	-- Primary index to Purchase Order Status over PresenceConstraint over (Purchase Order Status Code in "Purchase Order Status has Purchase Order Status Code") occurs at most one time
	PRIMARY KEY CLUSTERED(PurchaseOrderStatusCode),
	-- Unique index to Purchase Order Status over PresenceConstraint over (Purchase Order Status Text in "Purchase Order Status is described by Purchase Order Status Text") occurs at most one time
	UNIQUE NONCLUSTERED(PurchaseOrderStatusText)
)
GO

CREATE TABLE SalesOrder (
	-- Sales Order has Sales Order ID
	SalesOrderID                            BIGINT NOT NULL IDENTITY,
	-- Online Order Flag
	OnlineOrderFlag                         BIT,
	-- Sales Order has bill- to Address and Address has Address ID
	BillToAddressID                         BIGINT NOT NULL,
	-- Sales Order is from Customer that has Customer ID
	CustomerID                              BIGINT NOT NULL,
	-- Sales Order should be shipped by due-Date
	DueDate                                 datetime NOT NULL,
	-- Sales Order freight costs Freight
	Freight                                 money NOT NULL,
	-- Sales Order was ordered on order-Date
	OrderDate                               datetime NOT NULL,
	-- Sales Order has Revision Number
	RevisionNumber                          TINYINT NOT NULL,
	-- Sales Order has Sales Order Number
	SalesOrderNumber                        VARCHAR(25) NOT NULL,
	-- Sales Order has Ship Method that has Ship Method ID
	ShipMethodID                            BIGINT NOT NULL,
	-- Sales Order has ship- to Address and Address has Address ID
	ShipToAddressID                         BIGINT NOT NULL,
	-- Sales Order has Status and Sales Order Status has Sales Order Status Code
	StatusSalesOrderStatusCode              TINYINT NOT NULL,
	-- Sales Order is worth Sub Total
	SubTotal                                money NOT NULL,
	-- Sales Order includes Tax Amt
	TaxAmt                                  money NOT NULL,
	-- maybe Sales Order is on Account Number
	AccountNumber                           VARCHAR(16) NULL,
	-- maybe Sales Order bills Credit Card that has Credit Card ID
	CreditCardID                            BIGINT NULL,
	-- maybe Sales Order has Credit Card Approval Code
	CreditCardApprovalCode                  VARCHAR(15) NULL,
	-- maybe Sales Order converts currency at Currency Rate that has Currency Rate ID
	CurrencyRateID                          BIGINT NULL,
	-- maybe Sales Order corresponds to Purchase Order Number
	PurchaseOrderNumber                     VARCHAR(25) NULL,
	-- maybe Sales Order has Sales Order Comment
	SalesOrderComment                       VARCHAR(128) NULL,
	-- maybe Sales Order was taken by Sales Person that is a kind of Employee that is a kind of Person that is a kind of Business Entity that has Business Entity ID
	SalesPersonID                           BIGINT NULL,
	-- maybe Sales Order is assigned to Sales Territory that has Territory ID
	SalesTerritoryID                        BIGINT NULL,
	-- maybe Sales Order was shipped on ship-Date
	ShipDate                                datetime NULL,
	-- Primary index to Sales Order over PresenceConstraint over (Sales Order ID in "Sales Order has Sales Order ID") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderID),
	-- Unique index to Sales Order over PresenceConstraint over (Sales Order Number in "Sales Order has Sales Order Number") occurs at most one time
	UNIQUE NONCLUSTERED(SalesOrderNumber),
	FOREIGN KEY (BillToAddressID) REFERENCES Address (AddressID),
	FOREIGN KEY (CreditCardID) REFERENCES CreditCard (CreditCardID),
	FOREIGN KEY (CurrencyRateID) REFERENCES CurrencyRate (CurrencyRateID),
	FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
	FOREIGN KEY (ShipToAddressID) REFERENCES Address (AddressID)
)
GO

CREATE TABLE SalesOrderDetail (
	-- Sales Order Detail belongs to Sales Order that has Sales Order ID
	SalesOrderID                            BIGINT NOT NULL,
	-- Sales Order Detail has Sales Order Detail ID
	SalesOrderDetailID                      BIGINT NOT NULL IDENTITY,
	-- Sales Order Detail is for Order Qty
	OrderQty                                INTEGER NOT NULL,
	-- Sales Order Detail is for Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Sales Order Detail has Unit Price
	UnitPrice                               money NOT NULL,
	-- Sales Order Detail applies Unit Price Discount
	UnitPriceDiscount                       money NOT NULL,
	-- maybe Sales Order Detail has Carrier Tracking Number
	CarrierTrackingNumber                   VARCHAR(25) NULL,
	-- maybe Sales Order Detail applies Special Offer that has Special Offer ID
	SpecialOfferID                          BIGINT NULL,
	-- Primary index to Sales Order Detail over PresenceConstraint over (Sales Order, Sales Order Detail ID in "Sales Order includes Sales Order Detail", "Sales Order Detail has Sales Order Detail ID") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderID, SalesOrderDetailID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
	FOREIGN KEY (SalesOrderID) REFERENCES SalesOrder (SalesOrderID)
)
GO

CREATE TABLE SalesOrderSalesReason (
	-- Sales Order Sales Reason involves Sales Order that has Sales Order ID
	SalesOrderID                            BIGINT NOT NULL,
	-- Sales Order Sales Reason involves Sales Reason that has Sales Reason ID
	SalesReasonID                           BIGINT NOT NULL,
	-- Primary index to Sales Order Sales Reason over PresenceConstraint over (Sales Order, Sales Reason in "Sales Order has Sales Reason") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderID, SalesReasonID),
	FOREIGN KEY (SalesOrderID) REFERENCES SalesOrder (SalesOrderID)
)
GO

CREATE TABLE SalesOrderStatus (
	-- Sales Order Status has Sales Order Status Code
	SalesOrderStatusCode                    TINYINT NOT NULL CHECK((SalesOrderStatusCode >= 1 AND SalesOrderStatusCode <= 8)),
	-- Sales Order Status is described by Sales Order Status Text
	SalesOrderStatusText                    VARCHAR(15) NOT NULL,
	-- Primary index to Sales Order Status over PresenceConstraint over (Sales Order Status Code in "Sales Order Status has Sales Order Status Code") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderStatusCode),
	-- Unique index to Sales Order Status over PresenceConstraint over (Sales Order Status Text in "Sales Order Status is described by Sales Order Status Text") occurs at most one time
	UNIQUE NONCLUSTERED(SalesOrderStatusText)
)
GO

CREATE TABLE SalesPerson (
	-- Sales Person is a kind of Employee that is a kind of Person that is a kind of Business Entity that has Business Entity ID
	EmployeeID                              BIGINT NOT NULL,
	-- Sales Person may receive Bonus
	Bonus                                   money NOT NULL,
	-- Sales Person receives Commission Pct
	CommissionPct                           DECIMAL NOT NULL,
	-- Sales Person sold Sales Last Year last year
	SalesLastYear                           money NOT NULL,
	-- Sales Person has sold Sales YTD this year
	SalesYTD                                money NOT NULL,
	-- maybe Sales Person should sell Sales Quota
	SalesQuota                              money NULL,
	-- maybe Sales Person is assigned to Sales Territory that has Territory ID
	SalesTerritoryID                        BIGINT NULL,
	-- Primary index to Sales Person over PresenceConstraint over (Employee in "Sales Person is a kind of Employee") occurs at most one time
	PRIMARY KEY CLUSTERED(EmployeeID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee (PersonID)
)
GO

CREATE TABLE SalesPersonQuotaHistory (
	-- Sales Person Quota History involves Sales Person that is a kind of Employee that is a kind of Person that is a kind of Business Entity that has Business Entity ID
	SalesPersonID                           BIGINT NOT NULL,
	-- Sales Person Quota History involves Date
	QuotaDate                               datetime NOT NULL,
	-- Sales Person Quota History involves Amount
	SalesQuota                              money NOT NULL,
	-- Primary index to Sales Person Quota History over PresenceConstraint over (Sales Person, Quota Date in "Sales Person had quota to quota-Date of Amount") occurs one time
	PRIMARY KEY CLUSTERED(SalesPersonID, QuotaDate),
	FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson (EmployeeID)
)
GO

CREATE TABLE SalesReason (
	-- Sales Reason has Sales Reason ID
	SalesReasonID                           BIGINT NOT NULL IDENTITY,
	-- Sales Reason has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Sales Reason is of Reason Type and Sales Reason Type has Sales Reason Type Name
	ReasonTypeSalesReasonTypeName           VARCHAR(50) NOT NULL,
	-- Primary index to Sales Reason over PresenceConstraint over (Sales Reason ID in "Sales Reason has Sales Reason ID") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesReasonID),
	-- Unique index to Sales Reason over PresenceConstraint over (Name in "Sales Reason has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE SalesTaxRate (
	-- Sales Tax Rate has Sales Tax Rate ID
	SalesTaxRateID                          BIGINT NOT NULL IDENTITY,
	-- Sales Tax Rate has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Sales Tax Rate involves State Province that has State Province ID
	StateProvinceID                         BIGINT NOT NULL,
	-- Sales Tax Rate applies at Tax Rate
	TaxRate                                 money NOT NULL,
	-- Sales Tax Rate involves Tax Type
	TaxType                                 TINYINT NOT NULL CHECK((TaxType >= 1 AND TaxType <= 3)),
	-- Primary index to Sales Tax Rate over PresenceConstraint over (Sales Tax Rate ID in "Sales Tax Rate has Sales Tax Rate ID") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesTaxRateID),
	-- Unique index to Sales Tax Rate over PresenceConstraint over (Name in "Sales Tax Rate has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	-- Unique index to Sales Tax Rate over PresenceConstraint over (State Province, Tax Type in "State Province applies Tax Type") occurs at most one time
	UNIQUE NONCLUSTERED(StateProvinceID, TaxType)
)
GO

CREATE TABLE SalesTerritory (
	-- Sales Territory has Territory ID
	TerritoryID                             BIGINT NOT NULL IDENTITY,
	-- Sales Territory cost Cost Last Year last year
	CostLastYear                            money NOT NULL,
	-- Sales Territory cost Cost YTD this year
	CostYTD                                 money NOT NULL,
	-- Sales Territory is in Group and Sales Territory Group has Sales Territory Group Name
	GroupSalesTerritoryGroupName            VARCHAR(50) NOT NULL,
	-- Sales Territory has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Sales Territory sold Sales Last Year last year
	SalesLastYear                           money NOT NULL,
	-- Sales Territory sold Sales YTD this year
	SalesYTD                                money NOT NULL,
	-- Primary index to Sales Territory over PresenceConstraint over (Territory ID in "Sales Territory has Territory ID") occurs at most one time
	PRIMARY KEY CLUSTERED(TerritoryID),
	-- Unique index to Sales Territory over PresenceConstraint over (Name in "Sales Territory has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE SalesTerritoryHistory (
	-- Sales Territory History involves Sales Person that is a kind of Employee that is a kind of Person that is a kind of Business Entity that has Business Entity ID
	SalesPersonID                           BIGINT NOT NULL,
	-- Sales Territory History involves Date
	StartDate                               datetime NOT NULL,
	-- Sales Territory History involves Sales Territory that has Territory ID
	SalesTerritoryID                        BIGINT NOT NULL,
	-- maybe Sales Territory History is valid until end-Date
	EndDate                                 datetime NULL,
	-- Primary index to Sales Territory History over PresenceConstraint over (Sales Person, Start Date, Sales Territory in "Sales Person was assigned on start-Date to Sales Territory") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesPersonID, StartDate, SalesTerritoryID),
	FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson (EmployeeID),
	FOREIGN KEY (SalesTerritoryID) REFERENCES SalesTerritory (TerritoryID)
)
GO

CREATE TABLE ScrapReason (
	-- Scrap Reason has Scrap Reason ID
	ScrapReasonID                           BIGINT NOT NULL IDENTITY,
	-- Scrap Reason has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Primary index to Scrap Reason over PresenceConstraint over (Scrap Reason ID in "Scrap Reason has Scrap Reason ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ScrapReasonID),
	-- Unique index to Scrap Reason over PresenceConstraint over (Name in "Scrap Reason has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE Shift (
	-- Shift has Shift ID
	ShiftID                                 BIGINT NOT NULL IDENTITY,
	-- Shift ends at end-Time
	EndTime                                 TIME NOT NULL,
	-- Shift has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Shift starts at start-Time
	StartTime                               TIME NOT NULL,
	-- Primary index to Shift over PresenceConstraint over (Shift ID in "Shift has Shift ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ShiftID),
	-- Unique index to Shift over PresenceConstraint over (Name in "Shift has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	-- Unique index to Shift over PresenceConstraint over (Name, Start Time, End Time in "Shift has Name", "Shift starts at start-Time", "Shift ends at end-Time") occurs at most one time
	UNIQUE NONCLUSTERED(EndTime, Name, StartTime)
)
GO

CREATE TABLE ShipMethod (
	-- Ship Method has Ship Method ID
	ShipMethodID                            BIGINT NOT NULL IDENTITY,
	-- Ship Method has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Ship Method has Ship Base
	ShipBase                                money NOT NULL,
	-- Ship Method has Ship Rate
	ShipRate                                money NOT NULL,
	-- Primary index to Ship Method over PresenceConstraint over (Ship Method ID in "Ship Method has Ship Method ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ShipMethodID),
	-- Unique index to Ship Method over PresenceConstraint over (Name in "Ship Method has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE ShoppingCartItem (
	-- Shopping Cart Item has Shopping Cart Item ID
	ShoppingCartItemID                      BIGINT NOT NULL IDENTITY,
	-- Shopping Cart Item was created on Date Created
	DateCreated                             datetime NOT NULL,
	-- Shopping Cart Item is for Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Shopping Cart Item is for Quantity
	Quantity                                INTEGER NOT NULL,
	-- Shopping Cart Item is in Shopping Cart that has Shopping Cart ID
	ShoppingCartID                          VARCHAR(50) NOT NULL,
	-- Primary index to Shopping Cart Item over PresenceConstraint over (Shopping Cart Item ID in "Shopping Cart Item has Shopping Cart Item ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ShoppingCartItemID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
)
GO

CREATE TABLE SpecialOffer (
	-- Special Offer has Special Offer ID
	SpecialOfferID                          BIGINT NOT NULL IDENTITY,
	-- Special Offer belongs to Category
	Category                                VARCHAR(50) NOT NULL,
	-- Special Offer has Description
	Description                             VARCHAR(255) NOT NULL,
	-- Special Offer has Discount Pct
	DiscountPct                             DECIMAL NOT NULL,
	-- Special Offer is valid until end-Date
	EndDate                                 datetime NOT NULL,
	-- Special Offer applies to Max Qty
	MaxQty                                  INTEGER NOT NULL,
	-- Special Offer applies to Min Qty
	MinQty                                  INTEGER NOT NULL,
	-- Special Offer starts on start-Date
	StartDate                               datetime NOT NULL,
	-- Special Offer is of Type
	Type                                    VARCHAR(50) NOT NULL,
	-- Primary index to Special Offer over PresenceConstraint over (Special Offer ID in "Special Offer has Special Offer ID") occurs at most one time
	PRIMARY KEY CLUSTERED(SpecialOfferID)
)
GO

CREATE TABLE SpecialOfferProduct (
	-- Special Offer Product involves Special Offer that has Special Offer ID
	SpecialOfferID                          BIGINT NOT NULL,
	-- Special Offer Product involves Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Primary index to Special Offer Product over PresenceConstraint over (Special Offer, Product in "Special Offer includes Product") occurs at most one time
	PRIMARY KEY CLUSTERED(SpecialOfferID, ProductID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
	FOREIGN KEY (SpecialOfferID) REFERENCES SpecialOffer (SpecialOfferID)
)
GO

CREATE TABLE StateProvince (
	-- State Province has State Province ID
	StateProvinceID                         BIGINT NOT NULL IDENTITY,
	-- Is Only State Province Flag
	IsOnlyStateProvinceFlag                 BIT,
	-- State Province is in Country Region that has Country Region Code
	CountryRegionCode                       VARCHAR(3) NOT NULL,
	-- State Province has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- State Province is in Sales Territory that has Territory ID
	SalesTerritoryID                        BIGINT NOT NULL,
	-- State Province has State Province Code
	StateProvinceCode                       CHAR(3) NOT NULL,
	-- Primary index to State Province over PresenceConstraint over (State Province ID in "State Province has State Province ID") occurs at most one time
	PRIMARY KEY CLUSTERED(StateProvinceID),
	-- Unique index to State Province over PresenceConstraint over (Country Region, State Province Code in "State Province is in Country Region", "State Province has State Province Code") occurs at most one time
	UNIQUE NONCLUSTERED(CountryRegionCode, StateProvinceCode),
	-- Unique index to State Province over PresenceConstraint over (Name in "State Province has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	-- Unique index to State Province over PresenceConstraint over (State Province Code, Country Region in "State Province has State Province Code", "State Province is in Country Region") occurs at most one time
	UNIQUE NONCLUSTERED(CountryRegionCode, StateProvinceCode),
	FOREIGN KEY (CountryRegionCode) REFERENCES CountryRegion (CountryRegionCode),
	FOREIGN KEY (SalesTerritoryID) REFERENCES SalesTerritory (TerritoryID)
)
GO

CREATE TABLE Store (
	-- Store is a kind of Business Entity that has Business Entity ID
	BusinessEntityID                        BIGINT NOT NULL,
	-- Store has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- maybe Store has Demographics
	Demographics                            VARCHAR(MAX) NULL,
	-- maybe sales to Store are managed by Sales Person that is a kind of Employee that is a kind of Person that is a kind of Business Entity that has Business Entity ID
	SalesPersonID                           BIGINT NULL,
	-- Primary index to Store over PresenceConstraint over (Business Entity in "Store is a kind of Business Entity") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityID),
	FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity (BusinessEntityID),
	FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson (EmployeeID)
)
GO

CREATE TABLE [Transaction] (
	-- Transaction has Transaction ID
	TransactionID                           BIGINT NOT NULL IDENTITY,
	-- Transaction has Actual Cost
	ActualCost                              money NOT NULL,
	-- Transaction applies to Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Transaction has Quantity
	Quantity                                INTEGER NOT NULL,
	-- Transaction applies to Reference Order ID
	ReferenceOrderID                        INTEGER NOT NULL,
	-- Transaction applies to Reference Order Line ID
	ReferenceOrderLineID                    INTEGER NOT NULL,
	-- Transaction has transaction-Date
	TransactionDate                         datetime NOT NULL,
	-- Transaction has Transaction Type
	TransactionType                         CHAR(1) NOT NULL,
	-- Primary index to Transaction over PresenceConstraint over (Transaction ID in "Transaction has Transaction ID") occurs at most one time
	PRIMARY KEY CLUSTERED(TransactionID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
)
GO

CREATE TABLE TransactionHistory (
	-- Transaction History is a kind of Transaction that has Transaction ID
	TransactionID                           BIGINT NOT NULL,
	-- Primary index to Transaction History over PresenceConstraint over (Transaction in "Transaction History is a kind of Transaction") occurs at most one time
	PRIMARY KEY CLUSTERED(TransactionID),
	FOREIGN KEY (TransactionID) REFERENCES [Transaction] (TransactionID)
)
GO

CREATE TABLE TransactionHistoryArchive (
	-- Transaction History Archive is a kind of Transaction that has Transaction ID
	TransactionID                           BIGINT NOT NULL,
	-- Primary index to Transaction History Archive over PresenceConstraint over (Transaction in "Transaction History Archive is a kind of Transaction") occurs at most one time
	PRIMARY KEY CLUSTERED(TransactionID),
	FOREIGN KEY (TransactionID) REFERENCES [Transaction] (TransactionID)
)
GO

CREATE TABLE UnitMeasure (
	-- Unit Measure has Unit Measure Code
	UnitMeasureCode                         CHAR(3) NOT NULL,
	-- Unit Measure has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Primary index to Unit Measure over PresenceConstraint over (Unit Measure Code in "Unit Measure has Unit Measure Code") occurs at most one time
	PRIMARY KEY CLUSTERED(UnitMeasureCode),
	-- Unique index to Unit Measure over PresenceConstraint over (Name in "Unit Measure has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name)
)
GO

CREATE TABLE Vendor (
	-- Vendor is a kind of Business Entity that has Business Entity ID
	BusinessEntityID                        BIGINT NOT NULL,
	-- Active Flag
	ActiveFlag                              BIT,
	-- Preferred Vendor Status
	PreferredVendorStatus                   BIT,
	-- Vendor has Account Number
	AccountNumber                           VARCHAR(16) NOT NULL,
	-- Vendor has Credit Rating
	CreditRating                            tinyint NOT NULL,
	-- Vendor has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- maybe Vendor has purchasing- web service URL
	PurchasingWebServiceURL                 VARCHAR(1024) NULL,
	-- Primary index to Vendor over PresenceConstraint over (Business Entity in "Vendor is a kind of Business Entity") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityID),
	-- Unique index to Vendor over PresenceConstraint over (Account Number in "Vendor has Account Number") occurs at most one time
	UNIQUE NONCLUSTERED(AccountNumber),
	-- Unique index to Vendor over PresenceConstraint over (Name in "Vendor has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity (BusinessEntityID)
)
GO

CREATE TABLE WorkOrder (
	-- Work Order has Work Order ID
	WorkOrderID                             BIGINT NOT NULL IDENTITY,
	-- Work Order has due-Date
	DueDate                                 datetime NOT NULL,
	-- Work Order is for Order Qty
	OrderQty                                INTEGER NOT NULL,
	-- Work Order is for Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Work Order has Scrapped Qty
	ScrappedQty                             INTEGER NOT NULL,
	-- Work Order has start-Date
	StartDate                               datetime NOT NULL,
	-- maybe Work Order is valid until end-Date
	EndDate                                 datetime NULL,
	-- maybe Work Order has Scrap Reason that has Scrap Reason ID
	ScrapReasonID                           BIGINT NULL,
	-- Primary index to Work Order over PresenceConstraint over (Work Order ID in "Work Order has Work Order ID") occurs at most one time
	PRIMARY KEY CLUSTERED(WorkOrderID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
	FOREIGN KEY (ScrapReasonID) REFERENCES ScrapReason (ScrapReasonID)
)
GO

CREATE TABLE WorkOrderRouting (
	-- Work Order Routing involves Work Order that has Work Order ID
	WorkOrderID                             BIGINT NOT NULL,
	-- Work Order Routing involves Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Work Order Routing involves Operation Sequence
	OperationSequence                       SMALLINT NOT NULL,
	-- Work Order Routing is performed at Location that has Location ID
	LocationID                              BIGINT NOT NULL,
	-- Work Order Routing is anticipated to cost Planned Cost
	PlannedCost                             money NOT NULL,
	-- Work Order Routing has scheduled- end Date
	ScheduledEndDate                        datetime NOT NULL,
	-- Work Order Routing has scheduled- start Date
	ScheduledStartDate                      datetime NOT NULL,
	-- maybe Work Order Routing cost Actual Cost
	ActualCost                              money NULL,
	-- maybe Work Order Routing has actual- end Date
	ActualEndDate                           datetime NULL,
	-- maybe Work Order Routing took actual-Resource Hours
	ActualResourceHours                     DECIMAL NULL,
	-- maybe Work Order Routing has actual- start Date
	ActualStartDate                         datetime NULL,
	-- Primary index to Work Order Routing over PresenceConstraint over (Work Order, Product, Operation Sequence in "Work Order activity on Product involves Operation Sequence") occurs at most one time
	PRIMARY KEY CLUSTERED(WorkOrderID, ProductID, OperationSequence),
	FOREIGN KEY (LocationID) REFERENCES Location (LocationID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
	FOREIGN KEY (WorkOrderID) REFERENCES WorkOrder (WorkOrderID)
)
GO

ALTER TABLE Address
	ADD FOREIGN KEY (StateProvinceID) REFERENCES StateProvince (StateProvinceID)
GO

ALTER TABLE BillOfMaterials
	ADD FOREIGN KEY (ComponentProductID) REFERENCES Product (ProductID)
GO

ALTER TABLE BillOfMaterials
	ADD FOREIGN KEY (ProductAssemblyProductID) REFERENCES Product (ProductID)
GO

ALTER TABLE BillOfMaterials
	ADD FOREIGN KEY (UnitMeasureCode) REFERENCES UnitMeasure (UnitMeasureCode)
GO

ALTER TABLE BusinessEntityContact
	ADD FOREIGN KEY (ContactTypeID) REFERENCES ContactType (ContactTypeID)
GO

ALTER TABLE BusinessEntityContact
	ADD FOREIGN KEY (PersonID) REFERENCES Person (BusinessEntityID)
GO

ALTER TABLE CountryRegionCurrency
	ADD FOREIGN KEY (CurrencyCode) REFERENCES Currency (CurrencyCode)
GO

ALTER TABLE Customer
	ADD FOREIGN KEY (PersonID) REFERENCES Person (BusinessEntityID)
GO

ALTER TABLE Customer
	ADD FOREIGN KEY (SalesTerritoryID) REFERENCES SalesTerritory (TerritoryID)
GO

ALTER TABLE Customer
	ADD FOREIGN KEY (StoreID) REFERENCES Store (BusinessEntityID)
GO

ALTER TABLE Document
	ADD FOREIGN KEY (OwnerID) REFERENCES Employee (PersonID)
GO

ALTER TABLE EmailAddress
	ADD FOREIGN KEY (PersonID) REFERENCES Person (BusinessEntityID)
GO

ALTER TABLE Employee
	ADD FOREIGN KEY (JobCandidateID) REFERENCES JobCandidate (JobCandidateID)
GO

ALTER TABLE Employee
	ADD FOREIGN KEY (PersonID) REFERENCES Person (BusinessEntityID)
GO

ALTER TABLE EmployeeDepartmentHistory
	ADD FOREIGN KEY (ShiftID) REFERENCES Shift (ShiftID)
GO

ALTER TABLE PersonPhone
	ADD FOREIGN KEY (PhoneNumberTypeID) REFERENCES PhoneNumberType (PhoneNumberTypeID)
GO

ALTER TABLE Product
	ADD FOREIGN KEY (ProductModelID) REFERENCES ProductModel (ProductModelID)
GO

ALTER TABLE Product
	ADD FOREIGN KEY (ProductSubcategoryID) REFERENCES ProductSubcategory (ProductSubcategoryID)
GO

ALTER TABLE Product
	ADD FOREIGN KEY (SizeUnitMeasureCode) REFERENCES UnitMeasure (UnitMeasureCode)
GO

ALTER TABLE Product
	ADD FOREIGN KEY (WeightUnitMeasureCode) REFERENCES UnitMeasure (UnitMeasureCode)
GO

ALTER TABLE ProductVendor
	ADD FOREIGN KEY (UnitMeasureCode) REFERENCES UnitMeasure (UnitMeasureCode)
GO

ALTER TABLE ProductVendor
	ADD FOREIGN KEY (VendorID) REFERENCES Vendor (BusinessEntityID)
GO

ALTER TABLE PurchaseOrder
	ADD FOREIGN KEY (ShipMethodID) REFERENCES ShipMethod (ShipMethodID)
GO

ALTER TABLE PurchaseOrder
	ADD FOREIGN KEY (StatusPurchaseOrderStatusCode) REFERENCES PurchaseOrderStatus (PurchaseOrderStatusCode)
GO

ALTER TABLE PurchaseOrder
	ADD FOREIGN KEY (VendorID) REFERENCES Vendor (BusinessEntityID)
GO

ALTER TABLE SalesOrder
	ADD FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson (EmployeeID)
GO

ALTER TABLE SalesOrder
	ADD FOREIGN KEY (SalesTerritoryID) REFERENCES SalesTerritory (TerritoryID)
GO

ALTER TABLE SalesOrder
	ADD FOREIGN KEY (ShipMethodID) REFERENCES ShipMethod (ShipMethodID)
GO

ALTER TABLE SalesOrder
	ADD FOREIGN KEY (StatusSalesOrderStatusCode) REFERENCES SalesOrderStatus (SalesOrderStatusCode)
GO

ALTER TABLE SalesOrderDetail
	ADD FOREIGN KEY (SpecialOfferID) REFERENCES SpecialOffer (SpecialOfferID)
GO

ALTER TABLE SalesOrderSalesReason
	ADD FOREIGN KEY (SalesReasonID) REFERENCES SalesReason (SalesReasonID)
GO

ALTER TABLE SalesPerson
	ADD FOREIGN KEY (SalesTerritoryID) REFERENCES SalesTerritory (TerritoryID)
GO

ALTER TABLE SalesTaxRate
	ADD FOREIGN KEY (StateProvinceID) REFERENCES StateProvince (StateProvinceID)
GO
