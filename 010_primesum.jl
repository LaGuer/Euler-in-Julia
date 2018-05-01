

function primesum(limit::T = 2_000_000) where T<:Integer
    #easy way: using Primes; sum(primes(limit)) 

    #hard way (20x slower, 60x more memory, compared to easy way): 
    is_prime_num = BitVector(limit)
    is_prime_num .= true

    psum = zero(limit)
    for i::T in 2:limit
        if is_prime_num[i]
            psum += i
            multiples_of_i = [k*i for k in 2:(limit÷i)]
            is_prime_num[multiples_of_i] .= false
        end
    end
    psum
end

if !isinteractive()
    println(primesum())
end

