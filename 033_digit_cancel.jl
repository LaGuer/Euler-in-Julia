
"""
Return the denominator of the lowest form of the product of:
all the non-trivial digit-canceling fractions that are less than 1 in value and 
have two digits in the numerator and two in the denominator. 
Phew.
"""
function p33()
    prod(digit_canceling_fracs())
end

function digit_canceling_fracs()
    numer = 11
    result = Vector{Rational}()
    while numer < 99
        denom = numer + 1
        nd = digits(numer)
        while denom < 100 #better to construct denom from numer digits? 
            dd = digits(denom)
            (is_cancelable, newnumer, newdenom) = cancel_digit(nd, dd)
            if is_cancelable
                if newnumer//newdenom == numer//denom
                    push!(result, numer//denom)
                end
            end
            denom += 1
            denom += (denom % 10 == 0) ? 1 : 0 #skip 20, 30, 40, etc.
        end
        numer += 1
        numer += (numer % 10 == 0) ? 1 : 0 #skip 20, 30, 40, etc.
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
