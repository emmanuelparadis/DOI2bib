# DOI2bib
This R script requires some DOIs and writes the full references in a .bib file.

Version 2 (_v2) is more reliable as it closes the connection if it fails to open before trying to read the data.

The DOIs can be input in any way (with `scan()`, `read.table()` `read.csv()` ...)

The references are downloaded from [https://dx.doi.org/](https://dx.doi.org/), thus requiring a (preferably descent) Internet connection.
