/*
 * The Microsoft AdventureWorks database,
 * represented using the Constellation Query Language (CQL).
 *
 * AdventureWorks is available at <http://msftdbprodsamples.codeplex.com/>.
 * Your rights may be restricted by terms of the Microsoft Public License (Ms-PL).
 * Read them at <http://msftdbprodsamples.codeplex.com/license>
 *
 * This work is a derivative of the SQL Server 2008R2 OLTP database,
 * produced by reverse engineering the physical database snapshot.
 * Copyright 2016 Infinuendo Pty Ltd.
 * Read the LICENSE file for license terms.
 */
vocabulary AdventureWorks;

// SQL/CQL base types:
each uniqueidentifier is written as uniqueidentifier;
each Row GUID is written as uniqueidentifier;
each Time is written as Time;
each Date is written as datetime;
each money is written as money;
each smallmoney is written as smallmoney;
each Percentage is written as Decimal(8, 2);	// Bad modeling (as "smallmoney") in original
each Amount is written as money;
each Measure is written as Decimal(8, 2);   // For continuous quantities
each Count is written as Integer;	    // For discrete quantities, usually (as MeasureQty)
each Number is written as Integer;
each ID is written as Auto Counter;
each XML is written as Text;		    // (with facet xmlschema)
each URL is written as String(1024);

// User Defined Data Types:
each Name is written as a String(50);
each Phone Number is written as String(25);
each Account Number is written as String(15);
// each Flag is written as bit;
each Order Number is written as String(25);

// Value Types
each Description is written as String;
each Photo is written as varbinary;
each Revision Number is written as an Integer(8);
each Email Address Value is written as String(50);
each Hours is written as an Integer;

////////////////////////////////////////////////////////////////////////////////
// topic HumanResources;

each Department is identified by its ID;
Department has one Name, Name is of at most one Department;
Department has one group-Name;	// Avoid ambiguity; this is a new fact type
Department has one group-Name,
    group-Name is of Department;
// Department has one modified-Date;

each National ID Number	is written as String(15);
each Login ID is written as String(256);
each Job Title is written as String(50);
each Marital Status is written as Char(1) restricted to {'S', 'M'};
each Gender is written as Char(1) restricted to {'f', 'F', 'm', 'M'};
each OrganizationNode is written as hierarchyid;    // This is an SQL-Server-ism

each Employee [separate] is a kind of Person;
Employee belongs to one Department (as Organization Node);
// Employee is at one OrganizationLevel where... (derived from OrganizationNode)
Employee has one National ID Number, National ID Number is of Employee;
Employee has one Login ID,
    Login ID is of Employee;
Employee has one Job Title,
    Job Title is of Employee;
Employee has one birth-Date;
Employee has one Marital Status,
    Marital Status is of Employee;
Employee has one Gender,
    Gender is of Employee;
Employee has one hire-Date;
Employee (as Salaried Flag) is salaried;
Employee has one vacation- Hours;
Employee has one sick- leave Hours;
Employee (as Current Flag) is current;
// Employee has one Row GUID, Row GUID is of at most one Employee;
// Employee has one modified-Date;

each Shift is identified by its ID;
Shift has one Name,
    Name is of at most one Shift;
Shift starts at one start-Time;
Shift ends at one end-Time;
// Shift has one modified-Date;
each combination Name, Time(1), Time(2) occurs at most one time in
    Shift has Name,
    Shift starts at start-Time(1),
    Shift ends at end-Time(2);

each Employee Department History is where
    Employee started on start-Date in Department working Shift;
Employee Department History is valid until at most one end-Date;
// Employee Department History has one modified-Date;

each Employee Pay History is where
    pay of Employee was changed on rate- change Date;
Pay Frequency is written as tinyint restricted to {1, 2};   // 1=monthly, 2=biweekly
Employee Pay History is paid at one Pay Frequency;
Employee Pay History is at one Amount (as Rate);
// Employee Pay History has one modified-Date;

each Job Candidate is identified by its ID;
Job Candidate was hired as at most one Employee,
    Employee was at most one Job Candidate;
each Resume is written as XML;	 // (with xmlschema HR Resume)
Job Candidate supplied at most one Resume;
// Job Candidate has one modified-Date;

////////////////////////////////////////////////////////////////////////////////
// topic Person;

