
using Primes: factor

"""
triangle_num_div([min_divs=500]) -> t

Find the first triangle number t such that t has over min_divs number of divisors. 
"""
function triangle_num_div(min_divs = 500)
    tri_num = 1
    for n in Iterators.countfrom(1) #IterTools.countfrom in 0.7 ? 
        tri_num = n * (n + 1) ÷ 2
        if num_divisors(tri_num) > min_divs 
            return tri_num
        end
    end
end

function num_divisors(t)
    nd = 1
    for (p, e) in factor(t)
        nd *= (e+1)
    end
    nd
end

if !isinteractive()
    println(triangle_num_div())
end

