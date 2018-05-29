
function lcm_upto(l)
    #easy way: lcm(1:l)

    #hard way: (~50 times slower than easy way)
    mult = 1
    nums = collect(1:l)
    for idx in 2:length(nums)
        n = nums[idx]
        mult *= n

        #divide away current number from any other multiples of it
        nums[nums .% n .== 0] ./= n
    end
    mult
end

if !isinteractive()
    println(lcm_upto(20))
end
