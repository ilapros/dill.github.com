---
title: index
layout: home
---

### Biography

**NEWS**: As of January 2016 I will be moving to the [National Oceanic and Atmospheric Administration](http://noaa.gov)'s [Northeast Fisheries Science Centre](http://nefsc.noaa.gov/) in Woods Hole, Massachusetts as a member of the Protected Species Branch. More updates coming soon.

I am a research fellow (postdoc) within the Research Unit for Wildlife Population Assessment ([RUWPA](http://www.ruwpa.st-and.ac.uk/about.php)) at the University of St Andrews where I work on building software and methods for calculating the abundances of biological populations (put simply: I count animals, using statistics and computers). My main interests are models for detection ([accounting for how observers might miss seeing animals, usually involving their distance](http://distancesampling.org/whatisds.html)) and building spatial models (where are the animals, and how do they relate to biological factors like vegetation cover and sea depth?).

Before that (2012-2013) I was a postdoc at the [Department of Natural Resources Science at the University of Rhode Island](http://nrs.uri.edu/index.html). There I worked on developing spatial distribution maps of seabirds off the coast of Rhode Island as well as developing statistical methods for spatial data. I worked with Scott McWilliams, Peter Paton and Kris Winiarski.

Previous to that (2011-2012) I was a postdoctoral research fellow working at the [Centre for Research into Ecological and Environmental Modelling](http://www.creem.st-andrews.ac.uk) at the University of St Andrews.

From 2008-2011(12) I undertook a PhD at the University of Bath where I was investigating smoothing over complex regions under the supervision of [Simon Wood](http://www.maths.bath.ac.uk/~sw283/). You can [download (and even read) my thesis](https://github.com/downloads/dill/phd-smoothing/thesis-print.pdf) should that interest you. We published [a paper in Environmental and Ecological Statistics with some of these results](papers/fa.pdf), which is significantly shorter.

I have a first class (MMath) degree in statistics from the [University of St Andrews](http://www.st-andrews.ac.uk), where I spent my summers <strike>eating cake</strike> working at CREEM.

I live and work in New York, NY (but I'm enjoying travelling [around the USA](/states/states.png); [code](/states/visited.R)). I spend my spare time [goofing around with computers](othersoftware.html), cooking, playing board games, [beer](https://www.flickr.com/photos/millerdl/sets/72157629293177612/), [building electronic things](http://www.arduino.cc/), running and [taking photos](http://www.flickr.com/photos/millerdl). You can look at the things I find interesting on the internet [on my tumblog](http://ninepointeightone.net).

**NOTE ABOUT E-MAILING ME**: If you mail me to ask a question about distance sampling (and I deem it of general interest) I will post your *anonymised* (address and data removed) question and my answer to the [distance sampling mailing list](https://groups.google.com/forum/#!forum/distance-sampling). If you **do not*** want this to happen, please say so (though your e-mail will likely go to the bottom of my todo list).

![A picture of my thursday inbox folder](thursdays.png) **ADDITIONAL NOTE ABOUT E-MAILING ME**: I get a lot of queries about software, which I tend to reserve for Thursdays. If you don't hear from me on a Thursday, it'll probably be a week before you have another chance. Sorry!

### Software

I write software. A lot of the software involves the package [Distance](http://distancesampling.org), a Windows program for analysing distance sampling data. I'm part of a team of about 5 people around the world who develop the software. My work is mainly on the [R](http://r-project.org) components.

Most of my ongoing projects can be found on my [github profile](http://github.com/dill). Here is a (rough) list of software I've developed or helped develop.

[`Distance`](http://github.com/DistanceDevelopment/Distance) An R package (not to be confused with the Windows program) that allows one to perform simple distance sampling analyses. This is basically just a more user friendly version of `mrds`...

[`dsm`](http://github.com/DistanceDevelopment/dsm) An R package for spatial modelling of distance sampling data (following the approach of [Buckland & Hedley, 2004](http://www.creem.st-and.ac.uk/stb/hedley.pdf)). As part of my (first) postdoc at CREEM, I re-wrote most of the previous implementation (by Eric Rexstad and Louise Burt) and included new features (see poster and paper below).

[`mrds`](http://github.com/DistanceDevelopment/mrds) An R package that allows you to perform more complex analyses of distance sampling data (including things like double observer studies, to account for imperfect detection on the transect line). [Jeff Laake](http://www.afsc.noaa.gov/nmml/personnel/nmmlprofile.php?name=Jeff.Laake) was the package maintainer until 2014 and I have now taken over, having contributed code since starting on the team in 2005.

[`mmds`](http://github.com/dill/mmds) An R package for performing distance analyses using mixture model detection functions. This formulation allows you to avoid non-monotonically decreasing detction functions, which usually cause bias in analyses. (The package is based on ideas [from this paper by me and Len Thomas](http://dx.doi.org/10.1371/journal.pone.0118726).)

[`Distance2`](http://github.com/dill/Distance2/) An R package that is a re-write of mrds, mmds and Distance to give a nicer user interface and more flexibility. This package is under development, so shouldn't be used for serious analysis at the moment.

[`msg`](http://github.com/dill/msg) A way of performing smoothing (using splines in a generalized additive model framework) over a geographical region with a complex shape (for example peninsulae or coastlines). The github page has an example of how to use `msg`](https://github.com/dill/msg/wiki/A-simple-example). This is an implementation of the methods I developed as part of my PhD.

[`soap_checker`](http://github.com/dill/soap_checker) A small script to check whether a soap film smoother boundary, knots and data make sense.

Other smaller (and/or sillier) things can be found on [my other software page](othersoftware.html).

I have made a map of where users of the above software are from. You can see the map [here](softwhere.html).


### Publications

#### Not actually in print

I'm putting together a "textbook" on distance sampling and density surface modelling (spatially-explicit distance sampling) online. [You can look at my progress here](http://converged.yt/RDistanceBook/). I welcome any comments or suggestions via email or (preferably) [github](https://github.com/dill/RDistanceBook).

Course materials from the course "Spatial models for distance sampling data" given at Duke University, NC, 27-30 October 2015 are available [on the distance sampling website](http://distancesampling.org/workshops/duke-spatial-2015/) or [on github](https://github.com/DistanceDevelopment/spatial-workshops).

#### In print

Dias, FS, DL Miller, TA Marques, J Marcelino, MC Caldeira, JO Cerdeira, MN Bugalho (2016). Conservation zones promote oak regeneration and shrub diversity in certified Mediterranean oak woodlands. Accepted for publication in *Biological Conservation* 195, 226-234. [DOI](http://dx.doi.org/10.1016/j.biocon.2016.01.009). [PDF](papers/dias-2016-manuscript.pdf). [Appendix A](papers/dias-2016-appendixA.pdf). [Appendix B](papers/dias-2016-appendixB.pdf).

Miller, DL and L Thomas (2015). Mixture models for distance sampling detection functions. *PLOS ONE*. [DOI](http://dx.doi.org/10.1371/journal.pone.0118726). (Open Access!)

Miller, DL and SN Wood (2014). Finite area smoothing with generalized distance splines. *Environmental and Ecological Statistics* [DOI](http://dx.doi.org/10.1007/s10651-014-0277-4). [PDF](papers/fa.pdf). <a href="papers/fa-webappendix.pdf">Appendix</a>. Software implementation as package <code>msg</code>, above.

Winiarski, KJ, DL Miller, PWC Paton and SR McWilliams (2013). Spatial conservation prioritization  of marine bird distribution models to improve guidance for siting of offshore wind energy developments. *Biological Conservation* 169, 79-88. [DOI](http://dx.doi.org/10.1016/j.biocon.2013.11.004). [PDF](papers/Zonation_ms_081613.pdf). <a href="papers/zonation-appendix.pdf">Appendix</a>.

Winiarski, KJ, ML Burt, EA Rexstad, DL Miller, CL Trocki, PWC Paton and SR McWilliams (2014). Integrating aerial and ship surveys of marine birds into a combined density surface model: A case study of wintering Common Loons. *The Condor*. 116(2):149--161. [DOI](http://dx.doi.org/10.1650/CONDOR-13-085.1). [PDF](papers/auk_winiarskietal_051013.pdf) (with appendix).

Winiarski, KJ, DL Miller, PWC Paton and SR McWilliams (2013). A spatially-explicit model of wintering common loons: conservation implications. *Marine Ecology Progress Series* 492:273&#x2013;283. [DOI](http://dx.doi.org/10.3354/meps10492). [PDF](papers/meps-loons.pdf). <a href="papers/meps-loons-appendix.pdf">Appendix</a>. <a href="https://github.com/dill/MEPS-analysis">git repository with knitr document for the analysis</a>.

Miller, DL, ML Burt, EA Rexstad and L Thomas (2013). Spatial models for distance sampling data: recent developments and future directions. *Methods in Ecology and Evolution*. [DOI](http://onlinelibrary.wiley.com/doi/10.1111/2041-210X.12105/abstract) (Open Access!). [PDF](papers/dsm-paper.pdf). Appendices: [A](papers/dsm-paper-AppendixA.pdf), [B](papers/dsm-paper-AppendixB.pdf), [C](papers/dsm-paper-AppendixC.pdf), [D](papers/dsm-paper-AppendixD.pdf). [**Updated Appendix A available here**](http://distancesampling.org/R/vignettes/mexico-analysis.html).

Marra, G, DL Miller and L Zanin (2011). Modelling the spatiotemporal distribution of the incidence of resident foreign population. *Statistica Neerlandica*. 66(2), pp. 133-160. [DOI](http://dx.doi.org/10.1111%2Fj.1467-9574.2011.00500.x); [PDF](papers/SPMMZ.pdf).

#### Submitted/under review


Reiss, PT, DL Miller, P Wu and W Hua. Penalized nonparametric scalar-on-function regression via principal coordinates. *Submitted to Journal of Computational and Graphical Statistics*.

#### In preparation

Miller, DL and EF Becker. Modelling black and brown bear abundance in Alaska.

Miller, DL and N Kelly. Combatting edge effects in spatial smoothing.

Bravington, MV, S Hedley and DL Miller. Estimating variance in density surface models.

Mannocci, M, J Roberts, DL Miller, P Halpin. Here be dragons: extrapolating cetacean densities into the unsurveyed high seas of the western North Atlantic.

Witteveen, BH, DL Miller and KM Wynne. Spatiotemporal patterns of baleen whale distribution around the Kodiak Archipelago, Alaska.

Dellabianca, NA, GJ Pierce, AR Rey, G Scioscia, DL Miller, MA Torres, MN Paso Viola, RNP Goodall and ACM Schiavini. Spatial models of abundance and habitat requirements of Commerson’s and Peale’s dolphin in southern Patagonian waters.

### Talks

[Spatial models integrating two survey platforms](talks/noaa-narw-2015/talk.html). Talk at NOAA NEFSC Visual and Passive Acoustic Data Integration Modeling Workshop, Woods Hole, MA, 15 September 2015.

[Recent advances in spatial modelling of distance sampling surveys](talks/dsm-talk/talk-ESA.html). Talk at [The Ecological Society of America Annual Meeting 2015](http://esa.org/baltimore/) (session OOS4: [Advances in Modeling Wildlife Abundance](http://eco.confex.com/eco/2015/webprogram/Session10564.html)), Baltimore, MD, 10 August 2015.

[useR! 2015 highlights](talks/user2015-summary/talk.html), CREEMcrackers (joint with Rob Schick), University of St Andrews, Scotland, 31 July 2015.

[Recent advances in spatial modelling of distance sampling surveys](talks/dsm-talk/talk-Aberdeen.html). Talk at [Royal Statistical Society Highlands Local Group](http://www.bioss.ac.uk/RSSH/), Aberdeen, Scotland, 16 July 2015.

[Building ecological models bit-by-bit](talks/useR2015/talk.html). Talk at [useR! 2015](http://user2015.math.aau.dk/), Aalborg, Denmark, 1 July 2015.

[Distance sampling and detection function modelling in Distance](talks/BTO-distance/talk.html) and [Spatial modelling of distance sampling surveys](talks/BTO-dsm/talk.html). Two talks at [The British Trust for Ornithology](http://http://www.bto.org/), Thetford, UK, 25 June 2015.

[Recent advances in spatial modelling of distance sampling survey](talks/dsm-talk/talk-Lisbon.htmls). Talk at Universidade de Lisboa, Portugal, 11 June 2015.

[Density surface models](talks/cornell-dsm/talk.html). Talk given to Cornell Lab of Ornithology, Cornell University, 5 September 2014.

[Mixture models detection functions](talks/ncsu-mixtures/talk.html). North Carolina State University, 27 August 2014.

[Funtimes (and fundates) with `lubridate`](talks/rusers-time/talk.pdf) ([code](talks/rusers-time/talk.Rmd)). St Andrews R user group talk, July 2014.

[Specifying GAMs & GAMMs with `mgcv`](talks/creemcrackers-splines/talk.pdf), CREEMcrackers, University of St Andrews, Scotland, July 2014.

[Strategies for correlated covariates in distance sampling](talks/dscorrcovar.pdf), International Statistical Ecology Conference, Montpellier, France, July 2014.

[Density surface modelling](talks/duke-dsm/talk.html). Talk given to the Marine Geospatial Ecology Lab, Duke University, 11 February 2014.

[Functional programming in R](talks/rusers-functional/talk.html). St Andrews R user group talk, December 2013.

[Dealing with spatial autocorrelation in DSMs](talks/corr-talk/talk.html). Informal talk to the Research Unit for Wildlife Population Assessment, July 2013. ([code](https://raw.github.com/dill/dill.github.com/master/talks/corr-talk/talk.Rmd).)

[`dsm` version 2 - what's new?](talks/dsm-2.pdf). Informal talk to the Research Unit for Wildlife Population Assessment, December 2012.

[Combatting edge effects in spatial smoothing](talks/isec2012/index.html). International Statistical Ecology Conference, July 2012, Sundvolden, Norway.

[Using multidimensional scaling with Duchon splines for reliable finite area smoothing](talks/msg.pdf). useR! 2011, Warwick, UK. (also given at: Recent advances in spatial statistics in ecology, University of St Andrews, 2011; ISEC 2010, University of Kent, and more. This is the most recent version.)

[Using mixture models for distance sampling detection functions](talks/mmds.pdf). NCSE Summer meeting 2011, University of Bath, UK. (Again, I've given this a bunch of times, this is the most recent version.)

### Posters

[Convenient analysis of numerous distance sampling data sets in R](posters/Rexstad-ISEC2014.pdf) International Statistical Ecology Conference, July 2014, Montpellier, France. (Joint with Eric Rexstad and Lindesay Scott-Hayward.)

[Spatial density surface estimation from distance sampling surveys](posters/dsm-poster-isec2012.pdf) International Statistical Ecology Conference, July 2012, Sundvolden, Norway.

[Coming soon in Distance](posters/DistancePoster-isec2012.pdf) International Statistical Ecology Conference, July 2012, Sundvolden, Norway. (Entirely Laura Marshall's work, but I stood next to it and talked to people so it seems sensible to include it here.)

### Contact me!

**E-mail:** dave [at] ninepointeightone [dot] net

