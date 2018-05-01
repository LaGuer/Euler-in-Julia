

const ABUNDANT_SUM_LIMIT = 28123

function non_abundant_sums()
    #Total value of non-abundant-sum numbers
    non_abundant_sum_total = sum(1:23)
    abundant_nums = get_abundant_nums_upto(ABUNDANT_SUM_LIMIT)

    for n in 25:ABUNDANT_SUM_LIMIT
        if !is_sum_of_pair(n, abundant_nums)
            non_abundant_sum_total += n
        end
    end
    non_abundant_sum_total 
end

function is_sum_of_pair(n, narray)
    for i in narray
        if (n - i) in narray
            return true
        end
    end

    return false
end

@inline is_abundant(n) = sum(proper_divisors(n)) > n

function get_abundant_nums_upto(limit::Int)
    abundant_nums = Int[]
    for n in 12:limit
        if is_abundant(n)
            push!(abundant_nums, n)
        end
    end

    abundant_nums
end

function proper_divisors(n::Int)
    0 ≤ n ≤ 1 && return Int[] 

    lim = n÷2
    pdiv = [d for d in 2:lim if n%d == 0]
end

if !isinteractive()
    println(non_abundant_sums())
end

