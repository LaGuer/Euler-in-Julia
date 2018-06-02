

"""
max_solns_perimeter([upto=1000]) -> pmax
Problem statement:
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c},
there are exactly three solutions for p = 120.
{20,48,52}, {24,45,51}, {30,40,50}
For which value of p ≤ 1000, is the number of solutions maximised?
"""
function get_max_solns_perimeter(upto=1000)
    max_num_right_tris = max_solns_perimeter = 0
    for perimeter in 12:2:upto #(min p is from 3²+4²=5², p=3+4+5)
        n = num_right_tris(perimeter)
        if n > max_num_right_tris
            (max_solns_perimeter, max_num_right_tris) = (perimeter, n)
        end
    end
    max_solns_perimeter
end

function num_right_tris(p)
    n = 0
    for b in 1:p÷2
        a = (p*(p - 2b))/(2*(p-b))
        if isinteger(a)
            n += 1
        end
    end
    n
end

isinteractive() || println(get_max_solns_perimeter())

#=
a+b+c = p  ---(1)
a² + b² = c² -(2)
Sub (1) in (2), a² + b² = (p-a-b)²  
a² + b² = p² + a² + b² - 2pa + 2ab - 2pb
0 = p² - 2pa + 2ab - 2pb
2pa - 2ab = p² - 2pb
a(2p - 2b) = p(p - 2b)
a = p(p-2b)/(2p-2b) --(3)
Integer solutions to (3) are also integer solutions to (1) and (2) 

We know c<p/2 (from 009 spl pyth triplet), and from (2) b < c (for non-zero a),
so only b < p/2 have to be checked.

If a and b are even, c is even and so p=a+b+c is even.
If a and b are odd, c is odd+odd so even, and so p=a+b+c is even.
If a is odd and b is even (or vice versa), c is odd, so p is odd+even+odd so even
Hence, only even values of p need to be checked.

=#

#=
alt method: cache all sqrs of nums <500 (sicne c < 500), check each square sum
up to 500, increment dict value if a cached sqr found, find max of dict values
=#

#=
alt alt method: check out http://mathworld.wolfram.com/PythagoreanTriple.html
=#

