

using Combinatorics

function digit_power_sums(pow = 5)
    max_nd = get_max_ndigits(pow)
    digs = 0:9
    digits_powered = [d^pow for d in digs]

    result = Int[]
    for nd in 2:max_nd
        digit_combs = with_replacement_combinations(digs, nd)
        for dc in digit_combs
            countnz(dc) < 2 && continue #at least 2 nonzero digits (or it's not a sum)
            dig_sum = sum(digits_powered[dc+1]) #+1 is for 1-based indexing
            if sort(digits(dig_sum)) == sort(dc)
                push!(result, dig_sum)
            end
        end
    end

    result
end

#=
Finding a limit to the number of digits in number: 
In (x1*10^(nd-1) + x2*10^(nd-2) + ... xnd) = (x1^p + x2^p + ... + xnd^p)
smallest value of LHS that keeps it a nd digit number is 10^(nd-1)
largest value of RHS is nd*9^p
When nd is large enough that 10^(nd-1) > nd*9^p, no number having nd digits can satisfy the equation.
Hence, find nd such that (10^(nd-1))/nd > 9^p, then use numbers with ndigits < nd
=#
function get_max_ndigits(pow)
    nd = 1
    while 10^(nd-1)/10 ≤ 9^pow
        nd += 1
    end
    nd-1
end

if !isinteractive()
    println(sum(digit_power_sums()))
end

