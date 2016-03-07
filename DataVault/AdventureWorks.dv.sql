CREATE TABLE AWBuildVersionHUB (
	-- AWBuild Version HUB has AWBuild Version ID
	AWBuildVersionID                        BIGINT NOT NULL IDENTITY,
	-- AWBuild Version HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- AWBuild Version HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to AWBuild Version HUB over PresenceConstraint over (AWBuild Version ID in "AWBuild Version HUB has AWBuild Version ID") occurs at most one time
	PRIMARY KEY CLUSTERED(AWBuildVersionID)
)
GO

CREATE TABLE AddressHUB (
	-- Address HUB has Address ID
	AddressID                               BIGINT NOT NULL IDENTITY,
	-- Address HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Address HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Address HUB over PresenceConstraint over (Address ID in "Address HUB has Address ID") occurs at most one time
	PRIMARY KEY CLUSTERED(AddressID)
)
GO

CREATE TABLE AddressSAT (
	-- Address SAT is of Address HUB that has Address ID
	AddressHUBAddressID                     BIGINT NOT NULL,
	-- Address SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Address SAT has Address Line1
	AddressLine1                            VARCHAR(60) NOT NULL,
	-- Address SAT is in City that has City Name
	CityName                                VARCHAR(30) NOT NULL,
	-- Address SAT has Postal Code
	PostalCode                              VARCHAR(15) NOT NULL,
	-- Address SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Address SAT is in State Province that has State Province ID
	StateProvinceID                         BIGINT NOT NULL,
	-- maybe Address SAT has Address Line2
	AddressLine2                            VARCHAR(60) NULL,
	-- maybe Address SAT is in Spatial Location
	SpatialLocation                         Geography NULL,
	-- Primary index to Address SAT over PresenceConstraint over (Address HUB, Load Date Time in "Address SAT is of Address HUB", "Address SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(AddressHUBAddressID, LoadDateTime),
	FOREIGN KEY (AddressHUBAddressID) REFERENCES AddressHUB (AddressID)
)
GO
CREATE UNIQUE NONCLUSTERED INDEX AddressSATByAddressLine1CityNamePostalCodeStateProvinceIDAdf ON AddressSAT(AddressLine1, CityName, PostalCode, StateProvinceID, AddressLine2) WHERE AddressLine2 IS NOT NULL
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

CREATE TABLE BillOfMaterialsHUB (
	-- Bill Of Materials HUB has Bill Of Materials ID
	BillOfMaterialsID                       BIGINT NOT NULL IDENTITY,
	-- Bill Of Materials HUB involves Product HUB and Product HUB has Product ID
	ComponentProductID                      BIGINT NOT NULL,
	-- Bill Of Materials HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Bill Of Materials HUB involves Product HUB and Product HUB has Product ID
	ProductAssemblyProductID                BIGINT NOT NULL,
	-- Bill Of Materials HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Bill Of Materials HUB involves Date
	StartDate                               datetime NOT NULL,
	-- Primary index to Bill Of Materials HUB over PresenceConstraint over (Bill Of Materials ID in "Bill Of Materials HUB has Bill Of Materials ID") occurs at most one time
	PRIMARY KEY CLUSTERED(BillOfMaterialsID),
	-- Unique index to Bill Of Materials HUB over PresenceConstraint over (Product Assembly, Component, Start Date in "Product HUB includes Product HUB from start-Date") occurs at most one time
	UNIQUE NONCLUSTERED(ComponentProductID, ProductAssemblyProductID, StartDate)
)
GO

CREATE TABLE BillOfMaterialsSAT (
	-- Bill Of Materials SAT is of Bill Of Materials HUB that has Bill Of Materials ID
	BillOfMaterialsHUBBillOfMaterialsID     BIGINT NOT NULL,
	-- Bill Of Materials SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Bill Of Materials SAT has BOM Level
	BOMLevel                                SMALLINT NOT NULL,
	-- Bill Of Materials SAT has Per Assembly Qty
	PerAssemblyQty                          DECIMAL NOT NULL,
	-- Bill Of Materials SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Bill Of Materials SAT has Unit Measure that has Unit Measure Code
	UnitMeasureCode                         CHAR(3) NOT NULL,
	-- maybe Bill Of Materials SAT is valid until end-Date
	EndDate                                 datetime NULL,
	-- Primary index to Bill Of Materials SAT over PresenceConstraint over (Bill Of Materials HUB, Load Date Time in "Bill Of Materials SAT is of Bill Of Materials HUB", "Bill Of Materials SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(BillOfMaterialsHUBBillOfMaterialsID, LoadDateTime),
	FOREIGN KEY (BillOfMaterialsHUBBillOfMaterialsID) REFERENCES BillOfMaterialsHUB (BillOfMaterialsID)
)
GO

CREATE TABLE BusinessEntityAddressLINK (
	-- Business Entity Address LINK involves Business Entity HUB that has Business Entity ID
	BusinessEntityHUBBusinessEntityID       BIGINT NOT NULL,
	-- Business Entity Address LINK involves Address HUB that has Address ID
	AddressHUBAddressID                     BIGINT NOT NULL,
	-- Business Entity Address LINK involves Address Type that has Address Type ID
	AddressTypeID                           BIGINT NOT NULL,
	-- Business Entity Address LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Business Entity Address LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Business Entity Address LINK over PresenceConstraint over (Business Entity HUB, Address HUB, Address Type in "Business Entity HUB uses Address HUB as Address Type") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityHUBBusinessEntityID, AddressHUBAddressID, AddressTypeID),
	FOREIGN KEY (AddressHUBAddressID) REFERENCES AddressHUB (AddressID),
	FOREIGN KEY (AddressTypeID) REFERENCES AddressType (AddressTypeID)
)
GO

CREATE TABLE BusinessEntityContactLINK (
	-- Business Entity Contact LINK involves Business Entity HUB that has Business Entity ID
	BusinessEntityHUBBusinessEntityID       BIGINT NOT NULL,
	-- Business Entity Contact LINK involves Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	PersonHUBBusinessEntityID               BIGINT NOT NULL,
	-- Business Entity Contact LINK involves Contact Type that has Contact Type ID
	ContactTypeID                           BIGINT NOT NULL,
	-- Business Entity Contact LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Business Entity Contact LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Business Entity Contact LINK over PresenceConstraint over (Business Entity HUB, Person HUB, Contact Type in "Business Entity HUB appoints Person HUB as Contact Type") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityHUBBusinessEntityID, PersonHUBBusinessEntityID, ContactTypeID)
)
GO

CREATE TABLE BusinessEntityHUB (
	-- Business Entity HUB has Business Entity ID
	BusinessEntityID                        BIGINT NOT NULL IDENTITY,
	-- Business Entity HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Business Entity HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Business Entity HUB over PresenceConstraint over (Business Entity ID in "Business Entity HUB has Business Entity ID") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityID)
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

CREATE TABLE CreditCardHUB (
	-- Credit Card HUB has Credit Card ID
	CreditCardID                            BIGINT NOT NULL IDENTITY,
	-- Credit Card HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Credit Card HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Credit Card HUB over PresenceConstraint over (Credit Card ID in "Credit Card HUB has Credit Card ID") occurs at most one time
	PRIMARY KEY CLUSTERED(CreditCardID)
)
GO

