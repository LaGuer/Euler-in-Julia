


"""
spiral_diag_sum(dim[= 5])
Sum of the diagonals of a spiral constructed counterclockwise starting from 1 at the middle. 

```
M =
[*21*   22   23   24   *25*
20    *7*   8   *9*   10
19     6   *1*   2    11
18    *5*   4   *3*   12
*17*   16   15   14   *13*]
```
spiral_diag_sum(M) => 101

Sum of different arithmetic progressions. 
1 + (3 + 3+2 + 3+2+2 + 3+2+2+2) + (13 + 13+4 + ...) + ( + +6 + ...)
In an arithmetic progression: Sn is Sum of n terms, Tn is nth term, d is the diff between terms.
Here, each new AP's T1 is equal to (the old AP's last term + the new d).

l is the layer number, the distance of the current layer of spiral from the central 1.
Each layer adds 2 to the dimensions, and the center already has dimension 1.
Hence, dimensions = 2*(number of layers)+1 => numlayers = (dim-1)/2

Each layer has 4 terms in the diagonals.
For layer l, the d of that AP is 2l.
Sn = n(a + (n-1)d/2) = 4(a + 3d/2) = 4(a + 3l)

a at layer l = a at layer l-1 + 3(previous d) + current d = a at layer l-1 + 3*2(l-1) + 2l
a @ layer l = a @ layer l-1 + 8l - 6 = (1 + ... + 8(l-2) - 6 + 8(l-1) - 6) + 8l - 6
a@l = 1 - 6l + 8(l + l-1 + l-2 + ... 1) = 1 - 6l + 8l(l+1)/2 = 1 - 6l + 4l(l+1)

So, Sn = 4(1 - 6l + 4l(l+1) + 3l) = 4(1 - 3l + 4l(l + 1)) = 4(1 - 3l + 4l² + 4l)
Sn at layer l = 4(1 + l + 4l²) = 4(1 + l(1 + 4l))


"""
function spiral_diag_sum(dim = 1001)
    num_layers = (dim - 1)÷2

    layers_sum = 1 + 
    @parallel (+) for l in 1:num_layers
        4(1 + l*(1 + 4l))
    end
end

if !isinteractive()
    println(spiral_diag_sum())
end

