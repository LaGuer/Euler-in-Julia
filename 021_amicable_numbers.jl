
"""
sum_amicable_nums(lim[=10000])
Problem statement:
Let σ(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If σ(a) = b and σ(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore σ(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so σ(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
"""
function sum_amicable_nums(lim=10000)
    s = 0
    for n in 1:(lim-1)
        a = get_aliquot(n)
        if a < n && get_aliquot(a) == n #check a < n so we count each pair only once
            s += (a + n)
        end
    end
    s
end

#=
Uses recursive formula for finding sum of positive divisors
σ(n)=∑(i∈Z0): (−1)^(i+1) * (σ(n−(3i²−i)/2) + δ(n,(3i²−i)/2)n)
from: https://math.stackexchange.com/a/22744/85653
=#
let σ₁cache = Dict{Int, Int}()
    global σ₁
    function σ₁(n)
        haskey(σ₁cache, n) && return σ₁cache[n]
        i = 1
        s = 0
        while (gp = i*(3i-1)÷2) ≤ n
            term_sign = (-1)^(i+1)
            term = (gp == n) ? n : σ₁(n - gp)
            s += term_sign * term
            i = (i > 0) ? -i : -(i-1)
        end
        σ₁cache[n] = s
    end
end

#=
Gets aliquot sum from that by subtracting n
=#
get_aliquot(n) = σ₁(n) - n

isinteractive() || println(sum_amicable_nums())

