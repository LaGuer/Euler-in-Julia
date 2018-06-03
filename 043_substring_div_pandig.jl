
using Base.Cartesian: @nloops
const digits0to9 = Set(0:9)

function sum_subdiv_pandig()
    s = 0
    used_digits = Vector{Int}(10)
    for d_10 in 0:9
        used_digits[10] = d_10
        @nloops(9, d,
                (n -> allowed_digits_at(n, used_digits)), # range expr
                (n -> used_digits[n] = d_n),              # pre-expr
                begin                                     # loop body
                    sdpd_num = num_from_digits(reverse(used_digits))
                    s += sdpd_num
                end)
    end
    s
end

#=
d4 is an even digit
d3+d4+d5 is one of 6, 9, 12, 15, 18, 21, 24, 27 (0 and 3 totals need repeating digits)
d6 is 5 or 0
d6 + d8 - d7 is either 0 or 11
If d6 was 0, d8==d7 or d8-d7=11, neither is possible, so **d6 can only be 5**
=#
function allowed_digits_at(n, used_digits)
    allowed = setdiff(digits0to9, Set(used_digits[10:-1:(n+1)]))
    if n == 8 #check d8d9d10 is divisible by 17
        filter!(allowed) do d
            num_from_digits([used_digits[10] used_digits[9] d]) % 17 == 0
        end
    elseif n == 7 #check d7d8d9 is divisible by 13
        filter!(allowed) do d
            num_from_digits([used_digits[9] used_digits[8] d]) % 13 == 0
        end
    elseif n == 6 #check d4d5d6 is divisible by 5 and d6d7d8 is divisible by 11 here
        filter!(allowed) do d
            (d == 5) &&
            (d + used_digits[8] - used_digits[7]) in (0, 11)
        end
    elseif n == 5 #check d5d6d7 is divisible by 7
        filter!(allowed) do d
            num_from_digits([used_digits[7] used_digits[6] d]) % 7 == 0
        end
    elseif n == 4 #check d2d3d4 is divisible by 2
        filter!(allowed) do d
            d % 2 == 0
        end
    elseif n == 3 #d3d4d5 is divisible by 3
        filter!(allowed) do d
            (d + used_digits[4] + used_digits[5])/3 in 2:9
        end
    end
    allowed
end

num_from_digits(dn) = sum([dn[k]*10^(k-1) for k=1:length(dn)])

isinteractive() || println(sum_subdiv_pandig())
