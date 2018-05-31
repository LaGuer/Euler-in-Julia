

"""
Find the sum of all 'digit factorial numbers' i.e. numbers who are the sum of the factorials
of their digits.
"""
function sum_digit_factorial_nums()
    result = 0
    #=
    Maximum sum of digit factorials for an d-digit number is
    factorial(9)*d (where the number would be 9999..d-times)
    That product for 8-digit numbers is factorial(9)*8=2903040, less than any 8-digit number.
    The digit factorial sum would similarly be less than any d-digit number for all d>8
    =#
    for n in 10:(factorial(9)*7)
        if digit_factorial_sum(n) == n
            result += n
        end
    end
    result
end

function digit_factorial_sum(n::Integer)
    nd = digits(n)
    return sum((factorial(d) for d in nd))
end

if !isinteractive()
    println(sum_digit_factorial_nums())
end

