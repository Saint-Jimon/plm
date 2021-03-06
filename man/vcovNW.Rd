\name{vcovNW}
\alias{vcovNW}
\alias{vcovNW.plm}

\title{Newey and West(1987) Robust Covariance Matrix Estimator}
\description{
  Nonparametric robust covariance matrix estimators \emph{a la Newey
    and West} for panel models with serial correlation.
  }
\usage{
\method{vcovNW}{plm}(x, type = c("HC0", "sss", "HC1", "HC2", "HC3", "HC4"),
                      maxlag=NULL,
                      wj=function(j, maxlag) 1-j/(maxlag+1),
                      ...)
}

\arguments{
  \item{x}{an object of class \code{"plm"}}
  \item{type}{one of \code{"HC0"}, \code{"sss"}, \code{"HC1"}, \code{"HC2"}, \code{"HC3"},\code{"HC4"},}
  \item{maxlag}{either \code{NULL} or a positive integer specifying the
  maximum lag order before truncation}
  \item{wj}{weighting function to be applied to lagged terms,}
  \item{...}{further arguments}.
}

\value{
  An object of class \code{"matrix"} containing the estimate of the covariance matrix of coefficients.
}

\details{
\code{vcovNW} is a function for estimating a robust covariance matrix of
parameters for a panel model according to the Newey and West (1987)
method. The function works as a restriction of the Driscoll and Kraay
(1998) covariance to no cross-sectional correlation.

Weighting schemes are analogous to those in \code{vcovHC} in package \code{sandwich} and are justified theoretically (although in the context of the standard linear model) by MacKinnon and White (1985) and Cribari-Neto (2004) (see Zeileis (2004)).

The main use of \code{vcovNW} is to be an argument to other functions,
e.g. for Wald-type testing: as \code{vcov} to \code{coeftest()},
\code{waldtest()} and other methods in the \code{lmtest} package; and as
\code{vcov} to \code{linearHypothesis()} in the \code{car} package (see the examples). Notice that the \code{vcov} argument may be supplied a function (which is the safest) or a matrix (see Zeileis (2004), 4.1-2 and examples below).

}

\author{Giovanni Millo}

\references{
 Newey, W.K. & West, K.D. (1986) A simple, positive semi-definite, 
 heteroskedasticity and autocorrelationconsistent covariance matrix.
 \emph{Econometrica} \bold{55(3)}, pp. 703--708.
  }

\examples{
library(lmtest)
library(car)
data("Produc", package="plm")
zz <- plm(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp, data=Produc, model="pooling")
## standard coefficient significance test
coeftest(zz)
## NW robust significance test, default
coeftest(zz, vcov=vcovNW)
## idem with parameters, pass vcov as a function argument
coeftest(zz, vcov=function(x) vcovNW(x, type="HC1", maxlag=4))
## joint restriction test
waldtest(zz, update(zz, .~.-log(emp)-unemp), vcov=vcovNW)
## test of hyp.: 2*log(pc)=log(emp)
linearHypothesis(zz, "2*log(pc)=log(emp)", vcov=vcovNW)
}
\keyword{regression}

