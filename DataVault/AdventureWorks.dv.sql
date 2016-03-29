CREATE TABLE AWBuildVersionHUB (
	-- AWBuild Version VID
	AWBuildVersionVID                       BIGINT IDENTITY NOT NULL,
	-- AWBuild Version has AWBuild Version ID
	AWBuildVersionID                        BIGINT NOT NULL IDENTITY,
	-- Primary index to AWBuild Version HUB
	PRIMARY KEY CLUSTERED(AWBuildVersionVID),
	-- Unique index to AWBuild Version HUB over PresenceConstraint over (AWBuild Version ID in "AWBuild Version has AWBuild Version ID") occurs at most one time
	UNIQUE NONCLUSTERED(AWBuildVersionID)
)
GO

CREATE TABLE AddressHUB (
	-- Address VID
	AddressVID                              BIGINT IDENTITY NOT NULL,
	-- Address has Address ID
	AddressID                               BIGINT NOT NULL IDENTITY,
	-- Primary index to Address HUB
	PRIMARY KEY CLUSTERED(AddressVID),
	-- Unique index to Address HUB over PresenceConstraint over (Address ID in "Address has Address ID") occurs at most one time
	UNIQUE NONCLUSTERED(AddressID)
)
GO

CREATE TABLE AddressSAT (
	-- Address VID
	AddressVID                              BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Address has Address Line1
	AddressLine1                            VARCHAR(60) NOT NULL,
	-- Address is in City that has City Name
	CityName                                VARCHAR(30) NOT NULL,
	-- Address has Postal Code
	PostalCode                              VARCHAR(15) NOT NULL,
	-- Address is in State Province that has State Province ID
	StateProvinceID                         BIGINT NOT NULL IDENTITY,
	-- maybe Address has Address Line2
	AddressLine2                            VARCHAR(60) NULL,
	-- maybe Address is in Spatial Location
	SpatialLocation                         Geography NULL,
	-- Unique index to Address SAT
	UNIQUE NONCLUSTERED(AddressVID, LoadDateTime),
	FOREIGN KEY (AddressVID) REFERENCES AddressHUB (AddressVID)
)
GO

CREATE TABLE BillOfMaterialsHUB (
	-- Bill Of Materials VID
	BillOfMaterialsVID                      BIGINT IDENTITY NOT NULL,
	-- Bill Of Materials has Bill Of Materials ID
	BillOfMaterialsID                       BIGINT NOT NULL IDENTITY,
	-- Primary index to Bill Of Materials HUB
	PRIMARY KEY CLUSTERED(BillOfMaterialsVID),
	-- Unique index to Bill Of Materials HUB over PresenceConstraint over (Bill Of Materials ID in "Bill Of Materials has Bill Of Materials ID") occurs at most one time
	UNIQUE NONCLUSTERED(BillOfMaterialsID)
)
GO

CREATE TABLE BillOfMaterialsInvolvesComponentLINK (
	-- Bill Of Materials Involves Component VID
	BillOfMaterialsInvolvesComponentVID     BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Bill Of Materials VID
	BillOfMaterialsVID                      BIGINT NOT NULL,
	-- Product VID
	ComponentProductVID                     BIGINT NOT NULL,
	-- Primary index to Bill Of Materials Involves Component LINK
	PRIMARY KEY CLUSTERED(BillOfMaterialsInvolvesComponentVID),
	-- Unique index to Bill Of Materials Involves Component LINK
	UNIQUE NONCLUSTERED(BillOfMaterialsVID, ComponentProductVID),
	FOREIGN KEY (BillOfMaterialsVID) REFERENCES BillOfMaterialsHUB (BillOfMaterialsVID)
)
GO

CREATE TABLE BillOfMaterialsInvolvesProductAssemblyLINK (
	-- Bill Of Materials Involves Product Assembly VID
	BillOfMaterialsInvolvesProductAssemblyVI BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Bill Of Materials VID
	BillOfMaterialsVID                      BIGINT NOT NULL,
	-- Product VID
	ProductAssemblyProductVID               BIGINT NOT NULL,
	-- Primary index to Bill Of Materials Involves Product Assembly LINK
	PRIMARY KEY CLUSTERED(BillOfMaterialsInvolvesProductAssemblyVI),
	-- Unique index to Bill Of Materials Involves Product Assembly LINK
	UNIQUE NONCLUSTERED(BillOfMaterialsVID, ProductAssemblyProductVID),
	FOREIGN KEY (BillOfMaterialsVID) REFERENCES BillOfMaterialsHUB (BillOfMaterialsVID)
)
GO

CREATE TABLE BillOfMaterialsSAT (
	-- Bill Of Materials VID
	BillOfMaterialsVID                      BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Bill Of Materials has BOM Level
	BOMLevel                                SMALLINT NOT NULL,
	-- Bill Of Materials has Per Assembly Qty
	PerAssemblyQty                          DECIMAL NOT NULL,
	-- Bill Of Materials involves start-Date
	StartDate                               datetime NOT NULL,
	-- Bill Of Materials has Unit Measure that has Unit Measure Code
	UnitMeasureCode                         CHAR(3) NOT NULL,
	-- maybe Bill Of Materials is valid until end-Date
	EndDate                                 datetime NULL,
	-- Unique index to Bill Of Materials SAT
	UNIQUE NONCLUSTERED(BillOfMaterialsVID, LoadDateTime),
	FOREIGN KEY (BillOfMaterialsVID) REFERENCES BillOfMaterialsHUB (BillOfMaterialsVID)
)
GO

CREATE TABLE BusinessEntityAddressLINK (
	-- Business Entity Address VID
	BusinessEntityAddressVID                BIGINT IDENTITY NOT NULL,
	-- Business Entity VID
	BusinessEntityVID                       BIGINT NOT NULL,
	-- Address VID
	AddressVID                              BIGINT NOT NULL,
	-- Business Entity Address involves Address Type that has Address Type ID
	AddressTypeID                           BIGINT NOT NULL IDENTITY,
	-- Primary index to Business Entity Address LINK
	PRIMARY KEY CLUSTERED(BusinessEntityAddressVID),
	-- Unique index to Business Entity Address LINK over PresenceConstraint over (Business Entity, Address, Address Type in "Business Entity uses Address as Address Type") occurs at most one time
	UNIQUE NONCLUSTERED(BusinessEntityVID, AddressVID, AddressTypeID),
	FOREIGN KEY (AddressVID) REFERENCES AddressHUB (AddressVID)
)
GO

CREATE TABLE BusinessEntityContactLINK (
	-- Business Entity Contact VID
	BusinessEntityContactVID                BIGINT IDENTITY NOT NULL,
	-- Business Entity VID
	BusinessEntityVID                       BIGINT NOT NULL,
	-- Person VID
	PersonVID                               BIGINT NOT NULL,
	-- Business Entity Contact involves Contact Type that has Contact Type ID
	ContactTypeID                           BIGINT NOT NULL IDENTITY,
	-- Primary index to Business Entity Contact LINK
	PRIMARY KEY CLUSTERED(BusinessEntityContactVID),
	-- Unique index to Business Entity Contact LINK over PresenceConstraint over (Business Entity, Person, Contact Type in "Business Entity appoints Person as Contact Type") occurs at most one time
	UNIQUE NONCLUSTERED(BusinessEntityVID, PersonVID, ContactTypeID)
)
GO

CREATE TABLE BusinessEntityHUB (
	-- Business Entity VID
	BusinessEntityVID                       BIGINT IDENTITY NOT NULL,
	-- Business Entity has Business Entity ID
	BusinessEntityID                        BIGINT NOT NULL IDENTITY,
	-- Primary index to Business Entity HUB
	PRIMARY KEY CLUSTERED(BusinessEntityVID),
	-- Unique index to Business Entity HUB over PresenceConstraint over (Business Entity ID in "Business Entity has Business Entity ID") occurs at most one time
	UNIQUE NONCLUSTERED(BusinessEntityID)
)
GO

CREATE TABLE CreditCardHUB (
	-- Credit Card VID
	CreditCardVID                           BIGINT IDENTITY NOT NULL,
	-- Credit Card has Credit Card ID
	CreditCardID                            BIGINT NOT NULL IDENTITY,
	-- Primary index to Credit Card HUB
	PRIMARY KEY CLUSTERED(CreditCardVID),
	-- Unique index to Credit Card HUB over PresenceConstraint over (Credit Card ID in "Credit Card has Credit Card ID") occurs at most one time
	UNIQUE NONCLUSTERED(CreditCardID)
)
GO

CREATE TABLE CreditCardSAT (
	-- Credit Card VID
	CreditCardVID                           BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Credit Card has Card Number
	CardNumber                              VARCHAR(25) NOT NULL,
	-- Credit Card has Card Type
	CardType                                VARCHAR(50) NOT NULL,
	-- Credit Card has Exp Month
	ExpMonth                                tinyint NOT NULL,
	-- Credit Card has Exp Year
	ExpYear                                 smallint NOT NULL,
	-- Unique index to Credit Card SAT
	UNIQUE NONCLUSTERED(CreditCardVID, LoadDateTime),
	FOREIGN KEY (CreditCardVID) REFERENCES CreditCardHUB (CreditCardVID)
)
GO

CREATE TABLE CurrencyRateHUB (
	-- Currency Rate VID
	CurrencyRateVID                         BIGINT IDENTITY NOT NULL,
	-- Currency Rate has Currency Rate ID
	CurrencyRateID                          BIGINT NOT NULL IDENTITY,
	-- Primary index to Currency Rate HUB
	PRIMARY KEY CLUSTERED(CurrencyRateVID),
	-- Unique index to Currency Rate HUB over PresenceConstraint over (Currency Rate ID in "Currency Rate has Currency Rate ID") occurs at most one time
	UNIQUE NONCLUSTERED(CurrencyRateID)
)
GO

CREATE TABLE CurrencyRateSAT (
	-- Currency Rate VID
	CurrencyRateVID                         BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Currency Rate applies at Average Rate
	AverageRate                             money NOT NULL,
	-- Currency Rate involves Currency Rate Date
	CurrencyRateDate                        datetime NOT NULL,
	-- Currency Rate has End Of Day Rate
	EndOfDayRate                            money NOT NULL,
	-- Currency Rate involves from-Currency and Currency has Currency Code
	FromCurrencyCode                        CHAR(3) NOT NULL,
	-- Currency Rate involves to-Currency and Currency has Currency Code
	ToCurrencyCode                          CHAR(3) NOT NULL,
	-- Unique index to Currency Rate SAT
	UNIQUE NONCLUSTERED(CurrencyRateVID, LoadDateTime),
	FOREIGN KEY (CurrencyRateVID) REFERENCES CurrencyRateHUB (CurrencyRateVID)
)
GO

CREATE TABLE CustomerBelongsToSalesTerritoryLINK (
	-- Customer Belongs To Sales Territory VID
	CustomerBelongsToSalesTerritoryVID      BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Customer VID
	CustomerVID                             BIGINT NOT NULL,
	-- Sales Territory VID
	SalesTerritoryVID                       BIGINT NOT NULL,
	-- Primary index to Customer Belongs To Sales Territory LINK
	PRIMARY KEY CLUSTERED(CustomerBelongsToSalesTerritoryVID),
	-- Unique index to Customer Belongs To Sales Territory LINK
	UNIQUE NONCLUSTERED(CustomerVID, SalesTerritoryVID)
)
GO

CREATE TABLE CustomerHUB (
	-- Customer VID
	CustomerVID                             BIGINT IDENTITY NOT NULL,
	-- Customer has Customer ID
	CustomerID                              BIGINT NOT NULL IDENTITY,
	-- Primary index to Customer HUB
	PRIMARY KEY CLUSTERED(CustomerVID),
	-- Unique index to Customer HUB over PresenceConstraint over (Customer ID in "Customer has Customer ID") occurs at most one time
	UNIQUE NONCLUSTERED(CustomerID)
)
GO

CREATE TABLE CustomerIsPersonLINK (
	-- Customer Is Person VID
	CustomerIsPersonVID                     BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Customer VID
	CustomerVID                             BIGINT NOT NULL,
	-- Person VID
	PersonVID                               BIGINT NOT NULL,
	-- Primary index to Customer Is Person LINK
	PRIMARY KEY CLUSTERED(CustomerIsPersonVID),
	-- Unique index to Customer Is Person LINK
	UNIQUE NONCLUSTERED(CustomerVID, PersonVID),
	FOREIGN KEY (CustomerVID) REFERENCES CustomerHUB (CustomerVID)
)
GO

CREATE TABLE CustomerIsStoreLINK (
	-- Customer Is Store VID
	CustomerIsStoreVID                      BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Customer VID
	CustomerVID                             BIGINT NOT NULL,
	-- Store VID
	StoreVID                                BIGINT NOT NULL,
	-- Primary index to Customer Is Store LINK
	PRIMARY KEY CLUSTERED(CustomerIsStoreVID),
	-- Unique index to Customer Is Store LINK
	UNIQUE NONCLUSTERED(CustomerVID, StoreVID),
	FOREIGN KEY (CustomerVID) REFERENCES CustomerHUB (CustomerVID)
)
GO

CREATE TABLE CustomerSAT (
	-- Customer VID
	CustomerVID                             BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Customer has Account Number
	AccountNumber                           VARCHAR(16) NOT NULL,
	-- Unique index to Customer SAT
	UNIQUE NONCLUSTERED(CustomerVID, LoadDateTime),
	FOREIGN KEY (CustomerVID) REFERENCES CustomerHUB (CustomerVID)
)
GO

CREATE TABLE DatabaseLogHUB (
	-- Database Log VID
	DatabaseLogVID                          BIGINT IDENTITY NOT NULL,
	-- Database Log has Database Log ID
	DatabaseLogID                           BIGINT NOT NULL IDENTITY,
	-- Primary index to Database Log HUB
	PRIMARY KEY CLUSTERED(DatabaseLogVID),
	-- Unique index to Database Log HUB over PresenceConstraint over (Database Log ID in "Database Log has Database Log ID") occurs at most one time
	UNIQUE NONCLUSTERED(DatabaseLogID)
)
GO

