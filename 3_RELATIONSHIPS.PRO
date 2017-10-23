predicates
 nondeterm father(String, String)
 nondeterm son(String, String)
 nondeterm brother(String, String)
 nondeterm uncle(String, String)
 nondeterm grandfather(String, String)
 nondeterm who(String, String)
clauses
 son("Alexey","Yuri").
 son("Yuri","Ivan").
 son("Sergey","Ivan").
 son("Alexander","Ivan").
 son("Pavel","Sergey").
 
 father(FATHER,SON):-
		son(SON,FATHER).
 brother(SON1,SON2):-
 		son(SON1,FATHER),
 		son(SON2,FATHER),
 		SON1 <> SON2.
 uncle(UNCLE,PL):-
		son(PL,FATHER),
 		brother(FATHER,UNCLE).
 grandfather(GRANDFATHER,GRANDSON):-
		father(GRANDFATHER,FATHER),
 		son(GRANDSON,FATHER).
 who(PERSON1,PERSON2):-
		son(PERSON1,PERSON2),Write("Son"),nl;
		son(PERSON2,PERSON1),Write("Father"),nl;
		grandfather(PERSON1,PERSON2),Write("Grandfather"),nl;
		grandfather(PERSON2,PERSON1),Write("Grandson"),nl;
		uncle(PERSON1,PERSON2),Write("Uncle"),nl;
		uncle(PERSON2,PERSON1),Write("Pl"),nl;
		PERSON1 = PERSON2,Write("Himself"),nl.
/*
goal
 brother("Sergey",X1)
 grandfather(X2,"Pavel")
 who("Sergey","Alexey")
*/