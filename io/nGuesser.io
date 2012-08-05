n := Random value(1, 100) floor
n println
guesses := 1

while((guess := File standardInput readLine("Take a guess: ") asNumber()) != n,
	"Thats not it, " print
	if (guess > n, "too high" println, "too low" println)
	guesses = guesses + 1
	if (guesses > 10, break)
)
if(guess == n, ("You Got it after " .. guesses .. " tries") println, "You failed to guess it" println)