each Country Region Code is written as String(3);
each Country Region [static] is identified by its Code;
Country Region has one Name,
    Name is of at most one Country Region;

each State Province Code is written as Char(3);
each State Province [static] is identified by its ID;
State Province has one State Province Code;
State Province is in one Country Region;
each combination State Province Code, Country Region occurs at most one time in
    State Province has State Province Code,
    State Province is in Country Region;
State Province (as Is Only State Province Flag) is entire state;
State Province has one Name,
    Name is of at most one State Province;
// State Province has one modified-Date;
// State Province has one Row GUID, Row GUID is of at most one State Province;
each combination Country Region, State Province Code occurs at most one time in
    State Province is in Country Region,
    State Province has State Province Code;

each Address Type [static] is identified by its ID;
Address Type has one Name,	// e.g. Billing, Home, or Shipping
    Name is of at most one Address Type;
// Address Type has one Row GUID, Row GUID is of at most one Address Type;
// Address Type has one modified-Date;

// This is an SQL Server spatial data type that supports points, lines and polygons expressed in GPS latitude and longitude according to the OpenODC standard */
each Geography is written as Geography;

each Address Line is written as String(60);
each Address is identified by its ID;
each City Name is written as String(30);
each City [static] is identified by its Name;
each Postal Code is written as String(15);
Address has one Address Line (as Address Line1);
Address has at most one second- Address Line (as Address Line2);
Address is in one City;	    // REVISIT: Field will be CityName not City
Address has one Postal Code;
Address is in one State Province;
Address is in at most one Geography (as Spatial Location);
// Address has one Row GUID, Row GUID is of at most one Address;
// Address has one modified-Date;
each combination Address Line(1), Address Line(2), City, Postal Code, State Province occurs at most one time in
    Address has Address Line(1),
    Address has second Address Line(2),
    Address is in City,
    Address has Postal Code,
    Address is in State Province;

each Business Entity is identified by its ID;
// Business Entity has one Row GUID, Row GUID is of at most one Business Entity;
// Business Entity has one modified-Date;

// SC = Store Contact, IN = Individual (retail) customer, SP = Sales person, EM = Employee (non-sales), VC = Vendor contact, GC = General contact
// Should be a reference table containing these descriptive strings
each Person Type Code is written as Char(2) restricted to {'GC', 'SP', 'EM', 'IN', 'VC', 'SC'};
each Person Type [static] is identified by its Code;
each Personal Title is written as String(8);
each Name Suffix is written as String(10);
each Email Promotion Preference is written as Integer restricted to {0..2}; // None, only from us, from partners also

each Person [separate] is a kind of Business Entity;
each Vendor [separate] is a kind of Business Entity;
each Store [separate] is a kind of Business Entity;
for each Business Entity exactly one of these holds:
    Business Entity is a Person,
    Business Entity is a Store,
    Business Entity is a Vendor;

each Person is of one Person Type;
each Person (as Name Style) uses eastern name style;
each Person has at most one Personal Title (as Title);
Person has one first-Name, first-Name is of Person;
Person has at most one middle-Name, middle-Name is of Person;
Person has one last-Name, last-Name is of Person;
Person has at most one Name Suffix (as Suffix);
Person has one Email Promotion Preference (as Email Promotion);
each Additional Contact Info is written as XML;	// (with xmlschema Additional Contact Info)
each Demographics is written as XML;		// (with xmlschema Demographics)
Person has at most one Additional Contact Info;
Person has at most one Demographics;
// Person has one Row GUID, Row GUID is of at most one Person;
// Person has one modified-Date;

each Business Entity Address is where
    some Business Entity uses some Address as Address Type;
// Business Entity Address has one Row GUID, Row GUID is of at most one Business Entity Address;
// Business Entity Address has one modified-Date;

each Contact Type [static] is identified by its ID;
Contact Type has one Name,
    Name is of at most one Contact Type;
// Contact Type has one modified-Date;

each Business Entity Contact is where
    some Business Entity appoints some Person as Contact Type;
// Business Entity Contact has one modified-Date;
// Business Entity Contact has one Row GUID, Row GUID is of at most one Business Entity Contact;

each Email Address ID is written as ID;
each Email Address is identified by Person and Email Address ID where
    Email Address is used by one Person, Person uses Email Address,
    Email Address has one Email Address ID, Email Address ID is of Email Address;