CREATE TABLE DepartmentHUB (
	-- Department VID
	DepartmentVID                           BIGINT IDENTITY NOT NULL,
	-- Department has Department ID
	DepartmentID                            BIGINT NOT NULL IDENTITY,
	-- Primary index to Department HUB
	PRIMARY KEY CLUSTERED(DepartmentVID),
	-- Unique index to Department HUB over PresenceConstraint over (Department ID in "Department has Department ID") occurs at most one time
	UNIQUE NONCLUSTERED(DepartmentID)
)
GO

CREATE TABLE DepartmentSAT (
	-- Department VID
	DepartmentVID                           BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Department has group-Name
	GroupName                               VARCHAR(50) NOT NULL,
	-- Department has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Unique index to Department SAT
	UNIQUE NONCLUSTERED(DepartmentVID, LoadDateTime),
	FOREIGN KEY (DepartmentVID) REFERENCES DepartmentHUB (DepartmentVID)
)
GO

CREATE TABLE DocumentBelongsToParentDocumentLINK (
	-- Document Belongs To Parent Document VID
	DocumentBelongsToParentDocumentVID      BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Document VID
	DocumentVID                             BIGINT NOT NULL,
	-- Document VID
	ParentDocumentVID                       BIGINT NOT NULL,
	-- Primary index to Document Belongs To Parent Document LINK
	PRIMARY KEY CLUSTERED(DocumentBelongsToParentDocumentVID),
	-- Unique index to Document Belongs To Parent Document LINK
	UNIQUE NONCLUSTERED(DocumentVID, ParentDocumentVID)
)
GO

CREATE TABLE DocumentHUB (
	-- Document VID
	DocumentVID                             BIGINT IDENTITY NOT NULL,
	-- Document has Document ID
	DocumentID                              hierarchyid NOT NULL,
	-- Primary index to Document HUB
	PRIMARY KEY CLUSTERED(DocumentVID),
	-- Unique index to Document HUB over PresenceConstraint over (Document ID in "Document has Document ID") occurs at most one time
	UNIQUE NONCLUSTERED(DocumentID)
)
GO

CREATE TABLE DocumentIsResponsibilityOfOwnerLINK (
	-- Document Is Responsibility Of Owner VID
	DocumentIsResponsibilityOfOwnerVID      BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Document VID
	DocumentVID                             BIGINT NOT NULL,
	-- Employee VID
	OwnerEmployeeVID                        BIGINT NOT NULL,
	-- Primary index to Document Is Responsibility Of Owner LINK
	PRIMARY KEY CLUSTERED(DocumentIsResponsibilityOfOwnerVID),
	-- Unique index to Document Is Responsibility Of Owner LINK
	UNIQUE NONCLUSTERED(DocumentVID, OwnerEmployeeVID),
	FOREIGN KEY (DocumentVID) REFERENCES DocumentHUB (DocumentVID)
)
GO

CREATE TABLE DocumentSAT (
	-- Document VID
	DocumentVID                             BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
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
	-- Document has Status
	Status                                  TINYINT NOT NULL CHECK((Status >= 1 AND Status <= 3)),
	-- Document has Title
	Title                                   VARCHAR(50) NOT NULL,
	-- maybe Document has Document
	Document                                VARCHAR(MAX) NULL,
	-- maybe Document has Document Summary
	DocumentSummary                         VARCHAR(MAX) NULL,
	-- Unique index to Document SAT
	UNIQUE NONCLUSTERED(DocumentVID, LoadDateTime),
	FOREIGN KEY (DocumentVID) REFERENCES DocumentHUB (DocumentVID)
)
GO

CREATE TABLE EmailAddressHUB (
	-- Email Address VID
	EmailAddressVID                         BIGINT IDENTITY NOT NULL,
	-- Email Address is used by Person that is a kind of Business Entity that has Business Entity ID
	PersonID                                BIGINT NOT NULL IDENTITY,
	-- Email Address has Email Address ID
	EmailAddressID                          BIGINT NOT NULL IDENTITY,
	-- Primary index to Email Address HUB
	PRIMARY KEY CLUSTERED(EmailAddressVID),
	-- Unique index to Email Address HUB over PresenceConstraint over (Person, Email Address ID in "Email Address is used by Person", "Email Address has Email Address ID") occurs at most one time
	UNIQUE NONCLUSTERED(PersonID, EmailAddressID)
)
GO

CREATE TABLE EmailAddressIsUsedByPersonLINK (
	-- Email Address Is Used By Person VID
	EmailAddressIsUsedByPersonVID           BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Email Address VID
	EmailAddressVID                         BIGINT NOT NULL,
	-- Person VID
	PersonVID                               BIGINT NOT NULL,
	-- Primary index to Email Address Is Used By Person LINK
	PRIMARY KEY CLUSTERED(EmailAddressIsUsedByPersonVID),
	-- Unique index to Email Address Is Used By Person LINK
	UNIQUE NONCLUSTERED(EmailAddressVID, PersonVID),
	FOREIGN KEY (EmailAddressVID) REFERENCES EmailAddressHUB (EmailAddressVID)
)
GO

CREATE TABLE EmailAddressSAT (
	-- Email Address VID
	EmailAddressVID                         BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Email Address has EmailAddress
	EmailAddress                            VARCHAR(50) NOT NULL,
	-- Unique index to Email Address SAT
	UNIQUE NONCLUSTERED(EmailAddressVID, LoadDateTime),
	FOREIGN KEY (EmailAddressVID) REFERENCES EmailAddressHUB (EmailAddressVID)
)
GO

CREATE TABLE EmployeeBelongsToOrganizationNodeLINK (
	-- Employee Belongs To Organization Node VID
	EmployeeBelongsToOrganizationNodeVID    BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Employee VID
	EmployeeVID                             BIGINT NOT NULL,
	-- Department VID
	OrganizationNodeDepartmentVID           BIGINT NOT NULL,
	-- Primary index to Employee Belongs To Organization Node LINK
	PRIMARY KEY CLUSTERED(EmployeeBelongsToOrganizationNodeVID),
	-- Unique index to Employee Belongs To Organization Node LINK
	UNIQUE NONCLUSTERED(EmployeeVID, OrganizationNodeDepartmentVID),
	FOREIGN KEY (OrganizationNodeDepartmentVID) REFERENCES DepartmentHUB (DepartmentVID)
)
GO

CREATE TABLE EmployeeDepartmentHistoryLINK (
	-- Employee Department History VID
	EmployeeDepartmentHistoryVID            BIGINT IDENTITY NOT NULL,
	-- Employee VID
	EmployeeVID                             BIGINT NOT NULL,
	-- Employee Department History involves start-Date
	StartDate                               datetime NOT NULL,
	-- Department VID
	DepartmentVID                           BIGINT NOT NULL,
	-- Shift VID
	ShiftVID                                BIGINT NOT NULL,
	-- Primary index to Employee Department History LINK
	PRIMARY KEY CLUSTERED(EmployeeDepartmentHistoryVID),
	-- Unique index to Employee Department History LINK over PresenceConstraint over (Employee, Start Date, Department, Shift in "Employee started on start-Date in Department working Shift") occurs at most one time
	UNIQUE NONCLUSTERED(EmployeeVID, StartDate, DepartmentVID, ShiftVID),
	FOREIGN KEY (DepartmentVID) REFERENCES DepartmentHUB (DepartmentVID)
)
GO

CREATE TABLE EmployeeDepartmentHistorySAT (
	-- Employee Department History VID
	EmployeeDepartmentHistoryVID            BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- maybe Employee Department History is valid until end-Date
	EndDate                                 datetime NULL,
	-- Unique index to Employee Department History SAT
	UNIQUE NONCLUSTERED(EmployeeDepartmentHistoryVID, LoadDateTime),
	FOREIGN KEY (EmployeeDepartmentHistoryVID) REFERENCES EmployeeDepartmentHistoryLINK (EmployeeDepartmentHistoryVID)
)
GO

CREATE TABLE EmployeeHUB (
	-- Employee VID
	EmployeeVID                             BIGINT IDENTITY NOT NULL,
	-- Employee is a kind of Person that is a kind of Business Entity that has Business Entity ID
	PersonID                                BIGINT NOT NULL IDENTITY,
	-- Primary index to Employee HUB
	PRIMARY KEY CLUSTERED(EmployeeVID),
	-- Unique index to Employee HUB over PresenceConstraint over (Job Candidate in "Job Candidate was hired as Employee") occurs at most one time
	UNIQUE NONCLUSTERED(JobCandidateVID),
	-- Unique index to Employee HUB over PresenceConstraint over (Person in "Employee is a kind of Person") occurs at most one time
	UNIQUE NONCLUSTERED(PersonID)
)
GO

CREATE TABLE EmployeeIsAKindOfPersonLINK (
	-- Employee Is A Kind Of Person VID
	EmployeeIsAKindOfPersonVID              BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Employee VID
	EmployeeVID                             BIGINT NOT NULL,
	-- Person VID
	PersonVID                               BIGINT NOT NULL,
	-- Primary index to Employee Is A Kind Of Person LINK
	PRIMARY KEY CLUSTERED(EmployeeIsAKindOfPersonVID),
	-- Unique index to Employee Is A Kind Of Person LINK
	UNIQUE NONCLUSTERED(EmployeeVID, PersonVID),
	FOREIGN KEY (EmployeeVID) REFERENCES EmployeeHUB (EmployeeVID)
)
GO

CREATE TABLE EmployeePayHistoryHUB (
	-- Employee Pay History VID
	EmployeePayHistoryVID                   BIGINT IDENTITY NOT NULL,
	-- Employee Pay History involves Employee that is a kind of Person that is a kind of Business Entity that has Business Entity ID
	EmployeeID                              BIGINT NOT NULL IDENTITY,
	-- Employee Pay History involves rate- change Date
	RateChangeDate                          datetime NOT NULL,
	-- Primary index to Employee Pay History HUB
	PRIMARY KEY CLUSTERED(EmployeePayHistoryVID),
	-- Unique index to Employee Pay History HUB over PresenceConstraint over (Employee, Rate Change Date in "pay of Employee was changed on rate- change Date") occurs at most one time
	UNIQUE NONCLUSTERED(EmployeeID, RateChangeDate)
)
GO

CREATE TABLE EmployeePayHistoryInvolvesEmployeeLINK (
	-- Employee Pay History Involves Employee VID
	EmployeePayHistoryInvolvesEmployeeVID   BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Employee Pay History VID
	EmployeePayHistoryVID                   BIGINT NOT NULL,
	-- Employee VID
	EmployeeVID                             BIGINT NOT NULL,
	-- Primary index to Employee Pay History Involves Employee LINK
	PRIMARY KEY CLUSTERED(EmployeePayHistoryInvolvesEmployeeVID),
	-- Unique index to Employee Pay History Involves Employee LINK
	UNIQUE NONCLUSTERED(EmployeePayHistoryVID, EmployeeVID),
	FOREIGN KEY (EmployeePayHistoryVID) REFERENCES EmployeePayHistoryHUB (EmployeePayHistoryVID),
	FOREIGN KEY (EmployeeVID) REFERENCES EmployeeHUB (EmployeeVID)
)
GO

CREATE TABLE EmployeePayHistorySAT (
	-- Employee Pay History VID
	EmployeePayHistoryVID                   BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Employee Pay History is paid at Pay Frequency
	PayFrequency                            tinyint NOT NULL CHECK(PayFrequency = 1 OR PayFrequency = 2),
	-- Employee Pay History is at Rate
	Rate                                    money NOT NULL,
	-- Unique index to Employee Pay History SAT
	UNIQUE NONCLUSTERED(EmployeePayHistoryVID, LoadDateTime),
	FOREIGN KEY (EmployeePayHistoryVID) REFERENCES EmployeePayHistoryHUB (EmployeePayHistoryVID)
)
GO

CREATE TABLE EmployeeSAT (
	-- Employee VID
	EmployeeVID                             BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
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
	-- Employee has sick- leave Hours
	SickLeaveHours                          INTEGER NOT NULL,
	-- Employee has vacation-Hours
	VacationHours                           INTEGER NOT NULL,
	-- Unique index to Employee SAT
	UNIQUE NONCLUSTERED(EmployeeVID, LoadDateTime),
	FOREIGN KEY (EmployeeVID) REFERENCES EmployeeHUB (EmployeeVID)
)
GO

CREATE TABLE EmployeeWasJobCandidateLINK (
	-- Employee Was Job Candidate VID
	EmployeeWasJobCandidateVID              BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Employee VID
	EmployeeVID                             BIGINT NOT NULL,
	-- Job Candidate VID
	JobCandidateVID                         BIGINT NOT NULL,
	-- Primary index to Employee Was Job Candidate LINK
	PRIMARY KEY CLUSTERED(EmployeeWasJobCandidateVID),
	-- Unique index to Employee Was Job Candidate LINK
	UNIQUE NONCLUSTERED(EmployeeVID, JobCandidateVID),
	FOREIGN KEY (EmployeeVID) REFERENCES EmployeeHUB (EmployeeVID)
)
GO

CREATE TABLE ErrorLogHUB (
	-- Error Log VID
	ErrorLogVID                             BIGINT IDENTITY NOT NULL,
	-- Error Log has Error Log ID
	ErrorLogID                              BIGINT NOT NULL IDENTITY,
	-- Primary index to Error Log HUB
	PRIMARY KEY CLUSTERED(ErrorLogVID),
	-- Unique index to Error Log HUB over PresenceConstraint over (Error Log ID in "Error Log has Error Log ID") occurs at most one time
	UNIQUE NONCLUSTERED(ErrorLogID)
)
GO

CREATE TABLE GroupSalesSAT (
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Product has Standard Cost
	StandardCost                            money NOT NULL,
	-- Unique index to GroupSales SAT
	UNIQUE NONCLUSTERED(ProductVID, LoadDateTime)
)
GO

