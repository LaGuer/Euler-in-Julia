

using Combinatorics

function coin_sums_count(total = 200, denoms = [200, 100, 50, 20, 10, 5, 2, 1])
    coin_combs = combinations(denoms)

    counter = 0
    for c in coin_combs
        counter += num_dioph_solns(total, c)
    end
    counter
end

"""
num_dioph_solns(t, C)
Number of soluions of a given linear Diophantine equation of the form
c1x1 + c2x2 + c3x3 + ... = t
where [c1, c2, c3, ...] = C, and x1, x2, x3, ... are the unknowns to solve for.
"""
function num_dioph_solns(total, coeffs)
    if length(coeffs) == 1
        #if there's only one value, only solution is if it multiplies to total exactly
        return (total % coeffs[1] == 0) ? 1 : 0
    elseif length(coeffs) == 2
        (a, b) = coeffs[:]
        (d, u, v) = gcdx(a, b)
        if total % d != 0 #not solvable unless gcd(a, b) divides c
            return 0
        end
        #=
        x0 = u*(total÷d); y0 = v*(total÷d)
        x = x0 + (b/d)t; y = y0 - (a/d)t
        => -dx0/b < t < dy0/a to have positive x and y
        Number of solutions = number of t's in that range
        -d*x0/b = (-d*u*total/d)/b = -u*total/b. Similarly with d*y0/a
        =#
        upper_t_lim = (v*total/a)
        upper_t_lim = isinteger(upper_t_lim) ? upper_t_lim - 1 : floor(upper_t_lim)
        lower_t_lim = (-u*total/b)
        lower_t_lim = isinteger(lower_t_lim) ? lower_t_lim + 1 : ceil(lower_t_lim)
        return length(lower_t_lim:upper_t_lim)
    end

end

if !isinteractive()
    println(coin_sums_count())
end

