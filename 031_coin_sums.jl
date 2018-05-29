

function coin_sums_count(total = 200, denoms = [200, 100, 50, 20, 10, 5, 2, 1])
    num_dioph_solns(total, denoms)
end

"""
num_dioph_solns(t, C)
Number of soluions of a given linear Diophantine equation of the form
c1x1 + c2x2 + c3x3 + ... = t
where [c1, c2, c3, ...] = C, and x1, x2, x3, ... are the unknowns to solve for.
Allows any of xn to be zero.
"""
function num_dioph_solns(total, coeffs)
    if length(coeffs) == 1
        #if there's only one value, only solution is if it multiplies to total exactly
        num_solutions = (total % coeffs[1] == 0) ? 1 : 0
    elseif length(coeffs) == 2
        (a, b) = coeffs[:]
        (d, u, v) = gcdx(a, b)
        if total % d != 0 #not solvable unless gcd(a, b) divides c
            num_solutions = 0
        else
            #=
            x0 = u*(total÷d); y0 = v*(total÷d)
            x = x0 + (b/d)t; y = y0 - (a/d)t
            => -dx0/b ≤ t ≤ dy0/a to have positive x and y
            Number of solutions = number of t's in that range
            -d*x0/b = (-d*u*total/d)/b = -u*total/b. Similarly, d*y0/a = v*total/a
            =#
            upper_t_lim = floor(v*total/a)
            lower_t_lim = ceil(-u*total/b)
            num_solutions = length(lower_t_lim:upper_t_lim)
        end
    else
        #TODO: find better way of doing this, maybe Smith-normal matrices
        # or check if dynamic programming is faster
        #NOTE: a non-generic version could use `Base.Cartesian.@nloops 6 #...`
        c1 = coeffs[1]
        num_solutions = 0
        for x1 in 0:div(total, c1)
            num_solutions += num_dioph_solns(total - c1*x1, coeffs[2:end])
        end
    end
    num_solutions
end

if !isinteractive()
    println(coin_sums_count())
end

