
"""
Return the denominator of the lowest form of the product of:
all the non-trivial digit-canceling fractions that are less than 1 in value and 
have two digits in the numerator and two in the denominator (where non-trivial requires
that the canceled digit is not a 0.)
Phew.
"""
function p33()
    denominator(prod(digit_canceling_fracs()))
end

function digit_canceling_fracs()
    result = Vector{Rational}()
    for numer in 11:98
        (numer % 10 == 0) && continue
        nd = digits(numer)
        for denom in (numer+1):100 #better to construct denom from numer digits? 
            (denom % 10 == 0) && continue
            dd = digits(denom)
            (is_cancelable, newnumer, newdenom) = cancel_digit(nd, dd)
            if is_cancelable && (newnumer//newdenom == numer//denom)
                push!(result, numer//denom)
            end
        end
    end
    result
end

function cancel_digit(nd, dd)
    @assert length(nd) == 2 && length(dd) == 2
    newnumer = newdenom = 0
    is_cancelable = false
    if nd[1] == dd[1]
        is_cancelable = true
        (newnumer, newdenom) = (nd[2], dd[2])
    elseif nd[1] == dd[2]
        is_cancelable = true
        (newnumer, newdenom) = (nd[2], dd[1])
    elseif nd[2] == dd[1]
        is_cancelable = true
        (newnumer, newdenom) = (nd[1], dd[2])
    elseif nd[2] == dd[2]
        is_cancelable = true
        (newnumer, newdenom) = (nd[1], dd[1])
    end
    return (is_cancelable, newnumer, newdenom)
end

if !isinteractive()
    println(p33())
end
