


function ndigit_fibo_index(n = 1000)
    n < 1 && throw(ArgumentError("Number of digits n should be a positive integer (was $n)"))
    n == 1 && return 1

    #easy way from Project Euler forums (40000x faster):
    # ndf(n) = n == 1 ? 1 : ceil(Int, ((n-1) + log10(5)/2)/log10(golden))

    f1 = big(1)
    f2 = big(1)

    index = 2
    while true
        (f1, f2) = (f2, f1+f2)
        index += 1
        if ndigits(f2) ≥ n
            return index
        end
    end
end

if !isinteractive()
    println(ndigit_fibo_index())
end
