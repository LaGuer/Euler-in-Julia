
function get_p67_triangle()::Array{Int,2}
    M = readdlm(@__DIR__() * "/067data_triangle.txt")
    M[M .== ""] = 0
    M
end

include(@__DIR__() * "/_max_triangle_sum.jl")

if !isinteractive()
    println(max_triangle_sum(get_p67_triangle()))
end
