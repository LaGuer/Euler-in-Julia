
using Primes: isprime, primes

function coeff_prod_prime_quad(alim = 1000, blim = 1000)
    local coeff_prod::Int
    max_np = 1

    #When n = 0, n² + an + b = b, so b can only be prime numbers.
    #[2:end] since b = 2 requires n(n+a) to be odd, so can't have multiple consecutive prime values
    bvalues = primes(blim)[2:end] 

    #n(n+a)+b has to be odd. Since b is odd, n(n+a) should be even, which for odd n happens only with odd a
    alim = (alim % 2 == 0) ? alim - 1 : alim
    avalues = -alim:2:alim

    for a = avalues, b = bvalues
        #try the current max_np immediately, skip if that isn't prime
        quad_val = max_np^2 + a*max_np + b
        isprime(quad_val) || continue

        n = 1
        quad_val = 1 + a + b #for n = 1, n² + an + b becomes this
        while isprime(quad_val)
            n += 1
            (n == max_np) && (n += 1) #max_np quad has already been checked, skip
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

