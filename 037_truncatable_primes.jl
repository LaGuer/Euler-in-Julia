
using Primes

function sum_trunc_primes()
    cur_prime = 23 #lowest truncatable prime (excluding 2, 3, 5, 7)
    trunc_count = 1
    result = cur_prime

    #ugh, seems to be no simple analytical reason for exactly 11 trunc nums:
    # https://math.stackexchange.com/q/1953832/85653
    # So hardcode it. UGH.
    while trunc_count < 11
        cur_prime = nextprime(cur_prime + 1)
        if is_trunc_prime(cur_prime)
            trunc_count += 1
            result += cur_prime
        end
    end
    result
end

function is_trunc_prime(n::Integer) #assumes given n is prime
    t = 10
    while n÷t > 0
        # % checks left-to-right truncatability, ÷ checks right-to-left
        (isprime(n%t) && isprime(n÷t)) || return false
        t *= 10
    end
    return true
end

if !isinteractive()
    println(sum_trunc_primes())
end

#=
Problem statement: 
The number 3797 has an interesting property. Being prime itself, it is possible to
continuously remove digits from left to right, and remain prime at each stage:
3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

Possible efficiency improvements:
The number has to start with one of 2, 3, 5, 7 and end with one of 3, 7 (to be prime *and*
truncatable both directions).
Hence it has to start with one of: 23, 29, 31, 37, 53, 59, 71, 73, 79
And end with one of: 13, 17, 23, 37, 43, 47, 53, 67, 73, 83, 97
Construct n+1 digit candidates from n-digit ones based on these? 
=#

