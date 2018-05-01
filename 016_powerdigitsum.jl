

function powerdigitsum(base = 2, power = 1000)
    sum(digits(big(base)^power))
end

if !isinteractive()
    println(powerdigitsum())
end

