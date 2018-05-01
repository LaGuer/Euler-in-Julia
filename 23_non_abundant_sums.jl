

const ABUNDANT_SUM_LIMIT = 28123

function non_abundant_sums()
    abundant_nums = get_abundant_nums_upto(ABUNDANT_SUM_LIMIT)

    is_abundant_sum = falses(ABUNDANT_SUM_LIMIT)
    for n in abundant_nums, m in abundant_nums
        s = n + m
        if s ≤ ABUNDANT_SUM_LIMIT
            is_abundant_sum[s] = true
        end
    end

    sum(find(.!is_abundant_sum))
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

