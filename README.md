searchtobibtex: tools to manage bibtex and pdfs via crossref searches
=====================================================

pdftobibtex − Retrieves bibtex data for PDFs of journal papers, by performing a crossref search query via the DOI.

pdf-rename-by-doi − Renames PDFs of journal papers, by performing a crossref search query to retrieve author, year, journal and title data.

searchtobibtex − Performs a crossref search query to retrieve bibtex data.

searchtobrowser − Performs a crossref search query to find digital object identifiers and opens up the resulting webpages.


pdf-rename-by-doi
=================

pdf-rename-by-doi − Renames PDFs of journal papers, by performing a crossref search query to retrieve author, year, journal and title data.

SYNOPSIS
--------

**pdf-rename-by-doi** [**-v**] [**-f** *KEYFORMAT*] *PDF\_FILES*

**pdf-rename-by-doi** [**-v**] [**-f** *KEYFORMAT*] [**-d**] *DOI*  *PDF\_FILE*

DESCRIPTION
-----------

This program searches the first two pages of the PDF for a DOI. It looks up that DOI using the crossref API, and renames the PDF according to the format string *KEYFORMAT*.

OPTIONS
-------

**-v**
Verbose mode: write information about the move operation to stdout. Skipped files or directories are always written to stderr.

**-f** *KEYFORMAT*

The format string passed to **bibtool**, to generate the bibtex key. Defaults to ’%3n(author)-(journal)-(title)-%+4d(\$year)’ (see man(1) bibtool). The (journal) and (title) options are parsed before being passed to bibtool.

**-d** *DOI*
Instead of scraping the PDF file for a DOI, specify the DOI as an argument. In this case, you can only rename one file at a time.

EXAMPLES
--------

To rename all PDF files in-place in the directory called papers,

**pdf-rename-by-doi** papers/\*.pdf

To rename all PDF files in the directory called papers, sorting into a
 new subdirectory named by year,

**pdf-rename-by-doi** -f ’%+4d(year)/%3n(author)-(journal)-(title)-%+4d(year)’ papers/\*.pdf

To rename all PDF files in-place in subdirectories of the directory
 called papers

**pdf-rename-by-doi** papers/\*/\*.pdf



pdftobibtex
===========

pdftobibtex − Retrieves bibtex data for PDFs of journal papers, by performing a crossref search query via the DOI.

SYNOPSIS
--------

**pdftobibtex** [**-f** *KEYFORMAT*] *PDF\_FILES*

DESCRIPTION
-----------

This program searches the first two pages of the PDF for a DOI. It looks up that DOI using the crossref API, and dumps the retrieved bibtex entry to stdout. The bibtex key is formatted according to the format string *KEYFORMAT*.

OPTIONS
-------

**-f** *KEYFORMAT*

The format string passed to **bibtool**, to generate the bibtex key. Defaults to ’%3n(author):%+4d(\$year)’ (see man(1) bibtool).

EXAMPLES
--------

To find bibtex entries for all pdf files in the directory called
 papers, and append them to a file called mybib.bib,

**pdftobibtex** papers/\*.pdf \>\> mybib.bib



searchtobibtex
==============

searchtobibtex − Performs a crossref search query to retrieve bibtex data.

SYNOPSIS
--------

**searchtobibtex** [**-r** *NUM*] [**-y** *YEAR*] [**-f** *KEYFORMAT*] *SEARCH\_STRING*

DESCRIPTION
-----------

This program performs a freeform crossref search query agains the string *SEARCH\_STRING* and dumps the resulting bibtex data to stdout.

OPTIONS
-------

**-r** *NUM*

Return only NUM results (default 1)

**-y** *YEAR*

Restrict results to year=YEAR

**-f** *KEYFORMAT*

The format string passed to **bibtool**, to generate the bibtex key. Defaults to ’%3n(author):%+4d(\$year)’ (see man(1) bibtool).

EXAMPLES
--------

To append to the ’mybibliography.bib’ file the bibloagraphic data from
 a freeform lookup, with year specified:

**searchtobibtex** -y 1953 "A structure for deoxyribonucleaic acid Watson Crick" \>\> mybibliography.bib

To write to stdout the first five papers by someone called Einstein in
 1905, try

**searchtobibtex** -r 5 -y 1905 "Einstein"



SEARCHTOBROWSER
===============

NAME
----

searchtobrowser − Performs a crossref search query to find digital object identifiers and opens up the resulting webpages.

SYNOPSIS
--------

**searchtobrowser** [**-r** *NUM*] [**-y** *YEAR*] [**-b** *BROWSER*] *SEARCH\_STRING*

DESCRIPTION
-----------

This program performs a freeform crossref search query agains the string *SEARCH\_STRING* and opens up the associated web pages in your browser.

OPTIONS
-------

**-r** *NUM*

Return only NUM results (default 1)

**-y** *YEAR*

Restrict results to year=YEAR

**-b** *BROWSER*

Specify the browser command to use. Defaults to x-www-browser.

EXAMPLES
--------

To open up the page for the paper matching a search and restricting
 results to 1953:

**searchtobrowser** -y 1953 "A structure for deoxyribonucleaic acid Watson Crick"

To open the first five papers by someone called Einstein in 1905, try

**searchtobrowser** -r 5 -y 1905 "Einstein"

To do the same but in chromium, try

**searchtobrowser** -b chromium -r 5 -y 1905 "Einstein"

AUTHOR
------

Ati Sharma a.sharma@soton.ac.uk

REPORTING BUGS
--------------

Please email the author with any bugs.

COPYRIGHT
---------

Copyright (C) 2015 Ati Sharma License GPLv3+: GNU GPL version 3 or later \<http://gnu.org/licenses/gpl.html\>.
 This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
--------

**pdf-rename-by-doi**(1), **pdftobibtex**(1), **doitobibtex**(1), **bibtool**(1), **bibclean**(1)

