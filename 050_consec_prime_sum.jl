
using Primes

"""
max_consec_prime_sum([lim=1_000_000])
Which prime, below one-million, can be written as the sum of the most consecutive primes?
"""
function max_consec_prime_sum(lim=1_000_000)
    primenumbers = primes(lim-1)
    starterp = maxl = maxconsecsum = 0
    for (i, p) in enumerate(primenumbers)
        consecsum = p
        l = 1
        if p == 2
            consecsum += 3
            l = 2
        end
        while consecsum < lim && (i + l + 1) < lastindex(primenumbers)
            #at this point, consecsum is odd, and will remain odd (and hence potential prime)
            # only after we add *two* odd numbers
            consecsum += primenumbers[i + l] + primenumbers[i + l + 1]
            l += 2
            if l > maxl && consecsum in primenumbers
                (starterp, maxl, maxconsecsum) = (p, l, consecsum)
            end
        end
    end
    (starterp, maxl, maxconsecsum)
end

if VERSION ≤ v"0.6.3"
    const lastindex = endof
end

isinteractive() || println(max_consec_prime_sum())

