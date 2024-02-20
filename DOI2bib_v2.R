## 1. input the DOIs, for instance:
DOI <- read.table("....")$DOI
DOI <- scan(what = "") # by hand or copy/paste
## ... or else

## 2. Give a name for the output file:
OUTFILE <- "outfile.bib"

## 3. Run the followings:
baseurl <- "https://dx.doi.org/"
hdr <- "application/x-bibtex"
names(hdr) <- "Accept"

for (doi in DOI) {
    theurl <- paste0(baseurl, doi)
    URL <- url(theurl, headers = hdr)
    o <- try(open(URL))
    if (inherits(o, "try-error")) {
        cat("==>> Wrong doi =", doi, "<<==\n")
        next
    }
    X <- try(scan(URL, "", sep = "\n"))
    close(URL)
    if (inherits(X, "try-error")) {
        cat("==>> Download failed for doi =", doi, "<<==\n")
        next
    }
    cat(X, sep = "\n", file = OUTFILE, append = TRUE)
    cat("\n", file = OUTFILE, append = TRUE)
}
