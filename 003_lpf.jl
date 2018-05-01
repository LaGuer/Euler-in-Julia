
using Primes

function lpf(n::T) where T<:Integer
    factor(Vector, n)[end]

    #for a more ground-up (and slightly better performing) implementation, 
    #see repository LargestPrimeFactor
end

println(lpf(600851475143))

