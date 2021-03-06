% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/2_ggproto_visualize.r
\name{proto_default}
\alias{proto_default}
\alias{proto_default2d,}
\alias{proto_def,}
\alias{proto_def2d}
\alias{proto_default1d}
\alias{proto_def1d}
\title{Wrapper function for default 2D/1D tours respectively.}
\usage{
proto_default(aes_args = list(), identity_args = list())

proto_default1d(aes_args = list(), identity_args = list())
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
}
\description{
An easier way to get to default 2D tour settings.
Returns a list of proto_origin(), proto_point(...), proto_basis() for 2D.
Returns a list of proto_origin1d(), proto_density(...), proto_basis1d() for 1D.
}
\examples{
dat <- scale_sd(tourr::flea[, 1:6])
clas <- tourr::flea$species

## 2D case:
bas <- basis_pca(dat)
mv <- manip_var_of(bas)
mt_path <- manual_tour(bas, mv)

ggt <- ggtour(mt_path, dat) +
  proto_default(list(color = clas, shape = clas))
\dontrun{
animate_plotly(ggt)
}
## 1D case:
gt_path <- tourr::save_history(dat, grand_tour(d = 1), max_bases = 3)

ggt <- ggtour(gt_path, dat) +
  proto_default1d(list(fill = clas))
\dontrun{
animate_plotly(ggt)
}
}
\seealso{
Other ggtour proto: 
\code{\link{ggtour}()},
\code{\link{proto_basis}()},
\code{\link{proto_density}()},
\code{\link{proto_hex}()},
\code{\link{proto_highlight}()},
\code{\link{proto_origin}()},
\code{\link{proto_point}()},
\code{\link{proto_text}()}

Other ggtour proto: 
\code{\link{ggtour}()},
\code{\link{proto_basis}()},
\code{\link{proto_density}()},
\code{\link{proto_hex}()},
\code{\link{proto_highlight}()},
\code{\link{proto_origin}()},
\code{\link{proto_point}()},
\code{\link{proto_text}()}
}
\concept{ggtour proto}
