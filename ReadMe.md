# AdventureWorks Fact-Based examples

This repository showcases Infinuendo technologies applied to the well-known AdventureWorks
example database designs published by Microsoft. The original files are published at
http://msftdbprodsamples.codeplex.com/ and are subject to the
[Microsoft Public License (Ms-PL)](http://msftdbprodsamples.codeplex.com/license)

## Directories

* OLTP

   Online (normalised) versions of the database.

   * Original
   
   This directory contains a UTF-8 version of the original AdventureWorks 2008 OLTP schema
   as published at the above URL. The test data CSV files have been pushed down into the
   [TestData](OLTP/Original/TestData) subdirectory. Microsoft's [schema diagrams](OLTP/images)
   are also republished.

   * New ER Schema diagrams for the original

   An [alternate set of three schema diagrams](OLTP/images) for the original database, printable on A4 paper.

   * Database generated from the CQL version

   The file [AdventureWorks.sql](OLTP/AdventureWorks.sql) contains SQL for an operational 
   (OLTP) schema, generated from the CQL using the ActiveFacts **schema_compositor**.

* CQL

   The [AdventureWorks schema reverse-engineered](CQL/AdventureWorks.cql) into the [Constellation Query Language](http://www.infinuendo.com/introduction-to-cql/).
   This version can be processed using the [ActiveFacts]:(http://github.com/cjheath/activefacts) compiler
   and code generators *afgen* and *schema_compositor*.

* ORM2

   The AdventureWorks schema reverse-engineered as an [Object Role Model](http://www.orm.net/).
   This schema is largely congruent with the CQL version, with the exception of using a different
   data type system. Tasks in the Rakefile assist in detecting differences.

* DataVault

   Data warehouses constructed using the Data Vault design approach of Dan Linstedt.
   Dan's [original blog post](DataVault/DanLinstedt.html) and [files](DataVault/DanLinstedt/) are republished,
   because the originals can be hard to find. His [schema diagram](DataVault/DanLinstedt/AdventureWorks_A2Paper_V4.pdf)
   is included.

   The original version was produced by a code generator that has some errors in the SQL Server version.
   These errors were corrected in a blog post by by [Hans Geurtsen](DataVault/HansGeurtsen.html), and an
   [English version](DataVault/HansGeurtsen_EN.txt) is here courtesy of Google Translate.

   The file [AdventureWorks.dv.sql](DataVault/AdventureWorks.dv.sql) contains SQL for a data vault
   schema, generated from the CQL using the ActiveFacts **schema_compositor**. (not yet published).
