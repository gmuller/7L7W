class CensoredString(s: String) {
	val replacements = io.Source.fromFile("curses.txt").getLines
		.map(_.stripLineEnd.split(":", -1))
		.map(fields => fields(0) -> fields(1)).toList
	def censor = replacements.foldLeft(s)((prev, curr) => 
		prev.replaceAll(curr._1, curr._2))
}

implicit def stringWrapper(string: String) = new CensoredString(string)

val test = "Shoot, I really wanted to use some Darn worse words than this."
println(test)
println(test.censor)