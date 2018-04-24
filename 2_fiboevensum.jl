
function fiboevensum(lim)
    m = 1
    n = 2
    s = n

    while n ≤ lim
        (m, n) = (n, m+n) 
        (m, n) = (n, m+n) 
        #two odd numbers in n, now an even number
        (m, n) = (n, m+n) 
        n > lim && break
        s += n
    end
    s
end

println(fiboevensum(4000000))

