3.	/* создание таблицы Среднемесячная заработная плата работников организаций 2024 г.*/
4.	
5.	CREATE TABLE zp_2024 (
6.	    municipal VARCHAR(50),
7.	    zp DOUBLE PRECISION);
8.	COPY zp_2024 (municipal, zp)
9.	FROM 'C:\SQL\zarplata.csv'
10.	DELIMITER ';'
11.	CSV HEADER;
12.	
13.	/* создание таблицы Число семей, получивших жилые помещения и улучшивших жилищные условия в отчетном году, 2024 г.*/
14.	
15.	CREATE TABLE zhilyo_2024 (
16.	    municipal VARCHAR(50),
17.	    kolichestvo_ zhilyo INTEGER);
18.	COPY zp_2024 (municipal, kolichestvo_ zhilyo)
19.	FROM 'C:\SQL\zhilyo.csv'
20.	DELIMITER ';'
21.	CSV HEADER;
22.	
23.	/* создание таблицы Число лечебно-профилактических организаций, единица, значение показателя за 2024 г. */
24.	
25.	CREATE TABLE zdrav_2024 (
26.	    municipal VARCHAR(50),
27.	    kolichestvo_zdrav INTEGER);
28.	COPY zp_2024 (municipal, kolichestvo_zdrav)
29.	FROM 'C:\SQL\zdrav.csv'
30.	DELIMITER ';'
31.	CSV HEADER;
32.	
33.	/* создание таблицы Количество организаций по данным государственной регистрации, единица, на 1 января 2025 г. */
34.	
35.	CREATE TABLE pred_2024 (
36.	    municipal VARCHAR(50),
37.	    kolichestvo_pred INTEGER);
38.	COPY zp_2024 (municipal, kolichestvo_pred)
39.	FROM 'C:\SQL\pred.csv'
40.	DELIMITER ';'
41.	CSV HEADER;
42.	
43.	/* создание таблицы Прибыль (убыток) до налогообложения  по данным бухгалтерской отчетности, тысяча рублей, значение показателя за 2024 год, */
44.	
45.	CREATE TABLE pribyl_2024 (
46.	    municipal VARCHAR(50),
47.	    pribyl INTEGER);
48.	COPY zp_2024 (municipal, pribyl)
49.	FROM 'C:\SQL\pribyl.csv'
50.	DELIMITER ';'
51.	CSV HEADER;
52.	
53.	/* создание таблицы Инвестиции в основной капитал, осуществляемые организациями, находящимися на территории муниципального образования 2024 г. */
54.	
55.	CREATE TABLE invest_2024 (
56.	    municipal VARCHAR(50),
57.	    invest INTEGER);
58.	COPY invest_2024 (municipal, invest)
59.	FROM 'C:\SQL\invest.csv'
60.	DELIMITER ';'
61.	CSV HEADER;
62.	
63.	/* агрегирование таблиц по уровню жизни населения */
64.	
65.	select z.municipal, z.zp, z2.kolichestvo_zhilyo, z3.kolichestvo_lpu    from zp_2024 z 
66.	inner join zhilyo_2024 z2 
67.	on z.municipal = z2.municipal
68.	inner join zdrav_2024 z3 
69.	on z.municipal = z3.municipal 
70.	/* агрегирование таблиц по уровню экономики */
71.	
72.	select p.municipal, p.kol_pred, p2.pribyl, i.invest  from pred_2024 p 
73.	inner join pribyl_2024 p2 
74.	on p.municipal = p2.municipal
75.	inner join invest_2024 i 
76.	on p.municipal  = i.municipal
77.	
