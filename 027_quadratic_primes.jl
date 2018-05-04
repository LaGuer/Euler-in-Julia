
using Primes: isprime

function coeff_prod_prime_quad(alim = 1000, blim = 1000)
    local coeff_prod::Int
    max_np = 0
    for a = -alim:alim, b = 2:blim
        # b should be prime, primes above 3 are all 6x-1 or 6x+1
        (b ≤ 3 || (b-1)%6 == 0 || (b+1)%6 == 0) || continue

        n = 0
        quad_val = b #for n = 0, n² + an + b becomes b
        while isprime(quad_val)
            n += 1
            quad_val = n^2 + a*n + b
        end

        if n > max_np
            coeff_prod = a * b
            max_np = n
        end
    end
    coeff_prod
end

if !isinteractive()
    println(coeff_prod_prime_quad())
end

