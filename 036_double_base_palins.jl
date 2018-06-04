

function sum_dbpalins(lim=1_000_000)
    result = 0
    #only odd numbers can be binary palins since leading zeros not allowed 
    for n in 1:2:(lim-1) #"less than one million" in question, so exclusive limit
        if is_palin(n) && is_binary_palin(n)
            result += n
        end
    end
    result
end

function is_palin(n::Integer)
    dn = digits(n)
    reverse(dn) == dn
end

function is_binary_palin(n::Integer)
    bn = bin(n)
    reverse(bn) == bn
end

if VERSION > v"0.6.3"
    bin(n) = string(n, base=2)
end

if !isinteractive()
    println(sum_dbpalins())
end

