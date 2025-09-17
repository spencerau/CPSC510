% lowercase: constant
% uppercase: variable

solution(Queens) :- 
    % Queens must be a list of length 8
    length(Queens, 4),
    queens(Queens).

% base case
queens([]).
% place queen at Row and Col
queens([queen(Row, Col) | Others]) :- 
    % check that the other queens are placed correctly via recursive call
    queens(Others),
    % set one queen at per row (8 rows total for 8 queens)
    length(Others, OthersLength),
    Row is OthersLength + 1,
    % chooses a value for Col within 1-8, then checks that with noattack(); used to assign (unification) values to Col
    member(Col, [1,2,3,4]),
    % check that the queen does not attack any other queens
    noattack(queen(Row, Col), Others).

% queen cannot attack any other queens 
noattack(_, []).
noattack(queen(Row, Col), [queen(Row1, Col1) | Others]) :-
    % check column
    Col =\= Col1,                    
    % check diagonals
    Col1-Col =\= Row1-Row,           
    Col1-Col =\= Row-Row1,
    noattack(queen(Row, Col), Others).

