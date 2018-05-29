

function nth_prime(n = 10_001)
    #easy, sane way: using Primes; prime(n)

    #hard way: (30 times slower than easy way)
    known_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
    n ≤ 11 && return known_primes[n]

    k = 36
    while true
        for i in [k-1, k+1]
            if isaprimenum(i, known_primes)
                push!(known_primes, i)
                length(known_primes) == n && return i
                @assert(length(known_primes) < n, "Somehow exceeded $n primes.")
            end
        end
        k += 6
    end
end

# named this way to avoid clash with Primes.isprime
@inline function isaprimenum(p, known_primes)
    for i in known_primes
        if p % i == 0
            return false
        end
    end
    return true
end

if !isinteractive()
    println(nth_prime())
end

