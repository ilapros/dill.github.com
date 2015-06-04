---
title: Vague script for DSM talk

---

#

"title slide"

#

I'm interested in three ecological questions, these represent the research I've been involved with to date. They are:

#

  1. "How many animals are there?" -- aka abundance estimation

#

  2. "Where are all the animals?" -- aka spatial modelling

#

  3. "Why are they there?" -- investigation of covariate relationships

#

I'm mostly involved with the development of "density surface models", that is: explicit spatial models, based on data collected as part of distance sampling surveys.

#

This flow diagam shows how one might conceptualise the modelling process in DSMs and roughly shows how I'll proceed in this talk. First we have count data collected from transects (I'll only talk about line transects here). We then adjust this data based on detecability (and sometime availability) using distance sampling methods (detection functions). From this detection (and availability) corrected data, we build a spatial model with the counts as the response and covariates as the explanatory variables. We then check the resulting model conforms to our assumptions, makes biological sense and refine it if not. Once we're happy with the fitted model, we can perform inference: calculate abundaces and corresponding variances.


#

Now we need to account for detectability.


#

This is line transect distance sampling in one slide. Each grey point is an animal. Once they are observed they turn blue, the observer walks/drives/steams/flies down the line (highlighting them in red) and records the distances to the objects from the line.

We would expect that animals clsoe to the line will be easier to see than those which are further away -- this is reflected in the histogram on the right where there is a peak at zero distance and then a fall off with increasing distance.

#

We take this histogram and fit a detection function to the distances, modelling the shape of the drop-off with increasing distance. Integrating the distance out of the detection function gives us the average probability of detection. We can then use the probability to form a Horvtiz-Thompson-like estimator of abundance in a given area.

#

This is an example of a fitted detection function.

#

There are a number of extensions to the standard methodology. They include things like including other factors that might affect detectability (e.g. time of day or observer). Or perception and availability bias, particularly pertinent in marine surveys when the study taxa can dive or be difficult to sight due to sea conditions. We also have a number of different functional forms for the detection function (which I'll talk about next). Finally we can account for observers not recording distances correctly.


#

The standard forms for the detection function can be problematic as is seem in these two plots. One of our assumptions is that probability of detection decreases with distance *monotonically*. This is somewhat evident in the left figure but particularly in the right figure when the detection function is plotted for quantiles of the covariate included. These cases can't be easily constrained via optimisation, so a new formulation was required.

#

As part of work during my masters and PhD, I developed a mixture model approach to modelling the detection function. On the left, the black line is a weighted combination of the dotted lines -- each of which is monotonic, leading to a monotonic resulting function. This formulation allows for flexible modelling without possible nasty features hiding in the margins of the model.

Published in PLoS ONE this year.


#

Once we have the count data per transect, we split the transects up into *segments*. So in this diagram we translate the group of three bears into a count of "3" for that segment.


#

Now I glossed over in the previous slide what the response was there just saying "count". There are two options I'll talk about here:

  1. Using the "raw" counts -- just adding up the number of animals in the segment. In that case we see that the segment area $A_j$ is multiplied by $\hat{p}_j}$, giving an *effective area* to multiply the density (in the $\exp$).
  2. By first calculating the Hovitz-Thompson estimator of the abundance using the detection probabilities from the detection function.

I tend to prefer the former when it's possible, as it's closer to the quantity we actually observed. The latter is useful when covariates are included in the detection function -- we can use individual level covariates with the former as the sample units don't match.


## 16-17

Now we have a detection function and counts. Our next step is to build a spatial model. To do this we're going to use a generalised additive model. This is generalized additive models in two slides, hold tight.

Thinking about count models, we want to model the count per segment (*j*) which we model as a sum of smooth functions ($f_k$), plus an intercept, on the whatever scale (here $\exp$ is the inverse link). We muliply that by the area of the segment to transform from density to counts.

Those $f_k$s could also be random effects (as smooths and random effects are mathematically the same) or could just be fixed effects as in a GLM.

Simon Wood's book has (almost) everything you'd need to know.

## 18

Those smooth functions are governed by penalties. The penalty defines the functional form of the spline basis, but also controls the estimated form of the smooth. We change the "wigglyness" by estimating a smoothing parameter. The left panel gives a model with well chosen smoothing parameter (black line estimates blue), the middle panel shows what happens when the smoothing parameter is too small (interpolation) and the right panel when the smoothing parameter is too big (too smooth).

Selecting the smoothing parameter done by REML.

## 20

For that response, we can use any count distributions. For a long time people used quasi-Poisson but I've not seen a good fit to such data. I'm using Tweedie and negative binomial a lot now, especially now their parameters can be estimated during model fitting. Both are suitable for "continuous count" data, so can be used with both fo the previous responses.


## 21

The way that segments are nested in transects allows of an obvious structure to the data. We can exploit this to model autocorrelation in the data using a GEE/GAMM-type structure. If we model the autocorrelation with an AR$(p)$ process within each transect.

