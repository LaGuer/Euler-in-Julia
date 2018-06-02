

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
    for perimeter in 5:upto
        n = num_right_tris(perimeter)
        if n > max_num_right_tris
            (max_solns_perimeter, max_num_right_tris) = (perimeter, n)
        end
    end
    max_solns_perimeter
end

function num_right_tris(perimeter)
    n = 0
    c_max = perimeter÷2
    for c in c_max:-1:2
        csq = c^2
        for b in (c-1):-1:1
            a = perimeter - b - c
            if a^2 + b^2 == csq
                n += 1
            end
        end
    end
    n
end

isinteractive() || println(get_max_solns_perimeter())

#=
alt method: cache all sqrs of nums <500 (sicne c < 500), check each square sum
up to 500, increment dict value if a cached sqr found
=#
