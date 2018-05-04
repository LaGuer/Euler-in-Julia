

function primesum(limit::T = 2_000_000) where T<:Integer
    #easy way: using Primes; sum(primes(limit)) 

    #hard way (4x slower, 10x less memory, compared to easy way): 
    is_prime_num = BitVector(limit)
    is_prime_num .= true

    psum = zero(limit)
    for i::T in 2:limit
        if is_prime_num[i]
            psum += i
            for k in 2:(limit÷i)
                is_prime_num[k*i] = false
            end
        end
    end
    psum
end

if !isinteractive()
    println(primesum())
end

