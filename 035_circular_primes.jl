
using Primes

function circular_primes(lim=1_000_000)
    known_circ_primes = [2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97]
    lim == 100 && return length(known_circ_primes)
    lim < 100 && return count(i -> i < lim, known_circ_primes) #(exclusive limit)

    num_circ_primes = length(known_circ_primes)
    cur_prime = nextprime(known_circ_primes[end]+1)
    while cur_prime < lim
        if is_circ_prime(cur_prime)
            num_circ_primes += 1
        end
        cur_prime = nextprime(cur_prime+1)
    end
    num_circ_primes
end

function is_circ_prime(p)
    #assumes given input p is prime as it is, for the sake of efficiency
    dp = digits(p)
    for i in 1:(length(dp)-1)
        cdp = circshift(dp, i)
        n = sum([cdp[k]*10^(k-1) for k=1:length(cdp)]) #construct number from digits in cdp
        isprime(n) || return false
    end
    return true
end

if !isinteractive()
    println(circular_primes())
end
