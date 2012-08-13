valid_queen((Row, Col)) :- member(Col, [1, 2, 3, 4, 5, 6, 7, 8]).
valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).
cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :- cols(QueensTail, ColsTail).
diag1([], []).
diag1([(Row,Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
	Diagonal is Col - Row,
	diag1(QueensTail, DiagonalsTail).
diag2([], []).
diag2([(Row,Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
	Diagonal is Col + Row,
	diag2(QueensTail, DiagonalsTail).

eight_queens(Board) :-
	Board = [(1, _), (2, _), (3, _), (4, _), (5, _), (6, _), (7, _), (8, _)],
	valid_board(Board),
	cols(Board, Cols),
	diag1(Board, Diags1),
	diag2(Board, Diags2),
	fd_all_different(Cols),
	fd_all_different(Diags1),
	fd_all_different(Diags2),
	write(Board).