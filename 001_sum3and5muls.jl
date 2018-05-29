
"""
sum3and5muls(lim) -> s

Find the sum of all multiples of 3 and 5 less than a given limit. 
"""
function sum3and5muls(lim::T) where T<:Integer
    #lim - 1 because we want strictly below given limit, non-inclusive
    max3multiple = (lim - 1) ÷ 3
    max5multiple = (lim - 1) ÷ 5
    max15multiple = (lim - 1) ÷ 15

    #3 + 6 + 9 + ... = 3*1 + 3*2 + 3*3 + ... 3*(max3multiple) = 3*(1+2+3+...+max3multiple)
    sum3multiples = 3 * (max3multiple * (max3multiple + 1) ÷ 2)
    sum5multiples = 5 * (max5multiple * (max5multiple + 1) ÷ 2)
    #multiples of both 3 and 5 i.e. multiples of 15 have been added twice, so take them away
    sum15multiples = 15 * (max15multiple * (max15multiple + 1) ÷ 2)
    s = sum3multiples + sum5multiples - sum15multiples

    #(as of 0.6.0, this method is 300 times faster than a for loop with %3 and %5)
end

if !isinteractive()
    println(sum3and5muls(1000))
end
