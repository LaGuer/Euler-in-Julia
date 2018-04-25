
function longest_collatz_chain(lim = 1_000_000)
    maxlen = 0
    maxlen_n = 1
    for n in 2:lim
        len = collatz_length(n)
        if len > maxlen
            maxlen = len
            maxlen_n = n
        end
    end
    maxlen_n
end

# memoization 
let known_collatz_lengths = Dict(1=>0)
    global collatz_length
    function collatz_length(n)
        n in keys(known_collatz_lengths) && return known_collatz_lengths[n]

        if n % 2 == 0
            l = collatz_length(n÷2) + 1
        else
            l = collatz_length(3*n + 1) + 1
        end
        known_collatz_lengths[n] = l
        return l
    end
end

if !isinteractive()
    println(longest_collatz_chain())
end
