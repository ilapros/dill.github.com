# Recent advances in spatial modelling of distance sampling surveys

## Background/Question/Methods

Our understanding of a biological population can be greatly enhanced by modelling their distribution in space and as a function of environmental covariates. Such models can be used to investigate the relationships between distribution and environmental covariates as well as reliably estimate abundances and create maps of animal and plant distributions.

Here I'll give an overview of "density surface models", which consist of a spatial model of the abundance which has been corrected for uncertain detection via distance sampling methods. The spatial model consists of a generalised additive (mixed) model, which can include many varied components, such as smooth terms and random effects.


## Results/Conclusions

In particular, I'll highlight modelling techniques that may be advantageous to applied ecologists: quantification of uncertainty in a two-stage model, correction for availability bias, alternative response distributions, autocorrelation and smoothing in areas with complex boundaries.

Through examples of seabirds in Rhode Island and black bears in Alaska, I'll show how such models are easily constructed, fitted, checked and compared using the R packages dsm, Distance and mrds.


