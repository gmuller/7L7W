BitMap := Object clone
BitMap init := method(
	self bitMap := list()
)
BitMap dim := method(x_len, y_len,
	self bitMap preallocateToSize(y_len)
	for (i, 0, y_len -1, self bitMap append(list() setSize(x_len)))
	self
)

BitMap set := method(x, y, value,
	self bitMap at(y) atPut(x, value)
)

BitMap get := method(x, y,
	self bitMap at(y) at(x)
)

BitMap print := method(
	self bitMap foreach(i, v, writeln(v asJson))
)

BitMap transpose := method(
	transposedList := BitMap clone dim(
		self bitMap size, self bitMap at(0) size
	)
	self bitMap foreach(y, subList,
		subList foreach(x, value,
			transposedList set(y, x, value)
		)
	)
	transposedList
)

bm := BitMap clone
bm dim(5, 5)
for(i, 0, 4, for(j, 0, 4, bm set(i, j, Random value(1, 5)))) 
bm get(1, 2) println
bm print

bm2 := bm transpose
bm2 print

f := File with("newFile.txt") remove openForUpdating write(bm serialized) close
bm3 := BitMap clone
f2 := File("newFile.txt") contents (bm3 deserialized) close

