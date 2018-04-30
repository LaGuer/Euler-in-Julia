
const p18_triangle = [75 00 00 00 00 00 00 00 00 00 00 00 00 00 00
                      95 64 00 00 00 00 00 00 00 00 00 00 00 00 00
                      17 47 82 00 00 00 00 00 00 00 00 00 00 00 00
                      18 35 87 10 00 00 00 00 00 00 00 00 00 00 00
                      20 04 82 47 65 00 00 00 00 00 00 00 00 00 00
                      19 01 23 75 03 34 00 00 00 00 00 00 00 00 00
                      88 02 77 73 07 63 67 00 00 00 00 00 00 00 00
                      99 65 04 28 06 16 70 92 00 00 00 00 00 00 00
                      41 41 26 56 83 40 80 70 33 00 00 00 00 00 00
                      41 48 72 33 47 32 37 16 94 29 00 00 00 00 00
                      53 71 44 65 25 43 91 52 97 51 14 00 00 00 00
                      70 11 33 28 77 73 17 78 39 68 17 57 00 00 00
                      91 71 52 38 17 14 91 43 58 50 27 29 48 00 00
                      63 66 04 68 89 53 67 30 73 16 69 87 40 31 00
                      04 62 98 27 23 09 70 98 73 93 38 53 60 04 23]


function max_triangle_sum(M)
    @assert istril(M) "Input matrix m should be lower triangular, eg. [2 0 0; 3 5 0; 7 11 13]"

    max_sum_below(M, 1, 1)
end

function max_sum_below(M, i, j)
    (nrows, ncols) = size(M)
    if i == nrows
        return M[i, j] #nothing below this
    elseif j > i
        return 0 #in the zero filled triangle
    end

    M_max_sum_below = copy(M)
    relevant_rows = (nrows-1):-1:i
    for r in relevant_rows
        relevant_cols = j:j+(r-i)
        for c in relevant_cols
            M_max_sum_below[r, c] += max(M_max_sum_below[r+1, c], M_max_sum_below[r+1, c+1])
        end
    end

    M_max_sum_below[i, j]
end

if !isinteractive()
    rm = match(r"^\d+", PROGRAM_FILE)
    local M::Array{Int}
    if rm.match == "18"
        M = p18_triangle
    elseif rm.match == "67"
        M = p67_triangle
    else
        error("File name $(PROGRAM_FILE) doesn't start with Euler problem number.")
    end
    println(max_triangle_sum(M))
end

