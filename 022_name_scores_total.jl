

name_scores_total() = name_scores_total(@__DIR__()*"/022data_names.txt")
name_scores_total(names_file::String) = name_scores_total(vec(readdlm(names_file, ',', String)))

function name_scores_total(names_list::Array{String})
    sort!(names_list)
    alphabet_order = Dict((c, UInt8(c) - UInt8('A') + 1) for c in 'A':'Z')

    total_score = 0
    for (pos, name) in enumerate(names_list)
        try
            name_score = pos * sum(alphabet_order[c] for c in name)
            total_score += name_score
        catch er
            er isa KeyError && error("Only CAPITAL English letters are allowed in the file ($(name) has $(er.key) in it)")
            rethrow()
        end
    end

    total_score
end

if !isinteractive()
    println(name_scores_total())
end