Email Address has one Email Address Value (as EmailAddress);

each Password is identified by Person where
    Password is used by one Person,
    Person uses at most one Password;
each Password Hash is written as String(128);
each Password Salt is written as String(10);
Password has one Password Hash;
Password has one Password Salt;
// Password has one modified-Date;
// Password has one Row GUID, Row GUID is of at most one Password;

each Phone Number Type [static] is identified by its ID;
Phone Number Type has one Name,
    Name is of at most one Phone Number Type;
// Phone Number Type has one modified-Date;

each Person Phone is where
    some Person uses some Phone Number of Phone Number Type;
// Person Phone has one modified-Date;

////////////////////////////////////////////////////////////////////////////////
// topic Production;

each Unit Measure Code is written as Char(3);
each Unit Measure [static] is identified by its Code;
Unit Measure has one Name, Name is of at most one Unit Measure;
// Unit Measure has one modified-Date;

each Product Category is identified by its ID;
Product Category has one Name, Name is of at most one Product Category;
// Product Category has one modified-Date;
// Product Category has one Row GUID, Row GUID is of at most one Product Category;

each Product Subcategory is identified by its ID;
Product Subcategory has one Name, Name is of at most one Product Subcategory;
Product Subcategory belongs to one Product Category;
// Product Subcategory has one modified-Date;
// Product Subcategory has one Row GUID, Row GUID is of at most one Product Subcategory;

each Product Description XML is written as XML;	 // (with xmlschema Product Description)
each Manufacturer Instructions is written as XML;	 // (with xmlschema ManuInstructions)
each Product Model is identified by its ID;
Product Model has one Name,
    Name is of at most one Product Model;
Product Model is described by at most one Product Description XML (as Catalog Description);
Product Model has at most one Manufacturer Instructions (as Instructions);	// XML
// Product Model has one modified-Date;
// Product Model has one Row GUID, Row GUID is of at most one Product Model;

each Product Number is written as String(25);
each Color is written as String(15);
each Product Size is written as String(5);
each Product Weight is written as Measure;
each Product Line Name is written as Char(2) restricted to {'R', 'M', 'T', 'S'}; // Road, Mountain, Touring, Standard
each Product Line [static] is identified by its Name;
each Product Class is written as Char(2) restricted to {'H', 'M', 'L'};	// High, medium, Low
each Product Style is written as Char(2) restricted to {'W', 'M', 'U'};	// Womens, Mens, Universal

each Product is identified by its ID;
Product has one Name,
    Name is of at most one Product;
Product has one Product Number,
    Product Number is of at most one Product;

Product is of at most one [satellite Product Group] Color;
Product has at most one [satellite Product Group] Product Size (as Size);
Product size is in at most one [satellite Product Group] size-Unit Measure;
Product weight is in at most one [satellite Product Group] weight-Unit Measure;
Product has at most one [satellite Product Group] Product Weight (as Weight);
Product belongs to at most one [satellite Product Group] Product Line;
Product is of at most one [satellite Product Group] Product Class (as Class);
Product is of at most one [satellite Product Group] Product Style (as Style);
Product belongs to at most one [satellite Product Group] Product Subcategory (as Product Subcategory);
Product is of at most one [satellite Product Group] Product Model (as Product Model);

Product should be stocked at least in one [satellite ProductSupply] minimum-Number (as Safety Stock Level);
Product should be re-ordered when inventory drops below one [satellite ProductSupply] minimum-Number (as Reorder Point);
Product takes one [satellite ProductSupply] Number (as Days To Manufacture) of days to manufacture;

Product (as Finished Goods Flag) is saleable;
Product has one [satellite GroupSales] standard- cost Amount (as Standard Cost);
Product has one [satellite ProductSales] list- price Amount (as List Price);
Product was first available on one [satellite ProductSales] sell- start Date;
Product is last available on at most one [satellite ProductSales] sell- end Date;
Product was discontinued on at most one [satellite ProductSales] discontinued- Date;
// Product has one modified-Date;
// Product has one Row GUID, Row GUID is of at most one Product;

each Illustration is identified by its ID;
Illustration has one diagram- XML (as Diagram);
// Illustration has one modified-Date;

