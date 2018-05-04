
using Primes: isprime

function coeff_prod_prime_quad(alim = 1000, blim = 1000)
    local coeff_prod::Int
    max_np = 0
    for a = -alim:alim, b = -blim:blim
        np = num_primes_quad(a, b)
        if np > max_np
            coeff_prod = a * b
            max_np = np
        end
    end
    coeff_prod
end

function num_primes_quad(a, b)
    np = 0
    n = 0
    quad_val = b #for n = 0, n² + an + b becomes b

    while isprime(quad_val)
        np += 1
        n += 1
        quad_val = n^2 + a*n + b
    end

    np
end

if !isinteractive()
    println(coeff_prod_prime_quad())
end

