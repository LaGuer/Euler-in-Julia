
using Primes
using Combinatorics 

function largest_pandig_prime()
    D = collect(9:-1:1)
    while length(D) > 0
        #assumes permutations() switches from last to first, giving descending order here
        p = permutations(D)
        for nd in p
            n = num_from_digits(reverse!(nd)) #reverse to send with least significant digit first
            if isprime(n)
                return n
            end
        end
        popfirst!(D) #chop off largest digit so we can try n-1 digit numbers
    end
    -1
end

num_from_digits(dn) = sum([dn[k]*10^(k-1) for k=1:length(dn)])

if VERSION ≤ v"0.6.3"
    const popfirst! = shift!
end
isinteractive() || println(largest_pandig_prime())
