#
# pdf2csv.awk, 17 Dec 13

# /Producer (R 2.8.1)
($1 == "/Producer" && $2 == "(R") || \
($1 == "/PTEX.FileName") \
	{
	print "start"
	next
	}


# library/grDevices/src/devPS.c

# PDF_Circle
#
# non-bezier curve method:
#            a = 2./0.722 * r;
#            xx = x - 0.396*a;
#            yy = y - 0.347*a;
#            tr = (R_OPAQUE(gc->fill)) +
#                2 * (R_OPAQUE(gc->col)) - 1;
#            if(!pd->inText) texton(pd);
#            fprintf(pd->pdffp,
#                    "/F1 1 Tf %d Tr %.2f 0 0 %.2f %.2f %.2f Tm",
#                    tr, a, a, xx, yy);
#            fprintf(pd->pdffp, " (l) Tj 0 Tr\n");

NF > 10 && $1 == "/F1" && $5 == "Tr" {
	aa=$6
	print "circle," $10+aa*0.396 "," $11+aa*0.347
	next
	}

# PDF_Line
#     fprintf(pd->pdffp, "%.2f %.2f m %.2f %.2f l S\n", x1, y1, x2, y2);
NF == 7 && $3 == "m" && $7 == "S" {
	print "line," $1 "," $2 "," $4 "," $5
	next
	}

# PDFSimpleText
#
#    fprintf(pd->pdffp, "/F%d 1 Tf %.2f %.2f %.2f %.2f %.2f %.2f Tm ",
#            font,
#            a, b, bm, a, x, y);
#    if (pd->useKern &&
#        isType1Font(gc->fontfamily, PDFFonts, pd->defaultFont)) {
#        PDFWriteT1KerningString(pd->pdffp, str,
#                                PDFmetricInfo(gc->fontfamily, face, pd), gc);
#    } else {
#        PostScriptWriteString(pd->pdffp, str, strlen(str));
#        fprintf(pd->pdffp, " Tj\n");
NF > 11 && ($1 == "/F2" || $1 == "/F3") && $3 == "Tf" {
	printf("text,%f,%f,", $8, $9)
	for (t=11; t<NF; t++)
	   printf("%s ", $t)
	printf("\n")
	next
	}

