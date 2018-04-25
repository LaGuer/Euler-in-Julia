

"""
spl_pyth_triplet(ts) -> (a, b, c)

Given an expected triplet-sum ts, finds a triplet a, b, and c such that 
a + b + c = ts, and a²+b²=c². Returns the tuple (a, b, c).
Returns (-1, -1, -1) in case no triplet is found with the above properties. 

"""
function spl_pyth_triplet(tripletsum = 1000)
    # a²+b² = c² => (a+b)² = c² + 2ab => a+b > c 
    # from that and a+b+c=tripletsum: c < tripletsum/2
    c_max = floor(Int, tripletsum/2)
    for c in c_max:-1:2
        csq = c^2
        for a in c-1:-1:1
            b = tripletsum - a - c
            if a^2 + b^2 == csq
                return (a, b, c)
            end
        end
    end
    return (-1, -1, -1)
end

if !isinteractive()
    println(prod(spl_pyth_triplet()))
end

