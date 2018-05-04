

function get_max_cycle(lim = 1000)
    max_cycle = max_n = 0
    for n in 2:(lim-1)
        cycle_len = get_cycle_length(n)
        if max_cycle < cycle_len
            (max_n, max_cycle) = (n, cycle_len)
        end
    end

    (max_n, max_cycle)
end

function get_cycle_length(n)
    num = 1
    den = n
    cycle_len = 0

    seen_rems_pos = Dict{Int, Int}()
    pos_in_quot   = 0
    while true
        while num < den
            num *= 10
            pos_in_quot += 1
        end
        q = num ÷ den
        r = num % den
        r == 0 && break #terminating, no recurring cycle here
        if r in keys(seen_rems_pos)
            cycle_len = (pos_in_quot + 1) - seen_rems_pos[r]
            break
        end
        seen_rems_pos[r] = pos_in_quot
        pos_in_quot += 1
        num = r
    end

    cycle_len
end

if !isinteractive()
    println(get_max_cycle())
end

