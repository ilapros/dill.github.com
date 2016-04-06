---
title: Log-normal approximations
author: David L Miller

---

# Abstract

We often assume that an abundance estimate is log-normally distributed and use that as a basis for constructing confidence intervals. This is an aide memoir for me on that topic...


# Setup

We've estimated the abundance of some population using some method[^whatmethod] and now have an estimated abundance, which we'll call $\hat{N}$ and an associated estimate of the variance $\widehat{\text{Var}}(\hat{N})$.

So we assume:
$$
N_\text{truth} \sim \log\mathcal{N}(\hat{N}, \text{Var}(\hat{N}))
$$
for R's sake (for things like `qlnorm` and `plnorm` etc) we need the following parameters:
$$
\mu = \mathbb{E}(\log N) \quad \text{and} \quad \sigma^2 = \text{Var}(\log N)
$$

# Some maths

So if we know[^lnormhelp] that:
$$
\mathbb{E}(N) = \exp(\mu + \sigma^2/2)
$$
and
$$
\text{Var}(N) = \exp(2\mu +\sigma^2)(\exp\sigma^2 -1)
$$
we can get back to expressions about $\mu$ and $\sigma$. For $\sigma$ first...
$$
\begin{align}
\text{Var}(N) &= \exp(2\mu +\sigma^2)(\exp\sigma^2 -1)\\
\frac{\text{Var}(N)}{\exp(2\mu +\sigma^2)} &= (\exp\sigma^2 -1)\\
\frac{\text{Var}(N)}{(\exp(\mu +\sigma^2/2))^2} &= (\exp\sigma^2 -1)\\
\frac{\text{Var}(N)}{(\mathbb{E}(N))^2} &= (\exp\sigma^2 -1)\\
\text{CV}(N)^2 &= (\exp\sigma^2 -1)\\
\sigma^2 &= \log(\text{CV}(N)^2 + 1)\\
\sigma &= \sqrt{\log(\text{CV}(N)^2 + 1)}
\end{align}
$$
and for $\mu$:
$$
\begin{align}
\mathbb{E}(N) &= \exp(\mu + \sigma^2/2)\\
\mu &= \log\mathbb{E}(N) - \sigma^2/2\\
    &= \log\mathbb{E}(N) - \frac{1}{2}\log(\text{CV}(N)^2 + 1)\\
\end{align}
$$

These values can then be fed to `qlnorm` to obtain confidence intervals, hurrah!

[^whatmethod]: Maybe it was a density surface model? Maybe it was a Horvitz-Thompson estimate? Voodoo?
[^lnormhelp]: taken from the `*lnorm` help in R
