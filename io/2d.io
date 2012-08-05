List myAverage := method(
	total := 0
	try (
		self foreach(v, total = total + v)
		return total / self size
	) catch (Exception,
		"Something went wrong" println
	)
)

2d := list(
	list(2, 4, 3, 6, 3, 6, 3),
	list(2, 2, 6, 4, 2, 4, 2),
	list(2, 5, 3, 6, 4, 3, 2)
)

2d println
2d at(2) sum println
total := 0
2d foreach(v, total = total + v sum)
total println
2d at(2) myAverage println

empty := list()
list myAverage println

nan := list(1, 2, "three")
nan myAverage println
