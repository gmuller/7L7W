vizzini := Object clone
vizzini talk := method(
	"Fezzick, are there any rocks ahead?" println
	yield
	"No more rhymes now, I mean it." println
	yield
)

fezzick := Object clone
fezzick rhyme := method(
	yield
	"If there are, we'll all be dead" println
	yield
	"Anybody want a peanut?" println
)

vizzini @@talk; fezzick @@rhyme
Coroutine currentCoroutine pause	