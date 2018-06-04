

using Primes

"""
nums_with_n_dpf([n=4])
Find the first n consecutive numbers that have n distinct prime factors.
"""
function nums_with_n_dpf(n=4)
    lowerlim = reduce(*, [prime(i) for i in 1:n]) #lowest number with n distinct prime factors
    k = lowerlim
    num_dpfs = [length(factor(Set, k+i-1)) for i in 1:n]
    while true
        if all(num_dpfs .== n)
            return k
        end
        #move the window of calculation
        # look for next number with n distinct prime factors within num_dpfs
        offset = findfirst(i -> num_dpfs[i] == n, 2:n)
        if offset == NOT_FOUND  #if there's no such number in current k:k+(n-1)
            offset = n 
            empty!(num_dpfs)
        else
            splice!(num_dpfs, 1:offset)
        end
        k = k + offset
        append!(num_dpfs, [length(factor(Set, k+i-1)) for i in (n-offset+1):n])
    end
end

if VERSION ≤ v"0.6.3"
    const popfirst! = shift!
    const NOT_FOUND = 0
else
    const NOT_FOUND = nothing
end

isinteractive() || println(nums_with_n_dpf())
