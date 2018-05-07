

using Combinatorics

function coin_sums_count(total = 200, denoms = [200, 100, 50, 20, 10, 5, 2, 1])
    coin_combs = combinations(denoms)

    counter = 0
    for c in coin_combs
        counter += linear_dioph_num_solns(total, c)
    end
end

function linear_dioph_num_solns(total, coeffs)
    if length(coeffs) == 1
        #if there's only one value, only solution is if it multiplies to total exactly
        if total % coeffs[1] == 0
            return 1
        end
    elseif length(coeffs) == 2
        (a, b) = coeffs[:]
        (d, u, v) = gcdx(a, b)
        if total % d != 0 #not solvable unless gcd(a, b) divides c
            return 0
        end
        #x0 = u*(total÷d)
        #y0 = v*(total÷d)
        # x = x0 + (b/d)t; y = y0 - (a/d)t; -dx0/b < t < dy0/a => number of solutions is number of t's
        # -d*x0/b = (-d*u*total/d)/b = -u*total/b. Similarly for d*y0/a
        upper_t_lim = (v*total/a)
        upper_t_lim = isinteger(upper_t_lim) ? upper_t_lim - 1 : floor(upper_t_lim)
        lower_t_lim = (-u*total/b)
        lower_t_lim = isinteger(lower_t_lim) ? lower_t_lim + 1 : ceil(lower_t_lim)
        return length(lower_t_lim:upper_t_lim)
    end

end


