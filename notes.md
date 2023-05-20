change the example
foo 1 -> y + 1
bar -> 1 + x

(to make it seem that other optimization can be triggered)

let f = (\x -> x + 5)
in (\y -> 1 + y) (f 1)

==>

let f = (\x -> x + 5)
in (\y -> 1 + y) ((\x -> x + 5) 1)

----------------

let f = (\x -> x + 5)
in let y = f 1
in 1 + y

==>

let f = (\x -> x + 5)
in let y = (\x -> x + 5) 1
in 1 + (\x -> x + 5) 1

--------------------

let f = (\x -> x + 5)
in f 1

==>

let f = (\x -> x + 5)
in f 1
