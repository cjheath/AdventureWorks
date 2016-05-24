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
   [TestData](OLTP/Original/TestData) subdirectory. Microsoft's [schema diagrams](OLTP/Original/images)
   are also republished.

   * New ER Schema diagrams for the original

   An [alternate set of three schema diagrams](OLTP/images) for the original database, printable on A4 paper.

   * Database generated from the CQL version

   The file [AdventureWorks.sql](OLTP/AdventureWorks.sql) contains SQL for an operational 
   (OLTP) schema, generated from the CQL using the ActiveFacts **schema_compositor**.

* CQL

   The [AdventureWorks schema reverse-engineered](CQL/AdventureWorks.cql) into the
   [Constellation Query Language](http://www.infinuendo.com/introduction-to-cql/).
   This version can be processed using the [ActiveFacts]:(http://github.com/cjheath/activefacts)
   compiler and code generators *afgen* and *schema_compositor*.

   [Colorized CQL](CQL/AdventureWorks.cql.html) makes it even easier to read.

   A [browsable business glossary](CQL/AdventureWorks.html) was generated from the CQL.

   This version does not contain the CQL for the seven XML document types, reverse-engineered
   from the XSD files that are embedded in the original schema - however this is also a
   logical part of such a reverse engineering exercise.

* ORM2

   The [AdventureWorks schema reverse-engineered](ORM2/images) as an [Object Role Model](http://www.orm.net/).
   This schema is largely congruent with the CQL version, with the exception of using a different
   data type system. The [NORMA source file](ORM2/AdventureWorks.orm) is also available.
   Tasks in the Rakefile assist in detecting differences from the CQL version.

* DataVault

   Data warehouses constructed using the Data Vault design approach of Dan Linstedt.

   * Dan's original Data Vault version

   Dan's [original blog post](DataVault/DanLinstedt.html) and [files](DataVault/DanLinstedt/) are republished,
   because the originals can be hard to find. His [schema diagram](DataVault/DanLinstedt/AdventureWorks_A2Paper_V4.pdf)
   is included.

   * Hans Geurtsen's revision

   The original version was produced by a code generator that has some errors in the SQL Server version.
   These errors were corrected in a blog post by [Hans Geurtsen](DataVault/HansGeurtsen.html), of which
   [an English version](DataVault/HansGeurtsen_EN.txt) is here courtesy of Google Translate.

   * Data Vault schema <b>generated from CQL</b>

   The file [AdventureWorks.dv.sql](DataVault/AdventureWorks.dv.sql) contains SQL for a data vault
   schema, generated from the CQL using the ActiveFacts **schema_compositor**.

   This version is substantially similar to Dan Linstedt's version, but does not have the small
   errors that creep in whenever a human is "in the loop". This demonstrates the advantages of
   the machine-generated approach.
