
function largestpalinprod(digits=3)
    max_n = 10^digits - 1
    min_n = 10^(digits - 1)
    n_range = max_n:-1:min_n

    t_range = max_n^2:-1:min_n^2
    for t in t_range
        if ispalin(t)
            for n in n_range
                if t % n == 0 && (t÷n in n_range)
                    return :($t = $n * $(t÷n))
                end
            end
        end
    end
    error("Something's wrong: no palindrome found among products of $digits digit numbers")
end

function ispalin(n)
    dn = digits(n)
    dn == reverse(dn)
end

if !isinteractive()
    println(largestpalinprod())
end
