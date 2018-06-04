
using Primes

"""
prime_permutation_seq([numdigits=4; skip=1487, all=false])
Returns the first sequence of three numbers (each having `numdigits` digits in it) which 
are permutations of each other, form an arithmetic sequence, and are all prime.
If `all` is true, returns all such sequences that have `numdigits` digits.
If `skip` is specified, skip sequences starting at the given number (regardless of `all` parameter).
"""
function prime_permutation_seq(numdigits = 4; skip::Int = 1487, all::Bool = false)
    lowerlim = nextprime(10^(numdigits-1) + 1)
    a = lowerlim
    seqs = Vector{NTuple{3, Int}}()
    while a < 10^numdigits
        (b, c) = check_perms(a)
        if b != nothing
            push!(seqs, (a, b, c))
            if !all
                return seqs
            end
        end
        a = nextprime(a+1)
        a = (a == skip) ? nextprime(a+1) : a
    end
    seqs
end

function check_perms(a)
    ad = digits(a)
    done = false
    while !done
        done = true
        #https://en.wikipedia.org/wiki/Permutation#Generation_in_lexicographic_order
        # implemented for reverse ordered digits
        for i in 2:length(ad)
            if ad[i-1] > ad[i]
                j = findfirst(n -> n > ad[i], ad)
                (ad[i], ad[j]) = (ad[j], ad[i])
                reverse!(@view(ad[1:(i-1)]))
                done = false
                break
            end
        end
        if !done
            b = num_from_digits(ad)
            c = b + (b - a)
            if c < 10^length(ad) && isprime(b) && isprime(c) && (sort!(digits(c)) == sort(ad))
                return (b, c)
            end
        end
    end
    (nothing, nothing)
end

num_from_digits(dn) = sum([dn[k]*10^(k-1) for k=1:length(dn)])

isinteractive() || println(prime_permutation_seq())

