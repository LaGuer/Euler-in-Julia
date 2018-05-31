
const digits1to9 = [1, 2, 3, 4, 5, 6, 7, 8, 9]

"""
    sum_pandig_prods() -> sum_value
    Sum of "pandigital product"s - numbers z with z=xy where x, y, and z together have 
    all 9 digits occurring exactly once among them.
"""
function sum_pandig_prods()
    #=
    Product of n digit number and m digit number is (n+m)-digited or (n+m-1)-digited. 
    So here, only x, y, z combinations possible (for xy=z to be a pandigital product) are:
    ones where x is 2-digited, y is 3-digited, and z is 4-digited.
    ones where x is 1-digited, y is 4-digited, and z is 4-digited.
    =#
    pandig_prods = Set{Int}()
    for x in 12:98
        dx = digits(x)
        for y in 123:987
            z = x*y
            z > 9999 && break
            digits_used = [dx; digits(y); digits(z)]
            if sort(digits_used) == digits1to9
                push!(pandig_prods, z)
            end
        end
    end
    for x in 1:9
        for y in 1234:9876
            z = x * y
            z > 9999 && break
            digits_used = [x; digits(y); digits(z)]
            if sort(digits_used) == digits1to9
                push!(pandig_prods, z)
            end
        end
    end
    (sum(pandig_prods), pandig_prods)
end

if !isinteractive()
    println(sum_pandig_prods())
end
