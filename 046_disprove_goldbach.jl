
using Primes

function disprove_goldbach()
    for o in Iterators.countfrom(9, 2)
        isprime(o) && continue
        conjecture_at_o = false
        for n in 1:isqrt(o÷2)
            if isprime(o - 2*n^2)
                conjecture_at_o = true
            end
        end
        if conjecture_at_o == false
            return o
        end
    end
end

#=
Analysis:
o = P + 2n²
Limit for n: 
2n² < o => n < √(o/2)
=#

isinteractive() || println(disprove_goldbach())
