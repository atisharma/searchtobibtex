DOITOBIBTEX, PDF-RENAME-BY-DOI, PDFTOBIBTEX, SEARCHTOBIBTEX
=====================================================

doitobibtex − Pulls bibtex data from a supplied doi URL via the crossref API.

pdftobibtex − Retrieves bibtex data for PDFs of journal papers, by performing a crossref search query via the DOI.

pdf-rename-by-doi − Renames PDFs of journal papers, by performing a crossref search query to retrieve author, year, journal and title data.

searchtobibtex − Performs a crossref search query to retrieve bibtex data.

doitobibtex
===========

doitobibtex − Pulls bibtex data from a supplied doi URL via the crossref API.

SYNOPSIS
--------

**doitobibtex** [**-f** *KEYFORMAT*] *DOI*

DESCRIPTION
-----------

This program pulls bibtex data from a supplied DOI (as a URL in http://dx.doi.org form, or pure DOI form as in the example) via the crossref API. The output is dumped to stdout. The bibtex entry is cleaned using bibclean and bibtool.

OPTIONS
-------

**−f** *KEYFORMAT*

The format string passed to **bibtool**, to generate the bibtex key. Defaults to ’%3n(author):%+4d(\$year)’ (see man(1) bibtool).

EXAMPLE
-------

To append the bibloagraphic data from a DOI lookup to the
 ’mybibliography.bib’ file,

**doitobibtex** 0.1017/jfm.2013.286 \>\> mybibliography.bib

or to dump the key to stdout, with a different key formatting,

**doitobibtex** −f ’%1n(author)-%+4d(year)’ http://dx.doi.org/0.1017/jfm.2013.286

COMMENTS
--------

Requires **bibclean** and **bibtool**.


pdf-rename-by-doi
=================

pdf-rename-by-doi − Renames PDFs of journal papers, by performing a crossref search query to retrieve author, year, journal and title data.

SYNOPSIS
--------

**pdf-rename-by-doi** [**-v**] [**-f** *KEYFORMAT*] *PDF\_FILES*

DESCRIPTION
-----------

This program searches the first two pages of the PDF for a DOI. It looks up that DOI using the crossref API, and renames the PDF according to the format string *KEYFORMAT*.

OPTIONS
-------

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>[<strong>-v</strong>]</p>
<p>Verbose mode: write information about the move operation to stdout. Skipped files or directories are always written to stderr.</p></td>
</tr>
</tbody>
</table>

[**-f** *KEYFORMAT*]

The format string passed to **bibtool**, to generate the bibtex key. Defaults to ’%3n(author)-(journal)-(title)-%+4d(\$year)’ (see man(1) bibtool). The (journal) and (title) options are parsed before being passed to bibtool.

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

COMMENTS
--------

Requires **poppler-utils**, **bibclean** and **bibtool**.


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

[**-f** *KEYFORMAT*]

The format string passed to **bibtool**, to generate the bibtex key. Defaults to ’%3n(author):%+4d(\$year)’ (see man(1) bibtool).

EXAMPLES
--------

To find bibtex entries for all pdf files in the directory called
 papers, and append them to a file called mybib.bib,

**pdftobibtex** papers/\*.pdf \>\> mybib.bib

COMMENTS
--------

Requires **poppler-utils**, **bibclean** and **bibtool**.


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

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>-r</strong> <em>NUM</em></p>
<p>Return only NUM results (default 1)</p></td>
</tr>
</tbody>
</table>

**-y** *YEAR*

Restrict results to year=YEAR

[**-f** *KEYFORMAT*]

The format string passed to **bibtool**, to generate the bibtex key. Defaults to ’%3n(author):%+4d(\$year)’ (see man(1) bibtool).

EXAMPLES
--------

To append to the ’mybibliography.bib’ file the bibloagraphic data from
 a freeform lookup, with year specified:

**searchtobibtex** -y 1953 "A structure for deoxyribonucleaic acid Watson Crick" \>\> mybibliography.bib

To write to stdout the first five papers by someone called Einstein in
 1905, try

**searchtobibtex** -r 5 -y 1905 "Einstein"

COMMENTS
--------

Requires **bibclean** and **bibtool**.

AUTHOR
------

Ati Sharma, a.sharma AT soton.ac.uk

REPORTING BUGS
--------------

Please email the author with any bugs.

COPYRIGHT
---------

Copyright (C) 2015 Ati Sharma License GPLv3+: GNU GPL version 3 or later \<http://gnu.org/licenses/gpl.html\>.
 This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.

* * * * *
