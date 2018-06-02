
const letter_values = Dict((c => c - 'A' + 1 for c in 'A':'Z'))

"""
count_triangle_words([filename])
Problem statement:
The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
Using words.txt, a 16K text file containing nearly two-thousand common English words, how many are triangle words?
"""
count_triangle_words() = count_triangle_words(@__DIR__()*"/042data_words.txt")
function count_triangle_words(filename)
    fs = open(filename)
    n  = 0
    s = readuntil(fs, ',')
    while !isempty(s)
        w = strip(chop(s), '"')
        if is_tri_num(get_word_value(w))
            n += 1
        end
        s = readuntil(fs, ',')
    end
    n
end

get_word_value(w) = sum((letter_values[c] for c in w))

is_tri_num(n) = isinteger((-1 + sqrt(1 + 8n))/2)

#=

n²+n = 2tₙ => n² + n - 2tₙ = 0
soln: n = (-1 ± √(1 + 8t))/2
if ((-1 + √(1+8t))/2) is a positive integer, tₙ is a triangle number
sqrt may be costly, decide whether to use this or precalculating tri nums, based on word value ranges.
Result: precalc and formula methods perform the same, so use formula since it's more generic

=#
isinteractive() || println(count_triangle_words())

