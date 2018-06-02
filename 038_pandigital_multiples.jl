

"""
Problem statement:

Take the number 192 and multiply it by each of 1, 2, and 3:
    192 × 1 = 192
    192 × 2 = 384
    192 × 3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

"""
function largest_pandig_prod()
    #=
    If first digit of concatenated product p is >5, then:
    say the first product within p (integer x 1) is d digits long, 
    all the other products are then d+1 digits long.
    (First digit is going to be 9 here for largest pandigital concatenated product, so this applies.)

    There are 9 digits in a 1-9 pandigital number.
    So the first product can be 1 digit long (1,2,2,2), *not* 2 digit long (2, 3, 3, ?),
    can be 4 digit long (4, 5).

    1 digit long one is known, 9 x (1, 2, 3, 4) = 918273645

    For 4 digit long one: it can't start with any of 95-99, bcos that would lead to second part 
    starting 19, and 9 can't repeat in the pandigital number. 
    So it starts with one of 91-94, and its 5th and 6th digits are 18. Which means it starts with one of
    92-94 (since 1 can't repeat). 

    Starting 92, 93 or 94, then two digits, then 18, then 4 or 5, or 6 or 7, or 8 or 9.
    (184 or 185 for 92 since third digit after 92 can be <5 or ≥5. Similarly for 93,94.)
    Can't reuse 8 or 9, already used for 1st and 5th digits, so 94 is out too. 

    Hence, the result will be a number starting 92 or 93, then have two digits,
    then 18, then 4, 5, 6 or 7, then two digits.
    =#
    d1 = 9
    (d5, d6) = (1, 8)
    allowed_digits = collect(7:-1:2)
    for d2 in [3, 2] #reverse order so we find largest number first
        allowed_d3 = allowed_digits[allowed_digits .!= d2]
        for d3 in allowed_d3
            allowed_d4 = allowed_d3[allowed_d3 .!= d3]
            for d4 in allowed_d4
                prod1 = 9000 + d2*100 + d3*10 + d4
                allowed_d678 = allowed_d4[allowed_d4 .!= d4]
                prod2 = prod1*2
                if sort(digits(prod2), rev=true) == [8, allowed_d678..., 1]
                    return prod1 * 100000 + prod2
                end
            end
        end
    end
    error("Found nothing!")
end

isinteractive() || println(largest_pandig_prod())

