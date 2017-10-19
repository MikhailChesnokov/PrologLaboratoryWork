predicates
 ruler(String, integer, integer)
 RulersAtYear(integer, String)
 RulersInInterval(integer,integer,String)
clauses
 ruler("Yaroslav the Wise",1019,1054).
 ruler("Iziaslav I",1054,1077).
 ruler("Vsevolod I",1078,1093).
 ruler("Sviatopolk II",1092,1112).
 ruler("Vladimir II Monomakh",1113,1125).
 ruler("Mstislav I the Great",1125,1132).
 RulersAtYear(YEAR,RULER):-ruler(RULER,FROM,TO),
 			   FROM<=YEAR,
 			   To>=YEAR.
 RulersInInterval(FROM,TO,RULER):-ruler(RULER,F,T),
 				  FROM<=T,
 				  TO>=F.
 /* 
 Goal:
 RulersAtYear(1092,X)
 RulersInInterval(1050,1080,Y)
 */