def whileLoop {
	var i = 1
	while(i <=3) {
		println(i)
		i +=1
	}
}
whileLoop

def forLoop {
	println("Just a for loop")
	for (i <- 0 until args.length) {
		println(args(i))
	}
}
forLoop

def rubyLoop {
	println("ruby loop")
	args.foreach { arg =>
		println(arg)
	}
}
rubyLoop