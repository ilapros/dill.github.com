% Functional programming in `R`
% David L Miller
% St Andrews useR group, 12 December 2013

## 

<div class="quote">*If we wish to count lines of code, we should not regard them as "lines produced" but as "lines spent"*<br/>

Edsger W. Dijkstra</div>


## 

<div class="quote">This *is not* a talk about writing fast code</div>


## 

<div class="quote">This *is* a talk about writing code for humans to read</div>


## 

<div class="quote">This *is* a talk about writing code for humans to maintain</div>


## 

<div class="quote">This *is* a talk about writing less code</div>


## Why is programming terrible?

### Obfuscation

  - bending (someone else's) functions to your will
  - complex flow control (`{` and `}` tryanny)
  - "what does this function do?"
  - "quick" fixes

### Duplication
  - write 10 times, modify 9 times
  - copy and paste coding
  - typos (failure of duplication)


## 

<div class="quote">What is "functional" programming?</div>



## Getting closer to the mathematics

`sum(x-mean(x))^2`

**looks like**

$\left(\sum_{i=1}^n \left(x_i-\frac{\sum_{j=1}^n x_j}{n}\right)\right)^2$

Compare this to:

<!--?prettify-->

    x.mean <- mean(x)
    
    result <- 0
    
    for(i in 1:length(x)){
      result <- result + x[i]-x.mean
    }
    
    result <- result^2


##

<div class="quote">Focus is on what we *do* **not** on *implementation*</div>


## 

<div class="quote">Four examples of functional ideas</div>


## You're probably already doing this...

    data.mean <- apply(data, 1, mean)

(*A function as an argument to a function*)

Instead of

<!--?prettify-->

    data.mean <- numeric(nrow(data))
    
    for(i in 1:nrow(data)){
      data.mean[i] <- mean(data[i,])
    }

## What about this?

<!--?prettify-->

    apply(data, 1, function(x) sum(x^2))

(*Anonymous functions*)

Instead of 

<!--?prettify-->

    sum.sq <- function(x) sum(x^2)
    apply(data, 1, sum.sq)

## What about? 

<!--?prettify-->

    my.stats <- list(mean,sd,median)

    lapply(my.stats,function(f,x) apply(x,1,f), x=data)

(*`list` of functions, example of functional*)

Rather than

<!--?prettify-->

    apply(data,1,mean)
    apply(data,1,sd)
    apply(data,1,median)

## A little more esoteric

<!--?prettify-->

    sum.poly <- function(order){
      function(x) sum(x^order)
    }

    sum.sq <- sum.poly(2)

    apply(data, 1, sum.sq)

(*Closure*)

Rather than

<!--?prettify-->

    sum.sq <- function(x) sum(x^2)
    
    apply(data, 1, sum.sq)


## 

<div class="quote">First class functions</div>



## "First class" functions can be...

 * passed as arguments to other functions
 * anonymous
 * assigned to variables and stored in `list`s
 * returned from other functions


## 

<div class="quote">Closures</div>


## Closures

Okay, what happened in that last example?

<!--?prettify-->

    sum.poly <- function(order){
      function(x) sum(x^order)
    }
    
    sum.sq <- sum.poly(2)
    
    apply(data, 1, sum.sq)

`sum.sq` **encloses** the `environment` of `sum.poly`

<!--?prettify-->

    > as.list(environment(sum.sq))
    $order
    [1] 2

### "Function factories"


## 

<div class="quote">When is this actually useful?</div>


## Likelihoods

<!--?prettify-->

    ll.point <- function(pars,data,c.vec){
      ll(pars,data)*c.vec
    }

    ll.line <- function(pars,data){
      ll(pars,data)
    }

    obj.fcn <- function(pars,data,c.vec,transect){
      if(transect=="point"){
        ll.point(pars,data,c.vec)
      }else if(transect=="line"){
        ll.line(pars,data)
      }else{
        stop()
      }
    }

## Compare to

<!--?prettify-->

    obj.fcn <- function(transect){
      function(pars,data,c.vec){
        # function stuff
        if(transect=="point"){
          # ...
        }else if(transect=="line"){
          # ...
        }else{
          # ...
        }
      }
    }


## When are closures useful?

  * setting an option once
  * large memory overhead
  * many `if()`s
  * writing "wrappers"
  * function composition


## 

<div class="quote">Functionals</div>
 

## Functions that take functions and return numbers

 * remove `for` loops
 * simple situations use `apply` and co.
 * what about more complicated situations?
 * *split-apply-combine* pattern


## A functional functionals example

Want row means of a `data.frame` but only for columns in a range, range varies per row.

<!--?prettify-->

    mean(data[1,2:9])
    mean(data[2,4:11])
    ...

`Map(f,...)` takes `list`s and applies `f` to their elements in sync

<!--?prettify-->

    indices <- list(3:9, c(1,2), 9:12)
    
    Map(function(x,ind) mean(x[ind]),
        split(data,1:nrow(data)),
        indices)

##

<div class="quote">State</div>


## States and side effects

<!--?prettify-->

    > f(2)
    [1] 4

But...

<!--?prettify-->

    > g(3)
    > f(2)
    [1] 6

Um.


## States and side effects

  * `g` is changing "state" in the program
  * functional programming is a generalisation of "globals are bad"
  * programs that don't rely on state are easier to debug
  * programs that don't rely on state are easier to parallelise


## Sometimes state is useful

<!--?prettify-->

    new_counter <- function() {
      i <- 0
      function() {
        i <<- i + 1
        i
      }
    }
    counter_one <- new_counter()
    counter_two <- new_counter()
    

<!--?prettify-->

    > counter_one()
    [1] 1
    > counter_one()
    [1] 2
    > counter_two()
    [1] 1


## Recap

  * Functional ideas can:
    - make programs shorter
    - more like the mathematics they implement
    - remove messy control flow
    - avoid implementing object system for small problems
  * closures: take data and return a function
  * functionals: take functions and return data
  * you can do some pretty weird/cool stuff with functions in R  


## References

 * Hadley Wickham's [adv-r book](http://adv-r.had.co.nz/Functional-programming.html)
 * Brian Lee Yung Rowe [Modeling Data With Functional Programming In R](http://cartesianfaith.com/2013/09/21/preview-of-my-book-modeling-data-with-functional-programming-in-r/)
 * [Functional programming for the rest of us](http://www.defmacro.org/ramblings/fp.html)
 * [Edsger Dijkstra - Programming methodologies, their objectives and their nature](http://www.cs.utexas.edu/users/EWD/transcriptions/EWD04xx/EWD469.html) (EWD469)
 * [Edsger Dijkstra - On the cruelty of really teaching computing science](http://www.cs.utexas.edu/users/EWD/transcriptions/EWD10xx/EWD1036.html) (EWD1036)

