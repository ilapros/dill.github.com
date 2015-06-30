##

<p align="center"><big>Building ecological models bit-by-bit</big><br/><br/>
David L Miller<br/>CREEM, University of St Andrews<br/><br/>
<small>useR! 2015<br/>
Ålborg, Denmark<br/>
1 July 2015</small>
<br/>
<br/>
<br/>
<br/>
<br/>
<img class="bot" src="images/logo-big.gif" height=160><br/>
<img class="bot" src="images/03-foundation-colour.png" height=160></p>

##

<div class="quote">Motivation</div>

##

<div class="quote">Ecological questions</div>

##

<div class="bigquote">How many animals are there?</div>

##

<div class="bigquote">How?</div>

##

<div class="quote">Statistical methods</div>

. . .

<div class="quote"><br/>(Usable by ecologists)</div>

##

<div class="quote">Software</div>
. . .

<div class="quote"><br/>(Usable by ecologists)</div>

## Current trends (biased sample)

  * Big (BIG) (Bayesian?) models
  * Encapsulate many processes
  * "Throw everything in and see what happens"
  * (Perceived) Workflow:
    1. Formulate a giant likelihood
    2. Wait for a long time
    3. ...
    4. Get results/diagnostics
    5. Optional: repeat (convergence/model checking fails)


## Anti-trends

  * $\geq 2$ stage modelling
    * Optimality issues either way?
    * Propagation of uncertainty "hard"?
  * Model checking
  * Fitting non-complicated models

## Proposal

  * Simplification of workflow
  * Easier to understand (process-based)
  * Less time waiting (and shorter waiting)
  * Diagnostics as we go
  * Let's do more of this!



##

<div class="quote">Case study:<br/>distance sampling</div>


## Distance sampling (in 1 slide)

![](images/distance-animation.gif)

<small>Code for animation at <A href="https://gist.github.com/dill/2b0c120d5484d338d8ef">https://gist.github.com/dill/2b0c120d5484d338d8ef</a></small>

## Modelling detection

  * Model $\mathbb{P} \left[ \text{animal detected } \vert \text{ object at distance } y\right] = g(y;\boldsymbol{\theta})$
  * Calculate the average probability of detection:

$$
\hat{p}_i = \frac{1}{w} \int_0^w g(y; \mathbf{z}_i, \boldsymbol{\hat{\theta}})  \text{d}y
$$

  * Horvitz-Thompson-type estimators:

$$
\hat{N} = \sum_{i=1}^n \frac{s_i}{\hat{p}_i}
$$

  * (or model-based estimators see Miller et al (2013))

## Detection function

![](images/df.png)



## Mark-recapture distance sampling

  * DS assumes $g(0)=1$ (i.e. see everything right infront of you)
  * Use 2 observers, set up trials
  * Add an extra likelihood *component*, account for this
    * binomial, mark-recapture

$$
\mathcal{L} = \mathcal{L}_g \mathcal{L}_\Omega
$$


## Mark-recapture distance sampling animation

![](images/mrds-animation.gif)

<small>Code for animation at <A href="https://gist.github.com/dill/2b0c120d5484d338d8ef">https://gist.github.com/dill/2b0c120d5484d338d8ef</a></small>



##

<div class="quote">Partition in likelihood == partition in software</div>


## Syntax example

```r
# MR model
mr.io <- mrds(golftee.data, truncation=list(right=4),
              model=mr(mode="io", formula=~distance))

# DS model
ds1 <- ds(golftee.data, truncation=list(right=4))

# add them together
mrds.io <- mr.io + ds1
```

##

<div class="bigquote">`+` is a really useful operator</div>


## Let `+` do the work

  * define `+.class`
  * let `+` compute the resulting components
    * likelihood
    * AIC
    * update classes/functions
  * clearer interface for users
    * (likelihood components add on log scale)

## Can we do this for other model classes?

  * Distance sampling good for this
  * Componentised likelihood (thanks to David Borchers)
  * What about other models?

## Something like...?

```{r}
# linear model
mod <- lm(response ~ x1, data=data)
mod <- mod + lm_var(x2)
```

less trivially

```{r}
mod <- lm(response ~ x1, data=data)
mod_AR1 <- mod + corAR1(form=~sample|group)
```

<small>Refit using `lm` starting parameters?</small>


## Conclusion

  * Do folks think this kind of thing is useful?
  * In which areas is it useful?
  * Encourage users to perform model checking?
  * Don't just fit the most complicated model?



## Thanks!

<div class="quote">Talk available:<br/><a href="http://converged.yt/talks/useR2015/talk.html">http://converged.yt/talks/useR2015/talk.html</a></div>
