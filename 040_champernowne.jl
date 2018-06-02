
"""
champernowne_prod()
An irrational decimal fraction (Champernowne's constant) is created by concatenating the positive integers:
0.123456789101112131415161718192021...
It can be seen that the 12th digit of the fractional part is 1.
If dn represents the nth digit of the fractional part, find the value of the following expression.
d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
"""
function champernowne_prod(fracdigit_places=10 .^ (0, 1, 2, 3, 4, 5, 6))
    p = 1
    for n in fracdigit_places
        p *= digit_in_champernowne(n)
    end
    p
end

function digit_in_champernowne(n)
    cur_range_digits = 1
    crossed = 0
    while true
        range_start = crossed + 1
        range_end   = range_start + (cur_range_digits * 9 * 10^(cur_range_digits - 1)) - 1
        (range_start < 0 || range_end < 0) && break #overflow
        if n in range_start:range_end
            n -= range_start
            num_at_n = 10^(cur_range_digits - 1) + (n÷cur_range_digits)
            #reverse() since digits returns least significant digit first
            d        = reverse(digits(num_at_n))[n%cur_range_digits + 1]
            return d
        end
        crossed = range_end
        cur_range_digits += 1
    end
    throw(ArgumentError("$n is too large to handle"))
end

#=

1 digit numbers: d₁ to d₉.
2 digit numbers: 90 values, each 2 digits, so 180 places. d₁₀ to d₁₈₉  

if n in 1:9 -> d = n
if n in 10:(10+90*2-1) -> n -= 10; d is (n%2 + 1)th digit in (n÷2)+10^(2-1)
if n in (10+90*2):((10+90*2)+(900*3)-1) -> n -= 190; d is (n%3 + 1)th digit in (n÷3)+10^(3-1)

=#

isinteractive() || println(champernowne_prod())

