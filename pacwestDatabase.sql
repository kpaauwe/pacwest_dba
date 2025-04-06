DROP TABLE Athletes;
DROP TABLE Teams;
DROP TABLE Sports;
DROP TABLE Schools;



CREATE TABLE Sports (
	sportID 	CHAR(3) PRIMARY KEY,
	sportName 	VARCHAR(20)
);

CREATE TABLE Schools (
	schoolID	CHAR(3) PRIMARY KEY,
	schoolName	VARCHAR(30)
);

CREATE TABLE Teams (
	teamID		CHAR(3) PRIMARY KEY,
	schoolID 	CHAR(3) REFERENCES Schools,
	sportID		CHAR(3) REFERENCES Sports,
	headCoach	VARCHAR(50),
	seasonRec	VARCHAR(10)
);

CREATE TABLE Athletes (
	athleteNum 	VARCHAR(4) PRIMARY KEY,
	athName 	VARCHAR (50),
	jerseyNum	NUMBER(2,0),
	teamID		CHAR(3) REFERENCES Teams,
	position 	VARCHAR (30),
	schoolYear	NUMBER (1,0),
	height 		NUMBER(3,2), --Format feet.inches '5.11'
	hometown 	VARCHAR(80)
);


INSERT INTO Sports (sportID, sportName)
	VALUES('001', 'Mens Volleyball');
INSERT INTO Sports (sportID, sportName)
	VALUES('002', 'Womens Volleyball');
INSERT INTO Sports (sportID, sportName)
	VALUES('003', 'Mens Basketball');
INSERT INTO Sports (sportID, sportName)
	VALUES('004', 'Womens Basketball');




INSERT INTO Schools (schoolID, schoolName)
	VALUES ('001', 'Vancouver Island University');
INSERT INTO Schools (schoolID, schoolName)
	VALUES ('002', 'Camosun College');
INSERT INTO Schools (schoolID, schoolName)
	VALUES ('003', 'Douglas College');
INSERT INTO Schools (schoolID, schoolName)
	VALUES ('004', 'Capilano University');
INSERT INTO Schools (schoolID, schoolName)
	VALUES ('005', 'Columbia Bible College');
