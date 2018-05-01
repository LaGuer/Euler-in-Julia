

lex_perm_at_pos(r::Range) = lex_perm_at_pos(collect(r))
lex_perm_at_pos(r::Range, pos::Integer) = lex_perm_at_pos(collect(r), pos)
lex_perm_at_pos(pos::Integer) = lex_perm_at_pos(collect(0:9), pos)
function lex_perm_at_pos(digs::AbstractArray = collect(0:9), pos::Integer = 1_000_000)
    @assert(all(x -> 0 ≤ x ≤ 9, digs), "Numbers should only be among digits 0-9 (got $digs)")
    sort!(digs)
    ndigs::Int = length(digs)
    digs_to_num(ds)::Int = sum([d*10^(ndigs-i) for (i, d) in enumerate(ds)])

    #the sorted order is position 1 in lexicographic ordering
    pos == 1 && return digs_to_num(digs)

    pos_to_traverse = pos - 1 #4th pos means 3 to traverse from the sorted ordering
    perm_at_pos = copy(digs)
    for i in 1:length(perm_at_pos)
        #total number of permutations of digits beyond this placevalue
        perms_under_dig = factorial(ndigs - i)
        #cross n digits in this position = traverse n*perms_under_dig positions in lex order
        digits_to_cross = pos_to_traverse ÷ perms_under_dig

        perm_at_pos[i] = digs[digits_to_cross+1]
        deleteat!(digs, digits_to_cross+1)
        #digits_to_cross*perms_under_dig positions have been traversed by setting this digit, 
        # so subtract that away (using modulus)
        pos_to_traverse %= perms_under_dig
    end

    lex_perm_as_num = digs_to_num(perm_at_pos)
end


if !isinteractive()
    println(lex_perm_at_pos())
end

