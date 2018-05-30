
function largestpalinprod(digits=3)
    max_n = 10^digits - 1
    min_n = 10^(digits - 1)
    lpp   = 0
    lpp_i = 0

    for i in max_n:-1:min_n
        for j in i:-1:min_n
            p = i*j
            p < lpp && break #lower j's will only give lower products
            if ispalin(p)
                lpp = p
                lpp_i = i
            end
        end
    end
    if lpp > 0
        return :($lpp = $lpp_i * $(lpp÷lpp_i))
    else
        error("Something's wrong: no palindrome found among products of $digits digit numbers")
    end
end

function ispalin(n)
    dn = digits(n)
    dn == reverse(dn)
end

if !isinteractive()
    println(largestpalinprod())
end