each Product Model Illustration is where
    Product Model has Illustration;
// Product Model Illustration has one modified-Date;

each Product Description Text is written as String(400);
each Product Description is identified by its ID;
Product Description has one Product Description Text (as Description);
// Product Description has one Row GUID, Row GUID is of at most one Product Description;
// Product Description has one modified-Date;

// Location is a manufacturing location
each Location is identified by its ID; // (with length 16)
Location has one Name,
    Name is of at most one Location;
Location has one cost-smallmoney (as Cost Rate);
each Hours2 is written as Decimal(8, 2);
Location has one work- capacity Hours2 (as Availability);   // Work capacity (in hours) of the manufacturing location

each Bill Of Materials is identified by its ID where
    Product (as Product Assembly) includes Product (as Component) from start-Date;
Bill Of Materials is valid until at most one end-Date;
Bill Of Materials has one Unit Measure;
Bill Of Materials has one assembly- Measure (as Per Assembly Qty);
each BOM Level is written as Integer(16);
Bill Of Materials has one BOM Level;
// Bill Of Materials has one modified-Date;

each Culture [static] is identified by its ID;
Culture has one Name,
    Name is of at most one Culture;
// Culture has one modified-Date;

each Product Model Product Description Culture is where
    Product Model has Product Description for Culture;
// Product Model Product Description Culture has one modified-Date;

each Document ID is written as a hierarchyid;
each Document is identified by its ID;
Document belongs to at most one parent-Document;	// REVISIT: This is implicit in the hierarchyid
// Document is at DocumentLevel where DocumentLevel = Level(DocumentID) and DocumentID is of Document;
each Document Title is written as String(50);
Document has one Document Title (as Title);
Document is responsibility of one Employee (as Owner);
each Document Status is written as Integer(8) restricted to {1..3};
Document (as Folder Flag) is folder;
each Document File Name is written as String(400);
Document has one Document File Name;
each File Extension is written as String(8);
Document has one File Extension;
each Document Revision is written as Char(5);
Document has one Document Revision;
Document Change Number is written as Integer;
Document has one Document Change Number (as Change Number);
Document has one Document Status (as Status);	// 1='Pending approval', 2='Approved', 3='Obsolete'
each Document Summary is written as Text;
each Document Content is written as Text;
Document has at most one Document Summary;
Document has at most one Document Content (as Document);
// Document has one Row GUID, Row GUID is of at most one Document;
// Document has one modified-Date;

each Product Cost History is where
    Product was costed on start-Date;
Product Cost History is valid until at most one end-Date;
Product Cost History has one Amount (as Standard Cost);
// Product Cost History has one modified-Date;

each Product Document is where
    Product is described by Document,
    Document applies to Product;
// Product Document has one modified-Date;

each Shelf is written as String(10);
each Bin is written as Integer(8);
each Product Inventory is where
    Product is available at Location;
Product Inventory is on one Shelf;
Product Inventory is in one Bin;
Product Inventory has one Count (as Quantity);
// Product Inventory has one Row GUID, Row GUID is of at most one Product Inventory;
// Product Inventory has one modified-Date;

each Product List Price History is where
    Product was priced on start-Date;
Product List Price History is valid until at most one end-Date;
Product List Price History has one Amount (as List Price);
// Product List Price History has one modified-Date;

each Photo File Name is written as String(50);
each Product Photo is identified by its ID;
Product Photo has at most one thumb- nail Photo;
Product Photo has at most one thumbnail- Photo File Name;
Product Photo has at most one large- Photo;
Product Photo has at most one large- Photo File Name;
// Product Photo has one modified-Date;

each Product Product Photo is where
    some Product has some Product Photo;
Product Product Photo (as Primary) is primary;
// Product Product Photo has one modified-Date;

each Product Review is identified by its ID where
    Product was reviewed by reviewer- Name on one review- Date;
Product Review has one Email Address Value (as EmailAddress);
each Product Rating is written as Integer restricted to {1..5};
Product Review assigned one Product Rating (as Rating);
each Product Review Comments is written as String(3850);
Product Review has at most one Product Review Comments (as Comments);
// Product Review has one modified-Date;

each Scrap Reason [static] is identified by its ID;
Scrap Reason has one Name, Name is of at most one Scrap Reason;
// Scrap Reason has one modified-Date;

