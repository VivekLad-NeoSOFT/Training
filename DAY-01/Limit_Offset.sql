/*
The LIMIT clause is used to specify the number of records to return.
The LIMIT clause is useful on large tables with thousands of records. 
Returning a large number of records can impact performance.
*/

-- 1) Get the First 10 Customers
SELECT * FROM customer
ORDER BY customer_id
LIMIT 10;

-- Output:
/*
# customer_id	first_name	last_name	email	phone_number	birthdate	address	city	country	postal_code
1	Alfie	Brazer	abrazer0@newsvine.com	222-154-3766	1960-08-29	90 Starling Avenue	Huangrangping	China	
2	Vitia	Bunclark	vbunclark1@jimdo.com	485-997-3664	1958-02-05	942 Jay Hill	Mikhaylovka	Russia	613384
3	Dell	Rumke	drumke2@latimes.com	611-170-3953	1967-10-31	4980 Rowland Place	Logon	Philippines	8410
4	Ashli	Ponnsett	aponnsett3@jigsy.com	180-935-5967	1987-07-21	7 Algoma Park	Hernández	Argentina	3156
5	Katha	Hatter	khatter4@webeden.co.uk	330-769-5161	1990-07-05	9 Oxford Pass	Akron	United States	44315
6	Rhianon	Shimwall	rshimwall5@upenn.edu	553-310-0303	1983-05-19	1631 Duke Circle	Mirsk	Poland	59-630
7	Jo-ann	Spragge	jspragge6@nymag.com	123-461-3449	1980-12-17	5 Sutherland Street	Rantīs	Palestinian Territory	
8	Stesha	Lazer	slazer7@biglobe.ne.jp	876-599-6620	2003-10-12	4169 Lukken Court	Juripiranga	Brazil	58330-000
9	Aidan	Stapells	astapells8@scientificamerican.com	993-778-2630	1953-05-13	9 Northland Way	Vrtojba	Slovenia	5291
10	Waneta	Parades	wparades9@printfriendly.com	119-873-1105	1972-09-24	556 Mendota Terrace	Pajannangger	Indonesia	
*/
-----------------------------------------------------------------------------------------------------------------

-- 2) Get the Next 10 Customers
SELECT * FROM customer
ORDER BY customer_id
LIMIT 10 OFFSET 10;

-- Output:
/*
# customer_id	first_name	last_name	email	phone_number	birthdate	address	city	country	postal_code
11	Pru	Havile	phavilea@moonfruit.com	726-387-9613	1965-12-31	2046 Holy Cross Center	Qinhong	China	
12	Jean	Blade	jbladeb@oakley.com	726-132-5117	2003-05-07	67353 Loomis Plaza	Xin’an	China	
13	Lynne	Langhor	llanghorc@constantcontact.com	283-726-8243	1953-04-28	314 Coleman Way	Pupiales	Colombia	524528
14	Wendeline	Jellard	wjellardd@4shared.com	338-575-4154	1988-09-22	545 Stoughton Road	Platagata	Philippines	4807
15	Collette	Osgood	cosgoode@discuz.net	405-799-9415	1961-11-15	21 Pennsylvania Road	Oklahoma City	United States	73124
16	Rafi	Ivanuschka	rivanuschkaf@ameblo.jp	675-377-0969	1958-09-21	5243 Eliot Parkway	Pasararba	Indonesia	
17	Engracia	Balston	ebalstong@nba.com	443-207-2291	1973-11-08	426 Brickson Park Hill	Shihuang	China	
18	Raymond	Banfill	rbanfillh@salon.com	392-375-3768	1985-10-16	2136 Heffernan Alley	Västerås	Sweden	721 85
19	Brigitta	Carlesi	bcarlesii@ovh.net	673-181-5918	1976-07-29	2406 Oneill Park	Mont-Dore	New Caledonia	98810
20	Wilow	Walworth	wwalworthj@1und1.de	664-321-0761	1986-03-23	137 Bluejay Point	Riebiņi	Latvia	
*/
-----------------------------------------------------------------------------------------------------------------

