% Name : Anirudh Mohan
% Date : 11/12/2017



% 1. membership(Memeber, List)
membership(X, [X|_]).
membership(X,[_|T]) :- member(X,T).

% 2. element1(List)
element1([X|_]) :- write('Head = '), write(X).

% 3. lastelement(List, Last element)
lastelement([X], X).
lastelement([_|T], X) :- lastelement(T, X).

% 4. adjacent(First element, Second element, List)
adjacent(X, Y, [X,Y|_]).
adjacent(X, Y, [_|T]) :- adjacent(X, Y, T).

% 5. adjacent3(First element, Second element, Third element, List)
adjacent3(X, Y, Z, [X,Y,Z|_]).
adjacent3(X, Y, Z, [_|T]) :- adjacent3(X, Y, Z, T).

% 6. append1(List1, List2, result_List)
append1([], L2, L2). 
append1([X|T1], L2, [X|T3]) :- append1(T1,L2,T3).

% 7. delete(Element, From List, Resulting List)
del(X, [X|T], T).
del(X, [H|T], [H|T1]) :- del(X, T, T1).

% 8.  append2(Element, From List, Resulting List)
append2(X, [], [X]).
append2(X, [H|T], [H|T1]) :- append2(X, T, T1).

% 9. insert(Element, List, Expanded list)
insert(X, L, XL) :- del(X, XL, L).

% 10. len(List, Length)
len([], 0). 
len([_|T], Num) :- len(T, Num1), Num is 1 + Num1.

% 11. reverse1(Original List, Reversed List)
reverse1([],[]).
reverse1([H|T], Rev) :- reverse1(T,RT), append1(RT, [H], Rev).

% 12. palindrome(List)
palindrome(L):- reverse1(L, L).

% 13. display(List)
display([H | T]) :- write('List = '), write([H | T]).