each Transaction ID is written as an ID;    // (with startID 10000)

each Reference Order ID is written as Integer;
each Reference Order Line ID is written as Integer;
each Transaction is identified by its ID;
Transaction applies to one Product;
Transaction applies to one Reference Order ID;
Transaction applies to one Reference Order Line ID;
Transaction has one transaction-Date;
Transaction Type is written as Char(1);
Transaction has one Transaction Type;
Transaction has one Count (as Quantity);
Transaction has one Amount (as Actual Cost);
// Transaction has one modified-Date;

each Transaction History [partitioned] is a kind of Transaction;
// REVISIT: ID of Archive table should not be auto-assigned
each Transaction History Archive [partitioned] is a kind of Transaction;
either Transaction is a Transaction History or Transaction is a Transaction History Archive but not both;

each Work Order is identified by its ID;
Work Order is for one Product;
Work Order is for one ordered- Count (as Order Qty);
/* REVISIT: Derived Fact Type
Stocked Qty is written as Count;
Work Order has Stocked Qty where
    Work Order has Order Qty,
    Work Order has Stocked Qty,
    Stocked Qty = Order Qty - Scrapped Qty,
*/
Work Order has one start-Date;
Work Order is valid until at most one end-Date;
Work Order has one due-Date;
Work Order has one scrapped- Count (as Scrapped Qty);
Work Order has at most one Scrap Reason;
// Work Order has one modified-Date;

each Operation Sequence is written as an Integer(16);
each Resource Hours is written as Decimal(9,4);
each Work Order Routing is where
    Work Order activity on Product involves Operation Sequence;
Work Order Routing is performed at one Location,
    Location performed Work Order Routing;
Work Order Routing has one scheduled- start Date;
Work Order Routing has one scheduled- end Date;
Work Order Routing has at most one actual- start Date;
Work Order Routing has at most one actual- end Date;
Work Order Routing took at most one actual- Resource Hours;
Work Order Routing is anticipated to cost one Amount (as Planned Cost);
Work Order Routing cost at most one Amount (as Actual Cost);
// Work Order Routing has one modified-Date;

////////////////////////////////////////////////////////////////////////////////
// topic Purchasing;

Vendor has one Account Number,
     Account Number is of at most one Vendor;
Vendor has one Name,
     Name is of at most one Vendor;
each Credit Rating is written as tinyint;
Vendor has one Credit Rating;
Vendor (as Preferred Vendor Status) is preferred;
Vendor (as Active Flag) is active;
Vendor has at most one purchasing- web service URL;
// Vendor has one modified-Date;

each Product Vendor is where
    some Product is sourced from some Vendor;
Product Vendor averages one Count (as Average Lead Time) days to deliver;
Product Vendor asks one Amount (as Standard Price);
Product Vendor was paid at most one Amount (as Last Receipt Cost);
Product Vendor was paid on at most one last- receipt Date;
Product Vendor has one minimum- Count (as Min Order Qty);
Product Vendor has one maximum- Count (as Max Order Qty);
Product Vendor has one outstanding- Count (as On Order Qty);
Product Vendor has one Unit Measure;
// Product Vendor has one modified-Date;

each Ship Method [static] is identified by its ID;
Ship Method has one Name,
     Name is of at most one Ship Method;
Ship Method has one base- Amount (as Ship Base);
Ship Method has one rate- Amount (as Ship Rate);
// Ship Method has one Row GUID, Row GUID is of at most one Ship Method;
// Ship Method has one modified-Date;

each Purchase Order Status Code is written as Integer(8) restricted to {1..8};
each Purchase Order Status Text is written as String(15);
each Purchase Order Status [static] is identified by its Code;
Purchase Order Status is described by one Purchase Order Status Text,
    Purchase Order Status Text is of at most one Purchase Order Status;
Purchase Order Status 1 is described by Purchase Order Status Text 'Pending';
Purchase Order Status 2 is described by Purchase Order Status Text 'Approved';
Purchase Order Status 3 is described by Purchase Order Status Text 'Rejected';
Purchase Order Status 4 is described by Purchase Order Status Text 'Complete';

