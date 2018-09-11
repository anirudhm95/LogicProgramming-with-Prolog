% Name : Anirudh Mohan
% Date : 11/12/2017

is_male(lann).
is_male(loren).
is_male(tytos).
is_male(tywin).
is_male(kevan).
is_male(tyrion).
is_male(jaime).
is_male(lancel).


is_female(jeyne).
is_female(joanna).
is_female(dorna).
is_female(cersei).


is_parent_of(tywin,tyrion).
is_parent_of(tywin,jaime).
is_parent_of(tywin,cersei).

is_parent_of(joanna,tyrion).
is_parent_of(joanna,jaime).
is_parent_of(joanna,cersei).

is_parent_of(kevan,lancel).
is_parent_of(dorna,lancel).

is_parent_of(tytos,tywin).
is_parent_of(tytos,kevan).

is_parent_of(jeyne,tywin).
is_parent_of(jeyne,kevan).

is_parent_of(loren,tytos).

is_parent_of(lann,loren).

%********************** ********************** ********************** ********************** 

mother(MOTHER, CHILD) :- is_female(MOTHER), is_parent_of(MOTHER, CHILD).

father(FATHER, CHILD) :- is_male(FATHER), is_parent_of(FATHER, CHILD).

sibling1(NAME1, NAME2) :- is_parent_of(X, NAME1), is_parent_of(X, NAME2), NAME1\=NAME2.

% Add your person in NAME2 to check if they have a brothers %
brother1(NAME1, NAME2) :- sibling1(NAME1, NAME2), is_male(NAME1).

% Add your person in NAME2 to check if they have a sisters %
sister1(NAME1, NAME2) :- sibling1(NAME1, NAME2), is_female(NAME1).

%********************** ********************** ********************** ********************** 


sibling2(NAME1, NAME2) :- is_parent_of(X, NAME1), is_parent_of(X, NAME2), 
						  is_parent_of(Y, NAME1), is_parent_of(Y, NAME2),
							NAME1\=NAME2, X\=Y.

% Add your person in NAME2 to check if they have a brothers %
brother2(NAME1, NAME2) :- sibling2(NAME1, NAME2), is_male(NAME1).

% Add your person in NAME2 to check if they have a sisters %
sister2(NAME1, NAME2) :- sibling2(NAME1, NAME2), is_female(NAME1).

%********************** ********************** ********************** ********************** 


cousin(NAME1, NAME2) :- is_parent_of(X, NAME1), is_parent_of(Y, NAME2),
						sibling1(X,Y).
						
uncle(UNCLE, CHILDNAME) :- is_male(UNCLE), sibling1(UNCLE,X), is_parent_of(X, CHILDNAME).

aunt(AUNT, CHILDNAME) :- is_female(AUNT), is_parent_of(AUNT,X), cousin(X,CHILDNAME).


%********************** ********************** ********************** ********************** 

grandparent(GRANDPARENT,GRANDCHILD):- is_parent_of(GRANDPARENT,X), is_parent_of(X,GRANDCHILD).

grandmother(GRANDMOTHER, GRANDCHILD) :- is_female(GRANDMOTHER), is_parent_of(GRANDMOTHER,X), is_parent_of(X,GRANDCHILD).

grandfather(GRANDFATHER, GRANDCHILD) :- is_male(GRANDFATHER), is_parent_of(GRANDFATHER,X), is_parent_of(X,GRANDCHILD).

grandchild(GRANDCHILD, GRANDPARENT) :- is_parent_of(GRANDPARENT,X), is_parent_of(X,GRANDCHILD).

%********************** ********************** ********************** ********************** 


greatgrandparent(GREATGRANDPARENT, GREATGRANDCHILD) :- is_parent_of(GREATGRANDPARENT,X), 
														grandparent(X,GREATGRANDCHILD).

ancestor(ANCESTOR, CHILDNAME) :- is_parent_of(ANCESTOR, CHILDNAME).
ancestor(ANCESTOR, CHILDNAME) :- is_parent_of(ANCESTOR, X), ancestor(X, CHILDNAME).