INSERT INTO Schools (schoolID, schoolName)
	VALUES ('006', 'College of the Rockies');



	 --mvb teams
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('001', '001', '001', 'Abe Avender', '14-6');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('002', '002', '001', 'Kevin Ma', '14-6');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('003', '003', '001', 'Jeff Ross', '11-9');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('004', '004', '001', 'Markiel Simpson', '4-16');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('005', '005', '001', 'Kyle Pankratz', '6-14');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('006', '006', '001', 'Cisco Farrero', '15-5');
	 --wvb teams
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('007', '001', '002', 'Shane Hyde', '19-1');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('008', '002', '002', 'Brent Hall', '10-10');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('012', '003', '002', 'Jeff Ross', '7-13');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('009', '004', '002', 'Sue Soolsma', '12-8');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('010', '005', '002', 'Rebecca Wiebe', '8-12');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('011', '006', '002', 'Bryan Fraser', '4-16');
	 --mbb Teams
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('013', '001', '003', 'Matt Kuzminski', '21-3');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('014', '002', '003', 'Geoff Pippus', '19-5');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('015', '003', '003', 'Matt McKay', '8-16');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('016', '004', '003', 'Jason Price', '13-11');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('017', '005', '003', 'Brandon Fields', '11-13');
	 --wbb Teams
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('018', '001', '004', 'Tony Bryce', '21-1');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('019', '002', '004', 'John Dedrick', '4-20');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('020', '003', '004', 'Steve Beauchamp', '17-7');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('021', '004', '004', 'Chris Weimer', '10-14');
INSERT INTO Teams (teamID, schoolID, sportID, headCoach, seasonRec)
	VALUES ('022', '005', '004', 'Taylor Claggett', '19-3');

        --VIU MVB
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('001', 'Enrico Del Mundo', 1, 	'001', 'Libero', 	3, 5.11, 'Calgary, AB, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('002', 'Jake Stobbe', 		2, 	'001', 'Outside', 	4, 6.02, 'Chilliwack, BC, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('003', 'Gavin MacGregor', 	3, 	'001', 'Setter', 	1, 6.03, 'Kamloops, BC, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('004', 'Rowan MacPherson', 4, 	'001', 'Middle', 	1, 6.04, 'Kamloops, BC, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('005', 'Luke Sigurdson',	5, 	'001', 'Setter', 	5, 6.01, 'Oakbank, MB, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('006', 'Kolton Rawlusyk', 	6, 	'001', 'Outside',	2, 6.04, 'Red Deer, AB, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('007', 'Nathan Brown', 	7, 	'001', 'Libero', 	1, 5.10, 'Nanoose Bay, BC, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('008', 'Owen Dyck', 		8, 	'001', 'Setter',	4, 6.02, 'Winnipeg, MB, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('009', 'Max McDonald', 	9, 	'001', 'Middle', 	5, 6.05, 'Kelowna, BC, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('010', 'Phillip Treitel', 	10, '001', 'Outside', 	3, 6.07, 'Berlin, Germany');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('011', 'Sem Van Duist', 	11, '001', 'Middle', 	2, 6.07, 'Nanaimo, BC, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('012', 'Niklas Uhl', 		12, '001', 'Outside', 	1, 6.08, 'Meinheim, Germany');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('013', 'Manny Adefisayo', 	13, '001', 'Middle', 	3, 6.01, 'Prince George, BC, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('014', 'Rylan Van Kooten', 14, '001', 'Outside', 	4, 6.01, 'St. Andrews, MB, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('015', 'Kieran Paauwe', 	15, '001', 'Middle', 	3, 6.04, 'Calgary, AB, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('016', 'Colby Soolsma', 	16, '001', 'Outside', 	3, 6.05, 'North Vancouver, BC, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('017', 'Carter Munro', 	17, '001', 'Outside', 	3, 6.02, 'Victoria, BC, CA');
	 --camosun mvb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('100', 'Edvard Adolfsen', 	7, 	'002', 'Outside', 	3, 6.04, 'Sandes, Norway');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('101', 'Des Arthurs', 		19, '002', 'Outside', 	2, 6.03, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('102', 'Jake Bolton', 		3, 	'002', 'Outside', 	3, 6.02, 'Richmond, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('103', 'Liam Conlin', 		17, '002', 'Outside', 	4, 6.06, 'Calgary, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('104', 'Jordan Fulljames', 1, 	'002', 'Outside', 	2, 6.02, 'Prince George, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('105', 'Finn Johnson', 	14, '002', 'Middle',  	2, 6.05, 'Richmond, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('106', 'Noah Koldyk', 		12, '002', 'Outside', 	2, 6.07, 'Penticton');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('107', 'Nicolas Kozij', 	18, '002', 'Outside', 	2, 6.01, 'Ottawa');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('108', 'Kris La Guardia', 	5, 	'002', 'Libero',  	5, 5.05, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('109', 'Xavier Moreau', 	6, 	'002', 'Outside', 	1, 6.05, 'Edmonton, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('110', 'Matthew Rapin', 	10, '002', 'Outside', 	4, 6.01, 'Prince Albert, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('111', 'Lachlan Scherger', 15, '002', 'Middle',  	2, 6.07, 'Mildura, AU');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('112', 'Gabe Spinelli', 	10, '002', 'Outside', 	1, 6.06, 'Juiz de Fora, Brazil');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('113', 'Kyle Stodola', 	9, 	'002', 'Outside', 	2, 6.03, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('114', 'Huxley Wendland', 	4, 	'002', 'Outside', 	1, 6.05, 'Kamloops, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('115', 'Eli Woldringh', 	8, 	'002', 'Outside', 	2, 6.04, 'Prince George, BC');
	 --cap mvb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('200', 'Brendan Zebrynski',1, '004', 'Setter',     1, 6.02, 'Winnipeg, MB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('201', 'Oliver Westhaver', 2, '004', 'Libero',     1, 5.11, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('202', 'Trevor Matthysen', 3, '004', 'Outside',    1, 6.02, 'Mission, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('203', 'Marco Kost',       4, '004', 'Outside',    3, 6.04, 'Nuremberg, Germany');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('204', 'Jonah Violini',    8, '004', 'Setter',     2, 6.06, 'Vernon, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('205', 'Cole Appleton',    9, '004', 'Libero',     2, 6.02, 'Kelowna, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('206', 'Isaiah Ohori',     11, '004', 'Outside',   2, 6.02, 'Penticton, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('207', 'Reese Nowotny',    12, '004', 'Middle',    1, 6.03, 'Langley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('208', 'Brayden Labossiere',13, '004', 'Setter',   2, 6.01, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('209', 'Jakob Leinemann',  14, '004', 'Middle',    2, 6.09, 'Kelowna, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('210', 'Owen Genge',       15, '004', 'Libero',    2, 6.00, 'Burnaby, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('211', 'Dario Pereira',    16, '004', 'Outside',   2, 6.07, 'Brasilia, Brazil');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('212', 'Nate Raabe',       18, '004', 'Outside',   1, 6.05, 'Coquitlam, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('213', 'Tate Wheatley',    19, '004', 'Middle',    2, 6.05, 'Edmonton, Alta');
	 --cbc mvb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('300', 'Ben Doerksen', 1, '005', 'Libero', 1, 5.10, 'Lethbridge, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('301', 'Jonathan Letkemann', 2, '005', 'Outside', 4, 6.03, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('302', 'Matthew Louie', 3, '005', 'Setter', 1, 6.02, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('303', 'Cole Scott', 4, '005', 'Outside', 5, 6.03, 'London, ON');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('304', 'Troy Ardell', 5, '005', 'Outside', 2, 6.03, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('305', 'Isaac James', 6, '005', 'Outside', 2, 6.03, 'Richmond, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('306', 'Noah Friesen', 7, '005', 'Outside', 2, 6.03, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('307', 'Brayden Budd', 8, '005', 'Outside', 1, 6.03, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('308', 'Dylan Buehler', 9, '005', 'Middle', 1, 6.05, 'Prince George, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('309', 'Jackson Abiusi', 10, '005', 'Middle', 1, 6.05, 'Winnipeg, MB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('310', 'Luke Funk', 11, '005', 'Setter', 1, 6.02, 'Delta, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('311', 'Sam Wicki', 12, '005', 'Outside', 2, 6.03, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('312', 'Tobyn Kelpin', 13, '005', 'Middle', 1, 6.05, 'Victoria, BC');
	 --cotr mvb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('400', 'Reed Grusing', 2, '006', 'Outside', 4, 6.03, 'Bragg Creek, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('401', 'Jace Wilson', 3, '006', 'Outside', 2, 6.03, 'Vernon, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('402', 'Albert Francisco', 4, '006', 'Outside', 3, 6.00, 'Winnipeg, MB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('403', 'Brett Kester', 5, '006', 'Setter', 2, 6.00, 'Prince George, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('404', 'Cade Schindel', 6, '006', 'Outside', 2, 6.03, 'Swift Current, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('405', 'Jack Schmiess', 7, '006', 'Middle', 2, 6.04, 'Swift Current, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('406', 'Jhet Bowen', 8, '006', 'Setter', 1, 6.02, 'Winnipeg, MB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('407', 'Gage McDonald', 9, '006', 'Outside', 1, 6.00, 'Edam, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('408', 'Noah McFadzen', 10, '006', 'Libero', 2, 6.00, 'Cranbrook, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('409', 'Luke Margenau', 11, '006', 'Middle', 1, 6.05, 'Dubai, United Arab Emirates');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('410', 'Theo Clarke', 12, '006', 'Outside', 1, 6.06, 'Prince George, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('411', 'Ethan Braam', 13, '006', 'Middle', 3, 6.05, 'Kelowna, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('412', 'Noah Hadwen', 14, '006', 'Middle', 1, 6.08, 'Regina, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('413', 'Diego Policarpo', 15, '006', 'Outside', 4, 6.03, 'Sao Paulo, Brazil');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('414', 'Boston Thiessen', 16, '006', 'Setter', 2, 6.00, 'Mitchell, MB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('415', 'Reece Clarke', 17, '006', 'Libero', 4, 5.07, 'Ile des Chenes, MB');
	 --douglas mvb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('500', 'Juhan Park', 2, '003', 'Outside', 3, 6.04, 'Langley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('501', 'Elijah St. Germain', 3, '003', 'Libero', 2, 5.08, 'Delta, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('502', 'Owen Lam', 4, '003', 'Outside', 2, 6.02, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('503', 'Lucas Sansone', 5, '003', 'Middle', 3, 6.07, 'Buenos Aries, Argentina');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('504', 'Reese Rowland', 6, '003', 'Setter', 2, 6.02, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('505', 'Alp Kayra Aydin', 7, '003', 'Outside', 1, 6.05, 'Ankara, Turkey');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('506', 'Tyson Koop', 8, '003', 'Setter', 3, 6.05, 'Steinbach, MB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('507', 'Jake Thomson', 10, '003', 'Outside', 3, 6.03, 'Brandon, MB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('508', 'Marvin Tumusiime', 11, '003', 'Middle', 1, 6.05, 'Ntungamo, Uganda');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('509', 'Liam Bagshaw', 12, '003', 'Middle', 1, 6.05, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('510', 'Tylar Tran', 14, '003', 'Libero', 1, 5.10, 'Richmond, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('511', 'Elijah Kim', 15, '003', 'Setter', 4, 6.00, 'Richmond, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('512', 'Niko Robbles', 17, '003', 'Outside', 1, 5.11, 'Vancouver, BC');
	 --viu wvb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('600', 'Megan Duffy', 1, '007', 'Middle', 4, 6.00, 'Toronto, ON');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('601', 'Jordyn Exner', 2, '007', 'Libero', 2, 5.09, 'Buena Vista, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('602', 'Maggie Wood', 4, '007', 'Outside', 1, 5.11, 'Nanaimo, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('603', 'Grace Brisebois', 5, '007', 'Outside', 4, 6.01, 'Sechelt, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('604', 'Emma Schill', 6, '007', 'Outside', 5, 5.11, 'White Rock, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('605', 'Maranda Eby', 8, '007', 'Libero', 3, 5.05, 'Nanaimo, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('606', 'Elise Stime', 10, '007', 'Libero', 3, 5.04, 'Edmonton, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('607', 'Aimee Skinner', 11, '007', 'Outside', 2, 6.00, 'Coldstream, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('608', 'Lauren Hoard', 12, '007', 'Outside', 2, 6.01, 'Vernon, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('609', 'Danica Henderson', 13, '007', 'Setter', 1, 6.00, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('610', 'Grace Greene', 15, '007', 'Middle', 2, 6.02, 'Nanaimo, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('611', 'Maya Lees', 16, '007', 'Outside', 2, 5.11, 'Lumsden, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('612', 'Alannah Wright', 17, '007', 'Middle', 3, 6.01, 'Nanaimo, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('613', 'Kiana Gelissen', 18, '007', 'Middle', 5, 6.02, 'LaSalle, ON');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('614', 'Regan Ingram', 19, '007', 'Outside', 4, 6.00, 'Calgary, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('615', 'Keira Crellin', 20, '007', 'Setter', 1, 5.08, 'Calgary, AB');
	 --camosun wvb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('700', 'Georgia Archibald', 2, '008', 'Outside', 1, 5.10, 'Delta, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('701', 'Erica Bolink', 7, '008', 'Outside', 4, 6.00, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('702', 'Riyln Boorman', 11, '008', 'Outside', 2, 6.00, 'Red Deer, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('703', 'Ellie Carr', 16, '008', 'Middle', 1, 6.00, 'Burnaby, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('704', 'Tahlia Cook', 14, '008', 'Middle', 3, 6.00, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('705', 'Chantelle Dobie', 13, '008', 'Middle', 5, 6.00, 'Salmon Arm, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('706', 'Sierra Ede', 5, '008', 'Middle', 1, 6.00, 'Smithers, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('707', 'Capris Gunn', 9, '008', 'Middle', 1, 6.00, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('708', 'Karynn Hampe', 8, '008', 'Outside', 4, 6.00, 'Prince George, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('709', 'Avery Hansen', 6, '008', 'Setter', 3, 5.09, 'Red Deer, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('710', 'Paige Roslinsky', 17, '008', 'Libero', 3, 5.06, 'Red Deer, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('711', 'Christina Sofikitis', 12, '008', 'Outside', 2, 6.00, 'Richmond, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('712', 'Sloan Thomson', 15, '008', 'Libero', 2, 5.08, 'Saskatoon, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('713', 'Kwyn Tournier', 1, '008', 'Outside', 1, 5.10, 'Prince Albert, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('714', 'Olivia Trionfi', 4, '008', 'Setter', 1, 5.11, 'Langley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('715', 'Edyn Van Brabant', 3, '008', 'Outside', 2, 5.11, 'Bawlf, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('716', 'Jenna Young-Thompson', 10, '008', 'Setter', 2, 5.08, 'Victoria, BC');
	 --cap wvb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('800', 'Ella Green', 1, '009', 'Outside', 1, 5.09, 'Kelowna, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('801', 'Sophie Yarish', 2, '009', 'Setter', 2, 5.09, 'Prince George, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('802', 'Stephanie Sung', 3, '009', 'Outside', 4, 5.08, 'Burnaby, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('803', 'Natalie Rourke', 4, '009', 'Middle', 3, 6.00, 'Beaverlodge, Alta.');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('804', 'Maya Jovic', 5, '009', 'Outside', 5, 5.11, 'North Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('805', 'Monica Hoffman', 6, '009', 'Libero', 1, 5.05, 'West Kelowna, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('806', 'Sibby Bos', 7, '009', 'Middle', 4, 6.00, 'Kelowna, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('807', 'Ella Andreola', 8, '009', 'Libero', 3, 5.03, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('808', 'Nnya Mbaoma', 10, '009', 'Outside', 4, 5.10, 'Nanaimo, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('809', 'Aimee Tilley', 11, '009', 'Outside', 4, 5.11, 'North Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('810', 'Abby Betker', 13, '009', 'Outside', 3, 5.11, 'Kimberley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('811', 'Mollie English', 14, '009', 'Setter', 1, 5.08, 'Fort St. John, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('812', 'Kristen Young', 15, '009', 'Outside',3, 5.07, 'Burnaby, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('813', 'Grace Jerome', 16, '009', 'Middle', 1, 6.00, 'Langley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('814', 'Annika Kuznik', 17, '009', 'Outside', 4, 5.08, 'Delta, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('815', 'Taygen MacGregor', 18, '009', 'Middle', 2, 6.00, 'Langley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('816', 'Makenna Hamilton-Jackson', 19, '009', 'Outside', 2, 5.07, 'Vernon, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('817', 'Jennie Pereboom', 20, '009', 'Outside', 1, 6.01, 'Vernon, BC');
	 --cbc wvb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('900', 'Meredith Edgar', 1, '010', 'Outside', 1, 5.08, 'Langley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('901', 'Tianna Reimer', 2, '010', 'Libero', 2, 5.08, 'Calgary, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('902', 'Chloe Melin', 3, '010', 'Middle', 1, 5.08, 'Lanigan, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('903', 'Abigail Leiding', 4, '010', 'Outside', 1, 5.08, 'Langley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('904', 'Emma Jackson', 5, '010', 'Libero', 1, 5.08, 'Langley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('905', 'Olivia Pederson', 6, '010', 'Setter', 4, 5.08, 'Coldstream, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('906', 'Kiana Wiebe', 7, '010', 'Middle', 3, 5.08, 'Calgary, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('907', 'Julia Dingsdale', 8, '010', 'Libero', 2, 5.08, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('908', 'Nicole Reid', 9, '010', 'Outside', 5, 5.08, 'Chilliwack, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('909', 'Makayla Friesen', 10, '010', 'Outside', 1, 5.08, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('910', 'Keira Murphy', 11, '010', 'Libero', 2, 5.08, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('911', 'Marissa Bitter', 12, '010', 'Setter', 2, 5.08, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('912', 'Jill Barkey', 13, '010', 'Outside', 2, 5.08, 'Calgary, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('913', 'Elise Anderson', 14, '010', 'Middle', 1, 5.08, 'Langley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('914', 'Audrey Hansma', 15, '010', 'Outside', 1, 5.08, 'Fort St. John, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('915', 'Emily Brosius', 16, '010', 'Middle', 1, 5.08, 'Camrose, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('916', 'Brinay Burdick', 17, '010', 'Middle', 1, 5.08, 'Summerland, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('917', 'Kayla Dingsdale', 18, '010', 'Setter', 1, 5.08, 'Vancouver, BC');
	 --cotr wvb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1000', 'Ella Nichols', 1, '011', 'Outside', 4, 5.11, 'Medicine Hat, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1001', 'Alisia Dvorak', 2, '011', 'Middle', 3, 6.00, 'Fernie, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1002', 'Daivan Scherman', 3, '011', 'Middle', 2, 5.11, 'Battleford, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1003', 'Malia Somwe', 4, '011', 'Middle', 2, 5.11, 'Cranbrook, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1004', 'Cassie Fahselt', 5, '011', 'Setter', 2, 5.07, 'Jaffray, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1005', 'Winter Knudsgaard', 6, '011', 'Setter', 3, 5.07, 'Kimberley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1006', 'Olivia Harder', 7, '011', 'Outside', 1, 5.10, 'St-Pierre Jolys, MB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1007', 'Hannah Gray', 8, '011', 'Outside', 1, 5.10, 'Kelowna, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1008', 'Stevie Friesen', 9, '011', 'Libero', 1, 5.05, 'Fernie, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1009', 'Eloise Newsome', 10, '011', 'Outside', 1, 6.00, 'Cranbrook, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1010', 'Kayla Brasok', 11, '011', 'Middle', 1, 6.00, 'Calgary, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1011', 'Chloe Quaife', 12, '011', 'Outside', 2, 5.08, 'Cranbrook, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1012', 'Krista McKnight', 13, '011', 'Libero', 4, 5.05, 'Walsh, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1013', 'Rylee Bell', 14, '011', 'Outside', 4, 5.09, 'La Ronge, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1014', 'Maya Bowden', 16, '011', 'Outside', 1, 6.02, 'Prince Albert, SK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1015', 'Hannah Zurakowski', 17, '011', 'Setter', 4, 5.08, 'Calgary, AB');
    --douglas wvb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1100', 'Bea Colambot', 1, '012', 'Setter', 1, 5.06, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1101', 'Olivia Kuna', 2, '012', 'Libero', 2, 5.09, 'Burnaby, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1102', 'Hanna Keller', 4, '012', 'Outside', 1, 6.00, 'Kelowna, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1103', 'Lauren Bowman', 5, '012', 'Outside', 3, 5.10, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1104', 'Robynn Graham', 6, '012', 'Libero', 1, 5.06, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1105', 'Maggie Maskiewich', 7, '012', 'Outside', 3, 5.11, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1106', 'Alana Murr', 8, '012', 'Middle', 2, 6.03, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1107', 'Anna von Krosigk', 9, '012', 'Outside', 2, 6.01, 'Kelowna, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1108', 'Morgan Boisvert', 10, '012', 'Outside', 3, 5.11, 'Vernon, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1109', 'Leah Serlin', 11, '012', 'Outside', 5, 5.10, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1110', 'Emily Lafleur', 12, '012', 'Setter', 4, 5.09, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1111', 'Lauren Way', 14, '012', 'Middle', 3, 6.02, 'Coquitlam, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1112', 'Tina Oba', 16, '012', 'Outside', 2, 5.10, 'Tokyo, Japan');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1113', 'Maddie Magnowski', 17, '012', 'Outside', 1, 5.11, 'Langley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1114', 'Jenna Grewal', 18, '012', 'Middle', 1, 6.00, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1115', 'Alex Yuill', 0, '012', 'Libero', 1, 5.05, 'Richmond, BC');
     --viu mbb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1200', 'Breandan Mclaughlin', 2, '013', 'Forward', 2, 6.06, 'Campbell River, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1201', 'Kameron Bender', 3, '013', 'Guard', 3, 6.03, 'Tustin, CA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1202', 'Kye Kotapski-Tinga', 4, '013', 'Guard', 2, 6.03, 'Comox, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1203', 'Kaeleb Johnson', 5, '013', 'Guard', 4, 6.03, 'East Anchorage, AK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1204', 'Ryan Bastian', 6, '013', 'Guard', 3, 6.01, 'Ladysmith, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1205', 'Zekun (Peter) Li', 7, '013', 'Guard', 4, 6.01, 'Qingdao, CN');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1206', 'Brad Lansdell', 8, '013', 'Forward', 2, 6.04, 'George Town, Grand Cayman');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1207', 'Kai Leighton', 10, '013', 'Forward', 4, 6.04, 'Prince Rupert, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1208', 'Noah Lehto', 11, '013', 'Forward', 5, 6.06, 'Red Deer, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1209', 'Cohen Cadieux', 13, '013', 'Guard', 1, 6.01, 'Nanaimo, B.C.');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1210', 'Max D Amato', 14, '013', 'Forward', 3, 6.06, 'Melbourne, AUS');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1211', 'Rylan Adams', 15, '013', 'Guard', 1, 6.02, 'Prince Rupert, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1212', 'Boyd Anderson', 23, '013', 'Guard', 1, 6.00, 'Nanaimo, B.C.');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1213', 'Markus Modrovic', 24, '013', 'Forward', 3, 6.04, 'Victoria, BC');
    --camosun mbb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1300', 'Cole Belton', 3, '014', 'Guard', 4, 6.01, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1301', 'Cormick Brown', 2, '014', 'Guard', 4, 6.01, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1302', 'Malachi Bryden', 10, '014', 'Guard', 2, 6.02, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1303', 'Ty Bunn', 15, '014', 'Forward', 1, 6.04, 'West Kelowna, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1304', 'Lincoln Faulkner', 17, '014', 'Guard', 1, 6.03, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1305', 'David Finch', 4, '014', 'Guard', 3, 6.05, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1306', 'Izzy Helman', 17, '014', 'Guard', 3, 6.03, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1307', 'Eric Lees', 1, '014', 'Guard', 5, 5.11, 'Prince Rupert, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1308', 'Jon Martens', 21, '014', 'Forward', 3, 6.08, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1309', 'Jakob Neufeld', 7, '014', 'Guard', 3, 6.05, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1310', 'Jaime Palamos-Molins', 11, '014', 'Guard', 4, 6.01, 'Meliana, Spain');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1311', 'Marc Parma', 6, '014', 'Guard', 4, 6.01, 'Vic, Spain');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1312', 'Garrett Riley', 9, '014', 'Forward', 4, 6.06, 'Whistler, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1313', 'Camden Sparkes', 23, '014', 'Forward', 1, 6.07, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1314', 'Aidan Walsh', 13, '014', 'Forward', 3, 6.06, 'Courtenay, BC');
        --cbc mbb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1400', 'Lakeeb Hughes', 1, '017', 'Forward', 1, 6.06, 'Baltimore, MD, USA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1401', 'Dandre Palmer Ormsby', 2, '017', 'Guard', 1, 6.02, 'Toronto, ON');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1402', 'Levi Van Egdom', 3, '017', 'Guard', 3, 6.02, 'Chilliwack, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1403', 'Matias Rodriguez', 4, '017', 'Guard', 1, 6.02, 'Delta, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1404', 'Igor Krzych', 5, '017', 'Guard', 1, 6.02, 'Gliwice, Poland');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1405', 'Dane-Dre Anglin', 6, '017', 'Forward', 1, 6.06, 'Oshawa, ON');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1406', 'Hanibal Reda', 7, '017', 'Guard', 2, 6.02, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1407', 'Clive Adams', 8, '017', 'Guard', 4, 6.02, 'Toronto, ON');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1408', 'Leandro Madore-Sobarzo', 9, '017', 'Guard', 1, 6.02, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1409', 'Cam Carter', 10, '017', 'Guard', 2, 6.02, 'Baltimore, MD, USA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1410', 'Josiah Prang', 11, '017', 'Guard', 1, 6.02, 'Chilliwack, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1411', 'Spencer Dododza', 12, '017', 'Forward', 2, 6.06, 'New Westminster, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1412', 'Favour Igbinyemi', 13, '017', 'Forward', 3, 6.06, 'Surrey, BC');
    --douglas mbb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1500', 'Oliver Richman', 0, '015', 'Guard', 2, 5.10, 'Pemberton, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1501', 'Akec Ambianwol', 1, '015', 'Guard', 1, 6.06, 'Edmonton, Alberta');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1502', 'Jerome (Andrei) Verchez', 2, '015', 'Guard', 2, 5.10, 'Delta, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1503', 'Kaniyen Duncan', 3, '015', 'Guard', 1, 6.01, 'Calgary, Alberta');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1504', 'Kai Bohmert', 4, '015', 'Guard', 3, 6.03, 'Delta, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1505', 'Scottie Austin', 5, '015', 'Guard', 4, 6.03, 'Toronto, Ontario');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1506', 'Max Astak', 6, '015', 'Guard', 1, 6.01, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1507', 'Griffin White', 8, '015', 'Forward', 1, 6.05, 'Maple Ridge, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1508', 'Jeevan Sidhu', 9, '015', 'Forward', 3, 6.07, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1509', 'Gurek Sran', 10, '015', 'Forward', 3, 6.05, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1510', 'Hunter Thomson', 12, '015', 'Guard', 4, 6.00, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1511', 'Lorenzo Bonamin', 13, '015', 'Forward', 2, 6.07, 'Burnaby, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1512', 'Efe Ilica', 14, '015', 'Forward', 2, 6.07, 'Ayazagah, Türkiye');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1513', 'Jesse Connoly', 15, '015', 'Forward', 1, 6.06, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1514', 'Tanner Cruz', 20, '015', 'Guard', 1, 5.10, 'Prince George, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1515', 'Ethan Dhillon', 21, '015', 'Guard', 1, 6.03, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1516', 'Andre Juco', 22, '015', 'Guard', 1, 6.01, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1517', 'Matteo Malia', 23, '015', 'Guard', 1, 6.03, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1518', 'Corey Moore', 24, '015', 'Forward', 1, 6.08, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1519', 'Carter Walker', 25, '015', 'Forward', 1, 6.05, 'Prince George, BC');
    --cap mbb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1600', 'Ajaypal Hayer', 1, '016', 'Guard', 1, 6.00, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1601', 'Justin Pamintuan', 2, '016', 'Guard', 1, 6.00, 'New Westminster, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1602', 'Benicio Mollica', 4, '016', 'Guard', 2, 6.01, 'Port Coquitlam, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1603', 'Shakir Yakubu', 5, '016', 'Forward', 2, 6.05, 'Brampton, ON');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1604', 'Ahmad Athman', 6, '016', 'Guard', 4, 6.00, 'Oshawa, Ont.');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1605', 'Carter Andrade', 7, '016', 'Guard', 1, 6.02, 'North Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1606', 'Arshya Ghasemi', 8, '016', 'Guard', 2, 6.05, 'West Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1607', 'Sukhraj Garcha', 9, '016', 'Guard', 1, 6.03, 'Port Coquitlam, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1608', 'Damein Coleman', 10, '016', 'Forward', 3, 6.06, 'Baltimore, MD');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1609', 'Ty Klim', 11, '016', 'Forward', 1, 6.07, 'Chilliwack, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1610', 'Kash Lang', 12, '016', 'Guard', 4, 6.04, 'Lewiston, ID');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1611', 'Anthony Tamburrino', 13, '016', 'Forward', 3, 6.06, 'St. Albert, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1612', 'David Featherston Jr.', 14, '016', 'Forward', 4, 6.05, 'Sierra Vista, AZ');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1613', 'Josh Vandevelde', 15, '016', 'Forward', 3, 6.05, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1614', 'Zach Klim', 21, '016', 'Forward', 3, 6.11, 'Chilliwack, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1615', 'Russell Curley', 23, '016', 'Forward', 3, 6.06, 'Mission, BC');
        --viu wbb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1700', 'Trista Thorn', 2, '018', 'Guard', 2, 5.08, 'Okotoks, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1701', 'Rachel Labrador', 3, '018', 'Guard', 4, 5.09, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1702', 'Margarita Salas', 4, '018', 'Guard', 3, 5.04, 'Las Cruces, NM');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1703', 'Imaan Lali', 5, '018', 'Guard', 2, 5.07, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1704', 'Mackenzie Cox', 6, '018', 'Guard', 4, 5.09, 'Langley, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1705', 'Makayla Kimble', 8, '018', 'Guard', 5, 5.07, 'Fayetteville, NC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1706', 'Mackenzie Hall', 9, '018', 'Forward', 4, 6.00, 'Duncan, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1707', 'Colleen Nkrumah', 10, '018', 'Forward', 3, 5.10, 'Calgary, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1708', 'Allison Bentley', 11, '018', 'Guard', 2, 5.07, 'Cochrane, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1709', 'Jordyn Rioux', 12, '018', 'Guard', 3, 5.07, 'Langford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1710', 'Kiayra Hohlweg', 13, '018', 'Guard', 3, 5.07, 'Richmond, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1711', 'Harriette Mackenzie', 23, '018', 'Forward', 4, 6.02, 'Comox, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1712', 'Kaia Simpson', 24, '018', 'Forward', 4, 6.00, 'Wilmington, NC');
    --camosun wbb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1800', 'Maren Bilsky', 5, '019', 'Guard', 4, 5.08, 'Whitehorse, YK');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1801', 'Alexie Bowser', 3, '019', 'Guard', 1, 5.09, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1802', 'Jordyn Broekhuizen', 7, '019', 'Guard', 3, 5.09, 'Port Alberni, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1803', 'Elli Cailliau', 8, '019', 'Guard', 4, 5.07, 'Sherwood Park, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1804', 'Kanda Diop', 25, '019', 'Center', 4, 6.03, 'Geneva, Switzerland');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1805', 'Abi Ellison', 17, '019', 'Guard', 1, 5.07, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1806', 'Nicole Farkas', 21, '019', 'Forward', 4, 5.11, 'Whitehorse, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1807', 'Sevene Grewal', 1, '019', 'Guard', 2, 5.05, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1808', 'Taya Karsten', 6, '019', 'Forward', 4, 5.10, 'Medicine Hat, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1809', 'Dani Mellon', 4, '019', 'Guard', 2, 5.10, 'Kelowna, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1810', 'Didi Niang', 10, '019', 'Guard', 4, 5.09, 'Dakar, Senegal');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1811', 'Jordan Prete', 15, '019', 'Guard', 1, 5.04, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1812', 'Abby Rauh', 2, '019', 'Guard', 3, 5.10, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1813', 'Jordan Rush', 13, '019', 'Forward', 1, 5.11, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1814', 'Abby Schuetze', 9, '019', 'Guard', 2, 5.09, 'Victoria, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1815', 'Steph Sofikitis', 12, '019', 'Forward', 1, 6.00, 'Richmond, BC');
    --douglas wbb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1900', 'Neelam Rai', 2, '020', 'Guard', 1, 5.08, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1901', 'Lexi Robertson', 3, '020', 'Guard', 3, 5.05, 'Nampa, Idaho');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1902', 'Mazy Wandzura', 4, '020', 'Guard', 1, 5.09, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1903', 'Karishma Rai', 5, '020', 'Guard', 3, 5.09, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1904', 'Avnoor Waraich', 7, '020', 'Guard', 4, 5.07, 'Delta, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1905', 'Denise Mendoza', 10, '020', 'Guard', 1, 5.09, 'Coquitlam, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1906', 'Kristen Francks', 11, '020', 'Guard', 1, 5.07, 'Vernon, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1907', 'Elena Skalik', 12, '020', 'Guard', 3, 5.07, 'Campbell River, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1908', 'Hannah Brar', 13, '020', 'Forward', 1, 6.01, 'Coquitlam, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1909', 'Laini Glover', 14, '020', 'Forward', 4, 5.11, 'Burnaby, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1910', 'Alexis Hart', 15, '020', 'Guard', 1, 5.10, 'Coquitlam, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1911', 'Lauren Clements', 21, '020', 'Guard', 2, 5.09, 'Port Coquitlam, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1912', 'Amar Thiara', 22, '020', 'Guard', 3, 5.06, 'Delta, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('1913', 'Mackenzie Dalphond', 23, '020', 'Forward', 2, 6.00, 'Langley, BC');
        --cap wbb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2000', 'Lauren Tomlinson', 1, '021', 'Guard', 4, 5.05, 'Port Moody, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2001', 'Sheleese Hoilett', 2, '021', 'Guard', 3, 5.09, 'Markham, ON');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2002', 'Barcha Hnizdilova', 3, '021', 'Forward', 2, 5.11, 'Ústí nad Labem, Czechia');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2003', 'Steffi Bael', 6, '021', 'Guard', 1, 5.06, 'Calgary, AB');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2004', 'Amaya Hrbinic', 7, '021', 'Guard', 2, 5.06, 'Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2005', 'Kim Tiu', 9, '021', 'Guard', 2, 5.03, 'Richmond, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2006', 'Jenna Griffin', 10, '021', 'Guard', 3, 5.04, 'Port Moody, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2007', 'Mina Djordjevic', 11, '021', 'Forward', 3, 5.11, 'Surrey, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2008', 'Sereena Hothi', 12, '021', 'Forward', 4, 5.10, 'Delta, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2009', 'Chanelle Morris', 13, '021', 'Forward', 1, 5.10, 'North Vancouver, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2010', 'Alexa Kusel', 14, '021', 'Guard', 3, 5.04, 'Tsawassen, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2011', 'Mia Parkin', 15, '021', 'Guard', 1, 5.10, 'Adelaide, Australia');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2012', 'Brooklyn Klim', 20, '021', 'Forward', 1, 6.06, 'Chilliwack, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2013', 'Teigan Manson', 21, '021', 'Forward', 4, 5.11, 'Richmond Hill, Ont.');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2014', 'Ella Baird', 23, '021', 'Forward', 1, 6.00, 'North Saanichton, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2015', 'Madeleine Coffin', 24, '021', 'Forward', 4, 5.11, 'North Vancouver, BC');
        --cbc wbb
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2100', 'Hyewon Hwang', 1, '022', 'Guard', 3, 5.06, 'Port Moody, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2101', 'Jazzi Ashton', 2, '022', 'Guard', 2, 5.06, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2102', 'AJ Sobotta', 3, '022', 'Guard', 4, 5.06, 'Clarkston, WA, USA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2103', 'Sarah Korstrom', 4, '022', 'Guard', 3, 5.06, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2104', 'Julie Dueck', 5, '022', 'Guard', 4, 5.06, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2105', 'Grace Park', 6, '022', 'Guard', 2, 5.06, 'Coquitlam, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2106', 'Jayla Huynh', 7, '022', 'Guard', 1, 5.06, 'Burnaby, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2107', 'Elissa Vreugdenhil', 8, '022', 'Forward', 3, 5.10, 'Sumas, WA, USA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2108', 'Samara Mason', 9, '022', 'Guard', 2, 5.06, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2109', 'Madeline Beerwald', 10, '022', 'Forward', 5, 5.10, 'Abbotsford, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2110', 'Jenae Rhoads', 11, '022', 'Forward', 3, 5.10, 'Ketchikan, AK, USA');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2111', 'Angel Enyia', 12, '022', 'Forward', 2, 5.10, 'Maple Ridge, BC');
	INSERT INTO Athletes (athleteNum,athName, jerseyNum, teamID, position, schoolYear, height, hometown)
        VALUES ('2112', 'Kagari Tomita', 13, '022', 'Guard', 4, 5.06, 'Okayama, Japan');