each Purchase Order Number is written as an Order Number;
each Purchase Order is identified by its ID;	// Wrongly called Purchase Order Header in original
Purchase Order has one Purchase Order Number;
Purchase Order has one Revision Number;
Purchase Order has one Purchase Order Status (as Status);
Purchase Order was made by one Employee;
Purchase Order was placed with one Vendor;
Purchase Order requests one Ship Method;
Purchase Order was made on one order- Date;
Purchase Order was shipped on at most one ship- Date;
Purchase Order is worth one Amount (as Sub Total);
Purchase Order includes one tax- Amount (as Tax Amt);
Purchase Order freight costs one Amount (as Freight);
// Purchase Order totals Amount (as Total Due) where Total Due = Sub Total + Tax Amt + Freight;
// Purchase Order has one modified-Date;

each Purchase Order Detail ID is written as an ID;
each Purchase Order Detail is identified by Purchase Order and Purchase Order Detail ID where
    Purchase Order includes Purchase Order Detail,
    Purchase Order Detail belongs to one Purchase Order,
    Purchase Order Detail has one Purchase Order Detail ID,
    Purchase Order Detail ID is of Purchase Order Detail;
Purchase Order Detail has one due-Date;
Purchase Order Detail is for one Count (as Order Qty);
Purchase Order Detail is for one Product;
Purchase Order Detail costs one unit-Amount (as Unit Price);
// Purchase Order Detail has one line- total Amount where ...
Purchase Order Detail has one received- Measure (as Received Qty);
Purchase Order Detail has one rejected- Measure (as Rejected Qty);
// Purchase Order Detail has one stocked- Measure where ...
// Purchase Order Detail has one modified-Date;

////////////////////////////////////////////////////////////////////////////////
// topic Sales;

each Card Type is written as String(50);
each Card Number is written as String(25);
each Expiry Month is written as tinyint;
each Expiry Year is written as smallint;
each Credit Card is identified by its ID;
Credit Card has one Card Type;
Credit Card has one Card Number, Card Number is of at most one Credit Card;
Credit Card has one Expiry Month (as Exp Month);
Credit Card has one Expiry Year (as Exp Year);
// Credit Card has one modified-Date;

each Currency Code is written as a Char(3);
each Currency [static] is identified by its Code;
Currency has one Name,
     Name is of at most one Currency;
// Currency has one modified-Date;

each Country Region Currency [static] is where
    Country Region uses Currency;
// Country Region Currency has one modified-Date;

each Currency Rate is identified by its ID where
    from-Currency converts to to-Currency on Date (as Currency Rate Date);
    // Link fact type readings are not yet supported by the CQL compiler:
    // Currency Rate applies at one currency- rate Date,
    // Currency Rate converts one from-Currency,
    // Currency Rate converts one to-Currency;
Currency Rate applies at one average-Amount (as Average Rate);
Currency Rate has one end- of day Amount (as End Of Day Rate);
// Currency Rate has one modified-Date;

each Territory ID is written as an ID;
each Sales Territory is identified by Territory ID where
    Sales Territory has one Territory ID,
    Territory ID is of at most one Sales Territory;
Sales Territory has one Name,
    Name is of at most one Sales Territory;
Sales Territory covers State Province,
    State Province is in one Sales Territory;  // REVISIT: (as Territory),
Sales Territory Group is identified by its Name;
Sales Territory is in one Sales Territory Group (as Group);
Sales Territory sold one Amount (as Sales YTD) this year;
Sales Territory sold one Amount (as Sales Last Year) last year;
Sales Territory cost one Amount (as Cost YTD) this year;
Sales Territory cost one Amount (as Cost Last Year) last year;
// Sales Territory has one Row GUID, Row GUID is of at most one Sales Territory;
// Sales Territory has one modified-Date;

each Sales Person [separate] is a kind of Employee;
Sales Person is assigned to at most one Sales Territory; // REVISIT: (as Territory);
Sales Person should sell at most one quota- Amount (as Sales Quota);
Sales Person may receive one bonus- Amount (as Bonus);
Sales Person receives one commission- Percentage (as Commission Pct);
Sales Person has sold one Amount (as Sales YTD) this year;
Sales Person sold one Amount (as Sales Last Year) last year;
// Sales Person has one Row GUID, Row GUID is of at most one Sales Person;
// Sales Person has one modified-Date;

each Sales Person Quota History is where
    Sales Person had quota to quota-Date of one Amount (as Sales Quota);
