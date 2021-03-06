% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ch_rfa_SeasonStat.R
\name{ch_rfa_SeasonStat}
\alias{ch_rfa_SeasonStat}
\alias{ch_rfa_SeasonStat.data.frame}
\alias{ch_rfa_SeasonStat.formula}
\title{Seasonal statistics for flood peaks}
\usage{
ch_rfa_SeasonStat(x, ...)

\method{ch_rfa_SeasonStat}{data.frame}(x, ...)

\method{ch_rfa_SeasonStat}{formula}(form, x, ...)
}
\arguments{
\item{x}{Data. If data.frame with two columns, they must be respectively 
the date and a site variable.}

\item{...}{Other parameters.}

\item{form}{Formula that specifies the date and site variable. Must be of the
form \code{date ~ site}.}
}
\value{
Returns the circular or seasonal statistics of flood peaks.
}
\description{
Return the circular or seasonal statistics of flood peaks.
The angle represent the average timing of the floods and the radius its
regularity. For instance a radius of one represents perfect regularity. 
Can perform the analyses on multiple sites.
}
\examples{

dt <- ch_rfa_ExtractAmax(flow~date, flowStJohn)$date

ch_rfa_SeasonStat(dt)

## Illustration of the analysis of multiple sites

F0 <- function(ii) data.frame(site = ii, dt = sample(dt, replace = TRUE))
x <- lapply(1:10, F0)
x <- do.call(rbind, x)
           
st <- ch_rfa_SeasonStat(dt ~ site, x)

ch_rfa_JulianPlot()
points(y ~ x, st, col = 2, pch = 16)

}
\references{
Burn, D.H. (1997). Catchment similarity for regional flood frequency analysis
  using seasonality measures. Journal of Hydrology 202, 212-230.
  https://doi.org/10.1016/S0022-1694(97)00068-1
}
\seealso{
\link{ch_rfa_DistSeason}
}
\author{
Martin Durocher <mduroche@uwaterloo.ca>
}
