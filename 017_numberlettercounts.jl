
const letters_in_num = Dict(0 => 0, #zero is never pronounced as part of a number
                            1 => 3, 2 => 3, 3 => 5, 4 => 4, 5 => 4, 
                            6 => 3, 7 => 5, 8 => 5, 9 => 4, 10 => 3, 
                            11 => 6, 12 => 6, 13 => 8, 14 => 8, 15 => 7,
                            16 => 7, 17 => 9, 18 => 8, 19 => 8, 20 => 6, 
                            30 => 6, 40 => 5, 50 => 5, 60 => 5, 70 => 7,
                            80 => 6, 90 => 6, )

# this is a tuple of tuples (not Dict) because we want to preserve order
const letters_in_bignum = ((1_000_000_000, 7), #"billion",
                           (1_000_000, 7), #"million",
                           (1000, 8), #"thousand",
                           (100, 7) #"hundred",
                          )

function total_letters_in_numbers(upto = 1000)
    total_letters = 0
    for n in 1:upto
        total_letters += count_letters_in_num(n)
    end
    total_letters
end

function count_letters_in_num(n::T) where T<: Integer
    n in keys(letters_in_num) && return letters_in_num[n]

    num_letters = 0
    for (bn, bnl) in letters_in_bignum
        if n >= bn
            num_letters += count_letters_in_num(n÷bn) + bnl #"seventeen" + "billion"
            n %= bn
        end
    end
    n == 0 && return num_letters

    if num_letters > 0
        num_letters += 3 #"and"
    end

    if n in keys(letters_in_num) #reduced to one of the base numbers?
        num_letters += letters_in_num[n]
    else
        ones_dig = n % 10
        num_letters += count_letters_in_num(ones_dig) 
        n -= ones_dig

        num_letters += letters_in_num[n] #by now it's one of 20, 30, 40, ...
    end
    num_letters
end

if !isinteractive()
    println(total_letters_in_numbers())
end

