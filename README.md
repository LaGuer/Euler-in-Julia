Problems from [Project Euler](http://projecteuler.net/), solved using the [Julia language](http://julialang.org/). 

Some early problems have an easy solution when using Julia's inbuilt functions or its standard library or external packages. Most of the time, these easy (at times trivial) solutions are faster and more memory efficient, and *should* be used in anything resembling production usage. Since the point here is to learn the language and to understand the problems though, the solutions actually executed here are longer, more roundabout solutions, with the easy ways mentioned in comments in the program. 

Problems 1-30 were written for Julia v0.6 (though they also run in v0.7 as of DEV.5240, just with loads of deprecation warnings). 
Problems 31+ use Julia v0.7 functions and syntax wherever feasible (though they also maintain v0.6 compatibility). The only exception is a deprecation warning in 043 for using `Vector(m)` instead of `Vector(undef,m)`.

Some solutions use external packages, mainly [Primes](https://github.com/JuliaMath/Primes.jl/) and [Combinatorics](https://github.com/JuliaMath/Combinatorics.jl).
