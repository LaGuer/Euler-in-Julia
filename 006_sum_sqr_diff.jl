
function sum_sqr_diff(l)
    sq_of_sum = sum(1:l)^2
    sum_of_sq = sum((1:l).^2)

    diff = sq_of_sum - sum_of_sq
end

if !isinteractive()
    println(sum_sqr_diff(100))
end
