
% base case
my_member(X, [Y]).

% member(X, [H | T]) where T is the tail / rest of the list

my_member(X, [H | T]) :- X = H.
my_member(X, [H | T]) :- my_member(X,T).
