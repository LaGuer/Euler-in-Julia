
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