// Sales Person Quota History has one Row GUID, Row GUID is of at most one Sales Person Quota History;
// Sales Person Quota History has one modified-Date;

each Sales Territory History is where
    some Sales Person was assigned on start-Date to some Sales Territory, // REVISIT: (as Territory),
    that Sales Person worked that Sales Territory from start-Date,
    that Sales Territory was worked by that Sales Person from start-Date;
Sales Territory History is valid until at most one end-Date;
// Sales Territory History has one Row GUID, Row GUID is of at most one Sales Territory History
// Sales Territory History has one modified-Date;

Store has one Name, Name is of Store; // Store names are not unique
sales to Store are managed by at most one Sales Person;
each Store Survey is written as XML;	 // (with xmlschema Store Survey)
Store has at most one Store Survey (as Demographics);
// Store has one Row GUID, Row GUID is of at most one Store;
// Store has one modified-Date;

each Customer is identified by its ID;
Customer is at most one Person;
Customer is at most one Store;
either Customer is Person or Customer is Store but not both;
Customer belongs to at most one Sales Territory;
Account Number is written as String(16);
Customer has one Account Number,
    Account Number is of at most one Customer;
// Customer has Account Number where Customer has Customer ID and Account Number = 'AW' + ZeroPad(Customer ID);
// Customer has one Row GUID, Row GUID is of at most one Customer;
// Customer has one modified-Date;

each Person Credit Card is where
    some Person uses some Credit Card;
// Person Credit Card has one modified-Date;

each Special Offer Description is written as Description(255);
Special Offer Type is written as String(50);
Special Offer Category is written as String(50);
each Special Offer is identified by its ID;
Special Offer has one Special Offer Description (as Description);
Special Offer has one discount-Percentage (as Discount Pct);
Special Offer is of one Special Offer Type (as Type);
Special Offer belongs to one Special Offer Category (as Category);
Special Offer starts on one start-Date;
Special Offer is valid until one end-Date;
Special Offer applies to one min-Count (as Min Qty);
Special Offer applies to one max-Count (as Max Qty);
// Special Offer has one Row GUID, Row GUID is of at most one Special Offer;
// Special Offer has one modified-Date;

each Special Offer Product is where
    some Special Offer includes at least one Product;
// Special Offer Product has one Row GUID, Row GUID is of at most one Special Offer Product;
// Special Offer Product has one modified-Date;

each Sales Order Status Code is written as Integer(8) restricted to {1..8};
each Sales Order Status Text is written as String(15);
each Sales Order Status [static] is identified by its Code;
Sales Order Status is described by one Sales Order Status Text,
    Sales Order Status Text is of at most one Sales Order Status;

Sales Order Status 1 is described by Sales Order Status Text 'In process';
Sales Order Status 2 is described by Sales Order Status Text 'Approved';
Sales Order Status 3 is described by Sales Order Status Text 'Backordered';
Sales Order Status 4 is described by Sales Order Status Text 'Rejected';
Sales Order Status 5 is described by Sales Order Status Text 'Shipped';
Sales Order Status 6 is described by Sales Order Status Text 'Cancelled';

each Sales Order is identified by its ID;   // Wrongly called Sales Order Header in original
Sales Order has one Revision Number;
Sales Order was ordered on one order-Date;
Sales Order should be shipped by one due-Date;
Sales Order was shipped on at most one ship-Date;
Sales Order has one Sales Order Status (as Status);
Sales Order (as Online Order Flag) was entered online;
each Sales Order Number is written as an Order Number; // matching 'SO0*[1-9][0-9]*';
Sales Order has one Sales Order Number,
    Sales Order Number is of at most one Sales Order;	// where ... 'SO' + 
Sales Order corresponds to at most one customers- Purchase Order Number (as Purchase Order Number);
Sales Order is on at most one customers- Account Number (as Account Number);
Sales Order is from one Customer;
Sales Order was taken by at most one Sales Person;
Sales Order is assigned to at most one Sales Territory; // (as Territory);
Sales Order has one bill- to Address;
Sales Order has one ship- to Address;
Sales Order has one Ship Method;
Sales Order bills at most one Credit Card;
each Credit Card Approval Code is written as String(15);
Sales Order has at most one Credit Card Approval Code;
Sales Order converts currency at at most one Currency Rate;
Sales Order is worth one Amount (as Sub Total);
Sales Order includes one tax- Amount (as Tax Amt);
Sales Order freight costs one Amount (as Freight);
// Sales Order totals Amount (as Total Due) where Total Due = Sub Total + Tax Amt + Freight;
each Sales Order Comment is written as String(128);
Sales Order has at most one Sales Order Comment;
// Sales Order has one Row GUID, Row GUID is of at most one Sales Order;
// Sales Order has one modified-Date;

