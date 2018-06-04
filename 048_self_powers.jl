

"""
self_powers_sum_tail([upto=1000])
Find the last ten digits of the series, 1¹ + 2² + 3³ + ... + 1000¹⁰⁰⁰.
or in general, of the series 1¹ + 2² + 3³ + ... + nⁿ.
"""
function self_powers_sum_tail(upto=1000)
    #easy way: 5.2ms, 1.6MB
    #sum((n^n for n in big(1):1000))%10_000_000_000

    #hard way: 2x time (9.8ms), but 0 allocs
    result = 0
    for n in 1:upto
        npn = 1
        for p in 1:n
            npn = (npn * n)%10_000_000_000
        end
        result = (result + npn)%10_000_000_000
    end
    result
end

isinteractive() || println(self_powers_sum_tail())
