## pdf to csv

Lots of data is held in graphs within pdf files.

Some of these graphs are represented using an image format, e.g., jpeg,
while others are created using pdf operations (e.g., draw a cross at 10, 20).

If the pdf operations that create a graph are known, it is possible
to extract the coordinates of the points in a graph; [proof of concept](http://shape-of-code.coding-guidelines.com/2013/12/19/converting-graphs-in-pdf-files-to-csv-format/)

This project aims to add an option to [Mozilla's pdf renderer](https://mozilla.github.io/pdf.js/) to extracts the x/y coordinates of all the points appearing in a graph highlighted by the user.

## pdf disassemblers

[qpdf](https://github.com/qpdf/qpdf) does an excellent job of mapping the contents of a pdf to text.

[pdffigures](https://github.com/allenai/pdffigures) extracts figures from pdfs.

## Related tools

Manual conversion to svg and then automatic [conversion from svg](https://arxiv.org/html/1709.02261).

[chemdataextractor](http://chemtadataextractor.org/), as the name suggests, is oriented towards extracting chemical information from pdfs, e.g., chemical names and formula.

[utopia](http://utopiadocs.com/) attempts to extract structural features of an article, including citations.

[pdfgrep](https://pdfgrep.org/)

[pdftabextract](https://github.com/WZBSocialScienceCenter/pdftabextract)

[xpdf](https://www.xpdfreader.com/) is used as a library by many tools.

[poppler](https://poppler.freedesktop.org/) is a popular pdf rendering library.

