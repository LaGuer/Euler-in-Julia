

function num_downright_paths(gridsz = 20)
    #easy way: binomial(2*gridsz, gridsz)
    #(gridsz right steps + gridsz down steps) to get from src to dest, only choice
    # is where to intermingle the down steps among the total steps - so, which gridsz
    # positions to choose for down steps, among the total 2*gridsz steps taken. ∴  (2g)Cg

    # grid size in problem spec refers to number of edges, so no. of pts is +1 that
    grid = fill(-1, gridsz+1, gridsz+1)

    num_routes_to_end!(grid, 1, 1)
end

function num_routes_to_end!(grid, x, y)
    grid[x, y] ≥ 0 && return grid[x, y]

    last_idx = size(grid, 1)
    if (x, y) == (last_idx, last_idx)
        grid[x, y] = 1 #1 route from last point to itself
        return grid[x, y]
    end

    down_routes = right_routes = 0
    if x != last_idx
        down_routes = num_routes_to_end!(grid, x+1, y)
    end
    if y != last_idx
        right_routes = num_routes_to_end!(grid, x, y+1)
    end

    total_routes = down_routes + right_routes
    grid[x, y] = total_routes
end

if !isinteractive()
    println(num_downright_paths())
end

