smaller(A, B, A) :- (A =< B).
smaller(A, B, B) :- (B < A).
smallest([Head|[]], Head).
smallest([Head|Tail], C) :- smallest(Tail, X), smaller(X, Head, C).