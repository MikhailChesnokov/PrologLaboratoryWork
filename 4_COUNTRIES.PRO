domains
 city = ct(cityName, dwellersCount)
 cityName = String
 dwellersCount = integer
 cityList = city*
 countryName = String
predicates
 country(countryName, cityList)
 capitalOfCountry(countryName, cityName)
 includes(cityList, cityName)
 isCountryIncludesCity(countryName, cityName)
 countCities(cityList, integer)
 countCitiesOfCountry(countryName, integer)
 countDwellers(cityList, dwellersCount)
 countDwellersInCountry(String, dwellersCount)
 defineMax(city, city, city)
 largestCity(cityList, city)
 largestCityInCountry(countryName, city)
clauses
 country("Russia",[
 	ct( "Moskow",          10000),
 	ct( "St. Petersburg",   6000),
 	ct( "Novosibirsk",      3000),
 	ct( "Yekaterinburg",    2000)]).
 country("Ukraine",[
 	ct( "Kiev",             7000),
 	ct( "Lviv",             8000),
 	ct( "Mariupol",         3000)]).
 
 capitalOfCountry(COUNTRY,CAPITAL):-
 	country(COUNTRY,[ ct(CAPITAL,_) | _]).
 
 includes([ ct(CITY,_) | _], CITY).
 includes([_ | OTHERS], CITY):-
 	includes(OTHERS,CITY).
 isCountryIncludesCity(COUNTRY,CITY):-
 	country(COUNTRY,CITIES),
 	includes(CITIES,CITY).
 	
 countCities([_|OTHERS], SUM):-
 	countCities(OTHERS,SUBSUM),
 	SUM = SUBSUM + 1.
 countCities([],0).
 countCitiesOfCountry(COUNTRY,SUM):-
 	country(COUNTRY,CITIES),
 	countCities(CITIES,SUM).
 
 countDwellers([ct(_,DWELLERS)|OTHERS],SUM):-
 	countDwellers(OTHERS,SUBSUM),
 	SUM = SUBSUM + DWELLERS.
 countDwellers([],0).
 countDwellersInCountry(COUNTRY,DWELLERS):-
 	country(COUNTRY,CITIES),
 	countDwellers(CITIES,DWELLERS).
 
 defineMax( ct(CITY,DWELLERS), ct(_,SUBDWELLERS), ct(CITY,DWELLERS)):-
 	DWELLERS > SUBDWELLERS,!.
 defineMax( ct(_,_), ct(SUBCITY,SUBDWELLERS), ct(SUBCITY,SUBDWELLERS)).
 largestCity([ ct(CITY,DWELLERS) | OTHERS ], ct(MAXCITY,MAXDWELLERS)):-
 	largestCity(OTHERS,ct(SUBMAXCITY,SUBMAXDWELLERS)),
 	defineMax(ct(CITY,DWELLERS), ct(SUBMAXCITY,SUBMAXDWELLERS), ct(MAXCITY,MAXDWELLERS)).
 largestCity([],ct("NULL",0)).	
 largestCityInCountry(COUNTRY, ct(CITY, DWELLERS)):-
 	country(COUNTRY,CITIES),
 	largestCity(CITIES, ct(CITY,DWELLERS)).
/*
goal
 capitalOfCountry(COUNTRY,CAPITAL),
 isCountryIncudesCity("Russia","Yekaterinburg"),
 countCitiesOfCountry("Russia",TOTALCITIES),
 countDwellersInCountry("Russia",TOTALDWELLERS),
 largestCityInCountry("Ukraine",LARGESTCITY).
*/