

function get_max_cycle(lim = 1000)
    terminators = get_terminators(lim)
    max_cycle = max_n = 0
    for n in 2:(lim-1)
        terminators[n] && continue

        #println(n, ": ", 1/n)
        cycle_len = get_cycle_length(n)
        if max_cycle < cycle_len
            (max_n, max_cycle) = (n, cycle_len)
        end
    end

    (max_n, max_cycle)
end

function get_terminators(lim)
    terminators = falses(lim)

    tp = 2.^(1:floor(Int, log2(lim)))
    fp = 5.^(1:floor(Int, log(5, lim)))
    mul = filter(n -> (n < lim), tp * fp')  #0.6 doesn't have unary isless
    terminators[[tp; fp; mul]] = true
    terminators
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
        #@show pos_in_quot seen_rems_pos q r
    end

    cycle_len
end

if !isinteractive()
    println(get_max_cycle())
end


