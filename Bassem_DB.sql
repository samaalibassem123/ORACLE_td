--• EQUIPE(code,nom,directeur)
--• PAYS(code,nom)
--• COUREUR(num_dossard,code_equipe*,nom,code_pays*)
--• ETAPE(num,date_etape,kms,ville_depart,ville_arrivee)
--• TEMPS(num_dossard*,num_etape*,temps_realise)

CREATE TABLE EQUIPE(
code varchar(3),
nom varchar(30),
directeur varchar(30),
CONSTRAINT PK_RQ PRIMARY KEY (code)
);

CREATE TABLE PAYS(
code varchar(3),
nom varchar(20),
CONSTRAINT PK_PA PRIMARY KEY (code)
)

CREATE TABLE COUREUR(
num_dossard NUMBER(4),
code_equipe VARCHAR(3),
nom VARCHAR(20),
code_pays VARCHAR(3),
CONSTRAINT PK_CO PRIMARY KEY (num_dossard),
CONSTRAINT FK_COCE FOREIGN KEY (code_equipe) REFERENCES EQUIPE(code),
CONSTRAINT FK_COCP FOREIGN KEY (code_pays) REFERENCES PAYS(code)
)

CREATE TABLE ETAPE(
num NUMBER(4),
date_etape DATE,
kms NUMBER(4),
ville_depart VARCHAR(20),
ville_arrivee VARCHAR(20),
CONSTRAINT PK_ET PRIMARY KEY (num)
)

CREATE TABLE TEMPS(
 num_dossard NUMBER(4),
 num_etape NUMBER(4),
 temps_realise TIMESTAMP,  
 CONSTRAINT PK_TPS PRIMARY KEY (num_dossard,num_etape),
 CONSTRAINT FK_TMPND FOREIGN KEY (num_dossard) REFERENCES COUREUR(num_dossard),
 CONSTRAINT FK_TMPSNE FOREIGN KEY (num_etape) REFERENCES ETAPE(num)
)


----------------------- INSERT INTO EQUIPE ----------------------
INSERT INTO EQUIPE VALUES ('TMT','T-MOBILE TEAM','Mario Kummer');
INSERT INTO EQUIPE VALUES ('BLB','Brioche la Boulangere','Jean-Rene Bernaudeau');
INSERT INTO EQUIPE VALUES ('USP','US Postal Service','Berry Floor');

----------------------- INSERT INTO EQUIPE ----------------------
INSERT INTO PAYS VALUES ('FRA','France');  
INSERT INTO PAYS VALUES ('EU','Etats Unis');
INSERT INTO PAYS VALUES ('CAN','Canada');
INSERT INTO PAYS VALUES ('ESP','Espagne');
INSERT INTO PAYS VALUES ('ALL','Allemagne');
INSERT INTO PAYS VALUES ('ITA','Italie');

----------------------- INSERT INTO COUREUR ----------------------
INSERT INTO COUREUR(num_dossard,nom,code_equipe,code_pays) VALUES (1,'HIEKMANN Torsten','TMT','ALL');
INSERT INTO COUREUR(num_dossard,nom,code_equipe,code_pays) VALUES (2,'GUERINI Giuseppe','TMT','ITA');
INSERT INTO COUREUR(num_dossard,nom,code_equipe,code_pays) VALUES (3,'REICHL Dirk','TMT','ALL');
INSERT INTO COUREUR(num_dossard,nom,code_equipe,code_pays) VALUES (4,'CHAVANEL Sylvain','BLB','FRA');
INSERT INTO COUREUR(num_dossard,nom,code_equipe,code_pays) VALUES (5,'ROUS Didier','BLB','FRA');
INSERT INTO COUREUR(num_dossard,nom,code_equipe,code_pays) VALUES (6,'YUS QUEREJETA Unai','BLB','ESP');
INSERT INTO COUREUR(num_dossard,nom,code_equipe,code_pays) VALUES (7,'ARMSTRONG Lance','USP','EU');
INSERT INTO COUREUR(num_dossard,nom,code_equipe,code_pays) VALUES (8,'McCARTHY Patrick','USP','EU');
INSERT INTO COUREUR(num_dossard,nom,code_equipe,code_pays) VALUES (9,'BARRY Michael','USP','CAN');

----------------------- INSERT INTO ETAPE ----------------------
INSERT INTO ETAPE VALUES(1,TO_DATE('06/07/2008'),197,'Brest','Plumelec');
INSERT INTO ETAPE VALUES(2,TO_DATE('07/07/2008'),164,'Plumelec','Saint-Brieuc');
INSERT INTO ETAPE VALUES(3,TO_DATE('08/07/2008'),208,'Saint-Malo','Nantes');

----------------------- INSERT INTO TEMPS ----------------------
-- Premiere etape
insert into temps values(1,1,to_date('04:12:03','HH:MI:SS'));
insert into temps values(3,1,to_date('04:08:01','HH:MI:SS'));
insert into temps values(4,1,to_date('04:12:03','HH:MI:SS'));
insert into temps values(5,1,to_date('04:15:21','HH:MI:SS'));
insert into temps values(6,1,to_date('04:15:30','HH:MI:SS'));
insert into temps values(7,1,to_date('04:12:22','HH:MI:SS'));
insert into temps values(8,1,to_date('04:18:13','HH:MI:SS'));
insert into temps values(9,1,to_date('04:20:03','HH:MI:SS'));
SELECT * FROM temps;

-- Deuxieme etape
insert into temps values(1,2,to_date('03:51:13','HH:MI:SS'));
insert into temps values(2,2,to_date('03:46:03','HH:MI:SS'));
insert into temps values(3,2,to_date('03:48:23','HH:MI:SS'));
insert into temps values(4,2,to_date('03:50:10','HH:MI:SS'));
insert into temps values(5,2,to_date('03:48:08','HH:MI:SS'));
insert into temps values(6,2,to_date('03:49:02','HH:MI:SS'));
insert into temps values(8,2,to_date('03:49:53','HH:MI:SS'));
insert into temps values(9,2,to_date('03:47:24','HH:MI:SS'));
SELECT * FROM temps;

-- Troisieme etape
insert into temps values(1,3,to_date('05:05:13','HH:MI:SS'));
insert into temps values(2,3,to_date('05:10:03','HH:MI:SS'));
insert into temps values(3,3,to_date('05:03:23','HH:MI:SS'));
insert into temps values(4,3,to_date('05:00:10','HH:MI:SS'));
insert into temps values(5,3,to_date('05:08:08','HH:MI:SS'));
insert into temps values(7,3,to_date('05:06:32','HH:MI:SS'));
insert into temps values(9,3,to_date('05:07:24','HH:MI:SS'));
SELECT * FROM temps;