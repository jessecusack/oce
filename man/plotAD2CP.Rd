% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/adp.nortek.ad2cp.R
\name{plotAD2CP}
\alias{plotAD2CP}
\title{Plot an AD2CP Object}
\usage{
plotAD2CP(x, which = NULL, cex, col, pch, lwd, type, ...)
}
\arguments{
\item{x}{an AD2CP object, as created with \code{\link[=read.adp.ad2cp]{read.adp.ad2cp()}} or by
\code{\link[=read.oce]{read.oce()}} on a file of the AD2CP type.}

\item{which}{a character value indicating what to plot.  Use NULL to see a
listing of the possibilities for this particular object.  See
\dQuote{Details} and \dQuote{Examples}, and note that some understanding
of the object layout is required to devise \code{which} properly.  If \code{which}
is inappropriate for this particular \code{x}, then hints are printed to help
guide the user to something that will work.}

\item{cex}{character expansion factor}

\item{col}{indication of colour, passed to \code{\link[=imagep]{imagep()}} or to \code{\link[=oce.plot.ts]{oce.plot.ts()}},
depending on whether the plot is an image or a time-series graph. This
defaults to \link{oceColorsVelocity} for velocity images, \link{oceColorsViridis}
for amplitude and quality images, and to black for time-series plots.}

\item{pch}{character code}

\item{lwd}{line width, used only for time-series graphs.}

\item{type}{plot type, used only for time-series
graphs.}

\item{...}{optional other arguments, passed to the lower-level plotting
commands.}
}
\description{
Used by \code{\link{plot,adp-method}} or called directly, this function
plots some aspects of AD2CP data. The \code{which} parameter
has an entirely different meaning to that of
\code{\link{plot,adp-method}}, because AD2CP objects
are laid out differently from other \link{adp} objects.  As an aide,
\code{which} can be supply prompts that will work with the particular
object at hand, e.g. using \code{plotAD2CP(x,which="?")} will print a message
indicating the names of items in the \code{data} slot that can be plotted.
If, say, one of these is \code{"average"}, then using \code{which="average/?"} will
display a message indicating the items within the \code{"average"} records that
can be plotted.  Some of those items (e.g. \code{"magnetometer"}) can be
explored further, using \code{which="average/magnetometer/?"}; see
Example 3.
}
\examples{
library(oce)
# This example will only work for the author, because it uses a
# private file.  The file contains 'burst' and 'average' data.
f <- "/Users/kelley/Dropbox/oce_secret_data/ad2cp/secret1_trimmed.ad2cp"
if (file.exists(f)) {
    library(oce)
    d <- read.oce(f)
    # Example 1: time-distance variation of "average" velocity (beams 1 through 4)
    plot(d, which="average/v", col=oceColorsVelocity)
    # Example 2: time variation of "average" amplitude (beam 1)
    plot(d, which="average/a/1")
    # Example 3: time variation of "burst" magnetometer (x component)
    plot(d, which="burst/magnetometer/x")
    # Example 4: time variation of "burst" AHRS/gyro
    plot(d, which="burst/AHRS/gyro")
}

}
\author{
Dan Kelley
}
