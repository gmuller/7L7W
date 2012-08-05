fib := method(n,
	a := 1
	b := 1
	for(i, 3, n, 1, c := b; b = a + b; a = c)
	return b
)
fib(1) println
fib(2) println
fib(3) println
fib(4) println
fib(7) println 
fib(8) println


fib_rec := method(n,
	if(n == 1 or n == 2) then (return 1) else(return fib_rec(n-1) + fib_rec(n-2))
)

fib_rec(1) println
fib_rec(2) println
fib_rec(3) println
fib_rec(4) println
fib_rec(7) println
fib_rec(8) println