CREATE TABLE IllustrationHUB (
	-- Illustration VID
	IllustrationVID                         BIGINT IDENTITY NOT NULL,
	-- Illustration has Illustration ID
	IllustrationID                          BIGINT NOT NULL IDENTITY,
	-- Primary index to Illustration HUB
	PRIMARY KEY CLUSTERED(IllustrationVID),
	-- Unique index to Illustration HUB over PresenceConstraint over (Illustration ID in "Illustration has Illustration ID") occurs at most one time
	UNIQUE NONCLUSTERED(IllustrationID)
)
GO

CREATE TABLE IllustrationSAT (
	-- Illustration VID
	IllustrationVID                         BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Illustration has Diagram
	Diagram                                 VARCHAR(MAX) NOT NULL,
	-- Unique index to Illustration SAT
	UNIQUE NONCLUSTERED(IllustrationVID, LoadDateTime),
	FOREIGN KEY (IllustrationVID) REFERENCES IllustrationHUB (IllustrationVID)
)
GO

CREATE TABLE JobCandidateHUB (
	-- Job Candidate VID
	JobCandidateVID                         BIGINT IDENTITY NOT NULL,
	-- Job Candidate has Job Candidate ID
	JobCandidateID                          BIGINT NOT NULL IDENTITY,
	-- Primary index to Job Candidate HUB
	PRIMARY KEY CLUSTERED(JobCandidateVID),
	-- Unique index to Job Candidate HUB over PresenceConstraint over (Job Candidate ID in "Job Candidate has Job Candidate ID") occurs at most one time
	UNIQUE NONCLUSTERED(JobCandidateID)
)
GO

CREATE TABLE JobCandidateSAT (
	-- Job Candidate VID
	JobCandidateVID                         BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- maybe Job Candidate supplied Resume
	Resume                                  VARCHAR(MAX) NULL,
	-- Unique index to Job Candidate SAT
	UNIQUE NONCLUSTERED(JobCandidateVID, LoadDateTime),
	FOREIGN KEY (JobCandidateVID) REFERENCES JobCandidateHUB (JobCandidateVID)
)
GO

CREATE TABLE LocationHUB (
	-- Location VID
	LocationVID                             BIGINT IDENTITY NOT NULL,
	-- Location has Location ID
	LocationID                              BIGINT NOT NULL IDENTITY,
	-- Primary index to Location HUB
	PRIMARY KEY CLUSTERED(LocationVID),
	-- Unique index to Location HUB over PresenceConstraint over (Location ID in "Location has Location ID") occurs at most one time
	UNIQUE NONCLUSTERED(LocationID)
)
GO

CREATE TABLE LocationSAT (
	-- Location VID
	LocationVID                             BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Location has Availability
	Availability                            DECIMAL NOT NULL,
	-- Location has Cost Rate
	CostRate                                smallmoney NOT NULL,
	-- Location has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Unique index to Location SAT
	UNIQUE NONCLUSTERED(LocationVID, LoadDateTime),
	FOREIGN KEY (LocationVID) REFERENCES LocationHUB (LocationVID)
)
GO

CREATE TABLE PersonCreditCardLINK (
	-- Person Credit Card VID
	PersonCreditCardVID                     BIGINT IDENTITY NOT NULL,
	-- Person VID
	PersonVID                               BIGINT NOT NULL,
	-- Credit Card VID
	CreditCardVID                           BIGINT NOT NULL,
	-- Primary index to Person Credit Card LINK
	PRIMARY KEY CLUSTERED(PersonCreditCardVID),
	-- Unique index to Person Credit Card LINK over PresenceConstraint over (Person, Credit Card in "Person uses Credit Card") occurs at most one time
	UNIQUE NONCLUSTERED(PersonVID, CreditCardVID),
	FOREIGN KEY (CreditCardVID) REFERENCES CreditCardHUB (CreditCardVID)
)
GO

CREATE TABLE PersonHUB (
	-- Person VID
	PersonVID                               BIGINT IDENTITY NOT NULL,
	-- Person is a kind of Business Entity that has Business Entity ID
	BusinessEntityID                        BIGINT NOT NULL IDENTITY,
	-- Primary index to Person HUB
	PRIMARY KEY CLUSTERED(PersonVID),
	-- Unique index to Person HUB over PresenceConstraint over (Business Entity in "Person is a kind of Business Entity") occurs at most one time
	UNIQUE NONCLUSTERED(BusinessEntityID)
)
GO

CREATE TABLE PersonIsAKindOfBusinessEntityLINK (
	-- Person Is A Kind Of Business Entity VID
	PersonIsAKindOfBusinessEntityVID        BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Business Entity VID
	BusinessEntityVID                       BIGINT NOT NULL,
	-- Person VID
	PersonVID                               BIGINT NOT NULL,
	-- Primary index to Person Is A Kind Of Business Entity LINK
	PRIMARY KEY CLUSTERED(PersonIsAKindOfBusinessEntityVID),
	-- Unique index to Person Is A Kind Of Business Entity LINK
	UNIQUE NONCLUSTERED(PersonVID, BusinessEntityVID),
	FOREIGN KEY (BusinessEntityVID) REFERENCES BusinessEntityHUB (BusinessEntityVID),
	FOREIGN KEY (PersonVID) REFERENCES PersonHUB (PersonVID)
)
GO

CREATE TABLE PersonPhoneHUB (
	-- Person Phone VID
	PersonPhoneVID                          BIGINT IDENTITY NOT NULL,
	-- Person Phone involves Person that is a kind of Business Entity that has Business Entity ID
	PersonID                                BIGINT NOT NULL IDENTITY,
	-- Person Phone involves Phone Number
	PhoneNumber                             VARCHAR(25) NOT NULL,
	-- Person Phone involves Phone Number Type that has Phone Number Type ID
	PhoneNumberTypeID                       BIGINT NOT NULL IDENTITY,
	-- Primary index to Person Phone HUB
	PRIMARY KEY CLUSTERED(PersonPhoneVID),
	-- Unique index to Person Phone HUB over PresenceConstraint over (Person, Phone Number, Phone Number Type in "Person uses Phone Number of Phone Number Type") occurs at most one time
	UNIQUE NONCLUSTERED(PersonID, PhoneNumber, PhoneNumberTypeID)
)
GO

CREATE TABLE PersonPhoneInvolvesPersonLINK (
	-- Person Phone Involves Person VID
	PersonPhoneInvolvesPersonVID            BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Person Phone VID
	PersonPhoneVID                          BIGINT NOT NULL,
	-- Person VID
	PersonVID                               BIGINT NOT NULL,
	-- Primary index to Person Phone Involves Person LINK
	PRIMARY KEY CLUSTERED(PersonPhoneInvolvesPersonVID),
	-- Unique index to Person Phone Involves Person LINK
	UNIQUE NONCLUSTERED(PersonPhoneVID, PersonVID),
	FOREIGN KEY (PersonPhoneVID) REFERENCES PersonPhoneHUB (PersonPhoneVID),
	FOREIGN KEY (PersonVID) REFERENCES PersonHUB (PersonVID)
)
GO

CREATE TABLE PersonSAT (
	-- Person VID
	PersonVID                               BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
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
	-- Unique index to Person SAT
	UNIQUE NONCLUSTERED(PersonVID, LoadDateTime),
	FOREIGN KEY (PersonVID) REFERENCES PersonHUB (PersonVID)
)
GO

CREATE TABLE ProductBelongsToProductSubcategoryLINK (
	-- Product Belongs To Product Subcategory VID
	ProductBelongsToProductSubcategoryVID   BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Product Subcategory VID
	ProductSubcategoryVID                   BIGINT NOT NULL,
	-- Primary index to Product Belongs To Product Subcategory LINK
	PRIMARY KEY CLUSTERED(ProductBelongsToProductSubcategoryVID),
	-- Unique index to Product Belongs To Product Subcategory LINK
	UNIQUE NONCLUSTERED(ProductVID, ProductSubcategoryVID)
)
GO

CREATE TABLE ProductCategoryHUB (
	-- Product Category VID
	ProductCategoryVID                      BIGINT IDENTITY NOT NULL,
	-- Product Category has Product Category ID
	ProductCategoryID                       BIGINT NOT NULL IDENTITY,
	-- Primary index to Product Category HUB
	PRIMARY KEY CLUSTERED(ProductCategoryVID),
	-- Unique index to Product Category HUB over PresenceConstraint over (Product Category ID in "Product Category has Product Category ID") occurs at most one time
	UNIQUE NONCLUSTERED(ProductCategoryID)
)
GO

CREATE TABLE ProductCategorySAT (
	-- Product Category VID
	ProductCategoryVID                      BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Product Category has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Unique index to Product Category SAT
	UNIQUE NONCLUSTERED(ProductCategoryVID, LoadDateTime),
	FOREIGN KEY (ProductCategoryVID) REFERENCES ProductCategoryHUB (ProductCategoryVID)
)
GO

CREATE TABLE ProductCostHistoryHUB (
	-- Product Cost History VID
	ProductCostHistoryVID                   BIGINT IDENTITY NOT NULL,
	-- Product Cost History involves Product that has Product ID
	ProductID                               BIGINT NOT NULL IDENTITY,
	-- Product Cost History involves start-Date
	StartDate                               datetime NOT NULL,
	-- Primary index to Product Cost History HUB
	PRIMARY KEY CLUSTERED(ProductCostHistoryVID),
	-- Unique index to Product Cost History HUB over PresenceConstraint over (Product, Start Date in "Product was costed on start-Date") occurs at most one time
	UNIQUE NONCLUSTERED(ProductID, StartDate)
)
GO

CREATE TABLE ProductCostHistoryInvolvesProductLINK (
	-- Product Cost History Involves Product VID
	ProductCostHistoryInvolvesProductVID    BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Product Cost History VID
	ProductCostHistoryVID                   BIGINT NOT NULL,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Primary index to Product Cost History Involves Product LINK
	PRIMARY KEY CLUSTERED(ProductCostHistoryInvolvesProductVID),
	-- Unique index to Product Cost History Involves Product LINK
	UNIQUE NONCLUSTERED(ProductCostHistoryVID, ProductVID),
	FOREIGN KEY (ProductCostHistoryVID) REFERENCES ProductCostHistoryHUB (ProductCostHistoryVID)
)
GO

CREATE TABLE ProductCostHistorySAT (
	-- Product Cost History VID
	ProductCostHistoryVID                   BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Product Cost History has Standard Cost
	StandardCost                            money NOT NULL,
	-- maybe Product Cost History is valid until end-Date
	EndDate                                 datetime NULL,
	-- Unique index to Product Cost History SAT
	UNIQUE NONCLUSTERED(ProductCostHistoryVID, LoadDateTime),
	FOREIGN KEY (ProductCostHistoryVID) REFERENCES ProductCostHistoryHUB (ProductCostHistoryVID)
)
GO

CREATE TABLE ProductDescriptionHUB (
	-- Product Description VID
	ProductDescriptionVID                   BIGINT IDENTITY NOT NULL,
	-- Product Description has Product Description ID
	ProductDescriptionID                    BIGINT NOT NULL IDENTITY,
	-- Primary index to Product Description HUB
	PRIMARY KEY CLUSTERED(ProductDescriptionVID),
	-- Unique index to Product Description HUB over PresenceConstraint over (Product Description ID in "Product Description has Product Description ID") occurs at most one time
	UNIQUE NONCLUSTERED(ProductDescriptionID)
)
GO

CREATE TABLE ProductDescriptionSAT (
	-- Product Description VID
	ProductDescriptionVID                   BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Product Description has Description
	Description                             VARCHAR(400) NOT NULL,
	-- Unique index to Product Description SAT
	UNIQUE NONCLUSTERED(ProductDescriptionVID, LoadDateTime),
	FOREIGN KEY (ProductDescriptionVID) REFERENCES ProductDescriptionHUB (ProductDescriptionVID)
)
GO

CREATE TABLE ProductDocumentLINK (
	-- Product Document VID
	ProductDocumentVID                      BIGINT IDENTITY NOT NULL,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Document VID
	DocumentVID                             BIGINT NOT NULL,
	-- Primary index to Product Document LINK
	PRIMARY KEY CLUSTERED(ProductDocumentVID),
	-- Unique index to Product Document LINK over PresenceConstraint over (Product, Document in "Product is described by Document") occurs at most one time
	UNIQUE NONCLUSTERED(ProductVID, DocumentVID),
	FOREIGN KEY (DocumentVID) REFERENCES DocumentHUB (DocumentVID)
)
GO

CREATE TABLE ProductHUB (
	-- Product VID
	ProductVID                              BIGINT IDENTITY NOT NULL,
	-- Product has Product ID
	ProductID                               BIGINT NOT NULL IDENTITY,
	-- Primary index to Product HUB
	PRIMARY KEY CLUSTERED(ProductVID),
	-- Unique index to Product HUB over PresenceConstraint over (Product ID in "Product has Product ID") occurs at most one time
	UNIQUE NONCLUSTERED(ProductID)
)
GO

