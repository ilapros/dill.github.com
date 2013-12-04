## "Unconditional programming"

Want a vector of length $n$ but have a vector of length $1 \leq m \leq n$, want to pad the $n-m$ entries with 0s.

Maybe this works:

<!--?prettify-->

    pad <- function(vec,n){
      if(length(vec)<n){
        c(vec,rep(0,n-length(vec)))
      }else{
        vec
      }
    }


looks fine, but we probably don't need that `if() ... else ...` there.

<!--?prettify-->

    pad <- function(vec,n){
      c(vec,rep(0,each=n-length(vec)))
    }

(example stolen from Michael Feather's article "Unconditional programming")




