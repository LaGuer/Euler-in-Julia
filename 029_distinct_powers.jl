

using Primes
using DataStructures: SortedDict

const PrimePowers = SortedDict{Int, Int}

"""
Q: How many distinct terms are in the sequence generated by a^b for 2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?
"""
function distinct_powers_upto(lim = 100)
    seen_powers = Dict{PrimePowers, Bool}()

    for a in 2:lim
        if isprime(a)
            for b in 2:lim
                seen_powers[PrimePowers(a => b)] = true
            end
            continue
        end

        #eg. a = 12, then f = (2 => 2, 3 => 1)
        f = factor(a)
        for b in 2:lim
            let b=b #workaround Julia 0.6 bug of Box-ing closed variables
                #eg. a = 12, and b = 3, then prime_power = (2 => 2*3, 3 => 1*3), equivalent to 12^3
                prime_power = PrimePowers([k => v*b for (k,v) in zip(keys(f), values(f))])
                seen_powers[prime_power] = true
            end
        end
    end

    count(values(seen_powers))
end

#alternate version (approx 15% faster, 3x less memory (29ms, 5MB) for lim=100)
function distinct_powers_upto_big(lim = 100)
    pows = Set()
    for a in 2:lim, b in 2:lim
        push!(pows, big(a)^b)
    end
    length(pows)
end

if !isinteractive()
    println(distinct_powers_upto())
end