CREATE TABLE ProductInventoryLINK (
	-- Product Inventory VID
	ProductInventoryVID                     BIGINT IDENTITY NOT NULL,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Location VID
	LocationVID                             BIGINT NOT NULL,
	-- Primary index to Product Inventory LINK
	PRIMARY KEY CLUSTERED(ProductInventoryVID),
	-- Unique index to Product Inventory LINK over PresenceConstraint over (Product, Location in "Product is available at Location") occurs at most one time
	UNIQUE NONCLUSTERED(ProductVID, LocationVID),
	FOREIGN KEY (LocationVID) REFERENCES LocationHUB (LocationVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
)
GO

CREATE TABLE ProductInventorySAT (
	-- Product Inventory VID
	ProductInventoryVID                     BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Product Inventory is in Bin
	Bin                                     TINYINT NOT NULL,
	-- Product Inventory has Quantity
	Quantity                                INTEGER NOT NULL,
	-- Product Inventory is on Shelf
	Shelf                                   VARCHAR(10) NOT NULL,
	-- Unique index to Product Inventory SAT
	UNIQUE NONCLUSTERED(ProductInventoryVID, LoadDateTime),
	FOREIGN KEY (ProductInventoryVID) REFERENCES ProductInventoryLINK (ProductInventoryVID)
)
GO

CREATE TABLE ProductIsOfProductModelLINK (
	-- Product Is Of Product Model VID
	ProductIsOfProductModelVID              BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Product Model VID
	ProductModelVID                         BIGINT NOT NULL,
	-- Primary index to Product Is Of Product Model LINK
	PRIMARY KEY CLUSTERED(ProductIsOfProductModelVID),
	-- Unique index to Product Is Of Product Model LINK
	UNIQUE NONCLUSTERED(ProductVID, ProductModelVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
)
GO

CREATE TABLE ProductListPriceHistoryHUB (
	-- Product List Price History VID
	ProductListPriceHistoryVID              BIGINT IDENTITY NOT NULL,
	-- Product List Price History involves Product that has Product ID
	ProductID                               BIGINT NOT NULL IDENTITY,
	-- Product List Price History involves start-Date
	StartDate                               datetime NOT NULL,
	-- Primary index to Product List Price History HUB
	PRIMARY KEY CLUSTERED(ProductListPriceHistoryVID),
	-- Unique index to Product List Price History HUB over PresenceConstraint over (Product, Start Date in "Product was priced on start-Date") occurs at most one time
	UNIQUE NONCLUSTERED(ProductID, StartDate)
)
GO

CREATE TABLE ProductListPriceHistoryInvolvesProductLINK (
	-- Product List Price History Involves Product VID
	ProductListPriceHistoryInvolvesProductVI BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Product List Price History VID
	ProductListPriceHistoryVID              BIGINT NOT NULL,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Primary index to Product List Price History Involves Product LINK
	PRIMARY KEY CLUSTERED(ProductListPriceHistoryInvolvesProductVI),
	-- Unique index to Product List Price History Involves Product LINK
	UNIQUE NONCLUSTERED(ProductListPriceHistoryVID, ProductVID),
	FOREIGN KEY (ProductListPriceHistoryVID) REFERENCES ProductListPriceHistoryHUB (ProductListPriceHistoryVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
)
GO

CREATE TABLE ProductListPriceHistorySAT (
	-- Product List Price History VID
	ProductListPriceHistoryVID              BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Product List Price History has List Price
	ListPrice                               money NOT NULL,
	-- maybe Product List Price History is valid until end-Date
	EndDate                                 datetime NULL,
	-- Unique index to Product List Price History SAT
	UNIQUE NONCLUSTERED(ProductListPriceHistoryVID, LoadDateTime),
	FOREIGN KEY (ProductListPriceHistoryVID) REFERENCES ProductListPriceHistoryHUB (ProductListPriceHistoryVID)
)
GO

CREATE TABLE ProductModelHUB (
	-- Product Model VID
	ProductModelVID                         BIGINT IDENTITY NOT NULL,
	-- Product Model has Product Model ID
	ProductModelID                          BIGINT NOT NULL IDENTITY,
	-- Primary index to Product Model HUB
	PRIMARY KEY CLUSTERED(ProductModelVID),
	-- Unique index to Product Model HUB over PresenceConstraint over (Product Model ID in "Product Model has Product Model ID") occurs at most one time
	UNIQUE NONCLUSTERED(ProductModelID)
)
GO

CREATE TABLE ProductModelIllustrationLINK (
	-- Product Model Illustration VID
	ProductModelIllustrationVID             BIGINT IDENTITY NOT NULL,
	-- Product Model VID
	ProductModelVID                         BIGINT NOT NULL,
	-- Illustration VID
	IllustrationVID                         BIGINT NOT NULL,
	-- Primary index to Product Model Illustration LINK
	PRIMARY KEY CLUSTERED(ProductModelIllustrationVID),
	-- Unique index to Product Model Illustration LINK over PresenceConstraint over (Product Model, Illustration in "Product Model has Illustration") occurs at most one time
	UNIQUE NONCLUSTERED(ProductModelVID, IllustrationVID),
	FOREIGN KEY (IllustrationVID) REFERENCES IllustrationHUB (IllustrationVID),
	FOREIGN KEY (ProductModelVID) REFERENCES ProductModelHUB (ProductModelVID)
)
GO

CREATE TABLE ProductModelProductDescriptionCultureLINK (
	-- Product Model Product Description Culture VID
	ProductModelProductDescriptionCultureVID BIGINT IDENTITY NOT NULL,
	-- Product Model VID
	ProductModelVID                         BIGINT NOT NULL,
	-- Product Description VID
	ProductDescriptionVID                   BIGINT NOT NULL,
	-- Product Model Product Description Culture involves Culture that has Culture ID
	CultureID                               BIGINT NOT NULL IDENTITY,
	-- Primary index to Product Model Product Description Culture LINK
	PRIMARY KEY CLUSTERED(ProductModelProductDescriptionCultureVID),
	-- Unique index to Product Model Product Description Culture LINK over PresenceConstraint over (Product Model, Product Description, Culture in "Product Model has Product Description for Culture") occurs at most one time
	UNIQUE NONCLUSTERED(ProductModelVID, ProductDescriptionVID, CultureID),
	FOREIGN KEY (ProductDescriptionVID) REFERENCES ProductDescriptionHUB (ProductDescriptionVID),
	FOREIGN KEY (ProductModelVID) REFERENCES ProductModelHUB (ProductModelVID)
)
GO

CREATE TABLE ProductModelSAT (
	-- Product Model VID
	ProductModelVID                         BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Product Model has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- maybe Product Model is described by Catalog Description
	CatalogDescription                      VARCHAR(MAX) NULL,
	-- maybe Product Model has Instructions
	Instructions                            VARCHAR(MAX) NULL,
	-- Unique index to Product Model SAT
	UNIQUE NONCLUSTERED(ProductModelVID, LoadDateTime),
	FOREIGN KEY (ProductModelVID) REFERENCES ProductModelHUB (ProductModelVID)
)
GO

CREATE TABLE ProductPhotoHUB (
	-- Product Photo VID
	ProductPhotoVID                         BIGINT IDENTITY NOT NULL,
	-- Product Photo has Product Photo ID
	ProductPhotoID                          BIGINT NOT NULL IDENTITY,
	-- Primary index to Product Photo HUB
	PRIMARY KEY CLUSTERED(ProductPhotoVID),
	-- Unique index to Product Photo HUB over PresenceConstraint over (Product Photo ID in "Product Photo has Product Photo ID") occurs at most one time
	UNIQUE NONCLUSTERED(ProductPhotoID)
)
GO

CREATE TABLE ProductPhotoSAT (
	-- Product Photo VID
	ProductPhotoVID                         BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- maybe Product Photo has large-Photo
	LargePhoto                              varbinary NULL,
	-- maybe Product Photo has large-Photo File Name
	LargePhotoFileName                      VARCHAR(50) NULL,
	-- maybe Product Photo has thumb- nail Photo
	ThumbNailPhoto                          varbinary NULL,
	-- maybe Product Photo has thumbnail-Photo File Name
	ThumbnailPhotoFileName                  VARCHAR(50) NULL,
	-- Unique index to Product Photo SAT
	UNIQUE NONCLUSTERED(ProductPhotoVID, LoadDateTime),
	FOREIGN KEY (ProductPhotoVID) REFERENCES ProductPhotoHUB (ProductPhotoVID)
)
GO

CREATE TABLE ProductProductPhotoLINK (
	-- Product Product Photo VID
	ProductPhotoVID                         BIGINT IDENTITY NOT NULL,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Product Photo VID
	ProductPhotoVID                         BIGINT NOT NULL,
	-- Primary index to Product Product Photo LINK
	PRIMARY KEY CLUSTERED(ProductPhotoVID),
	-- Unique index to Product Product Photo LINK over PresenceConstraint over (Product, Product Photo in "Product has Product Photo") occurs at most one time
	UNIQUE NONCLUSTERED(ProductVID, ProductPhotoVID),
	FOREIGN KEY (ProductPhotoVID) REFERENCES ProductPhotoHUB (ProductPhotoVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
)
GO

CREATE TABLE ProductProductPhotoSAT (
	-- Product Product Photo VID
	ProductPhotoVID                         BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Primary
	[Primary]                               BIT,
	-- Unique index to Product Product Photo SAT
	UNIQUE NONCLUSTERED(ProductPhotoVID, LoadDateTime),
	FOREIGN KEY (ProductPhotoVID) REFERENCES ProductProductPhotoLINK (ProductPhotoVID)
)
GO

CREATE TABLE ProductReviewHUB (
	-- Product Review VID
	ProductReviewVID                        BIGINT IDENTITY NOT NULL,
	-- Product Review has Product Review ID
	ProductReviewID                         BIGINT NOT NULL IDENTITY,
	-- Primary index to Product Review HUB
	PRIMARY KEY CLUSTERED(ProductReviewVID),
	-- Unique index to Product Review HUB over PresenceConstraint over (Product Review ID in "Product Review has Product Review ID") occurs at most one time
	UNIQUE NONCLUSTERED(ProductReviewID)
)
GO

CREATE TABLE ProductReviewInvolvesProductLINK (
	-- Product Review Involves Product VID
	ProductReviewInvolvesProductVID         BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Product Review VID
	ProductReviewVID                        BIGINT NOT NULL,
	-- Primary index to Product Review Involves Product LINK
	PRIMARY KEY CLUSTERED(ProductReviewInvolvesProductVID),
	-- Unique index to Product Review Involves Product LINK
	UNIQUE NONCLUSTERED(ProductReviewVID, ProductVID),
	FOREIGN KEY (ProductReviewVID) REFERENCES ProductReviewHUB (ProductReviewVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
)
GO

CREATE TABLE ProductReviewSAT (
	-- Product Review VID
	ProductReviewVID                        BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Product Review has EmailAddress
	EmailAddress                            VARCHAR(50) NOT NULL,
	-- Product Review assigned Rating
	Rating                                  TINYINT NOT NULL CHECK((Rating >= 1 AND Rating <= 5)),
	-- Product Review involves review-Date
	ReviewDate                              datetime NOT NULL,
	-- Product Review involves reviewer-Name
	ReviewerName                            VARCHAR(50) NOT NULL,
	-- maybe Product Review has Comments
	Comments                                VARCHAR(3850) NULL,
	-- Unique index to Product Review SAT
	UNIQUE NONCLUSTERED(ProductReviewVID, LoadDateTime),
	FOREIGN KEY (ProductReviewVID) REFERENCES ProductReviewHUB (ProductReviewVID)
)
GO

CREATE TABLE ProductSAT (
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Finished Goods Flag
	FinishedGoodsFlag                       BIT,
	-- Product has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Product has Product Number
	ProductNumber                           VARCHAR(25) NOT NULL,
	-- Unique index to Product SAT
	UNIQUE NONCLUSTERED(ProductVID, LoadDateTime),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
)
GO

CREATE TABLE ProductSubcategoryBelongsToProductCategoryLINK (
	-- Product Subcategory Belongs To Product Category VID
	ProductSubcategoryBelongsToProductCatego BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Product Category VID
	ProductCategoryVID                      BIGINT NOT NULL,
	-- Product Subcategory VID
	ProductSubcategoryVID                   BIGINT NOT NULL,
	-- Primary index to Product Subcategory Belongs To Product Category LINK
	PRIMARY KEY CLUSTERED(ProductSubcategoryBelongsToProductCatego),
	-- Unique index to Product Subcategory Belongs To Product Category LINK
	UNIQUE NONCLUSTERED(ProductSubcategoryVID, ProductCategoryVID),
	FOREIGN KEY (ProductCategoryVID) REFERENCES ProductCategoryHUB (ProductCategoryVID)
)
GO

CREATE TABLE ProductSubcategoryHUB (
	-- Product Subcategory VID
	ProductSubcategoryVID                   BIGINT IDENTITY NOT NULL,
	-- Product Subcategory has Product Subcategory ID
	ProductSubcategoryID                    BIGINT NOT NULL IDENTITY,
	-- Primary index to Product Subcategory HUB
	PRIMARY KEY CLUSTERED(ProductSubcategoryVID),
	-- Unique index to Product Subcategory HUB over PresenceConstraint over (Product Subcategory ID in "Product Subcategory has Product Subcategory ID") occurs at most one time
	UNIQUE NONCLUSTERED(ProductSubcategoryID)
)
GO

CREATE TABLE ProductSubcategorySAT (
	-- Product Subcategory VID
	ProductSubcategoryVID                   BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Product Subcategory has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Unique index to Product Subcategory SAT
	UNIQUE NONCLUSTERED(ProductSubcategoryVID, LoadDateTime),
	FOREIGN KEY (ProductSubcategoryVID) REFERENCES ProductSubcategoryHUB (ProductSubcategoryVID)
)
GO

CREATE TABLE ProductVendorLINK (
	-- Product Vendor VID
	ProductVendorVID                        BIGINT IDENTITY NOT NULL,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Vendor VID
	VendorVID                               BIGINT NOT NULL,
	-- Primary index to Product Vendor LINK
	PRIMARY KEY CLUSTERED(ProductVendorVID),
	-- Unique index to Product Vendor LINK over PresenceConstraint over (Product, Vendor in "Product is sourced from Vendor") occurs at most one time
	UNIQUE NONCLUSTERED(ProductVID, VendorVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
)
GO

CREATE TABLE ProductVendorSAT (
	-- Product Vendor VID
	ProductVendorVID                        BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
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
	-- Unique index to Product Vendor SAT
	UNIQUE NONCLUSTERED(ProductVendorVID, LoadDateTime),
	FOREIGN KEY (ProductVendorVID) REFERENCES ProductVendorLINK (ProductVendorVID)
)
GO

CREATE TABLE ProductGroupSAT (
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- maybe Product is of Class
	Class                                   CHAR(2) NULL CHECK(Class = 'H' OR Class = 'L' OR Class = 'M'),
	-- maybe Product is of Color
	Color                                   VARCHAR(15) NULL,
	-- maybe Product belongs to Product Line that has Product Line Name
	ProductLineName                         CHAR(2) NULL CHECK(ProductLineName = 'M' OR ProductLineName = 'R' OR ProductLineName = 'S' OR ProductLineName = 'T'),
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
	-- Unique index to ProductGroup SAT
	UNIQUE NONCLUSTERED(ProductVID, LoadDateTime),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
)
GO

CREATE TABLE ProductSalesSAT (
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Product has List Price
	ListPrice                               money NOT NULL,
	-- Product was first available on sell- start Date
	SellStartDate                           datetime NOT NULL,
	-- maybe Product was discontinued on discontinued-Date
	DiscontinuedDate                        datetime NULL,
	-- maybe Product is last available on sell- end Date
	SellEndDate                             datetime NULL,
	-- Unique index to ProductSales SAT
	UNIQUE NONCLUSTERED(ProductVID, LoadDateTime),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
)
GO

CREATE TABLE ProductSupplySAT (
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Product takes Days To Manufacture of days to manufacture
	DaysToManufacture                       INTEGER NOT NULL,
	-- Product should be re-ordered when inventory drops below Reorder Point
	ReorderPoint                            INTEGER NOT NULL,
	-- Product should be stocked at least in Safety Stock Level
	SafetyStockLevel                        INTEGER NOT NULL,
	-- Unique index to ProductSupply SAT
	UNIQUE NONCLUSTERED(ProductVID, LoadDateTime),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
)
GO

CREATE TABLE PurchaseOrderDetailBelongsToPurchaseOrderLINK (
	-- Purchase Order Detail Belongs To Purchase Order VID
	PurchaseOrderDetailBelongsToPurchaseOrde BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Purchase Order Detail VID
	PurchaseOrderDetailVID                  BIGINT NOT NULL,
	-- Purchase Order VID
	PurchaseOrderVID                        BIGINT NOT NULL,
	-- Primary index to Purchase Order Detail Belongs To Purchase Order LINK
	PRIMARY KEY CLUSTERED(PurchaseOrderDetailBelongsToPurchaseOrde),
	-- Unique index to Purchase Order Detail Belongs To Purchase Order LINK
	UNIQUE NONCLUSTERED(PurchaseOrderDetailVID, PurchaseOrderVID)
)
GO

CREATE TABLE PurchaseOrderDetailHUB (
	-- Purchase Order Detail VID
	PurchaseOrderDetailVID                  BIGINT IDENTITY NOT NULL,
	-- Purchase Order Detail belongs to Purchase Order that has Purchase Order ID
	PurchaseOrderID                         BIGINT NOT NULL IDENTITY,
	-- Purchase Order Detail has Purchase Order Detail ID
	PurchaseOrderDetailID                   BIGINT NOT NULL IDENTITY,
	-- Primary index to Purchase Order Detail HUB
	PRIMARY KEY CLUSTERED(PurchaseOrderDetailVID),
	-- Unique index to Purchase Order Detail HUB over PresenceConstraint over (Purchase Order, Purchase Order Detail ID in "Purchase Order includes Purchase Order Detail", "Purchase Order Detail has Purchase Order Detail ID") occurs at most one time
	UNIQUE NONCLUSTERED(PurchaseOrderID, PurchaseOrderDetailID)
)
GO

CREATE TABLE PurchaseOrderDetailIsForProductLINK (
	-- Purchase Order Detail Is For Product VID
	PurchaseOrderDetailIsForProductVID      BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Purchase Order Detail VID
	PurchaseOrderDetailVID                  BIGINT NOT NULL,
	-- Primary index to Purchase Order Detail Is For Product LINK
	PRIMARY KEY CLUSTERED(PurchaseOrderDetailIsForProductVID),
	-- Unique index to Purchase Order Detail Is For Product LINK
	UNIQUE NONCLUSTERED(PurchaseOrderDetailVID, ProductVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID),
	FOREIGN KEY (PurchaseOrderDetailVID) REFERENCES PurchaseOrderDetailHUB (PurchaseOrderDetailVID)
)
GO

CREATE TABLE PurchaseOrderDetailSAT (
	-- Purchase Order Detail VID
	PurchaseOrderDetailVID                  BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Purchase Order Detail has due-Date
	DueDate                                 datetime NOT NULL,
	-- Purchase Order Detail is for Order Qty
	OrderQty                                INTEGER NOT NULL,
	-- Purchase Order Detail has Received Qty
	ReceivedQty                             DECIMAL NOT NULL,
	-- Purchase Order Detail has Rejected Qty
	RejectedQty                             DECIMAL NOT NULL,
	-- Purchase Order Detail costs Unit Price
	UnitPrice                               money NOT NULL,
	-- Unique index to Purchase Order Detail SAT
	UNIQUE NONCLUSTERED(PurchaseOrderDetailVID, LoadDateTime),
	FOREIGN KEY (PurchaseOrderDetailVID) REFERENCES PurchaseOrderDetailHUB (PurchaseOrderDetailVID)
)
GO

CREATE TABLE PurchaseOrderHUB (
	-- Purchase Order VID
	PurchaseOrderVID                        BIGINT IDENTITY NOT NULL,
	-- Purchase Order has Purchase Order ID
	PurchaseOrderID                         BIGINT NOT NULL IDENTITY,
	-- Primary index to Purchase Order HUB
	PRIMARY KEY CLUSTERED(PurchaseOrderVID),
	-- Unique index to Purchase Order HUB over PresenceConstraint over (Purchase Order ID in "Purchase Order has Purchase Order ID") occurs at most one time
	UNIQUE NONCLUSTERED(PurchaseOrderID)
)
GO

CREATE TABLE PurchaseOrderSAT (
	-- Purchase Order VID
	PurchaseOrderVID                        BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Purchase Order freight costs Freight
	Freight                                 money NOT NULL,
	-- Purchase Order was made on order-Date
	OrderDate                               datetime NOT NULL,
	-- Purchase Order has Purchase Order Number
	PurchaseOrderNumber                     VARCHAR(25) NOT NULL,
	-- Purchase Order has Revision Number
	RevisionNumber                          TINYINT NOT NULL,
	-- Purchase Order requests Ship Method that has Ship Method ID
	ShipMethodID                            BIGINT NOT NULL IDENTITY,
	-- Purchase Order has Status and Purchase Order Status has Purchase Order Status Code
	StatusPurchaseOrderStatusCode           TINYINT NOT NULL CHECK((StatusPurchaseOrderStatusCode >= 1 AND StatusPurchaseOrderStatusCode <= 8)),
	-- Purchase Order is worth Sub Total
	SubTotal                                money NOT NULL,
	-- Purchase Order includes Tax Amt
	TaxAmt                                  money NOT NULL,
	-- maybe Purchase Order was shipped on ship-Date
	ShipDate                                datetime NULL,
	-- Unique index to Purchase Order SAT
	UNIQUE NONCLUSTERED(PurchaseOrderVID, LoadDateTime),
	FOREIGN KEY (PurchaseOrderVID) REFERENCES PurchaseOrderHUB (PurchaseOrderVID)
)
GO

CREATE TABLE PurchaseOrderWasMadeByEmployeeLINK (
	-- Purchase Order Was Made By Employee VID
	PurchaseOrderWasMadeByEmployeeVID       BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Employee VID
	EmployeeVID                             BIGINT NOT NULL,
	-- Purchase Order VID
	PurchaseOrderVID                        BIGINT NOT NULL,
	-- Primary index to Purchase Order Was Made By Employee LINK
	PRIMARY KEY CLUSTERED(PurchaseOrderWasMadeByEmployeeVID),
	-- Unique index to Purchase Order Was Made By Employee LINK
	UNIQUE NONCLUSTERED(PurchaseOrderVID, EmployeeVID),
	FOREIGN KEY (EmployeeVID) REFERENCES EmployeeHUB (EmployeeVID),
	FOREIGN KEY (PurchaseOrderVID) REFERENCES PurchaseOrderHUB (PurchaseOrderVID)
)
GO

CREATE TABLE PurchaseOrderWasPlacedWithVendorLINK (
	-- Purchase Order Was Placed With Vendor VID
	PurchaseOrderWasPlacedWithVendorVID     BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Purchase Order VID
	PurchaseOrderVID                        BIGINT NOT NULL,
	-- Vendor VID
	VendorVID                               BIGINT NOT NULL,
	-- Primary index to Purchase Order Was Placed With Vendor LINK
	PRIMARY KEY CLUSTERED(PurchaseOrderWasPlacedWithVendorVID),
	-- Unique index to Purchase Order Was Placed With Vendor LINK
	UNIQUE NONCLUSTERED(PurchaseOrderVID, VendorVID),
	FOREIGN KEY (PurchaseOrderVID) REFERENCES PurchaseOrderHUB (PurchaseOrderVID)
)
GO

CREATE TABLE SalesOrderBillsCreditCardLINK (
	-- Sales Order Bills Credit Card VID
	SalesOrderBillsCreditCardVID            BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Sales Order VID
	SalesOrderVID                           BIGINT NOT NULL,
	-- Credit Card VID
	CreditCardVID                           BIGINT NOT NULL,
	-- Primary index to Sales Order Bills Credit Card LINK
	PRIMARY KEY CLUSTERED(SalesOrderBillsCreditCardVID),
	-- Unique index to Sales Order Bills Credit Card LINK
	UNIQUE NONCLUSTERED(SalesOrderVID, CreditCardVID),
	FOREIGN KEY (CreditCardVID) REFERENCES CreditCardHUB (CreditCardVID)
)
GO

CREATE TABLE SalesOrderConvertsCurrencyAtCurrencyRateLINK (
	-- Sales Order Converts Currency At Currency Rate VID
	SalesOrderConvertsCurrencyAtCurrencyRate BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Sales Order VID
	SalesOrderVID                           BIGINT NOT NULL,
	-- Currency Rate VID
	CurrencyRateVID                         BIGINT NOT NULL,
	-- Primary index to Sales Order Converts Currency At Currency Rate LINK
	PRIMARY KEY CLUSTERED(SalesOrderConvertsCurrencyAtCurrencyRate),
	-- Unique index to Sales Order Converts Currency At Currency Rate LINK
	UNIQUE NONCLUSTERED(SalesOrderVID, CurrencyRateVID),
	FOREIGN KEY (CurrencyRateVID) REFERENCES CurrencyRateHUB (CurrencyRateVID)
)
GO

CREATE TABLE SalesOrderDetailAppliesSpecialOfferLINK (
	-- Sales Order Detail Applies Special Offer VID
	SalesOrderDetailAppliesSpecialOfferVID  BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Sales Order Detail VID
	SalesOrderDetailVID                     BIGINT NOT NULL,
	-- Special Offer VID
	SpecialOfferVID                         BIGINT NOT NULL,
	-- Primary index to Sales Order Detail Applies Special Offer LINK
	PRIMARY KEY CLUSTERED(SalesOrderDetailAppliesSpecialOfferVID),
	-- Unique index to Sales Order Detail Applies Special Offer LINK
	UNIQUE NONCLUSTERED(SalesOrderDetailVID, SpecialOfferVID)
)
GO

CREATE TABLE SalesOrderDetailBelongsToSalesOrderLINK (
	-- Sales Order Detail Belongs To Sales Order VID
	SalesOrderDetailBelongsToSalesOrderVID  BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Sales Order Detail VID
	SalesOrderDetailVID                     BIGINT NOT NULL,
	-- Sales Order VID
	SalesOrderVID                           BIGINT NOT NULL,
	-- Primary index to Sales Order Detail Belongs To Sales Order LINK
	PRIMARY KEY CLUSTERED(SalesOrderDetailBelongsToSalesOrderVID),
	-- Unique index to Sales Order Detail Belongs To Sales Order LINK
	UNIQUE NONCLUSTERED(SalesOrderDetailVID, SalesOrderVID)
)
GO

CREATE TABLE SalesOrderDetailHUB (
	-- Sales Order Detail VID
	SalesOrderDetailVID                     BIGINT IDENTITY NOT NULL,
	-- Sales Order Detail belongs to Sales Order that has Sales Order ID
	SalesOrderID                            BIGINT NOT NULL IDENTITY,
	-- Sales Order Detail has Sales Order Detail ID
	SalesOrderDetailID                      BIGINT NOT NULL IDENTITY,
	-- Primary index to Sales Order Detail HUB
	PRIMARY KEY CLUSTERED(SalesOrderDetailVID),
	-- Unique index to Sales Order Detail HUB over PresenceConstraint over (Sales Order, Sales Order Detail ID in "Sales Order includes Sales Order Detail", "Sales Order Detail has Sales Order Detail ID") occurs at most one time
	UNIQUE NONCLUSTERED(SalesOrderID, SalesOrderDetailID)
)
GO

CREATE TABLE SalesOrderDetailIsForProductLINK (
	-- Sales Order Detail Is For Product VID
	SalesOrderDetailIsForProductVID         BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Sales Order Detail VID
	SalesOrderDetailVID                     BIGINT NOT NULL,
	-- Primary index to Sales Order Detail Is For Product LINK
	PRIMARY KEY CLUSTERED(SalesOrderDetailIsForProductVID),
	-- Unique index to Sales Order Detail Is For Product LINK
	UNIQUE NONCLUSTERED(SalesOrderDetailVID, ProductVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID),
	FOREIGN KEY (SalesOrderDetailVID) REFERENCES SalesOrderDetailHUB (SalesOrderDetailVID)
)
GO

CREATE TABLE SalesOrderDetailSAT (
	-- Sales Order Detail VID
	SalesOrderDetailVID                     BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Sales Order Detail is for Order Qty
	OrderQty                                INTEGER NOT NULL,
	-- Sales Order Detail has Unit Price
	UnitPrice                               money NOT NULL,
	-- Sales Order Detail applies Unit Price Discount
	UnitPriceDiscount                       money NOT NULL,
	-- maybe Sales Order Detail has Carrier Tracking Number
	CarrierTrackingNumber                   VARCHAR(25) NULL,
	-- Unique index to Sales Order Detail SAT
	UNIQUE NONCLUSTERED(SalesOrderDetailVID, LoadDateTime),
	FOREIGN KEY (SalesOrderDetailVID) REFERENCES SalesOrderDetailHUB (SalesOrderDetailVID)
)
GO

CREATE TABLE SalesOrderHUB (
	-- Sales Order VID
	SalesOrderVID                           BIGINT IDENTITY NOT NULL,
	-- Sales Order has Sales Order ID
	SalesOrderID                            BIGINT NOT NULL IDENTITY,
	-- Primary index to Sales Order HUB
	PRIMARY KEY CLUSTERED(SalesOrderVID),
	-- Unique index to Sales Order HUB over PresenceConstraint over (Sales Order ID in "Sales Order has Sales Order ID") occurs at most one time
	UNIQUE NONCLUSTERED(SalesOrderID)
)
GO

CREATE TABLE SalesOrderHasBillToAddressLINK (
	-- Sales Order Has Bill To Address VID
	SalesOrderHasBillToAddressVID           BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Address VID
	BillToAddressVID                        BIGINT NOT NULL,
	-- Sales Order VID
	SalesOrderVID                           BIGINT NOT NULL,
	-- Primary index to Sales Order Has Bill To Address LINK
	PRIMARY KEY CLUSTERED(SalesOrderHasBillToAddressVID),
	-- Unique index to Sales Order Has Bill To Address LINK
	UNIQUE NONCLUSTERED(SalesOrderVID, BillToAddressVID),
	FOREIGN KEY (BillToAddressVID) REFERENCES AddressHUB (AddressVID),
	FOREIGN KEY (SalesOrderVID) REFERENCES SalesOrderHUB (SalesOrderVID)
)
GO

CREATE TABLE SalesOrderHasShipToAddressLINK (
	-- Sales Order Has Ship To Address VID
	SalesOrderHasShipToAddressVID           BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Sales Order VID
	SalesOrderVID                           BIGINT NOT NULL,
	-- Address VID
	ShipToAddressVID                        BIGINT NOT NULL,
	-- Primary index to Sales Order Has Ship To Address LINK
	PRIMARY KEY CLUSTERED(SalesOrderHasShipToAddressVID),
	-- Unique index to Sales Order Has Ship To Address LINK
	UNIQUE NONCLUSTERED(SalesOrderVID, ShipToAddressVID),
	FOREIGN KEY (SalesOrderVID) REFERENCES SalesOrderHUB (SalesOrderVID),
	FOREIGN KEY (ShipToAddressVID) REFERENCES AddressHUB (AddressVID)
)
GO

CREATE TABLE SalesOrderIsAssignedToSalesTerritoryLINK (
	-- Sales Order Is Assigned To Sales Territory VID
	SalesOrderIsAssignedToSalesTerritoryVID BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Sales Order VID
	SalesOrderVID                           BIGINT NOT NULL,
	-- Sales Territory VID
	SalesTerritoryVID                       BIGINT NOT NULL,
	-- Primary index to Sales Order Is Assigned To Sales Territory LINK
	PRIMARY KEY CLUSTERED(SalesOrderIsAssignedToSalesTerritoryVID),
	-- Unique index to Sales Order Is Assigned To Sales Territory LINK
	UNIQUE NONCLUSTERED(SalesOrderVID, SalesTerritoryVID),
	FOREIGN KEY (SalesOrderVID) REFERENCES SalesOrderHUB (SalesOrderVID)
)
GO

CREATE TABLE SalesOrderIsFromCustomerLINK (
	-- Sales Order Is From Customer VID
	SalesOrderIsFromCustomerVID             BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Customer VID
	CustomerVID                             BIGINT NOT NULL,
	-- Sales Order VID
	SalesOrderVID                           BIGINT NOT NULL,
	-- Primary index to Sales Order Is From Customer LINK
	PRIMARY KEY CLUSTERED(SalesOrderIsFromCustomerVID),
	-- Unique index to Sales Order Is From Customer LINK
	UNIQUE NONCLUSTERED(SalesOrderVID, CustomerVID),
	FOREIGN KEY (CustomerVID) REFERENCES CustomerHUB (CustomerVID),
	FOREIGN KEY (SalesOrderVID) REFERENCES SalesOrderHUB (SalesOrderVID)
)
GO

CREATE TABLE SalesOrderSAT (
	-- Sales Order VID
	SalesOrderVID                           BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Online Order Flag
	OnlineOrderFlag                         BIT,
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
	ShipMethodID                            BIGINT NOT NULL IDENTITY,
	-- Sales Order has Status and Sales Order Status has Sales Order Status Code
	StatusSalesOrderStatusCode              TINYINT NOT NULL CHECK((StatusSalesOrderStatusCode >= 1 AND StatusSalesOrderStatusCode <= 8)),
	-- Sales Order is worth Sub Total
	SubTotal                                money NOT NULL,
	-- Sales Order includes Tax Amt
	TaxAmt                                  money NOT NULL,
	-- maybe Sales Order is on Account Number
	AccountNumber                           VARCHAR(16) NULL,
	-- maybe Sales Order has Credit Card Approval Code
	CreditCardApprovalCode                  VARCHAR(15) NULL,
	-- maybe Sales Order corresponds to Purchase Order Number
	PurchaseOrderNumber                     VARCHAR(25) NULL,
	-- maybe Sales Order has Sales Order Comment
	SalesOrderComment                       VARCHAR(128) NULL,
	-- maybe Sales Order was shipped on ship-Date
	ShipDate                                datetime NULL,
	-- Unique index to Sales Order SAT
	UNIQUE NONCLUSTERED(SalesOrderVID, LoadDateTime),
	FOREIGN KEY (SalesOrderVID) REFERENCES SalesOrderHUB (SalesOrderVID)
)
GO

CREATE TABLE SalesOrderSalesReasonHUB (
	-- Sales Order Sales Reason VID
	SalesOrderSalesReasonVID                BIGINT IDENTITY NOT NULL,
	-- Sales Order Sales Reason involves Sales Order that has Sales Order ID
	SalesOrderID                            BIGINT NOT NULL IDENTITY,
	-- Sales Order Sales Reason involves Sales Reason that has Sales Reason ID
	SalesReasonID                           BIGINT NOT NULL IDENTITY,
	-- Primary index to Sales Order Sales Reason HUB
	PRIMARY KEY CLUSTERED(SalesOrderSalesReasonVID),
	-- Unique index to Sales Order Sales Reason HUB over PresenceConstraint over (Sales Order, Sales Reason in "Sales Order has Sales Reason") occurs at most one time
	UNIQUE NONCLUSTERED(SalesOrderID, SalesReasonID)
)
GO

CREATE TABLE SalesOrderSalesReasonInvolvesSalesOrderLINK (
	-- Sales Order Sales Reason Involves Sales Order VID
	SalesOrderSalesReasonInvolvesSalesOrderV BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Sales Order Sales Reason VID
	SalesOrderSalesReasonVID                BIGINT NOT NULL,
	-- Sales Order VID
	SalesOrderVID                           BIGINT NOT NULL,
	-- Primary index to Sales Order Sales Reason Involves Sales Order LINK
	PRIMARY KEY CLUSTERED(SalesOrderSalesReasonInvolvesSalesOrderV),
	-- Unique index to Sales Order Sales Reason Involves Sales Order LINK
	UNIQUE NONCLUSTERED(SalesOrderSalesReasonVID, SalesOrderVID),
	FOREIGN KEY (SalesOrderSalesReasonVID) REFERENCES SalesOrderSalesReasonHUB (SalesOrderSalesReasonVID),
	FOREIGN KEY (SalesOrderVID) REFERENCES SalesOrderHUB (SalesOrderVID)
)
GO

CREATE TABLE SalesOrderWasTakenBySalesPersonLINK (
	-- Sales Order Was Taken By Sales Person VID
	SalesOrderWasTakenBySalesPersonVID      BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Sales Order VID
	SalesOrderVID                           BIGINT NOT NULL,
	-- Sales Person VID
	SalesPersonVID                          BIGINT NOT NULL,
	-- Primary index to Sales Order Was Taken By Sales Person LINK
	PRIMARY KEY CLUSTERED(SalesOrderWasTakenBySalesPersonVID),
	-- Unique index to Sales Order Was Taken By Sales Person LINK
	UNIQUE NONCLUSTERED(SalesOrderVID, SalesPersonVID),
	FOREIGN KEY (SalesOrderVID) REFERENCES SalesOrderHUB (SalesOrderVID)
)
GO

CREATE TABLE SalesPersonHUB (
	-- Sales Person VID
	SalesPersonVID                          BIGINT IDENTITY NOT NULL,
	-- Sales Person is a kind of Employee that is a kind of Person that is a kind of Business Entity that has Business Entity ID
	EmployeeID                              BIGINT NOT NULL IDENTITY,
	-- Primary index to Sales Person HUB
	PRIMARY KEY CLUSTERED(SalesPersonVID),
	-- Unique index to Sales Person HUB over PresenceConstraint over (Employee in "Sales Person is a kind of Employee") occurs at most one time
	UNIQUE NONCLUSTERED(EmployeeID)
)
GO

CREATE TABLE SalesPersonIsAKindOfEmployeeLINK (
	-- Sales Person Is A Kind Of Employee VID
	SalesPersonIsAKindOfEmployeeVID         BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Employee VID
	EmployeeVID                             BIGINT NOT NULL,
	-- Sales Person VID
	SalesPersonVID                          BIGINT NOT NULL,
	-- Primary index to Sales Person Is A Kind Of Employee LINK
	PRIMARY KEY CLUSTERED(SalesPersonIsAKindOfEmployeeVID),
	-- Unique index to Sales Person Is A Kind Of Employee LINK
	UNIQUE NONCLUSTERED(SalesPersonVID, EmployeeVID),
	FOREIGN KEY (EmployeeVID) REFERENCES EmployeeHUB (EmployeeVID),
	FOREIGN KEY (SalesPersonVID) REFERENCES SalesPersonHUB (SalesPersonVID)
)
GO

CREATE TABLE SalesPersonIsAssignedToSalesTerritoryLINK (
	-- Sales Person Is Assigned To Sales Territory VID
	SalesPersonIsAssignedToSalesTerritoryVID BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Sales Person VID
	SalesPersonVID                          BIGINT NOT NULL,
	-- Sales Territory VID
	SalesTerritoryVID                       BIGINT NOT NULL,
	-- Primary index to Sales Person Is Assigned To Sales Territory LINK
	PRIMARY KEY CLUSTERED(SalesPersonIsAssignedToSalesTerritoryVID),
	-- Unique index to Sales Person Is Assigned To Sales Territory LINK
	UNIQUE NONCLUSTERED(SalesPersonVID, SalesTerritoryVID),
	FOREIGN KEY (SalesPersonVID) REFERENCES SalesPersonHUB (SalesPersonVID)
)
GO

CREATE TABLE SalesPersonQuotaHistoryHUB (
	-- Sales Person Quota History VID
	SalesPersonQuotaHistoryVID              BIGINT IDENTITY NOT NULL,
	-- Sales Person Quota History involves Sales Person that is a kind of Employee that is a kind of Person that is a kind of Business Entity that has Business Entity ID
	SalesPersonID                           BIGINT NOT NULL IDENTITY,
	-- Sales Person Quota History involves quota-Date
	QuotaDate                               datetime NOT NULL,
	-- Primary index to Sales Person Quota History HUB
	PRIMARY KEY CLUSTERED(SalesPersonQuotaHistoryVID),
	-- Unique index to Sales Person Quota History HUB over PresenceConstraint over (Sales Person, Quota Date in "Sales Person had quota to quota-Date of Amount") occurs one time
	UNIQUE NONCLUSTERED(SalesPersonID, QuotaDate)
)
GO

CREATE TABLE SalesPersonQuotaHistoryInvolvesSalesPersonLINK (
	-- Sales Person Quota History Involves Sales Person VID
	SalesPersonQuotaHistoryInvolvesSalesPers BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Sales Person Quota History VID
	SalesPersonQuotaHistoryVID              BIGINT NOT NULL,
	-- Sales Person VID
	SalesPersonVID                          BIGINT NOT NULL,
	-- Primary index to Sales Person Quota History Involves Sales Person LINK
	PRIMARY KEY CLUSTERED(SalesPersonQuotaHistoryInvolvesSalesPers),
	-- Unique index to Sales Person Quota History Involves Sales Person LINK
	UNIQUE NONCLUSTERED(SalesPersonQuotaHistoryVID, SalesPersonVID),
	FOREIGN KEY (SalesPersonQuotaHistoryVID) REFERENCES SalesPersonQuotaHistoryHUB (SalesPersonQuotaHistoryVID),
	FOREIGN KEY (SalesPersonVID) REFERENCES SalesPersonHUB (SalesPersonVID)
)
GO

CREATE TABLE SalesPersonQuotaHistorySAT (
	-- Sales Person Quota History VID
	SalesPersonQuotaHistoryVID              BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Sales Person Quota History involves Sales Quota
	SalesQuota                              money NOT NULL,
	-- Unique index to Sales Person Quota History SAT
	UNIQUE NONCLUSTERED(SalesPersonQuotaHistoryVID, LoadDateTime),
	FOREIGN KEY (SalesPersonQuotaHistoryVID) REFERENCES SalesPersonQuotaHistoryHUB (SalesPersonQuotaHistoryVID)
)
GO

CREATE TABLE SalesPersonSAT (
	-- Sales Person VID
	SalesPersonVID                          BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
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
	-- Unique index to Sales Person SAT
	UNIQUE NONCLUSTERED(SalesPersonVID, LoadDateTime),
	FOREIGN KEY (SalesPersonVID) REFERENCES SalesPersonHUB (SalesPersonVID)
)
GO

CREATE TABLE SalesTerritoryHUB (
	-- Sales Territory VID
	SalesTerritoryVID                       BIGINT IDENTITY NOT NULL,
	-- Sales Territory has Territory ID
	TerritoryID                             BIGINT NOT NULL IDENTITY,
	-- Primary index to Sales Territory HUB
	PRIMARY KEY CLUSTERED(SalesTerritoryVID),
	-- Unique index to Sales Territory HUB over PresenceConstraint over (Territory ID in "Sales Territory has Territory ID") occurs at most one time
	UNIQUE NONCLUSTERED(TerritoryID)
)
GO

CREATE TABLE SalesTerritoryHistoryLINK (
	-- Sales Territory History VID
	SalesTerritoryHistoryVID                BIGINT IDENTITY NOT NULL,
	-- Sales Person VID
	SalesPersonVID                          BIGINT NOT NULL,
	-- Sales Territory History involves start-Date
	StartDate                               datetime NOT NULL,
	-- Sales Territory VID
	SalesTerritoryVID                       BIGINT NOT NULL,
	-- Primary index to Sales Territory History LINK
	PRIMARY KEY CLUSTERED(SalesTerritoryHistoryVID),
	-- Unique index to Sales Territory History LINK over PresenceConstraint over (Sales Person, Start Date, Sales Territory in "Sales Person was assigned on start-Date to Sales Territory") occurs at most one time
	UNIQUE NONCLUSTERED(SalesPersonVID, StartDate, SalesTerritoryVID),
	FOREIGN KEY (SalesPersonVID) REFERENCES SalesPersonHUB (SalesPersonVID),
	FOREIGN KEY (SalesTerritoryVID) REFERENCES SalesTerritoryHUB (SalesTerritoryVID)
)
GO

CREATE TABLE SalesTerritoryHistorySAT (
	-- Sales Territory History VID
	SalesTerritoryHistoryVID                BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- maybe Sales Territory History is valid until end-Date
	EndDate                                 datetime NULL,
	-- Unique index to Sales Territory History SAT
	UNIQUE NONCLUSTERED(SalesTerritoryHistoryVID, LoadDateTime),
	FOREIGN KEY (SalesTerritoryHistoryVID) REFERENCES SalesTerritoryHistoryLINK (SalesTerritoryHistoryVID)
)
GO

CREATE TABLE SalesTerritorySAT (
	-- Sales Territory VID
	SalesTerritoryVID                       BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
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
	-- Unique index to Sales Territory SAT
	UNIQUE NONCLUSTERED(SalesTerritoryVID, LoadDateTime),
	FOREIGN KEY (SalesTerritoryVID) REFERENCES SalesTerritoryHUB (SalesTerritoryVID)
)
GO

CREATE TABLE SalesToStoreAreManagedBySalesPersonLINK (
	-- Sales To Store Are Managed By Sales Person VID
	SalesToStoreAreManagedBySalesPersonVID  BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Store VID
	StoreVID                                BIGINT NOT NULL,
	-- Sales Person VID
	SalesPersonVID                          BIGINT NOT NULL,
	-- Primary index to Sales To Store Are Managed By Sales Person LINK
	PRIMARY KEY CLUSTERED(SalesToStoreAreManagedBySalesPersonVID),
	-- Unique index to Sales To Store Are Managed By Sales Person LINK
	UNIQUE NONCLUSTERED(StoreVID, SalesPersonVID),
	FOREIGN KEY (SalesPersonVID) REFERENCES SalesPersonHUB (SalesPersonVID)
)
GO

CREATE TABLE ShiftHUB (
	-- Shift VID
	ShiftVID                                BIGINT IDENTITY NOT NULL,
	-- Shift has Shift ID
	ShiftID                                 BIGINT NOT NULL IDENTITY,
	-- Primary index to Shift HUB
	PRIMARY KEY CLUSTERED(ShiftVID),
	-- Unique index to Shift HUB over PresenceConstraint over (Shift ID in "Shift has Shift ID") occurs at most one time
	UNIQUE NONCLUSTERED(ShiftID)
)
GO

CREATE TABLE ShiftSAT (
	-- Shift VID
	ShiftVID                                BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Shift ends at end-Time
	EndTime                                 TIME NOT NULL,
	-- Shift has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- Shift starts at start-Time
	StartTime                               TIME NOT NULL,
	-- Unique index to Shift SAT
	UNIQUE NONCLUSTERED(ShiftVID, LoadDateTime),
	FOREIGN KEY (ShiftVID) REFERENCES ShiftHUB (ShiftVID)
)
GO

CREATE TABLE ShoppingCartItemHUB (
	-- Shopping Cart Item VID
	ShoppingCartItemVID                     BIGINT IDENTITY NOT NULL,
	-- Shopping Cart Item has Shopping Cart Item ID
	ShoppingCartItemID                      BIGINT NOT NULL IDENTITY,
	-- Primary index to Shopping Cart Item HUB
	PRIMARY KEY CLUSTERED(ShoppingCartItemVID),
	-- Unique index to Shopping Cart Item HUB over PresenceConstraint over (Shopping Cart Item ID in "Shopping Cart Item has Shopping Cart Item ID") occurs at most one time
	UNIQUE NONCLUSTERED(ShoppingCartItemID)
)
GO

CREATE TABLE ShoppingCartItemIsForProductLINK (
	-- Shopping Cart Item Is For Product VID
	ShoppingCartItemIsForProductVID         BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Shopping Cart Item VID
	ShoppingCartItemVID                     BIGINT NOT NULL,
	-- Primary index to Shopping Cart Item Is For Product LINK
	PRIMARY KEY CLUSTERED(ShoppingCartItemIsForProductVID),
	-- Unique index to Shopping Cart Item Is For Product LINK
	UNIQUE NONCLUSTERED(ShoppingCartItemVID, ProductVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID),
	FOREIGN KEY (ShoppingCartItemVID) REFERENCES ShoppingCartItemHUB (ShoppingCartItemVID)
)
GO

CREATE TABLE ShoppingCartItemSAT (
	-- Shopping Cart Item VID
	ShoppingCartItemVID                     BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Shopping Cart Item was created on Date Created
	DateCreated                             datetime NOT NULL,
	-- Shopping Cart Item is for Quantity
	Quantity                                INTEGER NOT NULL,
	-- Shopping Cart Item is in Shopping Cart that has Shopping Cart ID
	ShoppingCartID                          VARCHAR(50) NOT NULL,
	-- Unique index to Shopping Cart Item SAT
	UNIQUE NONCLUSTERED(ShoppingCartItemVID, LoadDateTime),
	FOREIGN KEY (ShoppingCartItemVID) REFERENCES ShoppingCartItemHUB (ShoppingCartItemVID)
)
GO

CREATE TABLE SpecialOfferHUB (
	-- Special Offer VID
	SpecialOfferVID                         BIGINT IDENTITY NOT NULL,
	-- Special Offer has Special Offer ID
	SpecialOfferID                          BIGINT NOT NULL IDENTITY,
	-- Primary index to Special Offer HUB
	PRIMARY KEY CLUSTERED(SpecialOfferVID),
	-- Unique index to Special Offer HUB over PresenceConstraint over (Special Offer ID in "Special Offer has Special Offer ID") occurs at most one time
	UNIQUE NONCLUSTERED(SpecialOfferID)
)
GO

CREATE TABLE SpecialOfferProductLINK (
	-- Special Offer Product VID
	SpecialOfferProductVID                  BIGINT IDENTITY NOT NULL,
	-- Special Offer VID
	SpecialOfferVID                         BIGINT NOT NULL,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Primary index to Special Offer Product LINK
	PRIMARY KEY CLUSTERED(SpecialOfferProductVID),
	-- Unique index to Special Offer Product LINK over PresenceConstraint over (Special Offer, Product in "Special Offer includes Product") occurs at most one time
	UNIQUE NONCLUSTERED(SpecialOfferVID, ProductVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID),
	FOREIGN KEY (SpecialOfferVID) REFERENCES SpecialOfferHUB (SpecialOfferVID)
)
GO

CREATE TABLE SpecialOfferSAT (
	-- Special Offer VID
	SpecialOfferVID                         BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
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
	-- Unique index to Special Offer SAT
	UNIQUE NONCLUSTERED(SpecialOfferVID, LoadDateTime),
	FOREIGN KEY (SpecialOfferVID) REFERENCES SpecialOfferHUB (SpecialOfferVID)
)
GO

CREATE TABLE StoreHUB (
	-- Store VID
	StoreVID                                BIGINT IDENTITY NOT NULL,
	-- Store is a kind of Business Entity that has Business Entity ID
	BusinessEntityID                        BIGINT NOT NULL IDENTITY,
	-- Primary index to Store HUB
	PRIMARY KEY CLUSTERED(StoreVID),
	-- Unique index to Store HUB over PresenceConstraint over (Business Entity in "Store is a kind of Business Entity") occurs at most one time
	UNIQUE NONCLUSTERED(BusinessEntityID)
)
GO

CREATE TABLE StoreIsAKindOfBusinessEntityLINK (
	-- Store Is A Kind Of Business Entity VID
	StoreIsAKindOfBusinessEntityVID         BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Business Entity VID
	BusinessEntityVID                       BIGINT NOT NULL,
	-- Store VID
	StoreVID                                BIGINT NOT NULL,
	-- Primary index to Store Is A Kind Of Business Entity LINK
	PRIMARY KEY CLUSTERED(StoreIsAKindOfBusinessEntityVID),
	-- Unique index to Store Is A Kind Of Business Entity LINK
	UNIQUE NONCLUSTERED(StoreVID, BusinessEntityVID),
	FOREIGN KEY (BusinessEntityVID) REFERENCES BusinessEntityHUB (BusinessEntityVID),
	FOREIGN KEY (StoreVID) REFERENCES StoreHUB (StoreVID)
)
GO

CREATE TABLE StoreSAT (
	-- Store VID
	StoreVID                                BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Store has Name
	Name                                    VARCHAR(50) NOT NULL,
	-- maybe Store has Demographics
	Demographics                            VARCHAR(MAX) NULL,
	-- Unique index to Store SAT
	UNIQUE NONCLUSTERED(StoreVID, LoadDateTime),
	FOREIGN KEY (StoreVID) REFERENCES StoreHUB (StoreVID)
)
GO

CREATE TABLE TransactionAppliesToProductLINK (
	-- Transaction Applies To Product VID
	TransactionAppliesToProductVID          BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Transaction VID
	TransactionVID                          BIGINT NOT NULL,
	-- Primary index to Transaction Applies To Product LINK
	PRIMARY KEY CLUSTERED(TransactionAppliesToProductVID),
	-- Unique index to Transaction Applies To Product LINK
	UNIQUE NONCLUSTERED(TransactionVID, ProductVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
)
GO

CREATE TABLE TransactionHUB (
	-- Transaction VID
	TransactionVID                          BIGINT IDENTITY NOT NULL,
	-- Transaction has Transaction ID
	TransactionID                           BIGINT NOT NULL IDENTITY,
	-- Primary index to Transaction HUB
	PRIMARY KEY CLUSTERED(TransactionVID),
	-- Unique index to Transaction HUB over PresenceConstraint over (Transaction ID in "Transaction has Transaction ID") occurs at most one time
	UNIQUE NONCLUSTERED(TransactionID)
)
GO

CREATE TABLE TransactionHistoryArchiveHUB (
	-- Transaction History Archive VID
	TransactionHistoryArchiveVID            BIGINT IDENTITY NOT NULL,
	-- Transaction History Archive is a kind of Transaction that has Transaction ID
	TransactionID                           BIGINT NOT NULL IDENTITY,
	-- Primary index to Transaction History Archive HUB
	PRIMARY KEY CLUSTERED(TransactionHistoryArchiveVID),
	-- Unique index to Transaction History Archive HUB over PresenceConstraint over (Transaction in "Transaction History Archive is a kind of Transaction") occurs at most one time
	UNIQUE NONCLUSTERED(TransactionID)
)
GO

CREATE TABLE TransactionHistoryArchiveIsAKindOfTransactionLINK (
	-- Transaction History Archive Is A Kind Of Transaction VID
	TransactionHistoryArchiveIsAKindOfTranse BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Transaction History Archive VID
	TransactionHistoryArchiveVID            BIGINT NOT NULL,
	-- Transaction VID
	TransactionVID                          BIGINT NOT NULL,
	-- Primary index to Transaction History Archive Is A Kind Of Transaction LINK
	PRIMARY KEY CLUSTERED(TransactionHistoryArchiveIsAKindOfTranse),
	-- Unique index to Transaction History Archive Is A Kind Of Transaction LINK
	UNIQUE NONCLUSTERED(TransactionHistoryArchiveVID, TransactionVID),
	FOREIGN KEY (TransactionHistoryArchiveVID) REFERENCES TransactionHistoryArchiveHUB (TransactionHistoryArchiveVID),
	FOREIGN KEY (TransactionVID) REFERENCES TransactionHUB (TransactionVID)
)
GO

CREATE TABLE TransactionHistoryHUB (
	-- Transaction History VID
	TransactionHistoryVID                   BIGINT IDENTITY NOT NULL,
	-- Transaction History is a kind of Transaction that has Transaction ID
	TransactionID                           BIGINT NOT NULL IDENTITY,
	-- Primary index to Transaction History HUB
	PRIMARY KEY CLUSTERED(TransactionHistoryVID),
	-- Unique index to Transaction History HUB over PresenceConstraint over (Transaction in "Transaction History is a kind of Transaction") occurs at most one time
	UNIQUE NONCLUSTERED(TransactionID)
)
GO

CREATE TABLE TransactionHistoryIsAKindOfTransactionLINK (
	-- Transaction History Is A Kind Of Transaction VID
	TransactionHistoryIsAKindOfTransactionVI BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Transaction History VID
	TransactionHistoryVID                   BIGINT NOT NULL,
	-- Transaction VID
	TransactionVID                          BIGINT NOT NULL,
	-- Primary index to Transaction History Is A Kind Of Transaction LINK
	PRIMARY KEY CLUSTERED(TransactionHistoryIsAKindOfTransactionVI),
	-- Unique index to Transaction History Is A Kind Of Transaction LINK
	UNIQUE NONCLUSTERED(TransactionHistoryVID, TransactionVID),
	FOREIGN KEY (TransactionHistoryVID) REFERENCES TransactionHistoryHUB (TransactionHistoryVID),
	FOREIGN KEY (TransactionVID) REFERENCES TransactionHUB (TransactionVID)
)
GO

CREATE TABLE TransactionSAT (
	-- Transaction VID
	TransactionVID                          BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Transaction has Actual Cost
	ActualCost                              money NOT NULL,
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
	-- Unique index to Transaction SAT
	UNIQUE NONCLUSTERED(TransactionVID, LoadDateTime),
	FOREIGN KEY (TransactionVID) REFERENCES TransactionHUB (TransactionVID)
)
GO

CREATE TABLE VendorHUB (
	-- Vendor VID
	VendorVID                               BIGINT IDENTITY NOT NULL,
	-- Vendor is a kind of Business Entity that has Business Entity ID
	BusinessEntityID                        BIGINT NOT NULL IDENTITY,
	-- Primary index to Vendor HUB
	PRIMARY KEY CLUSTERED(VendorVID),
	-- Unique index to Vendor HUB over PresenceConstraint over (Business Entity in "Vendor is a kind of Business Entity") occurs at most one time
	UNIQUE NONCLUSTERED(BusinessEntityID)
)
GO

CREATE TABLE VendorIsAKindOfBusinessEntityLINK (
	-- Vendor Is A Kind Of Business Entity VID
	VendorIsAKindOfBusinessEntityVID        BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Business Entity VID
	BusinessEntityVID                       BIGINT NOT NULL,
	-- Vendor VID
	VendorVID                               BIGINT NOT NULL,
	-- Primary index to Vendor Is A Kind Of Business Entity LINK
	PRIMARY KEY CLUSTERED(VendorIsAKindOfBusinessEntityVID),
	-- Unique index to Vendor Is A Kind Of Business Entity LINK
	UNIQUE NONCLUSTERED(VendorVID, BusinessEntityVID),
	FOREIGN KEY (BusinessEntityVID) REFERENCES BusinessEntityHUB (BusinessEntityVID),
	FOREIGN KEY (VendorVID) REFERENCES VendorHUB (VendorVID)
)
GO

CREATE TABLE VendorSAT (
	-- Vendor VID
	VendorVID                               BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
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
	-- Unique index to Vendor SAT
	UNIQUE NONCLUSTERED(VendorVID, LoadDateTime),
	FOREIGN KEY (VendorVID) REFERENCES VendorHUB (VendorVID)
)
GO

CREATE TABLE WorkOrderHUB (
	-- Work Order VID
	WorkOrderVID                            BIGINT IDENTITY NOT NULL,
	-- Work Order has Work Order ID
	WorkOrderID                             BIGINT NOT NULL IDENTITY,
	-- Primary index to Work Order HUB
	PRIMARY KEY CLUSTERED(WorkOrderVID),
	-- Unique index to Work Order HUB over PresenceConstraint over (Work Order ID in "Work Order has Work Order ID") occurs at most one time
	UNIQUE NONCLUSTERED(WorkOrderID)
)
GO

CREATE TABLE WorkOrderIsForProductLINK (
	-- Work Order Is For Product VID
	WorkOrderIsForProductVID                BIGINT IDENTITY NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME,
	-- Product VID
	ProductVID                              BIGINT NOT NULL,
	-- Work Order VID
	WorkOrderVID                            BIGINT NOT NULL,
	-- Primary index to Work Order Is For Product LINK
	PRIMARY KEY CLUSTERED(WorkOrderIsForProductVID),
	-- Unique index to Work Order Is For Product LINK
	UNIQUE NONCLUSTERED(WorkOrderVID, ProductVID),
	FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID),
	FOREIGN KEY (WorkOrderVID) REFERENCES WorkOrderHUB (WorkOrderVID)
)
GO

CREATE TABLE WorkOrderRoutingHUB (
	-- Work Order Routing VID
	WorkOrderRoutingVID                     BIGINT IDENTITY NOT NULL,
	-- Work Order Routing involves Work Order that has Work Order ID
	WorkOrderID                             BIGINT NOT NULL,
	-- Work Order Routing involves Product that has Product ID
	ProductID                               BIGINT NOT NULL,
	-- Work Order Routing involves Operation Sequence
	OperationSequence                       SMALLINT NOT NULL,
	-- Location VID
	LocationVID                             BIGINT NOT NULL,
	-- Primary index to Work Order Routing HUB
	PRIMARY KEY CLUSTERED(WorkOrderRoutingVID),
	-- Unique index to Work Order Routing HUB over PresenceConstraint over (Work Order, Product, Operation Sequence in "Work Order activity on Product involves Operation Sequence") occurs at most one time
	UNIQUE NONCLUSTERED(WorkOrderID, ProductID, OperationSequence),
	FOREIGN KEY (LocationVID) REFERENCES LocationHUB (LocationVID),
	FOREIGN KEY (ProductID) REFERENCES ProductHUB (ProductVID),
	FOREIGN KEY (WorkOrderID) REFERENCES WorkOrderHUB (WorkOrderVID)
)
GO

CREATE TABLE WorkOrderRoutingSAT (
	-- Work Order Routing VID
	WorkOrderRoutingVID                     BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
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
	-- Unique index to Work Order Routing SAT
	UNIQUE NONCLUSTERED(WorkOrderRoutingVID, LoadDateTime),
	FOREIGN KEY (WorkOrderRoutingVID) REFERENCES WorkOrderRoutingHUB (WorkOrderRoutingVID)
)
GO

CREATE TABLE WorkOrderSAT (
	-- Work Order VID
	WorkOrderVID                            BIGINT NOT NULL,
	-- LoadDateTime
	LoadDateTime                            DATETIME,
	-- Work Order has due-Date
	DueDate                                 datetime NOT NULL,
	-- Work Order is for Order Qty
	OrderQty                                INTEGER NOT NULL,
	-- Work Order has Scrapped Qty
	ScrappedQty                             INTEGER NOT NULL,
	-- Work Order has start-Date
	StartDate                               datetime NOT NULL,
	-- maybe Work Order is valid until end-Date
	EndDate                                 datetime NULL,
	-- maybe Work Order has Scrap Reason that has Scrap Reason ID
	ScrapReasonID                           BIGINT NULL IDENTITY,
	-- Unique index to Work Order SAT
	UNIQUE NONCLUSTERED(WorkOrderVID, LoadDateTime),
	FOREIGN KEY (WorkOrderVID) REFERENCES WorkOrderHUB (WorkOrderVID)
)
GO

ALTER TABLE BillOfMaterialsInvolvesComponentLINK
	ADD FOREIGN KEY (ComponentProductVID) REFERENCES ProductHUB (ProductVID)
GO

ALTER TABLE BillOfMaterialsInvolvesProductAssemblyLINK
	ADD FOREIGN KEY (ProductAssemblyProductVID) REFERENCES ProductHUB (ProductVID)
GO

ALTER TABLE BusinessEntityAddressLINK
	ADD FOREIGN KEY (BusinessEntityVID) REFERENCES BusinessEntityHUB (BusinessEntityVID)
GO

ALTER TABLE BusinessEntityContactLINK
	ADD FOREIGN KEY (BusinessEntityVID) REFERENCES BusinessEntityHUB (BusinessEntityVID)
GO

ALTER TABLE BusinessEntityContactLINK
	ADD FOREIGN KEY (PersonVID) REFERENCES PersonHUB (PersonVID)
GO

ALTER TABLE CustomerBelongsToSalesTerritoryLINK
	ADD FOREIGN KEY (CustomerVID) REFERENCES CustomerHUB (CustomerVID)
GO

ALTER TABLE CustomerBelongsToSalesTerritoryLINK
	ADD FOREIGN KEY (SalesTerritoryVID) REFERENCES SalesTerritoryHUB (SalesTerritoryVID)
GO

ALTER TABLE CustomerIsPersonLINK
	ADD FOREIGN KEY (PersonVID) REFERENCES PersonHUB (PersonVID)
GO

ALTER TABLE CustomerIsStoreLINK
	ADD FOREIGN KEY (StoreVID) REFERENCES StoreHUB (StoreVID)
GO

ALTER TABLE DocumentBelongsToParentDocumentLINK
	ADD FOREIGN KEY (DocumentVID) REFERENCES DocumentHUB (DocumentVID)
GO

ALTER TABLE DocumentBelongsToParentDocumentLINK
	ADD FOREIGN KEY (ParentDocumentVID) REFERENCES DocumentHUB (DocumentVID)
GO

ALTER TABLE DocumentIsResponsibilityOfOwnerLINK
	ADD FOREIGN KEY (OwnerEmployeeVID) REFERENCES EmployeeHUB (EmployeeVID)
GO

ALTER TABLE EmailAddressIsUsedByPersonLINK
	ADD FOREIGN KEY (PersonVID) REFERENCES PersonHUB (PersonVID)
GO

ALTER TABLE EmployeeBelongsToOrganizationNodeLINK
	ADD FOREIGN KEY (EmployeeVID) REFERENCES EmployeeHUB (EmployeeVID)
GO

ALTER TABLE EmployeeDepartmentHistoryLINK
	ADD FOREIGN KEY (EmployeeVID) REFERENCES EmployeeHUB (EmployeeVID)
GO

ALTER TABLE EmployeeDepartmentHistoryLINK
	ADD FOREIGN KEY (ShiftVID) REFERENCES ShiftHUB (ShiftVID)
GO

ALTER TABLE EmployeeIsAKindOfPersonLINK
	ADD FOREIGN KEY (PersonVID) REFERENCES PersonHUB (PersonVID)
GO

ALTER TABLE EmployeeWasJobCandidateLINK
	ADD FOREIGN KEY (JobCandidateVID) REFERENCES JobCandidateHUB (JobCandidateVID)
GO

ALTER TABLE GroupSalesSAT
	ADD FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
GO

ALTER TABLE PersonCreditCardLINK
	ADD FOREIGN KEY (PersonVID) REFERENCES PersonHUB (PersonVID)
GO

ALTER TABLE ProductBelongsToProductSubcategoryLINK
	ADD FOREIGN KEY (ProductSubcategoryVID) REFERENCES ProductSubcategoryHUB (ProductSubcategoryVID)
GO

ALTER TABLE ProductBelongsToProductSubcategoryLINK
	ADD FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
GO

ALTER TABLE ProductCostHistoryInvolvesProductLINK
	ADD FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
GO

ALTER TABLE ProductDocumentLINK
	ADD FOREIGN KEY (ProductVID) REFERENCES ProductHUB (ProductVID)
GO

ALTER TABLE ProductIsOfProductModelLINK
	ADD FOREIGN KEY (ProductModelVID) REFERENCES ProductModelHUB (ProductModelVID)
GO

ALTER TABLE ProductSubcategoryBelongsToProductCategoryLINK
	ADD FOREIGN KEY (ProductSubcategoryVID) REFERENCES ProductSubcategoryHUB (ProductSubcategoryVID)
GO

ALTER TABLE ProductVendorLINK
	ADD FOREIGN KEY (VendorVID) REFERENCES VendorHUB (VendorVID)
GO

ALTER TABLE PurchaseOrderDetailBelongsToPurchaseOrderLINK
	ADD FOREIGN KEY (PurchaseOrderDetailVID) REFERENCES PurchaseOrderDetailHUB (PurchaseOrderDetailVID)
GO

ALTER TABLE PurchaseOrderDetailBelongsToPurchaseOrderLINK
	ADD FOREIGN KEY (PurchaseOrderVID) REFERENCES PurchaseOrderHUB (PurchaseOrderVID)
GO

ALTER TABLE PurchaseOrderWasPlacedWithVendorLINK
	ADD FOREIGN KEY (VendorVID) REFERENCES VendorHUB (VendorVID)
GO

ALTER TABLE SalesOrderBillsCreditCardLINK
	ADD FOREIGN KEY (SalesOrderVID) REFERENCES SalesOrderHUB (SalesOrderVID)
GO

ALTER TABLE SalesOrderConvertsCurrencyAtCurrencyRateLINK
	ADD FOREIGN KEY (SalesOrderVID) REFERENCES SalesOrderHUB (SalesOrderVID)
GO

ALTER TABLE SalesOrderDetailAppliesSpecialOfferLINK
	ADD FOREIGN KEY (SalesOrderDetailVID) REFERENCES SalesOrderDetailHUB (SalesOrderDetailVID)
GO

ALTER TABLE SalesOrderDetailAppliesSpecialOfferLINK
	ADD FOREIGN KEY (SpecialOfferVID) REFERENCES SpecialOfferHUB (SpecialOfferVID)
GO

ALTER TABLE SalesOrderDetailBelongsToSalesOrderLINK
	ADD FOREIGN KEY (SalesOrderDetailVID) REFERENCES SalesOrderDetailHUB (SalesOrderDetailVID)
GO

ALTER TABLE SalesOrderDetailBelongsToSalesOrderLINK
	ADD FOREIGN KEY (SalesOrderVID) REFERENCES SalesOrderHUB (SalesOrderVID)
GO

ALTER TABLE SalesOrderIsAssignedToSalesTerritoryLINK
	ADD FOREIGN KEY (SalesTerritoryVID) REFERENCES SalesTerritoryHUB (SalesTerritoryVID)
GO

ALTER TABLE SalesOrderWasTakenBySalesPersonLINK
	ADD FOREIGN KEY (SalesPersonVID) REFERENCES SalesPersonHUB (SalesPersonVID)
GO

ALTER TABLE SalesPersonIsAssignedToSalesTerritoryLINK
	ADD FOREIGN KEY (SalesTerritoryVID) REFERENCES SalesTerritoryHUB (SalesTerritoryVID)
GO

ALTER TABLE SalesToStoreAreManagedBySalesPersonLINK
	ADD FOREIGN KEY (StoreVID) REFERENCES StoreHUB (StoreVID)
GO

ALTER TABLE TransactionAppliesToProductLINK
	ADD FOREIGN KEY (TransactionVID) REFERENCES TransactionHUB (TransactionVID)
GO
