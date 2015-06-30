# useR! talk script

Hi, I'd like to talk about how we build models in ecology and how that works for those who are not software or stats people.

Me and my group at St Andrews are interested primarily in 1 problem: "how many animals are there?" -- that is abundance estimation and estimation of related uncertainty.

How we do this depends on a number of constraints that may occur in the field, today I'll talk about 1 such method, but in general we are looking for statistical methods, usable by ecologists. That is not to demean the intelligence of ecologists, but merely to point out that we each have different knowledge domains and you may not have the time and expertise to address issues of ecology, statistics and computers all at once (I don't!)


## 8

So let me set the scene based on a conference I attended last year and some trends that I saw there. Many of the models that I saw were "big" -- especially in the sense that folks want a one-stop solution to their problems, they feed the data into a big (often Bayesian) model and see what happens. Such methods often encapsulate all the processes going on in one model -- observation: detectability and availability; demographic; distribution etc. In my mind this lends itself to the workflow here: make a big more, wait for a long time for it to converge (either by some "regular" optimiser or MCMC), continue to wait, get some results and do some diagnostics (at which point there are many moving parts) and finally, when the model doesn't converge or if the model checking doesn't look too good, repeat the above steps.

## 9

What's fallen out of favour (in my still biased sample) is 2 or more stage modelling approaches. There are some valid criticisms of such models -- there are potentially differently-bad optimality issues and propagating the uncertainty from one model to the next can be tricky (or you need to make assumptions about (conditional) independence). Also, because large models are naturally harder to check, some checking is skipped, or assumed to be "okay" because of formulation ("I don't need to check autocorrelation because I included an AR(1) process in my model" etc). We also tend to see folks building big models that self-select the "correct" covariates (e.g. shrinkage/penalised approaches in regression or RJMCMC-type approaches in Bayesianland). I think this probably makes it harder to understand what you're doing and appreciate the different components involved.

## 10

If one can separate your models into their process-based components I think this is much easier to understand for those building models. In general I think there is a huge benefit in switching from a "what the computer needs to do" (initialisation, finding starting values etc) to a "domain specific" approach (observation process, demographics etc). This can make the workflow simpler since you can check each component as you fit them. Potentially this can result in less waiting around (since each smaller model should be easier to fit).

## 11

So, I've waffled enough in the abstract. Let's talk about my research area: distance sampling.

## 12

[[distance sampling in 1 slide]]


## 13

more chat about detection functions and abundance estimation

## 14 

this is what a detection function looks like

## 15

we make a big assumption in distance sampling that at zero distance we see everything. This might not be true, especially in difficut to survey places like the ocean or places with heavy folliage. We can try to get around this using two observers, they each record what they saw and we build a model to s work out what each missed. This let's us correct the detection function at 0 distance. This takes the form of a binomial likelihood, like a mark-recapture analysis. Here we see that we can separate these likelihoods into $g$ for the detection function and $\Omega$ for the uncertain detection at zero.

## 16

here's an animation showing that the the boat or plane or whatever steams along it's track, the first whale is only seen by the first observer, but the second group are seen by both.

## 17

So this model lets us partition not only the likelihood but also the software

## 18

Here is an example of some code I've been working on, we build the incomplete detection at zero model first, check it, then run the detection model, check that, then finally combine.

## 19

In the previous slide we had `+` doing all the work for us. This seems like a nice choice: it's short to type and easy to equate to mathematical ideas that are happening (in my examples)

## 20

Once we've defined a `+` operator for the classes we want to add, we can encapsulate all the operations we need there, in my case this includes updating the "final" likelihood (by adding the log-likelihoods), AIC (by adding) and updating what the resulting prediction and summary methods will be (by function composition and closures in my case). I think this is clearer for those using it, first as you have distinct parts and second since mathematically we're adding likelihoods (and as a statistician, that's our currency). It would be remiss of me to not say at this point that Hadley Wickham's `ggplot2` `+` heavily inspired this work.

## 21

So, this has been useful for me but are there other non-distance sampling applciations? Which classes of models are interesting for this approach and which user groups can benefit?

## 22

Thinking about other models, the most trivial I coul think of would be to use `+` as a replacement for the `update` (or `step`?) function. This would give a terser alternative that is also potentially more expressive. We could use this for adding variables in -- `+` acts on the formula or for adding an effect, like a correlation structure.

## 23

My main motivation for coming to useR! was to work out if this would actually be useful to anyone. My brain works like this, but perhaps other people are happy with the current way this works.

We can still use the full likelihood at the end to continue the optimisation (using starting values from the components), if we're worried about optimality.

One thing I'm really keen on is having folks perform not just model selection but model checking, this is often left out of papers -- a bad example for those learning the method. Hopefully the component-based approach can encourage people to do more model checking.

Finally, there was a great talk from Mark Brewer at a Methods in Ecology and Evolution symposium and comments from the Dynamic Ecology blog on "statistical machismo" -- making complicated models because that's what's cool. I think perhaps generating models from components can help in this respect, making models more easy to understand.







##






