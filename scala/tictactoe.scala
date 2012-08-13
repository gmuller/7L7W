class TicTacToe(board: String = "_________") {
	val gameBoard = Array.tabulate(9)((i) => board.charAt(i))
	var winner : Char = '?'
	var currentMove = 'O'
	
	def putMarker(index: Int) : Boolean = {
		if(index >= 0  && index < gameBoard.size && gameBoard(index).equals('_')) 
		{
			this.gameBoard(index) = currentMove
			currentMove = if (currentMove == 'X') 'O' else 'X'
			
			//check cols
			(0 until 2) foreach {i =>
				val row = Set(gameBoard(i), gameBoard(i+3), gameBoard(i+6))
				if (!row.contains('_') && row.size == 1) winner = row.head
			}
			
			//check rows
			(0 until 6 by 3) foreach {i =>
				val row = Set(gameBoard(i), gameBoard(i+1), gameBoard(i+2))
				if (!row.contains('_') && row.size == 1) winner = row.head
			}
			
			val diag1 = Set(gameBoard(0), gameBoard(4), gameBoard(8))
			if (!diag1.contains('_') && diag1.size == 1) winner = diag1.head
			
			val diag2 = Set(gameBoard(2), gameBoard(4), gameBoard(6))
			if (!diag2.contains('_') && diag2.size == 1) winner = diag2.head
			
			if (!gameBoard.contains('_')) winner = 'N';
			return true
		}
		return false
	}
	
	def printBoard {
		for (c <- 0 until this.gameBoard.size) {
			if (c % 3 == 0 && c != 0) println
			print(gameBoard(c) + " ")
		}
		println
	}
}

val ttt = new TicTacToe()
println("Let's Get Started")

while (ttt.winner == '?') {
	println("\nHere's the board: ")
	ttt.printBoard
	println("\n" + ttt.currentMove + "'s move.")
	
	val index = Console.readInt()
	if (!ttt.putMarker(index)) {
		println("\nInvalid Move!")
	}
}

println("\nGame Over!")
if (ttt.winner == 'N') println("Nobody Ever Wins") else println("Winner is: " + ttt.winner)