CREATE TABLE CreditCardSAT (
	-- Credit Card SAT is of Credit Card HUB that has Credit Card ID
	CreditCardHUBCreditCardID               BIGINT NOT NULL,
	-- Credit Card SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Credit Card SAT has Card Number
	CardNumber                              VARCHAR(25) NOT NULL,
	-- Credit Card SAT has Card Type
	CardType                                VARCHAR(50) NOT NULL,
	-- Credit Card SAT has Exp Month
	ExpMonth                                tinyint NOT NULL,
	-- Credit Card SAT has Exp Year
	ExpYear                                 smallint NOT NULL,
	-- Credit Card SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Credit Card SAT over PresenceConstraint over (Credit Card HUB, Load Date Time in "Credit Card SAT is of Credit Card HUB", "Credit Card SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(CreditCardHUBCreditCardID, LoadDateTime),
	-- Unique index to Credit Card SAT over PresenceConstraint over (Card Number in "Credit Card SAT has Card Number") occurs at most one time
	UNIQUE NONCLUSTERED(CardNumber),
	FOREIGN KEY (CreditCardHUBCreditCardID) REFERENCES CreditCardHUB (CreditCardID)
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

CREATE TABLE CurrencyRateHUB (
	-- Currency Rate HUB has Currency Rate ID
	CurrencyRateID                          BIGINT NOT NULL IDENTITY,
	-- Currency Rate HUB involves Date
	CurrencyRateDate                        datetime NOT NULL,
	-- Currency Rate HUB involves Currency and Currency has Currency Code
	FromCurrencyCode                        CHAR(3) NOT NULL,
	-- Currency Rate HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Currency Rate HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Currency Rate HUB involves Currency and Currency has Currency Code
	ToCurrencyCode                          CHAR(3) NOT NULL,
	-- Primary index to Currency Rate HUB over PresenceConstraint over (Currency Rate ID in "Currency Rate HUB has Currency Rate ID") occurs at most one time
	PRIMARY KEY CLUSTERED(CurrencyRateID),
	-- Unique index to Currency Rate HUB over PresenceConstraint over (From Currency, To Currency, Currency Rate Date in "from-Currency converts to to-Currency on Date") occurs at most one time
	UNIQUE NONCLUSTERED(CurrencyRateDate, FromCurrencyCode, ToCurrencyCode),
	FOREIGN KEY (FromCurrencyCode) REFERENCES Currency (CurrencyCode),
	FOREIGN KEY (ToCurrencyCode) REFERENCES Currency (CurrencyCode)
)
GO

CREATE TABLE CurrencyRateSAT (
	-- Currency Rate SAT is of Currency Rate HUB that has Currency Rate ID
	CurrencyRateHUBCurrencyRateID           BIGINT NOT NULL,
	-- Currency Rate SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Currency Rate SAT applies at Average Rate
	AverageRate                             money NOT NULL,
	-- Currency Rate SAT has End Of Day Rate
	EndOfDayRate                            money NOT NULL,
	-- Currency Rate SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Currency Rate SAT over PresenceConstraint over (Currency Rate HUB, Load Date Time in "Currency Rate SAT is of Currency Rate HUB", "Currency Rate SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(CurrencyRateHUBCurrencyRateID, LoadDateTime),
	FOREIGN KEY (CurrencyRateHUBCurrencyRateID) REFERENCES CurrencyRateHUB (CurrencyRateID)
)
GO

CREATE TABLE CustomerHUB (
	-- Customer HUB has Customer ID
	CustomerID                              BIGINT NOT NULL IDENTITY,
	-- Customer HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Customer HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Customer HUB over PresenceConstraint over (Customer ID in "Customer HUB has Customer ID") occurs at most one time
	PRIMARY KEY CLUSTERED(CustomerID)
)
GO

CREATE TABLE CustomerPersonLINK (
	-- Customer Person LINK involves Customer HUB that has Customer ID
	CustomerHUBCustomerID                   BIGINT NOT NULL,
	-- Customer Person LINK involves Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	PersonHUBBusinessEntityID               BIGINT NOT NULL,
	-- Customer Person LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Customer Person LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Customer Person LINK over PresenceConstraint over (Customer HUB, Person HUB in "Customer HUB is Person HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(CustomerHUBCustomerID, PersonHUBBusinessEntityID),
	FOREIGN KEY (CustomerHUBCustomerID) REFERENCES CustomerHUB (CustomerID)
)
GO

CREATE TABLE CustomerSAT (
	-- Customer SAT is of Customer HUB that has Customer ID
	CustomerHUBCustomerID                   BIGINT NOT NULL,
	-- Customer SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Customer SAT has Account Number
	AccountNumber                           VARCHAR(16) NOT NULL,
	-- Customer SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Customer SAT over PresenceConstraint over (Customer HUB, Load Date Time in "Customer SAT is of Customer HUB", "Customer SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(CustomerHUBCustomerID, LoadDateTime),
	-- Unique index to Customer SAT over PresenceConstraint over (Account Number in "Customer SAT has Account Number") occurs at most one time
	UNIQUE NONCLUSTERED(AccountNumber),
	FOREIGN KEY (CustomerHUBCustomerID) REFERENCES CustomerHUB (CustomerID)
)
GO

CREATE TABLE CustomerSalesTerritoryLINK (
	-- Customer Sales Territory LINK involves Customer HUB that has Customer ID
	CustomerHUBCustomerID                   BIGINT NOT NULL,
	-- Customer Sales Territory LINK involves Sales Territory HUB that has Territory ID
	SalesTerritoryHUBTerritoryID            BIGINT NOT NULL,
	-- Customer Sales Territory LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Customer Sales Territory LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Customer Sales Territory LINK over PresenceConstraint over (Customer HUB, Sales Territory HUB in "Customer HUB belongs to Sales Territory HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(CustomerHUBCustomerID, SalesTerritoryHUBTerritoryID),
	FOREIGN KEY (CustomerHUBCustomerID) REFERENCES CustomerHUB (CustomerID)
)
GO

CREATE TABLE CustomerStoreLINK (
	-- Customer Store LINK involves Customer HUB that has Customer ID
	CustomerHUBCustomerID                   BIGINT NOT NULL,
	-- Customer Store LINK involves Store HUB that is a kind of Business Entity HUB that has Business Entity ID
	StoreHUBBusinessEntityID                BIGINT NOT NULL,
	-- Customer Store LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Customer Store LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Customer Store LINK over PresenceConstraint over (Customer HUB, Store HUB in "Customer HUB is Store HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(CustomerHUBCustomerID, StoreHUBBusinessEntityID),
	FOREIGN KEY (CustomerHUBCustomerID) REFERENCES CustomerHUB (CustomerID)
)
GO

CREATE TABLE DatabaseLogHUB (
	-- Database Log HUB has Database Log ID
	DatabaseLogID                           BIGINT NOT NULL IDENTITY,
	-- Database Log HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Database Log HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Database Log HUB over PresenceConstraint over (Database Log ID in "Database Log HUB has Database Log ID") occurs at most one time
	PRIMARY KEY CLUSTERED(DatabaseLogID)
)
GO

CREATE TABLE DepartmentHUB (
	-- Department HUB has Department ID
	DepartmentID                            BIGINT NOT NULL IDENTITY,
	-- Department HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Department HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Department HUB over PresenceConstraint over (Department ID in "Department HUB has Department ID") occurs at most one time
	PRIMARY KEY CLUSTERED(DepartmentID)
)
GO

CREATE TABLE DepartmentSAT (
	-- Department SAT is of Department HUB that has Department ID
	DepartmentHUBDepartmentID               BIGINT NOT NULL,
	-- Department SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Department SAT has group-Name
	GroupName                               VARCHAR(50) NOT NULL,
	-- Department SAT has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Department SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Department SAT over PresenceConstraint over (Department HUB, Load Date Time in "Department SAT is of Department HUB", "Department SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(DepartmentHUBDepartmentID, LoadDateTime),
	-- Unique index to Department SAT over PresenceConstraint over (Name in "Department SAT has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	FOREIGN KEY (DepartmentHUBDepartmentID) REFERENCES DepartmentHUB (DepartmentID)
)
GO

CREATE TABLE DocumentHUB (
	-- Document HUB has Document ID
	DocumentID                              hierarchyid NOT NULL,
	-- Document HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Document HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Document HUB over PresenceConstraint over (Document ID in "Document HUB has Document ID") occurs at most one time
	PRIMARY KEY CLUSTERED(DocumentID)
)
GO

CREATE TABLE DocumentOwnerLINK (
	-- Document Owner LINK involves Document HUB that has Document ID
	DocumentHUBDocumentID                   hierarchyid NOT NULL,
	-- Document Owner LINK involves Employee HUB and Employee HUB is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	OwnerBusinessEntityID                   BIGINT NOT NULL,
	-- Document Owner LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Document Owner LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Document Owner LINK over PresenceConstraint over (Document HUB, Owner in "Document HUB is responsibility of Employee HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(DocumentHUBDocumentID, OwnerBusinessEntityID),
	FOREIGN KEY (DocumentHUBDocumentID) REFERENCES DocumentHUB (DocumentID)
)
GO

CREATE TABLE DocumentSAT (
	-- Document SAT is of Document HUB that has Document ID
	DocumentHUBDocumentID                   hierarchyid NOT NULL,
	-- Document SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Folder Flag
	FolderFlag                              BIT,
	-- Document SAT has Change Number
	ChangeNumber                            INTEGER NOT NULL,
	-- Document SAT has Document File Name
	DocumentFileName                        VARCHAR(400) NOT NULL,
	-- Document SAT has Document Revision
	DocumentRevision                        CHAR(5) NOT NULL,
	-- Document SAT has File Extension
	FileExtension                           VARCHAR(8) NOT NULL,
	-- Document SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Document SAT has Status
	Status                                  TINYINT NOT NULL CHECK((Status >= 1 AND Status <= 3)),
	-- Document SAT has Title
	Title                                   VARCHAR(50) NOT NULL,
	-- maybe Document SAT has Document Content
	DocumentContent                         VARCHAR(MAX) NULL,
	-- maybe Document SAT has Document Summary
	DocumentSummary                         VARCHAR(MAX) NULL,
	-- Primary index to Document SAT over PresenceConstraint over (Document HUB, Load Date Time in "Document SAT is of Document HUB", "Document SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(DocumentHUBDocumentID, LoadDateTime),
	FOREIGN KEY (DocumentHUBDocumentID) REFERENCES DocumentHUB (DocumentID)
)
GO

CREATE TABLE DocumentparentDocumentLINK (
	-- Document parent Document LINK involves Document HUB that has Document ID
	DocumentHUBDocumentID                   hierarchyid NOT NULL,
	-- Document parent Document LINK involves Document HUB and Document HUB has Document ID
	ParentDocumentHUBDocumentID             hierarchyid NOT NULL,
	-- Document parent Document LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Document parent Document LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Document parent Document LINK over PresenceConstraint over (Document HUB, Parent Document HUB in "Document HUB belongs to parent-Document HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(DocumentHUBDocumentID, ParentDocumentHUBDocumentID),
	FOREIGN KEY (DocumentHUBDocumentID) REFERENCES DocumentHUB (DocumentID),
	FOREIGN KEY (ParentDocumentHUBDocumentID) REFERENCES DocumentHUB (DocumentID)
)
GO

CREATE TABLE EmailAddressHUB (
	-- Email Address HUB has Email Address ID
	EmailAddressID                          BIGINT NOT NULL IDENTITY,
	-- Email Address HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Email Address HUB is used by Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	PersonHUBBusinessEntityID               BIGINT NOT NULL,
	-- Email Address HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Email Address HUB over PresenceConstraint over (Email Address ID in "Email Address HUB has Email Address ID") occurs at most one time
	PRIMARY KEY CLUSTERED(EmailAddressID)
)
GO

CREATE TABLE EmailAddressSAT (
	-- Email Address SAT is of Email Address HUB that has Email Address ID
	EmailAddressHUBEmailAddressID           BIGINT NOT NULL,
	-- Email Address SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Email Address SAT has EmailAddress
	EmailAddress                            VARCHAR(50) NOT NULL,
	-- Email Address SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Email Address SAT over PresenceConstraint over (Email Address HUB, Load Date Time in "Email Address SAT is of Email Address HUB", "Email Address SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(EmailAddressHUBEmailAddressID, LoadDateTime),
	FOREIGN KEY (EmailAddressHUBEmailAddressID) REFERENCES EmailAddressHUB (EmailAddressID)
)
GO

CREATE TABLE EmployeeDepartmentHistoryLINK (
	-- Employee Department History LINK has Employee Department History ID
	EmployeeDepartmentHistoryID             BIGINT NOT NULL IDENTITY,
	-- Employee Department History LINK involves Department HUB that has Department ID
	DepartmentHUBDepartmentID               BIGINT NOT NULL,
	-- Employee Department History LINK involves Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	EmployeeHUBBusinessEntityID             BIGINT NOT NULL,
	-- Employee Department History LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Employee Department History LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Employee Department History LINK involves Shift HUB that has Shift ID
	ShiftHUBShiftID                         BIGINT NOT NULL,
	-- Employee Department History LINK involves Date
	StartDate                               datetime NOT NULL,
	-- Primary index to Employee Department History LINK over PresenceConstraint over (Employee Department History ID in "Employee Department History LINK has Employee Department History ID") occurs at most one time
	PRIMARY KEY CLUSTERED(EmployeeDepartmentHistoryID),
	-- Unique index to Employee Department History LINK over PresenceConstraint over (Employee HUB, Start Date, Department HUB, Shift HUB in "Employee HUB started on start-Date in Department HUB working Shift HUB") occurs at most one time
	UNIQUE NONCLUSTERED(DepartmentHUBDepartmentID, EmployeeHUBBusinessEntityID, ShiftHUBShiftID, StartDate),
	FOREIGN KEY (DepartmentHUBDepartmentID) REFERENCES DepartmentHUB (DepartmentID)
)
GO

CREATE TABLE EmployeeDepartmentHistorySAT (
	-- Employee Department History SAT is of Employee Department History LINK that has Employee Department History ID
	EmployeeDepartmentHistoryLINKEmployeeD83 BIGINT NOT NULL,
	-- Employee Department History SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Employee Department History SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- maybe Employee Department History SAT is valid until end-Date
	EndDate                                 datetime NULL,
	-- Primary index to Employee Department History SAT over PresenceConstraint over (Employee Department History LINK, Load Date Time in "Employee Department History SAT is of Employee Department History LINK", "Employee Department History SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(EmployeeDepartmentHistoryLINKEmployeeD83, LoadDateTime),
	FOREIGN KEY (EmployeeDepartmentHistoryLINKEmployeeD83) REFERENCES EmployeeDepartmentHistoryLINK (EmployeeDepartmentHistoryID)
)
GO

CREATE TABLE EmployeeHUB (
	-- Employee HUB is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	PersonHUBBusinessEntityID               BIGINT NOT NULL,
	-- Employee HUB was loaded at Date Time
	DateTime                                DATETIME NOT NULL,
	-- Employee HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Employee HUB over PresenceConstraint over (Person HUB in "Employee HUB is a kind of Person HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(PersonHUBBusinessEntityID)
)
GO

CREATE TABLE EmployeeJobCandidateLINK (
	-- Employee Job Candidate LINK involves Job Candidate HUB that has Job Candidate ID
	JobCandidateHUBJobCandidateID           BIGINT NOT NULL,
	-- Employee Job Candidate LINK involves Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	EmployeeHUBBusinessEntityID             BIGINT NOT NULL,
	-- Employee Job Candidate LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Employee Job Candidate LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Employee Job Candidate LINK over PresenceConstraint over (Job Candidate HUB, Employee HUB in "Job Candidate HUB was hired as Employee HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(JobCandidateHUBJobCandidateID, EmployeeHUBBusinessEntityID),
	FOREIGN KEY (EmployeeHUBBusinessEntityID) REFERENCES EmployeeHUB (PersonHUBBusinessEntityID)
)
GO

CREATE TABLE EmployeeOrganizationNodeLINK (
	-- Employee Organization Node LINK involves Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	EmployeeHUBBusinessEntityID             BIGINT NOT NULL,
	-- Employee Organization Node LINK involves Department HUB and Department HUB has Department ID
	OrganizationNodeDepartmentID            BIGINT NOT NULL,
	-- Employee Organization Node LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Employee Organization Node LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Employee Organization Node LINK over PresenceConstraint over (Employee HUB, Organization Node in "Employee HUB belongs to Department HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(EmployeeHUBBusinessEntityID, OrganizationNodeDepartmentID),
	FOREIGN KEY (EmployeeHUBBusinessEntityID) REFERENCES EmployeeHUB (PersonHUBBusinessEntityID),
	FOREIGN KEY (OrganizationNodeDepartmentID) REFERENCES DepartmentHUB (DepartmentID)
)
GO

CREATE TABLE EmployeePayHistoryHUB (
	-- Employee Pay History HUB has Employee Pay History ID
	EmployeePayHistoryID                    BIGINT NOT NULL IDENTITY,
	-- Employee Pay History HUB involves Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	EmployeeHUBBusinessEntityID             BIGINT NOT NULL,
	-- Employee Pay History HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Employee Pay History HUB involves Date
	RateChangeDate                          datetime NOT NULL,
	-- Employee Pay History HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Employee Pay History HUB over PresenceConstraint over (Employee Pay History ID in "Employee Pay History HUB has Employee Pay History ID") occurs at most one time
	PRIMARY KEY CLUSTERED(EmployeePayHistoryID),
	-- Unique index to Employee Pay History HUB over PresenceConstraint over (Employee HUB, Rate Change Date in "pay of Employee HUB was changed on rate- change Date") occurs at most one time
	UNIQUE NONCLUSTERED(EmployeeHUBBusinessEntityID, RateChangeDate),
	FOREIGN KEY (EmployeeHUBBusinessEntityID) REFERENCES EmployeeHUB (PersonHUBBusinessEntityID)
)
GO

CREATE TABLE EmployeePayHistorySAT (
	-- Employee Pay History SAT is of Employee Pay History HUB that has Employee Pay History ID
	EmployeePayHistoryHUBEmployeePayHistoryI BIGINT NOT NULL,
	-- Employee Pay History SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Employee Pay History SAT is paid at Pay Frequency
	PayFrequency                            tinyint NOT NULL CHECK(PayFrequency = 1 OR PayFrequency = 2),
	-- Employee Pay History SAT is at Rate
	Rate                                    money NOT NULL,
	-- Employee Pay History SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Employee Pay History SAT over PresenceConstraint over (Employee Pay History HUB, Load Date Time in "Employee Pay History SAT is of Employee Pay History HUB", "Employee Pay History SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(EmployeePayHistoryHUBEmployeePayHistoryI, LoadDateTime),
	FOREIGN KEY (EmployeePayHistoryHUBEmployeePayHistoryI) REFERENCES EmployeePayHistoryHUB (EmployeePayHistoryID)
)
GO

CREATE TABLE EmployeeSAT (
	-- Employee SAT is of Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	EmployeeHUBBusinessEntityID             BIGINT NOT NULL,
	-- Employee SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Current Flag
	CurrentFlag                             BIT,
	-- Salaried Flag
	SalariedFlag                            BIT,
	-- Employee SAT has birth-Date
	BirthDate                               datetime NOT NULL,
	-- Employee SAT has Gender
	Gender                                  CHAR(1) NOT NULL CHECK(Gender = 'F' OR Gender = 'M' OR Gender = 'f' OR Gender = 'm'),
	-- Employee SAT has hire-Date
	HireDate                                datetime NOT NULL,
	-- Employee SAT has Job Title
	JobTitle                                VARCHAR(50) NOT NULL,
	-- Employee SAT has Login ID
	LoginID                                 VARCHAR(256) NOT NULL,
	-- Employee SAT has Marital Status
	MaritalStatus                           CHAR(1) NOT NULL CHECK(MaritalStatus = 'M' OR MaritalStatus = 'S'),
	-- Employee SAT has National ID Number
	NationalIDNumber                        VARCHAR(15) NOT NULL,
	-- Employee SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Employee SAT has sick- leave Hours
	SickLeaveHours                          INTEGER NOT NULL,
	-- Employee SAT has vacation-Hours
	VacationHours                           INTEGER NOT NULL,
	-- Primary index to Employee SAT over PresenceConstraint over (Employee HUB, Load Date Time in "Employee SAT is of Employee HUB", "Employee SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(EmployeeHUBBusinessEntityID, LoadDateTime),
	FOREIGN KEY (EmployeeHUBBusinessEntityID) REFERENCES EmployeeHUB (PersonHUBBusinessEntityID)
)
GO

CREATE TABLE ErrorLogHUB (
	-- Error Log HUB has Error Log ID
	ErrorLogID                              BIGINT NOT NULL IDENTITY,
	-- Error Log HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Error Log HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Error Log HUB over PresenceConstraint over (Error Log ID in "Error Log HUB has Error Log ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ErrorLogID)
)
GO

CREATE TABLE IllustrationHUB (
	-- Illustration HUB has Illustration ID
	IllustrationID                          BIGINT NOT NULL IDENTITY,
	-- Illustration HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Illustration HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Illustration HUB over PresenceConstraint over (Illustration ID in "Illustration HUB has Illustration ID") occurs at most one time
	PRIMARY KEY CLUSTERED(IllustrationID)
)
GO

CREATE TABLE IllustrationSAT (
	-- Illustration SAT is of Illustration HUB that has Illustration ID
	IllustrationHUBIllustrationID           BIGINT NOT NULL,
	-- Illustration SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Illustration SAT has Diagram
	Diagram                                 VARCHAR(MAX) NOT NULL,
	-- Illustration SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Illustration SAT over PresenceConstraint over (Illustration HUB, Load Date Time in "Illustration SAT is of Illustration HUB", "Illustration SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(IllustrationHUBIllustrationID, LoadDateTime),
	FOREIGN KEY (IllustrationHUBIllustrationID) REFERENCES IllustrationHUB (IllustrationID)
)
GO

CREATE TABLE JobCandidateHUB (
	-- Job Candidate HUB has Job Candidate ID
	JobCandidateID                          BIGINT NOT NULL IDENTITY,
	-- Job Candidate HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Job Candidate HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Job Candidate HUB over PresenceConstraint over (Job Candidate ID in "Job Candidate HUB has Job Candidate ID") occurs at most one time
	PRIMARY KEY CLUSTERED(JobCandidateID)
)
GO

CREATE TABLE JobCandidateSAT (
	-- Job Candidate SAT is of Job Candidate HUB that has Job Candidate ID
	JobCandidateHUBJobCandidateID           BIGINT NOT NULL,
	-- Job Candidate SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Job Candidate SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- maybe Job Candidate SAT supplied Resume
	Resume                                  VARCHAR(MAX) NULL,
	-- Primary index to Job Candidate SAT over PresenceConstraint over (Job Candidate HUB, Load Date Time in "Job Candidate SAT is of Job Candidate HUB", "Job Candidate SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(JobCandidateHUBJobCandidateID, LoadDateTime),
	FOREIGN KEY (JobCandidateHUBJobCandidateID) REFERENCES JobCandidateHUB (JobCandidateID)
)
GO

CREATE TABLE LocationHUB (
	-- Location HUB has Location ID
	LocationID                              BIGINT NOT NULL IDENTITY,
	-- Location HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Location HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Location HUB over PresenceConstraint over (Location ID in "Location HUB has Location ID") occurs at most one time
	PRIMARY KEY CLUSTERED(LocationID)
)
GO

CREATE TABLE LocationSAT (
	-- Location SAT is of Location HUB that has Location ID
	LocationHUBLocationID                   BIGINT NOT NULL,
	-- Location SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Location SAT has Availability
	Availability                            DECIMAL NOT NULL,
	-- Location SAT has Cost Rate
	CostRate                                smallmoney NOT NULL,
	-- Location SAT has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Location SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Location SAT over PresenceConstraint over (Location HUB, Load Date Time in "Location SAT is of Location HUB", "Location SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(LocationHUBLocationID, LoadDateTime),
	-- Unique index to Location SAT over PresenceConstraint over (Name in "Location SAT has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	FOREIGN KEY (LocationHUBLocationID) REFERENCES LocationHUB (LocationID)
)
GO

CREATE TABLE PersonCreditCardLINK (
	-- Person Credit Card LINK involves Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	PersonHUBBusinessEntityID               BIGINT NOT NULL,
	-- Person Credit Card LINK involves Credit Card HUB that has Credit Card ID
	CreditCardHUBCreditCardID               BIGINT NOT NULL,
	-- Person Credit Card LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Person Credit Card LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Person Credit Card LINK over PresenceConstraint over (Person HUB, Credit Card HUB in "Person HUB uses Credit Card HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(PersonHUBBusinessEntityID, CreditCardHUBCreditCardID),
	FOREIGN KEY (CreditCardHUBCreditCardID) REFERENCES CreditCardHUB (CreditCardID)
)
GO

CREATE TABLE PersonHUB (
	-- Person HUB is a kind of Business Entity HUB that has Business Entity ID
	BusinessEntityHUBBusinessEntityID       BIGINT NOT NULL,
	-- Person HUB was loaded at Date Time
	DateTime                                DATETIME NOT NULL,
	-- Person HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Person HUB over PresenceConstraint over (Business Entity HUB in "Person HUB is a kind of Business Entity HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityHUBBusinessEntityID),
	FOREIGN KEY (BusinessEntityHUBBusinessEntityID) REFERENCES BusinessEntityHUB (BusinessEntityID)
)
GO

CREATE TABLE PersonPhoneLINK (
	-- Person Phone LINK has Person Phone ID
	PersonPhoneID                           BIGINT NOT NULL IDENTITY,
	-- Person Phone LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Person Phone LINK involves Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	PersonHUBBusinessEntityID               BIGINT NOT NULL,
	-- Person Phone LINK involves Phone Number
	PhoneNumber                             VARCHAR(25) NOT NULL,
	-- Person Phone LINK involves Phone Number Type that has Phone Number Type ID
	PhoneNumberTypeID                       BIGINT NOT NULL,
	-- Person Phone LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Person Phone LINK over PresenceConstraint over (Person Phone ID in "Person Phone LINK has Person Phone ID") occurs at most one time
	PRIMARY KEY CLUSTERED(PersonPhoneID),
	-- Unique index to Person Phone LINK over PresenceConstraint over (Person HUB, Phone Number, Phone Number Type in "Person HUB uses Phone Number of Phone Number Type") occurs at most one time
	UNIQUE NONCLUSTERED(PersonHUBBusinessEntityID, PhoneNumber, PhoneNumberTypeID),
	FOREIGN KEY (PersonHUBBusinessEntityID) REFERENCES PersonHUB (BusinessEntityHUBBusinessEntityID)
)
GO

CREATE TABLE PersonSAT (
	-- Person SAT is of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	PersonHUBBusinessEntityID               BIGINT NOT NULL,
	-- Person SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Name Style
	NameStyle                               BIT,
	-- Person SAT has Email Promotion
	EmailPromotion                          TINYINT NOT NULL CHECK((EmailPromotion >= 0 AND EmailPromotion <= 2)),
	-- Person SAT has first-Name
	FirstName                               VARCHAR(50) NOT NULL,
	-- Person SAT has last-Name
	LastName                                VARCHAR(50) NOT NULL,
	-- Person SAT is of Person Type that has Person Type Code
	PersonTypeCode                          CHAR(2) NOT NULL CHECK(PersonTypeCode = 'EM' OR PersonTypeCode = 'GC' OR PersonTypeCode = 'IN' OR PersonTypeCode = 'SC' OR PersonTypeCode = 'SP' OR PersonTypeCode = 'VC'),
	-- Person SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- maybe Person SAT has Additional Contact Info
	AdditionalContactInfo                   VARCHAR(MAX) NULL,
	-- maybe Person SAT has Demographics
	Demographics                            VARCHAR(MAX) NULL,
	-- maybe Person SAT has middle-Name
	MiddleName                              VARCHAR(50) NULL,
	-- maybe Person SAT uses Password that has Password Hash
	PasswordHash                            VARCHAR(128) NULL,
	-- maybe Person SAT uses Password that has Password Salt
	PasswordSalt                            VARCHAR(10) NULL,
	-- maybe Person SAT has Suffix
	Suffix                                  VARCHAR(10) NULL,
	-- maybe Person SAT has Title
	Title                                   VARCHAR(8) NULL,
	-- Primary index to Person SAT over PresenceConstraint over (Person HUB, Load Date Time in "Person SAT is of Person HUB", "Person SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(PersonHUBBusinessEntityID, LoadDateTime),
	FOREIGN KEY (PersonHUBBusinessEntityID) REFERENCES PersonHUB (BusinessEntityHUBBusinessEntityID)
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

CREATE TABLE ProductCategoryHUB (
	-- Product Category HUB has Product Category ID
	ProductCategoryID                       BIGINT NOT NULL IDENTITY,
	-- Product Category HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Category HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Category HUB over PresenceConstraint over (Product Category ID in "Product Category HUB has Product Category ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductCategoryID)
)
GO

CREATE TABLE ProductCategorySAT (
	-- Product Category SAT is of Product Category HUB that has Product Category ID
	ProductCategoryHUBProductCategoryID     BIGINT NOT NULL,
	-- Product Category SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Category SAT has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Product Category SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Category SAT over PresenceConstraint over (Product Category HUB, Load Date Time in "Product Category SAT is of Product Category HUB", "Product Category SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductCategoryHUBProductCategoryID, LoadDateTime),
	-- Unique index to Product Category SAT over PresenceConstraint over (Name in "Product Category SAT has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	FOREIGN KEY (ProductCategoryHUBProductCategoryID) REFERENCES ProductCategoryHUB (ProductCategoryID)
)
GO

CREATE TABLE ProductCostHistoryHUB (
	-- Product Cost History HUB has Product Cost History ID
	ProductCostHistoryID                    BIGINT NOT NULL IDENTITY,
	-- Product Cost History HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Cost History HUB involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Product Cost History HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Product Cost History HUB involves Date
	StartDate                               datetime NOT NULL,
	-- Primary index to Product Cost History HUB over PresenceConstraint over (Product Cost History ID in "Product Cost History HUB has Product Cost History ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductCostHistoryID),
	-- Unique index to Product Cost History HUB over PresenceConstraint over (Product HUB, Start Date in "Product HUB was costed on start-Date") occurs at most one time
	UNIQUE NONCLUSTERED(ProductHUBProductID, StartDate)
)
GO

CREATE TABLE ProductCostHistorySAT (
	-- Product Cost History SAT is of Product Cost History HUB that has Product Cost History ID
	ProductCostHistoryHUBProductCostHistoryI BIGINT NOT NULL,
	-- Product Cost History SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Cost History SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Product Cost History SAT has Standard Cost
	StandardCost                            money NOT NULL,
	-- maybe Product Cost History SAT is valid until end-Date
	EndDate                                 datetime NULL,
	-- Primary index to Product Cost History SAT over PresenceConstraint over (Product Cost History HUB, Load Date Time in "Product Cost History SAT is of Product Cost History HUB", "Product Cost History SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductCostHistoryHUBProductCostHistoryI, LoadDateTime),
	FOREIGN KEY (ProductCostHistoryHUBProductCostHistoryI) REFERENCES ProductCostHistoryHUB (ProductCostHistoryID)
)
GO

CREATE TABLE ProductDescriptionHUB (
	-- Product Description HUB has Product Description ID
	ProductDescriptionID                    BIGINT NOT NULL IDENTITY,
	-- Product Description HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Description HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Description HUB over PresenceConstraint over (Product Description ID in "Product Description HUB has Product Description ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductDescriptionID)
)
GO

CREATE TABLE ProductDescriptionSAT (
	-- Product Description SAT is of Product Description HUB that has Product Description ID
	ProductDescriptionHUBProductDescriptionI BIGINT NOT NULL,
	-- Product Description SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Description SAT has Description
	Description                             VARCHAR(400) NOT NULL,
	-- Product Description SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Description SAT over PresenceConstraint over (Product Description HUB, Load Date Time in "Product Description SAT is of Product Description HUB", "Product Description SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductDescriptionHUBProductDescriptionI, LoadDateTime),
	FOREIGN KEY (ProductDescriptionHUBProductDescriptionI) REFERENCES ProductDescriptionHUB (ProductDescriptionID)
)
GO

CREATE TABLE ProductDocumentLINK (
	-- Product Document LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Product Document LINK involves Document HUB that has Document ID
	DocumentHUBDocumentID                   hierarchyid NOT NULL,
	-- Product Document LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Document LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Document LINK over PresenceConstraint over (Product HUB, Document HUB in "Product HUB is described by Document HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductHUBProductID, DocumentHUBDocumentID),
	FOREIGN KEY (DocumentHUBDocumentID) REFERENCES DocumentHUB (DocumentID)
)
GO

CREATE TABLE ProductHUB (
	-- Product HUB has Product ID
	ProductID                               BIGINT NOT NULL IDENTITY,
	-- Product HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product HUB over PresenceConstraint over (Product ID in "Product HUB has Product ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductID)
)
GO

CREATE TABLE ProductInventoryLINK (
	-- Product Inventory LINK has Product Inventory ID
	ProductInventoryID                      BIGINT NOT NULL IDENTITY,
	-- Product Inventory LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Inventory LINK involves Location HUB that has Location ID
	LocationHUBLocationID                   BIGINT NOT NULL,
	-- Product Inventory LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Product Inventory LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Inventory LINK over PresenceConstraint over (Product Inventory ID in "Product Inventory LINK has Product Inventory ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductInventoryID),
	-- Unique index to Product Inventory LINK over PresenceConstraint over (Product HUB, Location HUB in "Product HUB is available at Location HUB") occurs at most one time
	UNIQUE NONCLUSTERED(LocationHUBLocationID, ProductHUBProductID),
	FOREIGN KEY (LocationHUBLocationID) REFERENCES LocationHUB (LocationID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID)
)
GO

CREATE TABLE ProductInventorySAT (
	-- Product Inventory SAT is of Product Inventory LINK that has Product Inventory ID
	ProductInventoryLINKProductInventoryID  BIGINT NOT NULL,
	-- Product Inventory SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Inventory SAT is in Bin
	Bin                                     TINYINT NOT NULL,
	-- Product Inventory SAT has Quantity
	Quantity                                INTEGER NOT NULL,
	-- Product Inventory SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Product Inventory SAT is on Shelf
	Shelf                                   VARCHAR(10) NOT NULL,
	-- Primary index to Product Inventory SAT over PresenceConstraint over (Product Inventory LINK, Load Date Time in "Product Inventory SAT is of Product Inventory LINK", "Product Inventory SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductInventoryLINKProductInventoryID, LoadDateTime),
	FOREIGN KEY (ProductInventoryLINKProductInventoryID) REFERENCES ProductInventoryLINK (ProductInventoryID)
)
GO

CREATE TABLE ProductListPriceHistoryHUB (
	-- Product List Price History HUB has Product List Price History ID
	ProductListPriceHistoryID               BIGINT NOT NULL IDENTITY,
	-- Product List Price History HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product List Price History HUB involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Product List Price History HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Product List Price History HUB involves Date
	StartDate                               datetime NOT NULL,
	-- Primary index to Product List Price History HUB over PresenceConstraint over (Product List Price History ID in "Product List Price History HUB has Product List Price History ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductListPriceHistoryID),
	-- Unique index to Product List Price History HUB over PresenceConstraint over (Product HUB, Start Date in "Product HUB was priced on start-Date") occurs at most one time
	UNIQUE NONCLUSTERED(ProductHUBProductID, StartDate),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID)
)
GO

CREATE TABLE ProductListPriceHistorySAT (
	-- Product List Price History SAT is of Product List Price History HUB that has Product List Price History ID
	ProductListPriceHistoryHUBProductListPr1 BIGINT NOT NULL,
	-- Product List Price History SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product List Price History SAT has List Price
	ListPrice                               money NOT NULL,
	-- Product List Price History SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- maybe Product List Price History SAT is valid until end-Date
	EndDate                                 datetime NULL,
	-- Primary index to Product List Price History SAT over PresenceConstraint over (Product List Price History HUB, Load Date Time in "Product List Price History SAT is of Product List Price History HUB", "Product List Price History SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductListPriceHistoryHUBProductListPr1, LoadDateTime),
	FOREIGN KEY (ProductListPriceHistoryHUBProductListPr1) REFERENCES ProductListPriceHistoryHUB (ProductListPriceHistoryID)
)
GO

CREATE TABLE ProductModelHUB (
	-- Product Model HUB has Product Model ID
	ProductModelID                          BIGINT NOT NULL IDENTITY,
	-- Product Model HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Model HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Model HUB over PresenceConstraint over (Product Model ID in "Product Model HUB has Product Model ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductModelID)
)
GO

CREATE TABLE ProductModelIllustrationLINK (
	-- Product Model Illustration LINK involves Product Model HUB that has Product Model ID
	ProductModelHUBProductModelID           BIGINT NOT NULL,
	-- Product Model Illustration LINK involves Illustration HUB that has Illustration ID
	IllustrationHUBIllustrationID           BIGINT NOT NULL,
	-- Product Model Illustration LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Model Illustration LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Model Illustration LINK over PresenceConstraint over (Product Model HUB, Illustration HUB in "Product Model HUB has Illustration HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductModelHUBProductModelID, IllustrationHUBIllustrationID),
	FOREIGN KEY (IllustrationHUBIllustrationID) REFERENCES IllustrationHUB (IllustrationID),
	FOREIGN KEY (ProductModelHUBProductModelID) REFERENCES ProductModelHUB (ProductModelID)
)
GO

CREATE TABLE ProductModelProductDescriptionCultureLINK (
	-- Product Model Product Description Culture LINK involves Product Model HUB that has Product Model ID
	ProductModelHUBProductModelID           BIGINT NOT NULL,
	-- Product Model Product Description Culture LINK involves Product Description HUB that has Product Description ID
	ProductDescriptionHUBProductDescriptionI BIGINT NOT NULL,
	-- Product Model Product Description Culture LINK involves Culture that has Culture ID
	CultureID                               BIGINT NOT NULL,
	-- Product Model Product Description Culture LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Model Product Description Culture LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Model Product Description Culture LINK over PresenceConstraint over (Product Model HUB, Product Description HUB, Culture in "Product Model HUB has Product Description HUB for Culture") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductModelHUBProductModelID, ProductDescriptionHUBProductDescriptionI, CultureID),
	FOREIGN KEY (CultureID) REFERENCES Culture (CultureID),
	FOREIGN KEY (ProductDescriptionHUBProductDescriptionI) REFERENCES ProductDescriptionHUB (ProductDescriptionID),
	FOREIGN KEY (ProductModelHUBProductModelID) REFERENCES ProductModelHUB (ProductModelID)
)
GO

CREATE TABLE ProductModelSAT (
	-- Product Model SAT is of Product Model HUB that has Product Model ID
	ProductModelHUBProductModelID           BIGINT NOT NULL,
	-- Product Model SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Model SAT has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Product Model SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- maybe Product Model SAT is described by Catalog Description
	CatalogDescription                      VARCHAR(MAX) NULL,
	-- maybe Product Model SAT has Instructions
	Instructions                            VARCHAR(MAX) NULL,
	-- Primary index to Product Model SAT over PresenceConstraint over (Product Model HUB, Load Date Time in "Product Model SAT is of Product Model HUB", "Product Model SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductModelHUBProductModelID, LoadDateTime),
	-- Unique index to Product Model SAT over PresenceConstraint over (Name in "Product Model SAT has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	FOREIGN KEY (ProductModelHUBProductModelID) REFERENCES ProductModelHUB (ProductModelID)
)
GO

CREATE TABLE ProductPhotoHUB (
	-- Product Photo HUB has Product Photo ID
	ProductPhotoID                          BIGINT NOT NULL IDENTITY,
	-- Product Photo HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Photo HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Photo HUB over PresenceConstraint over (Product Photo ID in "Product Photo HUB has Product Photo ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductPhotoID)
)
GO

CREATE TABLE ProductPhotoSAT (
	-- Product Photo SAT is of Product Photo HUB that has Product Photo ID
	ProductPhotoHUBProductPhotoID           BIGINT NOT NULL,
	-- Product Photo SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Photo SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- maybe Product Photo SAT has large-Photo
	LargePhoto                              varbinary NULL,
	-- maybe Product Photo SAT has large-Photo File Name
	LargePhotoFileName                      VARCHAR(50) NULL,
	-- maybe Product Photo SAT has thumb- nail Photo
	ThumbNailPhoto                          varbinary NULL,
	-- maybe Product Photo SAT has thumbnail-Photo File Name
	ThumbnailPhotoFileName                  VARCHAR(50) NULL,
	-- Primary index to Product Photo SAT over PresenceConstraint over (Product Photo HUB, Load Date Time in "Product Photo SAT is of Product Photo HUB", "Product Photo SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductPhotoHUBProductPhotoID, LoadDateTime),
	FOREIGN KEY (ProductPhotoHUBProductPhotoID) REFERENCES ProductPhotoHUB (ProductPhotoID)
)
GO

CREATE TABLE ProductProductModelLINK (
	-- Product Product Model LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Product Product Model LINK involves Product Model HUB and Product Model HUB has Product Model ID
	ProductModelID                          BIGINT NOT NULL,
	-- Product Product Model LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Product Model LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Product Model LINK over PresenceConstraint over (Product HUB, Product Model in "Product HUB is of Product Model HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductHUBProductID, ProductModelID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID),
	FOREIGN KEY (ProductModelID) REFERENCES ProductModelHUB (ProductModelID)
)
GO

CREATE TABLE ProductProductPhotoLINK (
	-- Product Product Photo LINK has Product Product Photo ID
	ProductPhotoID                          BIGINT NOT NULL IDENTITY,
	-- Product Product Photo LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Product Photo LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Product Product Photo LINK involves Product Photo HUB that has Product Photo ID
	ProductPhotoHUBProductPhotoID           BIGINT NOT NULL,
	-- Product Product Photo LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Product Photo LINK over PresenceConstraint over (Product Product Photo ID in "Product Product Photo LINK has Product Product Photo ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductPhotoID),
	-- Unique index to Product Product Photo LINK over PresenceConstraint over (Product HUB, Product Photo HUB in "Product HUB has Product Photo HUB") occurs at most one time
	UNIQUE NONCLUSTERED(ProductHUBProductID, ProductPhotoHUBProductPhotoID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID),
	FOREIGN KEY (ProductPhotoHUBProductPhotoID) REFERENCES ProductPhotoHUB (ProductPhotoID)
)
GO

CREATE TABLE ProductProductPhotoSAT (
	-- Product Product Photo SAT is of Product Product Photo LINK that has Product Product Photo ID
	ProductPhotoLINKProductPhotoID          BIGINT NOT NULL,
	-- Product Product Photo SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Primary
	[Primary]                               BIT,
	-- Product Product Photo SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Product Photo SAT over PresenceConstraint over (Product Product Photo LINK, Load Date Time in "Product Product Photo SAT is of Product Product Photo LINK", "Product Product Photo SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductPhotoLINKProductPhotoID, LoadDateTime),
	FOREIGN KEY (ProductPhotoLINKProductPhotoID) REFERENCES ProductProductPhotoLINK (ProductPhotoID)
)
GO

CREATE TABLE ProductProductSubcategoryLINK (
	-- Product Product Subcategory LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Product Product Subcategory LINK involves Product Subcategory HUB and Product Subcategory HUB has Product Subcategory ID
	ProductSubcategoryID                    BIGINT NOT NULL,
	-- Product Product Subcategory LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Product Subcategory LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Product Subcategory LINK over PresenceConstraint over (Product HUB, Product Subcategory in "Product HUB belongs to Product Subcategory HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductHUBProductID, ProductSubcategoryID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID)
)
GO

CREATE TABLE ProductReviewHUB (
	-- Product Review HUB has Product Review ID
	ProductReviewID                         BIGINT NOT NULL IDENTITY,
	-- Product Review HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Review HUB involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Product Review HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Product Review HUB involves Date
	ReviewDate                              datetime NOT NULL,
	-- Product Review HUB involves Name
	ReviewerName                            VARCHAR(50) NOT NULL,
	-- Primary index to Product Review HUB over PresenceConstraint over (Product Review ID in "Product Review HUB has Product Review ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductReviewID),
	-- Unique index to Product Review HUB over PresenceConstraint over (Product HUB, Reviewer Name in "Product HUB was reviewed by reviewer-Name on review-Date") occurs one time
	UNIQUE NONCLUSTERED(ProductHUBProductID, ReviewerName),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID)
)
GO

CREATE TABLE ProductReviewSAT (
	-- Product Review SAT is of Product Review HUB that has Product Review ID
	ProductReviewHUBProductReviewID         BIGINT NOT NULL,
	-- Product Review SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Review SAT has EmailAddress
	EmailAddress                            VARCHAR(50) NOT NULL,
	-- Product Review SAT assigned Rating
	Rating                                  TINYINT NOT NULL CHECK((Rating >= 1 AND Rating <= 5)),
	-- Product Review SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- maybe Product Review SAT has Comments
	Comments                                VARCHAR(3850) NULL,
	-- Primary index to Product Review SAT over PresenceConstraint over (Product Review HUB, Load Date Time in "Product Review SAT is of Product Review HUB", "Product Review SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductReviewHUBProductReviewID, LoadDateTime),
	FOREIGN KEY (ProductReviewHUBProductReviewID) REFERENCES ProductReviewHUB (ProductReviewID)
)
GO

CREATE TABLE ProductSAT (
	-- Product SAT is of Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Product SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Finished Goods Flag
	FinishedGoodsFlag                       BIT,
	-- Product SAT takes Days To Manufacture of days to manufacture
	DaysToManufacture                       INTEGER NOT NULL,
	-- Product SAT has List Price
	ListPrice                               money NOT NULL,
	-- Product SAT has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Product SAT has Product Number
	ProductNumber                           VARCHAR(25) NOT NULL,
	-- Product SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Product SAT should be re-ordered when inventory drops below Reorder Point
	ReorderPoint                            INTEGER NOT NULL,
	-- Product SAT should be stocked at least in Safety Stock Level
	SafetyStockLevel                        INTEGER NOT NULL,
	-- Product SAT was first available on sell- start Date
	SellStartDate                           datetime NOT NULL,
	-- Product SAT has Standard Cost
	StandardCost                            money NOT NULL,
	-- maybe Product SAT is of Class
	Class                                   CHAR(2) NULL CHECK(Class = 'H' OR Class = 'L' OR Class = 'M'),
	-- maybe Product SAT is of Color
	Color                                   VARCHAR(15) NULL,
	-- maybe Product SAT was discontinued on discontinued-Date
	DiscontinuedDate                        datetime NULL,
	-- maybe Product SAT belongs to Product Line that has Product Line Name
	ProductLineName                         CHAR(2) NULL CHECK(ProductLineName = 'M' OR ProductLineName = 'R' OR ProductLineName = 'S' OR ProductLineName = 'T'),
	-- maybe Product SAT is last available on sell- end Date
	SellEndDate                             datetime NULL,
	-- maybe Product SAT has Size
	Size                                    VARCHAR(5) NULL,
	-- maybe Product SAT size is in size-Unit Measure and Unit Measure has Unit Measure Code
	SizeUnitMeasureCode                     CHAR(3) NULL,
	-- maybe Product SAT is of Style
	Style                                   CHAR(2) NULL CHECK(Style = 'M' OR Style = 'U' OR Style = 'W'),
	-- maybe Product SAT has Weight
	Weight                                  DECIMAL NULL,
	-- maybe Product SAT weight is in weight-Unit Measure and Unit Measure has Unit Measure Code
	WeightUnitMeasureCode                   CHAR(3) NULL,
	-- Primary index to Product SAT over PresenceConstraint over (Product HUB, Load Date Time in "Product SAT is of Product HUB", "Product SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductHUBProductID, LoadDateTime),
	-- Unique index to Product SAT over PresenceConstraint over (Name in "Product SAT has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	-- Unique index to Product SAT over PresenceConstraint over (Product Number in "Product SAT has Product Number") occurs at most one time
	UNIQUE NONCLUSTERED(ProductNumber),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID)
)
GO

CREATE TABLE ProductSubcategoryHUB (
	-- Product Subcategory HUB has Product Subcategory ID
	ProductSubcategoryID                    BIGINT NOT NULL IDENTITY,
	-- Product Subcategory HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Subcategory HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Subcategory HUB over PresenceConstraint over (Product Subcategory ID in "Product Subcategory HUB has Product Subcategory ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductSubcategoryID)
)
GO

CREATE TABLE ProductSubcategoryProductCategoryLINK (
	-- Product Subcategory Product Category LINK involves Product Subcategory HUB that has Product Subcategory ID
	ProductSubcategoryHUBProductSubcategoryI BIGINT NOT NULL,
	-- Product Subcategory Product Category LINK involves Product Category HUB that has Product Category ID
	ProductCategoryHUBProductCategoryID     BIGINT NOT NULL,
	-- Product Subcategory Product Category LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Subcategory Product Category LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Subcategory Product Category LINK over PresenceConstraint over (Product Subcategory HUB, Product Category HUB in "Product Subcategory HUB belongs to Product Category HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductSubcategoryHUBProductSubcategoryI, ProductCategoryHUBProductCategoryID),
	FOREIGN KEY (ProductCategoryHUBProductCategoryID) REFERENCES ProductCategoryHUB (ProductCategoryID),
	FOREIGN KEY (ProductSubcategoryHUBProductSubcategoryI) REFERENCES ProductSubcategoryHUB (ProductSubcategoryID)
)
GO

CREATE TABLE ProductSubcategorySAT (
	-- Product Subcategory SAT is of Product Subcategory HUB that has Product Subcategory ID
	ProductSubcategoryHUBProductSubcategoryI BIGINT NOT NULL,
	-- Product Subcategory SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Subcategory SAT has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Product Subcategory SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Product Subcategory SAT over PresenceConstraint over (Product Subcategory HUB, Load Date Time in "Product Subcategory SAT is of Product Subcategory HUB", "Product Subcategory SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductSubcategoryHUBProductSubcategoryI, LoadDateTime),
	-- Unique index to Product Subcategory SAT over PresenceConstraint over (Name in "Product Subcategory SAT has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	FOREIGN KEY (ProductSubcategoryHUBProductSubcategoryI) REFERENCES ProductSubcategoryHUB (ProductSubcategoryID)
)
GO

CREATE TABLE ProductVendorLINK (
	-- Product Vendor LINK has Product Vendor ID
	ProductVendorID                         BIGINT NOT NULL IDENTITY,
	-- Product Vendor LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Vendor LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Product Vendor LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Product Vendor LINK involves Vendor HUB that is a kind of Business Entity HUB that has Business Entity ID
	VendorHUBBusinessEntityID               BIGINT NOT NULL,
	-- Primary index to Product Vendor LINK over PresenceConstraint over (Product Vendor ID in "Product Vendor LINK has Product Vendor ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductVendorID),
	-- Unique index to Product Vendor LINK over PresenceConstraint over (Product HUB, Vendor HUB in "Product HUB is sourced from Vendor HUB") occurs at most one time
	UNIQUE NONCLUSTERED(ProductHUBProductID, VendorHUBBusinessEntityID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID)
)
GO

CREATE TABLE ProductVendorSAT (
	-- Product Vendor SAT is of Product Vendor LINK that has Product Vendor ID
	ProductVendorLINKProductVendorID        BIGINT NOT NULL,
	-- Product Vendor SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Product Vendor SAT averages Average Lead Time days to deliver
	AverageLeadTime                         INTEGER NOT NULL,
	-- Product Vendor SAT has Max Order Qty
	MaxOrderQty                             INTEGER NOT NULL,
	-- Product Vendor SAT has Min Order Qty
	MinOrderQty                             INTEGER NOT NULL,
	-- Product Vendor SAT has On Order Qty
	OnOrderQty                              INTEGER NOT NULL,
	-- Product Vendor SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Product Vendor SAT asks Standard Price
	StandardPrice                           money NOT NULL,
	-- Product Vendor SAT has Unit Measure that has Unit Measure Code
	UnitMeasureCode                         CHAR(3) NOT NULL,
	-- maybe Product Vendor SAT was paid Last Receipt Cost
	LastReceiptCost                         money NULL,
	-- maybe Product Vendor SAT was paid on last- receipt Date
	LastReceiptDate                         datetime NULL,
	-- Primary index to Product Vendor SAT over PresenceConstraint over (Product Vendor LINK, Load Date Time in "Product Vendor SAT is of Product Vendor LINK", "Product Vendor SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ProductVendorLINKProductVendorID, LoadDateTime),
	FOREIGN KEY (ProductVendorLINKProductVendorID) REFERENCES ProductVendorLINK (ProductVendorID)
)
GO

CREATE TABLE PurchaseOrderDetailHUB (
	-- Purchase Order Detail HUB has Purchase Order Detail ID
	PurchaseOrderDetailID                   BIGINT NOT NULL IDENTITY,
	-- Purchase Order Detail HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Purchase Order Detail HUB belongs to Purchase Order HUB that has Purchase Order ID
	PurchaseOrderHUBPurchaseOrderID         BIGINT NOT NULL,
	-- Purchase Order Detail HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Purchase Order Detail HUB over PresenceConstraint over (Purchase Order Detail ID in "Purchase Order Detail HUB has Purchase Order Detail ID") occurs at most one time
	PRIMARY KEY CLUSTERED(PurchaseOrderDetailID)
)
GO

CREATE TABLE PurchaseOrderDetailProductLINK (
	-- Purchase Order Detail Product LINK involves Purchase Order Detail HUB that has Purchase Order Detail ID
	PurchaseOrderDetailHUBPurchaseOrderDetai BIGINT NOT NULL,
	-- Purchase Order Detail Product LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Purchase Order Detail Product LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Purchase Order Detail Product LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Purchase Order Detail Product LINK over PresenceConstraint over (Purchase Order Detail HUB, Product HUB in "Purchase Order Detail HUB is for Product HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(PurchaseOrderDetailHUBPurchaseOrderDetai, ProductHUBProductID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID),
	FOREIGN KEY (PurchaseOrderDetailHUBPurchaseOrderDetai) REFERENCES PurchaseOrderDetailHUB (PurchaseOrderDetailID)
)
GO

CREATE TABLE PurchaseOrderDetailSAT (
	-- Purchase Order Detail SAT is of Purchase Order Detail HUB that has Purchase Order Detail ID
	PurchaseOrderDetailHUBPurchaseOrderDetai BIGINT NOT NULL,
	-- Purchase Order Detail SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Purchase Order Detail SAT has due-Date
	DueDate                                 datetime NOT NULL,
	-- Purchase Order Detail SAT is for Order Qty
	OrderQty                                INTEGER NOT NULL,
	-- Purchase Order Detail SAT has Received Qty
	ReceivedQty                             DECIMAL NOT NULL,
	-- Purchase Order Detail SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Purchase Order Detail SAT has Rejected Qty
	RejectedQty                             DECIMAL NOT NULL,
	-- Purchase Order Detail SAT costs Unit Price
	UnitPrice                               money NOT NULL,
	-- Primary index to Purchase Order Detail SAT over PresenceConstraint over (Purchase Order Detail HUB, Load Date Time in "Purchase Order Detail SAT is of Purchase Order Detail HUB", "Purchase Order Detail SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(PurchaseOrderDetailHUBPurchaseOrderDetai, LoadDateTime),
	FOREIGN KEY (PurchaseOrderDetailHUBPurchaseOrderDetai) REFERENCES PurchaseOrderDetailHUB (PurchaseOrderDetailID)
)
GO

CREATE TABLE PurchaseOrderEmployeeLINK (
	-- Purchase Order Employee LINK involves Purchase Order HUB that has Purchase Order ID
	PurchaseOrderHUBPurchaseOrderID         BIGINT NOT NULL,
	-- Purchase Order Employee LINK involves Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	EmployeeHUBBusinessEntityID             BIGINT NOT NULL,
	-- Purchase Order Employee LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Purchase Order Employee LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Purchase Order Employee LINK over PresenceConstraint over (Purchase Order HUB, Employee HUB in "Purchase Order HUB was made by Employee HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(PurchaseOrderHUBPurchaseOrderID, EmployeeHUBBusinessEntityID),
	FOREIGN KEY (EmployeeHUBBusinessEntityID) REFERENCES EmployeeHUB (PersonHUBBusinessEntityID)
)
GO

CREATE TABLE PurchaseOrderHUB (
	-- Purchase Order HUB has Purchase Order ID
	PurchaseOrderID                         BIGINT NOT NULL IDENTITY,
	-- Purchase Order HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Purchase Order HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Purchase Order HUB over PresenceConstraint over (Purchase Order ID in "Purchase Order HUB has Purchase Order ID") occurs at most one time
	PRIMARY KEY CLUSTERED(PurchaseOrderID)
)
GO

CREATE TABLE PurchaseOrderSAT (
	-- Purchase Order SAT is of Purchase Order HUB that has Purchase Order ID
	PurchaseOrderHUBPurchaseOrderID         BIGINT NOT NULL,
	-- Purchase Order SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Purchase Order SAT freight costs Freight
	Freight                                 money NOT NULL,
	-- Purchase Order SAT was made on order-Date
	OrderDate                               datetime NOT NULL,
	-- Purchase Order SAT has Purchase Order Number
	PurchaseOrderNumber                     VARCHAR(25) NOT NULL,
	-- Purchase Order SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Purchase Order SAT has Revision Number
	RevisionNumber                          TINYINT NOT NULL,
	-- Purchase Order SAT requests Ship Method that has Ship Method ID
	ShipMethodID                            BIGINT NOT NULL,
	-- Purchase Order SAT has Status and Purchase Order Status has Purchase Order Status Code
	StatusPurchaseOrderStatusCode           TINYINT NOT NULL,
	-- Purchase Order SAT is worth Sub Total
	SubTotal                                money NOT NULL,
	-- Purchase Order SAT includes Tax Amt
	TaxAmt                                  money NOT NULL,
	-- maybe Purchase Order SAT was shipped on ship-Date
	ShipDate                                datetime NULL,
	-- Primary index to Purchase Order SAT over PresenceConstraint over (Purchase Order HUB, Load Date Time in "Purchase Order SAT is of Purchase Order HUB", "Purchase Order SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(PurchaseOrderHUBPurchaseOrderID, LoadDateTime),
	FOREIGN KEY (PurchaseOrderHUBPurchaseOrderID) REFERENCES PurchaseOrderHUB (PurchaseOrderID)
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

CREATE TABLE PurchaseOrderVendorLINK (
	-- Purchase Order Vendor LINK involves Purchase Order HUB that has Purchase Order ID
	PurchaseOrderHUBPurchaseOrderID         BIGINT NOT NULL,
	-- Purchase Order Vendor LINK involves Vendor HUB that is a kind of Business Entity HUB that has Business Entity ID
	VendorHUBBusinessEntityID               BIGINT NOT NULL,
	-- Purchase Order Vendor LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Purchase Order Vendor LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Purchase Order Vendor LINK over PresenceConstraint over (Purchase Order HUB, Vendor HUB in "Purchase Order HUB was placed with Vendor HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(PurchaseOrderHUBPurchaseOrderID, VendorHUBBusinessEntityID),
	FOREIGN KEY (PurchaseOrderHUBPurchaseOrderID) REFERENCES PurchaseOrderHUB (PurchaseOrderID)
)
GO

CREATE TABLE SalesOrderCreditCardLINK (
	-- Sales Order Credit Card LINK involves Sales Order HUB that has Sales Order ID
	SalesOrderHUBSalesOrderID               BIGINT NOT NULL,
	-- Sales Order Credit Card LINK involves Credit Card HUB that has Credit Card ID
	CreditCardHUBCreditCardID               BIGINT NOT NULL,
	-- Sales Order Credit Card LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order Credit Card LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Order Credit Card LINK over PresenceConstraint over (Sales Order HUB, Credit Card HUB in "Sales Order HUB bills Credit Card HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderHUBSalesOrderID, CreditCardHUBCreditCardID),
	FOREIGN KEY (CreditCardHUBCreditCardID) REFERENCES CreditCardHUB (CreditCardID)
)
GO

CREATE TABLE SalesOrderCurrencyRateLINK (
	-- Sales Order Currency Rate LINK involves Sales Order HUB that has Sales Order ID
	SalesOrderHUBSalesOrderID               BIGINT NOT NULL,
	-- Sales Order Currency Rate LINK involves Currency Rate HUB that has Currency Rate ID
	CurrencyRateHUBCurrencyRateID           BIGINT NOT NULL,
	-- Sales Order Currency Rate LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order Currency Rate LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Order Currency Rate LINK over PresenceConstraint over (Sales Order HUB, Currency Rate HUB in "Sales Order HUB converts currency at Currency Rate HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderHUBSalesOrderID, CurrencyRateHUBCurrencyRateID),
	FOREIGN KEY (CurrencyRateHUBCurrencyRateID) REFERENCES CurrencyRateHUB (CurrencyRateID)
)
GO

CREATE TABLE SalesOrderCustomerLINK (
	-- Sales Order Customer LINK involves Sales Order HUB that has Sales Order ID
	SalesOrderHUBSalesOrderID               BIGINT NOT NULL,
	-- Sales Order Customer LINK involves Customer HUB that has Customer ID
	CustomerHUBCustomerID                   BIGINT NOT NULL,
	-- Sales Order Customer LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order Customer LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Order Customer LINK over PresenceConstraint over (Sales Order HUB, Customer HUB in "Sales Order HUB is from Customer HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderHUBSalesOrderID, CustomerHUBCustomerID),
	FOREIGN KEY (CustomerHUBCustomerID) REFERENCES CustomerHUB (CustomerID)
)
GO

CREATE TABLE SalesOrderDetailHUB (
	-- Sales Order Detail HUB has Sales Order Detail ID
	SalesOrderDetailID                      BIGINT NOT NULL IDENTITY,
	-- Sales Order Detail HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order Detail HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Sales Order Detail HUB belongs to Sales Order HUB that has Sales Order ID
	SalesOrderHUBSalesOrderID               BIGINT NOT NULL,
	-- Primary index to Sales Order Detail HUB over PresenceConstraint over (Sales Order Detail ID in "Sales Order Detail HUB has Sales Order Detail ID") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderDetailID)
)
GO

CREATE TABLE SalesOrderDetailProductLINK (
	-- Sales Order Detail Product LINK involves Sales Order Detail HUB that has Sales Order Detail ID
	SalesOrderDetailHUBSalesOrderDetailID   BIGINT NOT NULL,
	-- Sales Order Detail Product LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Sales Order Detail Product LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order Detail Product LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Order Detail Product LINK over PresenceConstraint over (Sales Order Detail HUB, Product HUB in "Sales Order Detail HUB is for Product HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderDetailHUBSalesOrderDetailID, ProductHUBProductID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID),
	FOREIGN KEY (SalesOrderDetailHUBSalesOrderDetailID) REFERENCES SalesOrderDetailHUB (SalesOrderDetailID)
)
GO

CREATE TABLE SalesOrderDetailSAT (
	-- Sales Order Detail SAT is of Sales Order Detail HUB that has Sales Order Detail ID
	SalesOrderDetailHUBSalesOrderDetailID   BIGINT NOT NULL,
	-- Sales Order Detail SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order Detail SAT is for Order Qty
	OrderQty                                INTEGER NOT NULL,
	-- Sales Order Detail SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Sales Order Detail SAT has Unit Price
	UnitPrice                               money NOT NULL,
	-- Sales Order Detail SAT applies Unit Price Discount
	UnitPriceDiscount                       money NOT NULL,
	-- maybe Sales Order Detail SAT has Carrier Tracking Number
	CarrierTrackingNumber                   VARCHAR(25) NULL,
	-- Primary index to Sales Order Detail SAT over PresenceConstraint over (Sales Order Detail HUB, Load Date Time in "Sales Order Detail SAT is of Sales Order Detail HUB", "Sales Order Detail SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderDetailHUBSalesOrderDetailID, LoadDateTime),
	FOREIGN KEY (SalesOrderDetailHUBSalesOrderDetailID) REFERENCES SalesOrderDetailHUB (SalesOrderDetailID)
)
GO

CREATE TABLE SalesOrderDetailSpecialOfferLINK (
	-- Sales Order Detail Special Offer LINK involves Sales Order Detail HUB that has Sales Order Detail ID
	SalesOrderDetailHUBSalesOrderDetailID   BIGINT NOT NULL,
	-- Sales Order Detail Special Offer LINK involves Special Offer HUB that has Special Offer ID
	SpecialOfferHUBSpecialOfferID           BIGINT NOT NULL,
	-- Sales Order Detail Special Offer LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order Detail Special Offer LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Order Detail Special Offer LINK over PresenceConstraint over (Sales Order Detail HUB, Special Offer HUB in "Sales Order Detail HUB applies Special Offer HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderDetailHUBSalesOrderDetailID, SpecialOfferHUBSpecialOfferID),
	FOREIGN KEY (SalesOrderDetailHUBSalesOrderDetailID) REFERENCES SalesOrderDetailHUB (SalesOrderDetailID)
)
GO

CREATE TABLE SalesOrderHUB (
	-- Sales Order HUB has Sales Order ID
	SalesOrderID                            BIGINT NOT NULL IDENTITY,
	-- Sales Order HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Order HUB over PresenceConstraint over (Sales Order ID in "Sales Order HUB has Sales Order ID") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderID)
)
GO

CREATE TABLE SalesOrderSAT (
	-- Sales Order SAT is of Sales Order HUB that has Sales Order ID
	SalesOrderHUBSalesOrderID               BIGINT NOT NULL,
	-- Sales Order SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Online Order Flag
	OnlineOrderFlag                         BIT,
	-- Sales Order SAT should be shipped by due-Date
	DueDate                                 datetime NOT NULL,
	-- Sales Order SAT freight costs Freight
	Freight                                 money NOT NULL,
	-- Sales Order SAT was ordered on order-Date
	OrderDate                               datetime NOT NULL,
	-- Sales Order SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Sales Order SAT has Revision Number
	RevisionNumber                          TINYINT NOT NULL,
	-- Sales Order SAT has Sales Order Number
	SalesOrderNumber                        VARCHAR(25) NOT NULL,
	-- Sales Order SAT has Ship Method that has Ship Method ID
	ShipMethodID                            BIGINT NOT NULL,
	-- Sales Order SAT has Status and Sales Order Status has Sales Order Status Code
	StatusSalesOrderStatusCode              TINYINT NOT NULL,
	-- Sales Order SAT is worth Sub Total
	SubTotal                                money NOT NULL,
	-- Sales Order SAT includes Tax Amt
	TaxAmt                                  money NOT NULL,
	-- maybe Sales Order SAT has Credit Card Approval Code
	CreditCardApprovalCode                  VARCHAR(15) NULL,
	-- maybe Sales Order SAT is on customers-Account Number
	CustomersAccountNumber                  VARCHAR(16) NULL,
	-- maybe Sales Order SAT corresponds to customers-Purchase Order Number
	CustomersPurchaseOrderNumber            VARCHAR(25) NULL,
	-- maybe Sales Order SAT has Sales Order Comment
	SalesOrderComment                       VARCHAR(128) NULL,
	-- maybe Sales Order SAT was shipped on ship-Date
	ShipDate                                datetime NULL,
	-- Primary index to Sales Order SAT over PresenceConstraint over (Sales Order HUB, Load Date Time in "Sales Order SAT is of Sales Order HUB", "Sales Order SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderHUBSalesOrderID, LoadDateTime),
	-- Unique index to Sales Order SAT over PresenceConstraint over (Sales Order Number in "Sales Order SAT has Sales Order Number") occurs at most one time
	UNIQUE NONCLUSTERED(SalesOrderNumber),
	FOREIGN KEY (SalesOrderHUBSalesOrderID) REFERENCES SalesOrderHUB (SalesOrderID)
)
GO

CREATE TABLE SalesOrderSalesPersonLINK (
	-- Sales Order Sales Person LINK involves Sales Order HUB that has Sales Order ID
	SalesOrderHUBSalesOrderID               BIGINT NOT NULL,
	-- Sales Order Sales Person LINK involves Sales Person HUB that is a kind of Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	SalesPersonHUBBusinessEntityID          BIGINT NOT NULL,
	-- Sales Order Sales Person LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order Sales Person LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Order Sales Person LINK over PresenceConstraint over (Sales Order HUB, Sales Person HUB in "Sales Order HUB was taken by Sales Person HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderHUBSalesOrderID, SalesPersonHUBBusinessEntityID),
	FOREIGN KEY (SalesOrderHUBSalesOrderID) REFERENCES SalesOrderHUB (SalesOrderID)
)
GO

CREATE TABLE SalesOrderSalesReasonLINK (
	-- Sales Order Sales Reason LINK involves Sales Order HUB that has Sales Order ID
	SalesOrderHUBSalesOrderID               BIGINT NOT NULL,
	-- Sales Order Sales Reason LINK involves Sales Reason that has Sales Reason ID
	SalesReasonID                           BIGINT NOT NULL,
	-- Sales Order Sales Reason LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order Sales Reason LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Order Sales Reason LINK over PresenceConstraint over (Sales Order HUB, Sales Reason in "Sales Order HUB has Sales Reason") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderHUBSalesOrderID, SalesReasonID),
	FOREIGN KEY (SalesOrderHUBSalesOrderID) REFERENCES SalesOrderHUB (SalesOrderID)
)
GO

CREATE TABLE SalesOrderSalesTerritoryLINK (
	-- Sales Order Sales Territory LINK involves Sales Order HUB that has Sales Order ID
	SalesOrderHUBSalesOrderID               BIGINT NOT NULL,
	-- Sales Order Sales Territory LINK involves Sales Territory HUB that has Territory ID
	SalesTerritoryHUBTerritoryID            BIGINT NOT NULL,
	-- Sales Order Sales Territory LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order Sales Territory LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Order Sales Territory LINK over PresenceConstraint over (Sales Order HUB, Sales Territory HUB in "Sales Order HUB is assigned to Sales Territory HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderHUBSalesOrderID, SalesTerritoryHUBTerritoryID),
	FOREIGN KEY (SalesOrderHUBSalesOrderID) REFERENCES SalesOrderHUB (SalesOrderID)
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

CREATE TABLE SalesOrderbilltoAddressLINK (
	-- Sales Order bill to Address LINK involves Sales Order HUB that has Sales Order ID
	SalesOrderHUBSalesOrderID               BIGINT NOT NULL,
	-- Sales Order bill to Address LINK involves Address HUB and Address HUB has Address ID
	BillToAddressHUBAddressID               BIGINT NOT NULL,
	-- Sales Order bill to Address LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order bill to Address LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Order bill to Address LINK over PresenceConstraint over (Sales Order HUB, Bill To Address HUB in "Sales Order HUB has bill- to Address HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderHUBSalesOrderID, BillToAddressHUBAddressID),
	FOREIGN KEY (BillToAddressHUBAddressID) REFERENCES AddressHUB (AddressID),
	FOREIGN KEY (SalesOrderHUBSalesOrderID) REFERENCES SalesOrderHUB (SalesOrderID)
)
GO

CREATE TABLE SalesOrdershiptoAddressLINK (
	-- Sales Order ship to Address LINK involves Sales Order HUB that has Sales Order ID
	SalesOrderHUBSalesOrderID               BIGINT NOT NULL,
	-- Sales Order ship to Address LINK involves Address HUB and Address HUB has Address ID
	ShipToAddressHUBAddressID               BIGINT NOT NULL,
	-- Sales Order ship to Address LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Order ship to Address LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Order ship to Address LINK over PresenceConstraint over (Sales Order HUB, Ship To Address HUB in "Sales Order HUB has ship- to Address HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesOrderHUBSalesOrderID, ShipToAddressHUBAddressID),
	FOREIGN KEY (SalesOrderHUBSalesOrderID) REFERENCES SalesOrderHUB (SalesOrderID),
	FOREIGN KEY (ShipToAddressHUBAddressID) REFERENCES AddressHUB (AddressID)
)
GO

CREATE TABLE SalesPersonHUB (
	-- Sales Person HUB is a kind of Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	EmployeeHUBBusinessEntityID             BIGINT NOT NULL,
	-- Sales Person HUB was loaded at Date Time
	DateTime                                DATETIME NOT NULL,
	-- Sales Person HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Person HUB over PresenceConstraint over (Employee HUB in "Sales Person HUB is a kind of Employee HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(EmployeeHUBBusinessEntityID),
	FOREIGN KEY (EmployeeHUBBusinessEntityID) REFERENCES EmployeeHUB (PersonHUBBusinessEntityID)
)
GO

CREATE TABLE SalesPersonQuotaHistoryHUB (
	-- Sales Person Quota History HUB has Sales Person Quota History ID
	SalesPersonQuotaHistoryID               BIGINT NOT NULL IDENTITY,
	-- Sales Person Quota History HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Person Quota History HUB involves Date
	QuotaDate                               datetime NOT NULL,
	-- Sales Person Quota History HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Sales Person Quota History HUB involves Sales Person HUB that is a kind of Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	SalesPersonHUBBusinessEntityID          BIGINT NOT NULL,
	-- Sales Person Quota History HUB involves Amount
	SalesQuota                              money NOT NULL,
	-- Primary index to Sales Person Quota History HUB over PresenceConstraint over (Sales Person Quota History ID in "Sales Person Quota History HUB has Sales Person Quota History ID") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesPersonQuotaHistoryID),
	-- Unique index to Sales Person Quota History HUB over PresenceConstraint over (Sales Person HUB, Quota Date in "Sales Person HUB had quota to quota-Date of Amount") occurs one time
	UNIQUE NONCLUSTERED(QuotaDate, SalesPersonHUBBusinessEntityID),
	FOREIGN KEY (SalesPersonHUBBusinessEntityID) REFERENCES SalesPersonHUB (EmployeeHUBBusinessEntityID)
)
GO

CREATE TABLE SalesPersonQuotaHistorySAT (
	-- Sales Person Quota History SAT is of Sales Person Quota History HUB that has Sales Person Quota History ID
	SalesPersonQuotaHistoryHUBSalesPersonQu9 BIGINT NOT NULL,
	-- Sales Person Quota History SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Person Quota History SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Person Quota History SAT over PresenceConstraint over (Sales Person Quota History HUB, Load Date Time in "Sales Person Quota History SAT is of Sales Person Quota History HUB", "Sales Person Quota History SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesPersonQuotaHistoryHUBSalesPersonQu9, LoadDateTime),
	FOREIGN KEY (SalesPersonQuotaHistoryHUBSalesPersonQu9) REFERENCES SalesPersonQuotaHistoryHUB (SalesPersonQuotaHistoryID)
)
GO

CREATE TABLE SalesPersonSAT (
	-- Sales Person SAT is of Sales Person HUB that is a kind of Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	SalesPersonHUBBusinessEntityID          BIGINT NOT NULL,
	-- Sales Person SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Person SAT may receive Bonus
	Bonus                                   money NOT NULL,
	-- Sales Person SAT receives Commission Pct
	CommissionPct                           DECIMAL NOT NULL,
	-- Sales Person SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Sales Person SAT sold Sales Last Year last year
	SalesLastYear                           money NOT NULL,
	-- Sales Person SAT has sold Sales YTD this year
	SalesYTD                                money NOT NULL,
	-- maybe Sales Person SAT should sell Sales Quota
	SalesQuota                              money NULL,
	-- Primary index to Sales Person SAT over PresenceConstraint over (Sales Person HUB, Load Date Time in "Sales Person SAT is of Sales Person HUB", "Sales Person SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesPersonHUBBusinessEntityID, LoadDateTime),
	FOREIGN KEY (SalesPersonHUBBusinessEntityID) REFERENCES SalesPersonHUB (EmployeeHUBBusinessEntityID)
)
GO

CREATE TABLE SalesPersonSalesTerritoryLINK (
	-- Sales Person Sales Territory LINK involves Sales Person HUB that is a kind of Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	SalesPersonHUBBusinessEntityID          BIGINT NOT NULL,
	-- Sales Person Sales Territory LINK involves Sales Territory HUB that has Territory ID
	SalesTerritoryHUBTerritoryID            BIGINT NOT NULL,
	-- Sales Person Sales Territory LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Person Sales Territory LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Person Sales Territory LINK over PresenceConstraint over (Sales Person HUB, Sales Territory HUB in "Sales Person HUB is assigned to Sales Territory HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesPersonHUBBusinessEntityID, SalesTerritoryHUBTerritoryID),
	FOREIGN KEY (SalesPersonHUBBusinessEntityID) REFERENCES SalesPersonHUB (EmployeeHUBBusinessEntityID)
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

CREATE TABLE SalesTerritoryHUB (
	-- Sales Territory HUB has Territory ID
	TerritoryID                             BIGINT NOT NULL IDENTITY,
	-- Sales Territory HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Territory HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Sales Territory HUB over PresenceConstraint over (Territory ID in "Sales Territory HUB has Territory ID") occurs at most one time
	PRIMARY KEY CLUSTERED(TerritoryID)
)
GO

CREATE TABLE SalesTerritoryHistoryLINK (
	-- Sales Territory History LINK has Sales Territory History ID
	SalesTerritoryHistoryID                 BIGINT NOT NULL IDENTITY,
	-- Sales Territory History LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Territory History LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Sales Territory History LINK involves Sales Person HUB that is a kind of Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	SalesPersonHUBBusinessEntityID          BIGINT NOT NULL,
	-- Sales Territory History LINK involves Sales Territory HUB that has Territory ID
	SalesTerritoryHUBTerritoryID            BIGINT NOT NULL,
	-- Sales Territory History LINK involves Date
	StartDate                               datetime NOT NULL,
	-- Primary index to Sales Territory History LINK over PresenceConstraint over (Sales Territory History ID in "Sales Territory History LINK has Sales Territory History ID") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesTerritoryHistoryID),
	-- Unique index to Sales Territory History LINK over PresenceConstraint over (Sales Person HUB, Start Date, Sales Territory HUB in "Sales Person HUB was assigned on start-Date to Sales Territory HUB") occurs at most one time
	UNIQUE NONCLUSTERED(SalesPersonHUBBusinessEntityID, SalesTerritoryHUBTerritoryID, StartDate),
	FOREIGN KEY (SalesPersonHUBBusinessEntityID) REFERENCES SalesPersonHUB (EmployeeHUBBusinessEntityID),
	FOREIGN KEY (SalesTerritoryHUBTerritoryID) REFERENCES SalesTerritoryHUB (TerritoryID)
)
GO

CREATE TABLE SalesTerritoryHistorySAT (
	-- Sales Territory History SAT is of Sales Territory History LINK that has Sales Territory History ID
	SalesTerritoryHistoryLINKSalesTerritory8 BIGINT NOT NULL,
	-- Sales Territory History SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Territory History SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- maybe Sales Territory History SAT is valid until end-Date
	EndDate                                 datetime NULL,
	-- Primary index to Sales Territory History SAT over PresenceConstraint over (Sales Territory History LINK, Load Date Time in "Sales Territory History SAT is of Sales Territory History LINK", "Sales Territory History SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesTerritoryHistoryLINKSalesTerritory8, LoadDateTime),
	FOREIGN KEY (SalesTerritoryHistoryLINKSalesTerritory8) REFERENCES SalesTerritoryHistoryLINK (SalesTerritoryHistoryID)
)
GO

CREATE TABLE SalesTerritorySAT (
	-- Sales Territory SAT is of Sales Territory HUB that has Territory ID
	SalesTerritoryHUBTerritoryID            BIGINT NOT NULL,
	-- Sales Territory SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Sales Territory SAT cost Cost Last Year last year
	CostLastYear                            money NOT NULL,
	-- Sales Territory SAT cost Cost YTD this year
	CostYTD                                 money NOT NULL,
	-- Sales Territory SAT is in Group and Sales Territory Group has Sales Territory Group Name
	GroupSalesTerritoryGroupName            VARCHAR(50) NOT NULL,
	-- Sales Territory SAT has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Sales Territory SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Sales Territory SAT sold Sales Last Year last year
	SalesLastYear                           money NOT NULL,
	-- Sales Territory SAT sold Sales YTD this year
	SalesYTD                                money NOT NULL,
	-- Primary index to Sales Territory SAT over PresenceConstraint over (Sales Territory HUB, Load Date Time in "Sales Territory SAT is of Sales Territory HUB", "Sales Territory SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(SalesTerritoryHUBTerritoryID, LoadDateTime),
	-- Unique index to Sales Territory SAT over PresenceConstraint over (Name in "Sales Territory SAT has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	FOREIGN KEY (SalesTerritoryHUBTerritoryID) REFERENCES SalesTerritoryHUB (TerritoryID)
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

CREATE TABLE ShiftHUB (
	-- Shift HUB has Shift ID
	ShiftID                                 BIGINT NOT NULL IDENTITY,
	-- Shift HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Shift HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Shift HUB over PresenceConstraint over (Shift ID in "Shift HUB has Shift ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ShiftID)
)
GO

CREATE TABLE ShiftSAT (
	-- Shift SAT is of Shift HUB that has Shift ID
	ShiftHUBShiftID                         BIGINT NOT NULL,
	-- Shift SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Shift SAT ends at end-Time
	EndTime                                 TIME NOT NULL,
	-- Shift SAT has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Shift SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Shift SAT starts at start-Time
	StartTime                               TIME NOT NULL,
	-- Primary index to Shift SAT over PresenceConstraint over (Shift HUB, Load Date Time in "Shift SAT is of Shift HUB", "Shift SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ShiftHUBShiftID, LoadDateTime),
	-- Unique index to Shift SAT over PresenceConstraint over (Name in "Shift SAT has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	-- Unique index to Shift SAT over PresenceConstraint over (Name, Start Time, End Time in "Shift SAT has Name", "Shift SAT starts at start-Time", "Shift SAT ends at end-Time") occurs at most one time
	UNIQUE NONCLUSTERED(EndTime, Name, StartTime),
	FOREIGN KEY (ShiftHUBShiftID) REFERENCES ShiftHUB (ShiftID)
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

CREATE TABLE ShoppingCartItemHUB (
	-- Shopping Cart Item HUB has Shopping Cart Item ID
	ShoppingCartItemID                      BIGINT NOT NULL IDENTITY,
	-- Shopping Cart Item HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Shopping Cart Item HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Shopping Cart Item HUB over PresenceConstraint over (Shopping Cart Item ID in "Shopping Cart Item HUB has Shopping Cart Item ID") occurs at most one time
	PRIMARY KEY CLUSTERED(ShoppingCartItemID)
)
GO

CREATE TABLE ShoppingCartItemProductLINK (
	-- Shopping Cart Item Product LINK involves Shopping Cart Item HUB that has Shopping Cart Item ID
	ShoppingCartItemHUBShoppingCartItemID   BIGINT NOT NULL,
	-- Shopping Cart Item Product LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Shopping Cart Item Product LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Shopping Cart Item Product LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Shopping Cart Item Product LINK over PresenceConstraint over (Shopping Cart Item HUB, Product HUB in "Shopping Cart Item HUB is for Product HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(ShoppingCartItemHUBShoppingCartItemID, ProductHUBProductID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID),
	FOREIGN KEY (ShoppingCartItemHUBShoppingCartItemID) REFERENCES ShoppingCartItemHUB (ShoppingCartItemID)
)
GO

CREATE TABLE ShoppingCartItemSAT (
	-- Shopping Cart Item SAT is of Shopping Cart Item HUB that has Shopping Cart Item ID
	ShoppingCartItemHUBShoppingCartItemID   BIGINT NOT NULL,
	-- Shopping Cart Item SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Shopping Cart Item SAT was created on Date Created
	DateCreated                             datetime NOT NULL,
	-- Shopping Cart Item SAT is for Quantity
	Quantity                                INTEGER NOT NULL,
	-- Shopping Cart Item SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Shopping Cart Item SAT is in Shopping Cart that has Shopping Cart ID
	ShoppingCartID                          VARCHAR(50) NOT NULL,
	-- Primary index to Shopping Cart Item SAT over PresenceConstraint over (Shopping Cart Item HUB, Load Date Time in "Shopping Cart Item SAT is of Shopping Cart Item HUB", "Shopping Cart Item SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(ShoppingCartItemHUBShoppingCartItemID, LoadDateTime),
	FOREIGN KEY (ShoppingCartItemHUBShoppingCartItemID) REFERENCES ShoppingCartItemHUB (ShoppingCartItemID)
)
GO

CREATE TABLE SpecialOfferHUB (
	-- Special Offer HUB has Special Offer ID
	SpecialOfferID                          BIGINT NOT NULL IDENTITY,
	-- Special Offer HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Special Offer HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Special Offer HUB over PresenceConstraint over (Special Offer ID in "Special Offer HUB has Special Offer ID") occurs at most one time
	PRIMARY KEY CLUSTERED(SpecialOfferID)
)
GO

CREATE TABLE SpecialOfferProductLINK (
	-- Special Offer Product LINK involves Special Offer HUB that has Special Offer ID
	SpecialOfferHUBSpecialOfferID           BIGINT NOT NULL,
	-- Special Offer Product LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Special Offer Product LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Special Offer Product LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Special Offer Product LINK over PresenceConstraint over (Special Offer HUB, Product HUB in "Special Offer HUB includes Product HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(SpecialOfferHUBSpecialOfferID, ProductHUBProductID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID),
	FOREIGN KEY (SpecialOfferHUBSpecialOfferID) REFERENCES SpecialOfferHUB (SpecialOfferID)
)
GO

CREATE TABLE SpecialOfferSAT (
	-- Special Offer SAT is of Special Offer HUB that has Special Offer ID
	SpecialOfferHUBSpecialOfferID           BIGINT NOT NULL,
	-- Special Offer SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Special Offer SAT belongs to Category
	Category                                VARCHAR(50) NOT NULL,
	-- Special Offer SAT has Description
	Description                             VARCHAR(255) NOT NULL,
	-- Special Offer SAT has Discount Pct
	DiscountPct                             DECIMAL NOT NULL,
	-- Special Offer SAT is valid until end-Date
	EndDate                                 datetime NOT NULL,
	-- Special Offer SAT applies to Max Qty
	MaxQty                                  INTEGER NOT NULL,
	-- Special Offer SAT applies to Min Qty
	MinQty                                  INTEGER NOT NULL,
	-- Special Offer SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Special Offer SAT starts on start-Date
	StartDate                               datetime NOT NULL,
	-- Special Offer SAT is of Type
	Type                                    VARCHAR(50) NOT NULL,
	-- Primary index to Special Offer SAT over PresenceConstraint over (Special Offer HUB, Load Date Time in "Special Offer SAT is of Special Offer HUB", "Special Offer SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(SpecialOfferHUBSpecialOfferID, LoadDateTime),
	FOREIGN KEY (SpecialOfferHUBSpecialOfferID) REFERENCES SpecialOfferHUB (SpecialOfferID)
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
	-- State Province is in Sales Territory HUB that has Territory ID
	SalesTerritoryHUBTerritoryID            BIGINT NOT NULL,
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
	FOREIGN KEY (SalesTerritoryHUBTerritoryID) REFERENCES SalesTerritoryHUB (TerritoryID)
)
GO

CREATE TABLE StoreHUB (
	-- Store HUB is a kind of Business Entity HUB that has Business Entity ID
	BusinessEntityHUBBusinessEntityID       BIGINT NOT NULL,
	-- Store HUB was loaded at Date Time
	DateTime                                DATETIME NOT NULL,
	-- Store HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Store HUB over PresenceConstraint over (Business Entity HUB in "Store HUB is a kind of Business Entity HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityHUBBusinessEntityID),
	FOREIGN KEY (BusinessEntityHUBBusinessEntityID) REFERENCES BusinessEntityHUB (BusinessEntityID)
)
GO

CREATE TABLE StoreSAT (
	-- Store SAT is of Store HUB that is a kind of Business Entity HUB that has Business Entity ID
	StoreHUBBusinessEntityID                BIGINT NOT NULL,
	-- Store SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Store SAT has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Store SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- maybe Store SAT has Demographics
	Demographics                            VARCHAR(MAX) NULL,
	-- Primary index to Store SAT over PresenceConstraint over (Store HUB, Load Date Time in "Store SAT is of Store HUB", "Store SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(StoreHUBBusinessEntityID, LoadDateTime),
	FOREIGN KEY (StoreHUBBusinessEntityID) REFERENCES StoreHUB (BusinessEntityHUBBusinessEntityID)
)
GO

CREATE TABLE StoreSalesPersonLINK (
	-- Store Sales Person LINK involves Store HUB that is a kind of Business Entity HUB that has Business Entity ID
	StoreHUBBusinessEntityID                BIGINT NOT NULL,
	-- Store Sales Person LINK involves Sales Person HUB that is a kind of Employee HUB that is a kind of Person HUB that is a kind of Business Entity HUB that has Business Entity ID
	SalesPersonHUBBusinessEntityID          BIGINT NOT NULL,
	-- Store Sales Person LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Store Sales Person LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Store Sales Person LINK over PresenceConstraint over (Store HUB, Sales Person HUB in "sales to Store HUB are managed by Sales Person HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(StoreHUBBusinessEntityID, SalesPersonHUBBusinessEntityID),
	FOREIGN KEY (SalesPersonHUBBusinessEntityID) REFERENCES SalesPersonHUB (EmployeeHUBBusinessEntityID),
	FOREIGN KEY (StoreHUBBusinessEntityID) REFERENCES StoreHUB (BusinessEntityHUBBusinessEntityID)
)
GO

CREATE TABLE TransactionHUB (
	-- Transaction HUB has Transaction ID
	TransactionID                           BIGINT NOT NULL IDENTITY,
	-- Transaction HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Transaction HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Transaction HUB over PresenceConstraint over (Transaction ID in "Transaction HUB has Transaction ID") occurs at most one time
	PRIMARY KEY CLUSTERED(TransactionID)
)
GO

CREATE TABLE TransactionHistoryArchiveHUB (
	-- Transaction History Archive HUB is a kind of Transaction HUB that has Transaction ID
	TransactionHUBTransactionID             BIGINT NOT NULL,
	-- Transaction History Archive HUB was loaded at Date Time
	DateTime                                DATETIME NOT NULL,
	-- Transaction History Archive HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Transaction History Archive HUB over PresenceConstraint over (Transaction HUB in "Transaction History Archive HUB is a kind of Transaction HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(TransactionHUBTransactionID),
	FOREIGN KEY (TransactionHUBTransactionID) REFERENCES TransactionHUB (TransactionID)
)
GO

CREATE TABLE TransactionHistoryHUB (
	-- Transaction History HUB is a kind of Transaction HUB that has Transaction ID
	TransactionHUBTransactionID             BIGINT NOT NULL,
	-- Transaction History HUB was loaded at Date Time
	DateTime                                DATETIME NOT NULL,
	-- Transaction History HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Transaction History HUB over PresenceConstraint over (Transaction HUB in "Transaction History HUB is a kind of Transaction HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(TransactionHUBTransactionID),
	FOREIGN KEY (TransactionHUBTransactionID) REFERENCES TransactionHUB (TransactionID)
)
GO

CREATE TABLE TransactionProductLINK (
	-- Transaction Product LINK involves Transaction HUB that has Transaction ID
	TransactionHUBTransactionID             BIGINT NOT NULL,
	-- Transaction Product LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Transaction Product LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Transaction Product LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Transaction Product LINK over PresenceConstraint over (Transaction HUB, Product HUB in "Transaction HUB applies to Product HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(TransactionHUBTransactionID, ProductHUBProductID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID),
	FOREIGN KEY (TransactionHUBTransactionID) REFERENCES TransactionHUB (TransactionID)
)
GO

CREATE TABLE TransactionSAT (
	-- Transaction SAT is of Transaction HUB that has Transaction ID
	TransactionHUBTransactionID             BIGINT NOT NULL,
	-- Transaction SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Transaction SAT has Actual Cost
	ActualCost                              money NOT NULL,
	-- Transaction SAT has Quantity
	Quantity                                INTEGER NOT NULL,
	-- Transaction SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Transaction SAT applies to Reference Order ID
	ReferenceOrderID                        INTEGER NOT NULL,
	-- Transaction SAT applies to Reference Order Line ID
	ReferenceOrderLineID                    INTEGER NOT NULL,
	-- Transaction SAT has transaction-Date
	TransactionDate                         datetime NOT NULL,
	-- Transaction SAT has Transaction Type
	TransactionType                         CHAR(1) NOT NULL,
	-- Primary index to Transaction SAT over PresenceConstraint over (Transaction HUB, Load Date Time in "Transaction SAT is of Transaction HUB", "Transaction SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(TransactionHUBTransactionID, LoadDateTime),
	FOREIGN KEY (TransactionHUBTransactionID) REFERENCES TransactionHUB (TransactionID)
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

CREATE TABLE VendorHUB (
	-- Vendor HUB is a kind of Business Entity HUB that has Business Entity ID
	BusinessEntityHUBBusinessEntityID       BIGINT NOT NULL,
	-- Vendor HUB was loaded at Date Time
	DateTime                                DATETIME NOT NULL,
	-- Vendor HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Vendor HUB over PresenceConstraint over (Business Entity HUB in "Vendor HUB is a kind of Business Entity HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(BusinessEntityHUBBusinessEntityID),
	FOREIGN KEY (BusinessEntityHUBBusinessEntityID) REFERENCES BusinessEntityHUB (BusinessEntityID)
)
GO

CREATE TABLE VendorSAT (
	-- Vendor SAT is of Vendor HUB that is a kind of Business Entity HUB that has Business Entity ID
	VendorHUBBusinessEntityID               BIGINT NOT NULL,
	-- Vendor SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Active Flag
	ActiveFlag                              BIT,
	-- Preferred Vendor Status
	PreferredVendorStatus                   BIT,
	-- Vendor SAT has Account Number
	AccountNumber                           VARCHAR(16) NOT NULL,
	-- Vendor SAT has Credit Rating
	CreditRating                            tinyint NOT NULL,
	-- Vendor SAT has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Vendor SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- maybe Vendor SAT has purchasing- web service URL
	PurchasingWebServiceURL                 VARCHAR(1024) NULL,
	-- Primary index to Vendor SAT over PresenceConstraint over (Vendor HUB, Load Date Time in "Vendor SAT is of Vendor HUB", "Vendor SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(VendorHUBBusinessEntityID, LoadDateTime),
	-- Unique index to Vendor SAT over PresenceConstraint over (Account Number in "Vendor SAT has Account Number") occurs at most one time
	UNIQUE NONCLUSTERED(AccountNumber),
	-- Unique index to Vendor SAT over PresenceConstraint over (Name in "Vendor SAT has Name") occurs at most one time
	UNIQUE NONCLUSTERED(Name),
	FOREIGN KEY (VendorHUBBusinessEntityID) REFERENCES VendorHUB (BusinessEntityHUBBusinessEntityID)
)
GO

CREATE TABLE WorkOrderHUB (
	-- Work Order HUB has Work Order ID
	WorkOrderID                             BIGINT NOT NULL IDENTITY,
	-- Work Order HUB was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Work Order HUB was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Work Order HUB over PresenceConstraint over (Work Order ID in "Work Order HUB has Work Order ID") occurs at most one time
	PRIMARY KEY CLUSTERED(WorkOrderID)
)
GO

CREATE TABLE WorkOrderProductLINK (
	-- Work Order Product LINK involves Work Order HUB that has Work Order ID
	WorkOrderHUBWorkOrderID                 BIGINT NOT NULL,
	-- Work Order Product LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Work Order Product LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Work Order Product LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Work Order Product LINK over PresenceConstraint over (Work Order HUB, Product HUB in "Work Order HUB is for Product HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(WorkOrderHUBWorkOrderID, ProductHUBProductID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID),
	FOREIGN KEY (WorkOrderHUBWorkOrderID) REFERENCES WorkOrderHUB (WorkOrderID)
)
GO

CREATE TABLE WorkOrderRoutingLINK (
	-- Work Order Routing LINK has Work Order Routing ID
	WorkOrderRoutingID                      BIGINT NOT NULL IDENTITY,
	-- Work Order Routing LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Work Order Routing LINK involves Operation Sequence
	OperationSequence                       SMALLINT NOT NULL,
	-- Work Order Routing LINK involves Product HUB that has Product ID
	ProductHUBProductID                     BIGINT NOT NULL,
	-- Work Order Routing LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Work Order Routing LINK involves Work Order HUB that has Work Order ID
	WorkOrderHUBWorkOrderID                 BIGINT NOT NULL,
	-- Primary index to Work Order Routing LINK over PresenceConstraint over (Work Order Routing ID in "Work Order Routing LINK has Work Order Routing ID") occurs at most one time
	PRIMARY KEY CLUSTERED(WorkOrderRoutingID),
	-- Unique index to Work Order Routing LINK over PresenceConstraint over (Work Order HUB, Product HUB, Operation Sequence in "Work Order HUB activity on Product HUB involves Operation Sequence") occurs at most one time
	UNIQUE NONCLUSTERED(OperationSequence, ProductHUBProductID, WorkOrderHUBWorkOrderID),
	FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID),
	FOREIGN KEY (WorkOrderHUBWorkOrderID) REFERENCES WorkOrderHUB (WorkOrderID)
)
GO

CREATE TABLE WorkOrderRoutingLocationLINK (
	-- Work Order Routing Location LINK involves Work Order Routing LINK that has Work Order Routing ID
	WorkOrderRoutingLINKWorkOrderRoutingID  BIGINT NOT NULL,
	-- Work Order Routing Location LINK involves Location HUB that has Location ID
	LocationHUBLocationID                   BIGINT NOT NULL,
	-- Work Order Routing Location LINK was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Work Order Routing Location LINK was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Primary index to Work Order Routing Location LINK over PresenceConstraint over (Work Order Routing LINK, Location HUB in "Work Order Routing LINK is performed at Location HUB") occurs at most one time
	PRIMARY KEY CLUSTERED(WorkOrderRoutingLINKWorkOrderRoutingID, LocationHUBLocationID),
	FOREIGN KEY (LocationHUBLocationID) REFERENCES LocationHUB (LocationID),
	FOREIGN KEY (WorkOrderRoutingLINKWorkOrderRoutingID) REFERENCES WorkOrderRoutingLINK (WorkOrderRoutingID)
)
GO

CREATE TABLE WorkOrderRoutingSAT (
	-- Work Order Routing SAT is of Work Order Routing LINK that has Work Order Routing ID
	WorkOrderRoutingLINKWorkOrderRoutingID  BIGINT NOT NULL,
	-- Work Order Routing SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Work Order Routing SAT is anticipated to cost Planned Cost
	PlannedCost                             money NOT NULL,
	-- Work Order Routing SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Work Order Routing SAT has scheduled- end Date
	ScheduledEndDate                        datetime NOT NULL,
	-- Work Order Routing SAT has scheduled- start Date
	ScheduledStartDate                      datetime NOT NULL,
	-- maybe Work Order Routing SAT cost Actual Cost
	ActualCost                              money NULL,
	-- maybe Work Order Routing SAT has actual- end Date
	ActualEndDate                           datetime NULL,
	-- maybe Work Order Routing SAT took actual-Resource Hours
	ActualResourceHours                     DECIMAL NULL,
	-- maybe Work Order Routing SAT has actual- start Date
	ActualStartDate                         datetime NULL,
	-- Primary index to Work Order Routing SAT over PresenceConstraint over (Work Order Routing LINK, Load Date Time in "Work Order Routing SAT is of Work Order Routing LINK", "Work Order Routing SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(WorkOrderRoutingLINKWorkOrderRoutingID, LoadDateTime),
	FOREIGN KEY (WorkOrderRoutingLINKWorkOrderRoutingID) REFERENCES WorkOrderRoutingLINK (WorkOrderRoutingID)
)
GO

CREATE TABLE WorkOrderSAT (
	-- Work Order SAT is of Work Order HUB that has Work Order ID
	WorkOrderHUBWorkOrderID                 BIGINT NOT NULL,
	-- Work Order SAT was loaded at load-Date Time
	LoadDateTime                            DATETIME NOT NULL,
	-- Work Order SAT has due-Date
	DueDate                                 datetime NOT NULL,
	-- Work Order SAT is for Order Qty
	OrderQty                                INTEGER NOT NULL,
	-- Work Order SAT was loaded from Record Source
	RecordSource                            VARCHAR(64) NOT NULL,
	-- Work Order SAT has Scrapped Qty
	ScrappedQty                             INTEGER NOT NULL,
	-- Work Order SAT has start-Date
	StartDate                               datetime NOT NULL,
	-- maybe Work Order SAT is valid until end-Date
	EndDate                                 datetime NULL,
	-- maybe Work Order SAT has Scrap Reason that has Scrap Reason ID
	ScrapReasonID                           BIGINT NULL,
	-- Primary index to Work Order SAT over PresenceConstraint over (Work Order HUB, Load Date Time in "Work Order SAT is of Work Order HUB", "Work Order SAT was loaded at load-Date Time") occurs at most one time
	PRIMARY KEY CLUSTERED(WorkOrderHUBWorkOrderID, LoadDateTime),
	FOREIGN KEY (ScrapReasonID) REFERENCES ScrapReason (ScrapReasonID),
	FOREIGN KEY (WorkOrderHUBWorkOrderID) REFERENCES WorkOrderHUB (WorkOrderID)
)
GO

ALTER TABLE AddressSAT
	ADD FOREIGN KEY (StateProvinceID) REFERENCES StateProvince (StateProvinceID)
GO

ALTER TABLE BillOfMaterialsHUB
	ADD FOREIGN KEY (ComponentProductID) REFERENCES ProductHUB (ProductID)
GO

ALTER TABLE BillOfMaterialsHUB
	ADD FOREIGN KEY (ProductAssemblyProductID) REFERENCES ProductHUB (ProductID)
GO

ALTER TABLE BillOfMaterialsSAT
	ADD FOREIGN KEY (UnitMeasureCode) REFERENCES UnitMeasure (UnitMeasureCode)
GO

ALTER TABLE BusinessEntityAddressLINK
	ADD FOREIGN KEY (BusinessEntityHUBBusinessEntityID) REFERENCES BusinessEntityHUB (BusinessEntityID)
GO

ALTER TABLE BusinessEntityContactLINK
	ADD FOREIGN KEY (BusinessEntityHUBBusinessEntityID) REFERENCES BusinessEntityHUB (BusinessEntityID)
GO

ALTER TABLE BusinessEntityContactLINK
	ADD FOREIGN KEY (ContactTypeID) REFERENCES ContactType (ContactTypeID)
GO

ALTER TABLE BusinessEntityContactLINK
	ADD FOREIGN KEY (PersonHUBBusinessEntityID) REFERENCES PersonHUB (BusinessEntityHUBBusinessEntityID)
GO

ALTER TABLE CountryRegionCurrency
	ADD FOREIGN KEY (CurrencyCode) REFERENCES Currency (CurrencyCode)
GO

ALTER TABLE CustomerPersonLINK
	ADD FOREIGN KEY (PersonHUBBusinessEntityID) REFERENCES PersonHUB (BusinessEntityHUBBusinessEntityID)
GO

ALTER TABLE CustomerSalesTerritoryLINK
	ADD FOREIGN KEY (SalesTerritoryHUBTerritoryID) REFERENCES SalesTerritoryHUB (TerritoryID)
GO

ALTER TABLE CustomerStoreLINK
	ADD FOREIGN KEY (StoreHUBBusinessEntityID) REFERENCES StoreHUB (BusinessEntityHUBBusinessEntityID)
GO

ALTER TABLE DocumentOwnerLINK
	ADD FOREIGN KEY (OwnerBusinessEntityID) REFERENCES EmployeeHUB (PersonHUBBusinessEntityID)
GO

ALTER TABLE EmailAddressHUB
	ADD FOREIGN KEY (PersonHUBBusinessEntityID) REFERENCES PersonHUB (BusinessEntityHUBBusinessEntityID)
GO

ALTER TABLE EmployeeDepartmentHistoryLINK
	ADD FOREIGN KEY (EmployeeHUBBusinessEntityID) REFERENCES EmployeeHUB (PersonHUBBusinessEntityID)
GO

ALTER TABLE EmployeeDepartmentHistoryLINK
	ADD FOREIGN KEY (ShiftHUBShiftID) REFERENCES ShiftHUB (ShiftID)
GO

ALTER TABLE EmployeeHUB
	ADD FOREIGN KEY (PersonHUBBusinessEntityID) REFERENCES PersonHUB (BusinessEntityHUBBusinessEntityID)
GO

ALTER TABLE EmployeeJobCandidateLINK
	ADD FOREIGN KEY (JobCandidateHUBJobCandidateID) REFERENCES JobCandidateHUB (JobCandidateID)
GO

ALTER TABLE PersonCreditCardLINK
	ADD FOREIGN KEY (PersonHUBBusinessEntityID) REFERENCES PersonHUB (BusinessEntityHUBBusinessEntityID)
GO

ALTER TABLE PersonPhoneLINK
	ADD FOREIGN KEY (PhoneNumberTypeID) REFERENCES PhoneNumberType (PhoneNumberTypeID)
GO

ALTER TABLE ProductCostHistoryHUB
	ADD FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID)
GO

ALTER TABLE ProductDocumentLINK
	ADD FOREIGN KEY (ProductHUBProductID) REFERENCES ProductHUB (ProductID)
GO

ALTER TABLE ProductProductSubcategoryLINK
	ADD FOREIGN KEY (ProductSubcategoryID) REFERENCES ProductSubcategoryHUB (ProductSubcategoryID)
GO

ALTER TABLE ProductSAT
	ADD FOREIGN KEY (SizeUnitMeasureCode) REFERENCES UnitMeasure (UnitMeasureCode)
GO

ALTER TABLE ProductSAT
	ADD FOREIGN KEY (WeightUnitMeasureCode) REFERENCES UnitMeasure (UnitMeasureCode)
GO

ALTER TABLE ProductVendorLINK
	ADD FOREIGN KEY (VendorHUBBusinessEntityID) REFERENCES VendorHUB (BusinessEntityHUBBusinessEntityID)
GO

ALTER TABLE ProductVendorSAT
	ADD FOREIGN KEY (UnitMeasureCode) REFERENCES UnitMeasure (UnitMeasureCode)
GO

ALTER TABLE PurchaseOrderDetailHUB
	ADD FOREIGN KEY (PurchaseOrderHUBPurchaseOrderID) REFERENCES PurchaseOrderHUB (PurchaseOrderID)
GO

ALTER TABLE PurchaseOrderEmployeeLINK
	ADD FOREIGN KEY (PurchaseOrderHUBPurchaseOrderID) REFERENCES PurchaseOrderHUB (PurchaseOrderID)
GO

ALTER TABLE PurchaseOrderSAT
	ADD FOREIGN KEY (ShipMethodID) REFERENCES ShipMethod (ShipMethodID)
GO

ALTER TABLE PurchaseOrderSAT
	ADD FOREIGN KEY (StatusPurchaseOrderStatusCode) REFERENCES PurchaseOrderStatus (PurchaseOrderStatusCode)
GO

ALTER TABLE PurchaseOrderVendorLINK
	ADD FOREIGN KEY (VendorHUBBusinessEntityID) REFERENCES VendorHUB (BusinessEntityHUBBusinessEntityID)
GO

ALTER TABLE SalesOrderCreditCardLINK
	ADD FOREIGN KEY (SalesOrderHUBSalesOrderID) REFERENCES SalesOrderHUB (SalesOrderID)
GO

ALTER TABLE SalesOrderCurrencyRateLINK
	ADD FOREIGN KEY (SalesOrderHUBSalesOrderID) REFERENCES SalesOrderHUB (SalesOrderID)
GO

ALTER TABLE SalesOrderCustomerLINK
	ADD FOREIGN KEY (SalesOrderHUBSalesOrderID) REFERENCES SalesOrderHUB (SalesOrderID)
GO

ALTER TABLE SalesOrderDetailHUB
	ADD FOREIGN KEY (SalesOrderHUBSalesOrderID) REFERENCES SalesOrderHUB (SalesOrderID)
GO

ALTER TABLE SalesOrderDetailSpecialOfferLINK
	ADD FOREIGN KEY (SpecialOfferHUBSpecialOfferID) REFERENCES SpecialOfferHUB (SpecialOfferID)
GO

ALTER TABLE SalesOrderSAT
	ADD FOREIGN KEY (ShipMethodID) REFERENCES ShipMethod (ShipMethodID)
GO

ALTER TABLE SalesOrderSAT
	ADD FOREIGN KEY (StatusSalesOrderStatusCode) REFERENCES SalesOrderStatus (SalesOrderStatusCode)
GO

ALTER TABLE SalesOrderSalesPersonLINK
	ADD FOREIGN KEY (SalesPersonHUBBusinessEntityID) REFERENCES SalesPersonHUB (EmployeeHUBBusinessEntityID)
GO

ALTER TABLE SalesOrderSalesReasonLINK
	ADD FOREIGN KEY (SalesReasonID) REFERENCES SalesReason (SalesReasonID)
GO

ALTER TABLE SalesOrderSalesTerritoryLINK
	ADD FOREIGN KEY (SalesTerritoryHUBTerritoryID) REFERENCES SalesTerritoryHUB (TerritoryID)
GO

ALTER TABLE SalesPersonSalesTerritoryLINK
	ADD FOREIGN KEY (SalesTerritoryHUBTerritoryID) REFERENCES SalesTerritoryHUB (TerritoryID)
GO

ALTER TABLE SalesTaxRate
	ADD FOREIGN KEY (StateProvinceID) REFERENCES StateProvince (StateProvinceID)
GO
