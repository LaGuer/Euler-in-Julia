
function facto_digits_sum(n = 100)
    sum(digits(factorial(big(n))))
end

if !isinteractive()
    println(facto_digits_sum())
end

