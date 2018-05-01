

function count_day1_sundays()
    #= easy way:
    ns=0;
    for d = Date(1901, 1, 1):Dates.Day(1):Date(2000, 12, 31)
        ns += (Dates.issunday(d) && Dates.day(d) == 1)?  1 : 0
    end
    ns
    =#
    
    #= hard way: 6x faster than the easy way, ~200μs =#
    daychange_in_month = [
                          31%7, #Jan,
                          y -> ((y % 400 == 0) ? 29 :
                                ((y % 100 == 0) ? 28 :
                                 ((y % 4 == 0)   ? 29 : 28)))%7, #Feb
                          31%7, #Mar,
                          30%7,
                          31%7,
                          30%7,
                          31%7, #July
                          31%7,
                          30%7, #September
                          31%7,
                          30%7,
                          31%7,
                         ]

    d = 2 # 1 = Monday; 1901-1-1 is the current day, and it's a Tuesday
    ns = 0
    for y in 1901:2000
        for m in 1:12
            daychange = daychange_in_month[m]
            change::Int = (typeof(daychange) == Int) ? daychange : daychange(y)
            #what's the day when all dates of this month have been added
            d += change
            if d > 7
                d %= 7
            end

            y == 2000 && m == 12 && break #will end up counting 1Jan2001 (if sunday), skip

            if d == 7
                ns += 1
            end
        end
    end
    ns
end

if !isinteractive()
    println(count_day1_sundays())
end

