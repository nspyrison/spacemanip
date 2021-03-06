% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/2_ggproto_visualize.r
\name{proto_density}
\alias{proto_density}
\alias{proto_density1d}
\title{Tour proto for data, 1D density, with rug marks}
\usage{
proto_density(
  aes_args = list(),
  identity_args = list(),
  density_position = c("identity", "stack")
)
}
\arguments{
\item{aes_args}{A list of aesthetic arguments to passed to
\verb{geom_point(aes(X)}. Any mapping of the data to an aesthetic,
for example, \code{geom_point(aes(color = myCol, shape = myCol))} becomes
\code{aes_args = list(color = myCol, shape = myCol)}.}

\item{identity_args}{A list of static, identity arguments passed into
\code{geom_point()}, but outside of \code{aes()}, for instance
\code{geom_point(aes(...), size = 2, alpha = .7)} becomes
\code{identity_args = list(size = 2, alpha = .7)}.}

\item{density_position}{The \code{ggplot2} position of \code{geom_density()}. Either
c("identity", "stack"), defaults to "identity". Warning: "stack" does not
work with \code{animate_plotly()} at the moment.}
}
\description{
Adds \code{geom_density()} and \code{geom_rug()} of the projected data. Density
\code{postion = "stack"} does not work with \code{animate_plotly()}, GH issue is open.
}
\examples{
dat <- scale_sd(tourr::flea[, 1:6])
clas <- tourr::flea$species
gt_path <- save_history(dat, grand_tour(), max = 3)

ggt <- ggtour(gt_path, dat) +
  proto_density(aes_args = list(color = clas, fill = clas)) +
  proto_basis1d()
\dontrun{
animate_plotly(ggt)
}
}
\seealso{
Other ggtour proto: 
\code{\link{ggtour}()},
\code{\link{proto_basis}()},
\code{\link{proto_default}()},
\code{\link{proto_hex}()},
\code{\link{proto_highlight}()},
\code{\link{proto_origin}()},
\code{\link{proto_point}()},
\code{\link{proto_text}()}
}
\concept{ggtour proto}
