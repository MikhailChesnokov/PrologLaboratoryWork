predicates
 nondeterm marks(String, integer, integer, integer)
 superior(String)
 mathematitian(String)
 debtor(String)
 debtorByAnalysis(String)
 nondeterm best(String)
 nondeterm getSum(String,integer)
 nondeterm betterExists(String)
 lazyProgrammer(String)
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
 	
 getSum(SURNAME,SUM):-marks(SURNAME,M1,M2,M3),
						SUM = M1 + M2 + M3.
 betterExists(SURNAME):-getSum(SURNAME,SUM),
						getSum(_,SUM2),
						SUM2>SUM.
 /* "best" isn't works with nondeterm. */
 best(SURNAME):-not(betterExists(SURNAME)).
 
 lazyProgrammer(SURNAME):-marks(SURNAME,ALGEBRA,_,PROGRAMMING),
				PROGRAMMING>8,
				ALGEBRA<5;
 			marks(SURNAME,_,ANALYSIS,PROGRAMMING),
				PROGRAMMING>8,
				ANALYSIS<5.
 /*
 goal
   superior("Ivanov")
   mathematitian(X1)
   debtorByAnalysis(X2)
   debtor(X3)
   best("Ivanov") - only nondeterm
   lazyProgrammer(X4)
 */