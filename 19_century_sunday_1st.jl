

function count_day1_sundays()
    #= easy way:=#
    ns=0;
    for d = Date(1901, 1, 1):Dates.Day(1):Date(2000, 12, 31)
        ns += (Dates.issunday(d) && Dates.day(d) == 1)? 1 : 0
    end
    ns
    


end

if !isinteractive()
    println(count_day1_sundays())
end

