predicates
 marks(String, integer, integer, integer)
 superior(String)
 mathematitian(String)
 debtor(String)
 debtorByAnalysis(String)
 lazyProgrammer(String)
 findMax(String,integer, integer, integer)
 best(String)
clauses
 marks("Ivanov",10,9,10).
 marks("Petrov",7,6,3).
 marks("Sidorov",5,4,9).
 marks("Danilova",8,7,10).
 marks("Kovalev",5,3,4).
 marks("Andreeva",6,7,6).
 
 superior(SURNAME):-marks(SURNAME,ALGEBRA,ANALYSIS,PROGRAMMING),
 			ALGEBRA>=8,
 			ANALYSIS>=8,
 			PROGRAMMING>=8.

 mathematitian(SURNAME):-marks(SURNAME,ALGEBRA,ANALYSIS,_),
 			ALGEBRA>=6,
 			ANALYSIS>=6.

 debtor(SURNAME):-marks(SURNAME,ALGEBRA,_,_),
 			ALGEBRA<4;
 		  marks(SURNAME,_,ANALYSIS,_),
 		  	ANALYSIS<4;
 		  marks(SURNAME,_,_,PROGRAMMING),
 			PROGRAMMING<4.

 debtorByAnalysis(SURNAME):-marks(SURNAME,_,ANALYSIS,_),
 				ANALYSIS<4.
				
 findMax(_,M1,M2,M3):-marks(_,X,Y,Z),
			X + Y + Z > M1 + M2 + M3,
 			!,fail.
 findMax(_,_,_,_).
 best(SURNAME):-marks(SURNAME,M1,M2,M3),
			findMax(SURNAME,M1,M2,M3).
 				
 lazyProgrammer(SURNAME):-marks(SURNAME,ALGEBRA,_,PROGRAMMING),
 			PROGRAMMING>8,
 			ALGEBRA<5,!.
 lazyProgrammer(SURNAME):-marks(SURNAME,_,ANALYSIS,PROGRAMMING),
 			PROGRAMMING>8,
 			ANALYSIS<5.
 /*
 goal
   superior("Ivanov"),
   mathematitian(X1),
   debtorByAnalysis(X2),
   debtor(X3),
   best(X4),
   lazyProgrammer(X5).
 */