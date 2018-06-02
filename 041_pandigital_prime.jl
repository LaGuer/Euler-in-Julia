
using Primes
using Combinatorics 

function largest_pandig_prime()
    #only 7-, 4- and 1-digit pandigital numbers don't have digits adding up to something divisible by 3
    for D in (collect(7:-1:1), collect(4:-1:1))
        #assumes permutations() switches from last to first, giving descending order here
        p = permutations(D)
        for nd in p
            n = num_from_digits(reverse!(nd)) #reverse to send with least significant digit first
            if isprime(n)
                return n
            end
        end
    end
    -1
end

num_from_digits(dn) = sum([dn[k]*10^(k-1) for k=1:length(dn)])

isinteractive() || println(largest_pandig_prime())