This approach is still not very reliable, down to optimisation issues (which relies on the random effect interpretation of smooths and fits the whole thing as a mixedmodel. However, such models are often unstable due to conflicting density/sparseness of their components.

## 22

Okay, since that was a bit of a whirlwind tour. Let's change track slightly and talk about a case study of black bears in Alaska. This work was join with Earl Becker and Becky Strauch and funded by the Alaska Department of Fish and Game (while I was working at the University of Rhode Island). I'm not going to cover the detection function part of the study and instead I'll focus on the spatial modelling...

## 23

Just to give you an idea of the study area, the total size was about 28% that of Portugal. The survey was therefore carried out in planes like this one with two observers looking for bears from 2001-2003.

## 24

This is what the study area looks like in Alaska. The mountain range to the North includes Denali (Mt McKinley), the highest point in North America.

## 25

This is what 1238 randomly selected 35km transects look like. They really sampled a LOT of the area.

## 26

I said there were two observers. They follow a protocol where they each look then confirm each others' observations. The protocol used is detailed in Burt et al (2014) that is a good introduction to the methodology, if you're interested.

The photo there is what one might see out of the back seat of the plane.

## 27

So, out of those 1238 transects, we made 44,000 segments for the 351 observations of black bears. This left us with a lot of zeros in our data. Usually we observed lone bears or sows with a couple of cubs.

## 28-33

Here are our covariates. The "gaps" in the plots are where the elevation cut off is.


## 34

This plot shows the smooth effect of the elevation in our final model -- as elevation increases, there are fewer bears. This is probably because it's colder, there is more snow and there are fewer things for them to eat (at that time of year mostly berries until larger prey become available).


## 35

Here we see an interaction between two smooth terms, aspect and slope. So this shows that bears like to be on a slope and sunbathe -- 180 degrees is South facing.


## 36

Now those smooths were from our "final" model, how do we check that the results are reasonable.

## 37

We can use residual checks of our GAM to see whether the model conforms to assumptions. Here we can see that the normal QQ plot in the top left is okay, perhaps we under predict larger groups? The other plots are a bit more problematic to interpret. For example the line in the bottom of the top right residuals vs linear predictions and huge spike in the histogram of the residuals.

This is because by default these plots are created using deviance residuals, which are not really ideal for count-type data.


## 38-39

Instead we can use randomised quantile residuals. These were developed by Dunn and Smyth, and give exactly normally distributed results. This allows us to clarify the residuals vs linear predictor picture showing no issue with heteroskedasticity.

## 40

An additional problem with spatial models is that all of the covariates are usually somehow functions of each other. We can see below that slope and elevation are somehow related but not in an entirely linear way.

This is called "concurvity" and we can use various measures to check for it in our model.

## 41

Having thoroughly checked our model (which is more than I have covered), we can then think about our ecological problems again and perform inference.

## 42

Our simple Horvtiz-Thompson estimate of abundance, assuming a homgeneous landscape gives us an abundance of ~1500, DSM gives us ~1200. This is not a huge difference, especially given the confidence interval for the DSM estimate.

The DSM is relatively complicated to fit. And organising ones' data accordingly is highly complex and time-consuming. What else does DSM offer?

## 43

For me the key is that DSM offers this kind of map of abundance over the study area. This can be show to wildlife managers and they can get a really good idea of where the animals are.

In this plot, blue areas are those excluded from the prediciton grid.

## 44

We would also like to estimate uncertainty along with abundance. This is tricky if we have a 2-stage (or more complex) model, as we need to propagate uncertainty from the detection function to the spatial model.

Recent work from Mark Bravington and Sharon Hedley has solved this for the counts model at least.

The idea is that one can re-arrange the model to give an extra term, this is a random effect with variance fixed as the uncertainty from the detection function. Refitting the model with this extra random effect (which doesn't change the mean) appropriately inflates the variance to take into account the uncertainty in estimating the detection function.

## 45

Using this we can create maps of our uncertainty. Here of the coefficient of variation.

Points indicate observations. Blue areas are those points outside the elevational cut off or those points where the CV estimate was too large (due to division by zero.


## 46

In conclusion, DSMs incorporate flexible spatial and detection models. This can be very useful in areas where the landscape is heterogeneous and wildlife managers need to know what's going on spatially.

Many folks are down on two-stage modelling. While two-stage models can be limiting in some situations, we can see that here the two-stage process doesn't offer too much of an issue with obtaining results. The main advantages for me are that a team can separate their tasks and fit parts of the models independently and work asynchronously at some points. Model checking is also separable and therefore easier to understand.

## 47

I've mentioned software at several points during the talk and indeed, that's my main job at CREEM. We have a Windows package, but where most of the action is happening is in R packages. The Distance R package is a very simple way to do line and point transect analyses and abundance estimation via H-T estimators. mrds lets one fit double observer and mode complex models.

## 48

Finally the `dsm` package fits DSMs. The syntax is very similar to that of `mgcv`, so if you're used to that then the transition should be easy. There are also a number of utility functions that make doing routine tasks much easier.

## 49

Before I finish I'd like to thank several folks who've really helped me think about which aspects of DSM. I'd like to particularly pick out Eric Rexstad and Mark Bravington as people who think much more clearly than me when it comes to this stuff.

The picture at the bottom is me (pre-beard), Steve Buckland and Earl Becker, during a little flight we took to look for bears in Alaska in 2013.

