

using Primes: factor

const ABUNDANT_SUM_BEGIN = 28123

function non_abundant_sums()
    #Total value of non-abundant-sum numbers
    non_abundant_sum_total = sum(1:23)

    for n in 25:ABUNDANT_SUM_BEGIN
        if !is_sum_of_abundants(n)
            non_abundant_sum_total += n
        end
    end
    non_abundant_sum_total 
end

function is_sum_of_abundants(n)
    for a in get_abundant_nums_upto(n÷2)
        if is_abundant(n - a)
            return true
        end
    end

    return false
end

let abundant_nums = Int[], prev_limit::Int = zero(Int)
    global get_abundant_nums_upto, is_abundant
    is_abundant(n) = (n in abundant_nums) || (sum(proper_divisors(n)) > n)

    function get_abundant_nums_upto(limit::Int)
        if prev_limit ≥ limit
            return filter(n -> n < limit, abundant_nums)
        end

        for n in prev_limit:limit
            if is_abundant(n)
                push!(abundant_nums, n)
            end
        end

        prev_limit = limit
        abundant_nums
    end
end

function proper_divisors(n::Int)
    0 ≤ n ≤ 1 && return Int[] 

    pf = factor(n)
    pdiv = ones(Int,1)
    for (pr, exp) in pf
        m = Int[pr^i for i in 0:exp]
        pdiv = vec(pdiv * m')
    end

    sort!(pdiv)
    pdiv[1:end-1]
end

if !isinteractive()
    println(non_abundant_sums())
end

