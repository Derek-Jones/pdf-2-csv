Lots of data is held in graphs within pdf files.

Some of these graphs are represented using an image format, e.g., jpeg,
while others are created using pdf operations (e.g., draw a cross at 10, 20).

If the pdf operations that create a graph are known, it is possible
to extract the coordinates of the points in a graph; [proof of concept](http://shape-of-code.coding-guidelines.com/2013/12/19/converting-graphs-in-pdf-files-to-csv-format/)

This project aims to add an option to [Mozilla's pdf renderer](https://mozilla.github.io/pdf.js/) to extracts the x/y coordinates of all the points appearing in a graph highlighted by the user.

