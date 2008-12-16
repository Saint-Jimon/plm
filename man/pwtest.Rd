\name{pwtest}
\alias{pwtest}
\title{Wooldridge's Test for Unobserved Effects in Panel Models}
\description{
  Semi-parametric test for the presence of (individual or time) unobserved effects in panel models.
}
\usage{
pwtest(x, data, effect = c("individual","time"), index = NULL, ...)
}

\arguments{
  \item{x}{an object of class \code{"formula"},}
  \item{data}{a \code{data.frame}}
  \item{effect}{one of \code{"individual"} or \code{"time"}}
  \item{index}{the index of the \code{data.frame},}
  \item{\dots}{further arguments.}
}

\details{
  
  This semi-parametric test checks the null hypothesis of zero
  correlation between errors of the same group. Therefore it has power
  both against individual effects and, more generally, any kind of
  serial correlation.

  The test relies on N-asymptotics. It is valid under error
heteroskedasticity and departures from normality.

The above is valid if \code{effect="individual"}, which is the most
likely usage. If \code{effect="time"}, symmetrically, the test relies on
T-asymptotics and has power against time effects and, more generally,
against cross-sectional correlation.

}

\value{
  An object of class \code{"htest"}.
}

\author{Giovanni Millo}

\references{
  Wooldridge, J.M. (2002) \emph{Econometric analysis of cross-section and panel data},
    MIT Press, 10.4.4., page 264.
}
\seealso{
  
  \code{\link{pbltest}}, \code{\link{pbgtest}}, \code{\link{pdwtest}},
  \code{\link{pbsytest}}, \code{\link{pwartest}}, \code{\link{pwfdtest}}
  for tests for serial correlation in panel models. \code{\link{plmtest}}
  for tests for random effects.
  
}
\examples{
data("Produc", package="Ecdat")
pwtest(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp, data=Produc)
}
\keyword{htest}