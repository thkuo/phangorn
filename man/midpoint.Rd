% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/treeManipulation.R
\name{getRoot}
\alias{getRoot}
\alias{midpoint}
\alias{midpoint.phylo}
\alias{midpoint.multiPhylo}
\alias{pruneTree}
\title{Tree manipulation}
\usage{
getRoot(tree)

midpoint(tree, node.labels = "support", ...)

\method{midpoint}{phylo}(tree, node.labels = "support", ...)

\method{midpoint}{multiPhylo}(tree, node.labels = "support", ...)

pruneTree(tree, ..., FUN = ">=")
}
\arguments{
\item{tree}{an object of class \code{phylo}}

\item{node.labels}{are nodel labels 'support' values, 'label' or should be
'deleted'}

\item{\dots}{further arguments, passed to other methods.}

\item{FUN}{a function evaluated on the nodelabels, result must be logical.}
}
\value{
\code{pruneTree} and \code{midpoint} a tree. \code{getRoot} returns
the root node.
}
\description{
\code{midpoint} performs midpoint rooting of a tree.  \code{pruneTree}
produces a consensus tree.
}
\details{
\code{pruneTree} prunes back a tree and produces a consensus tree, for trees
already containing nodelabels.  It assumes that nodelabels are numerical or
character that allows conversion to numerical, it uses
as.numeric(as.character(tree$node.labels)) to convert them.  \code{midpoint}
so far does not transform node.labels properly.
}
\examples{

tree <- unroot(rtree(10))
tree$node.label <- c("", round(runif(tree$Nnode-1), 3))

tree2 <- midpoint(tree)
tree3 <- pruneTree(tree, .5)

par(mfrow = c(3,1))
plot(tree, show.node.label=TRUE)
plot(tree2, show.node.label=TRUE)
plot(tree3, show.node.label=TRUE)

}
\seealso{
\code{\link[ape]{consensus}}, \code{\link[ape]{root}},
\code{\link[ape]{di2multi}}
}
\author{
Klaus Schliep \email{klaus.schliep@gmail.com}
}
\keyword{cluster}