each Sales Order Detail ID is written as an ID;
each Sales Order Detail is identified by Sales Order and Sales Order Detail ID where
    Sales Order includes Sales Order Detail,
    Sales Order Detail belongs to one Sales Order,
    Sales Order Detail has one Sales Order Detail ID,
    Sales Order Detail ID is of Sales Order Detail;
Carrier Tracking Number is written as String(25);
Sales Order Detail has at most one Carrier Tracking Number;
Sales Order Detail is for one Count (as Order Qty);
Sales Order Detail is for one Product;
Sales Order Detail applies at most one Special Offer;
Sales Order Detail has one unit-Amount (as Unit Price);
Sales Order Detail applies one unit- discount Amount (as Unit Price Discount);
// Sales Order Detail has one line- total Amount where ...
// Sales Order Detail has one Row GUID, Row GUID is of at most one Sales Order Detail;
// Sales Order Detail has one modified-Date;

each Sales Reason [static] is identified by its ID;
Sales Reason has one Name,
     Name is of at most one Sales Reason;
Sales Reason Type is identified by its Name;
Sales Reason is of one Sales Reason Type (as Reason Type);
// Sales Reason has one modified-Date;

each Sales Order Sales Reason is where
    Sales Order has Sales Reason;
// Sales Order Sales Reason has one modified-Date;

each Tax Type is written as Integer(8) restricted to {1..3};
each Sales Tax Rate [static] is identified by its ID where
    some State Province applies some Tax Type;
Sales Tax Rate applies at one Amount (as Tax Rate);
Sales Tax Rate has one Name,
    Name is of at most one Sales Tax Rate;
// Sales Tax Rate has one Row GUID, Row GUID is of at most one Sales Tax Rate
// Sales Tax Rate has one modified-Date;

each Shopping Cart ID is written as String(50);
each Shopping Cart is identified by its ID;
each Shopping Cart Item is identified by its ID;
Shopping Cart Item is in one Shopping Cart;
Shopping Cart Item is for one Number (as Quantity);
Shopping Cart Item is for one Product;
Shopping Cart Item was created on one Date (as Date Created);
// Shopping Cart Item has one modified-Date;

////////////////////////////////////////////////////////////////////////////////
// topic dbo;

each AWBuild Version is identified by its ID;
/*
	SystemInformationID	tinyint IDENTITY NOT NULL,
	[Database Version] nvarchar(25) NOT NULL,
	VersionDate		datetime NOT NULL,
	ModifiedDate		datetime NOT NULL,
	CONSTRAINT PK_AWBuildVersion_SystemInformationID PRIMARY KEY CLUSTERED (SystemInformationID)
*/

each Database Log is identified by its ID;
/*
	DatabaseLogID		int IDENTITY NOT NULL,
	PostTime		datetime NOT NULL,
	DatabaseUser		sysname NOT NULL,
	Event			sysname NOT NULL,
	Schema			sysname NULL,
	Object			sysname NULL,
	TSQL nvarchar(max) NOT NULL,
	XmlEvent		xml NOT NULL,
	CONSTRAINT PK_DatabaseLog_DatabaseLogID PRIMARY KEY NONCLUSTERED (DatabaseLogID)
*/

each Error Log is identified by its ID;
/*
	ErrorLogID		int IDENTITY NOT NULL,
	ErrorTime		datetime NOT NULL,
	UserName		sysname NOT NULL,
	ErrorNumber		int NOT NULL,
	ErrorSeverity		int NULL,
	ErrorState		int NULL,
	ErrorProcedure		nvarchar(126) NULL,
	ErrorLine		int NULL,
	ErrorMessage		nvarchar(4000) NOT NULL,
	CONSTRAINT PK_ErrorLog_ErrorLogID PRIMARY KEY CLUSTERED (ErrorLogID)
*/
