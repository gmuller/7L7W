class TicTacToe(board: String = "_________") {
	var gameBoard = Array.tabulate(9)((i) => board.charAt(i))
	var winner = Nil
	var currentMove = 'O'
	
	def putMarker(index: Int) : Boolean = {
		if(index >= 0  && index < gameBoard.size && gameBoard(index).equals('_')) 
		{
			this.gameBoard(index) = currentMove
			currentMove = if (currentMove == 'X') 'O' else 'X'
			return true
		}
		return false
	}
	
	def printBoard {
		for (c <- this.gameBoard) {
			print(c)
		}
		println
	}
}

val ttt = new TicTacToe()
println("Let's Get Started")

while (ttt.winner == Nil) {
	println("Here's the board: ")
	ttt.printBoard
	println(ttt.currentMove + "'s move.")
	
	val index = Console.readInt()
	if (!ttt.putMarker(index)) {
		println("Invalid Move")
	}
}