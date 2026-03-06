-- =============================================================
-- Admission Atlas Armenia 2026 — Full Database Export
-- Generated from index.html
--
-- Tables:
--   universities           (13 rows)  – all institutions
--   programs               (208 rows) – full bachelor catalog B001-B208
--   subjects               (23 rows)  – entrance exam subjects
--   exam_programs          (36 rows)  – programs in the Exam Explorer
--   exam_program_subjects  (72 rows)  – junction: required subjects per exam program
--   program_scores         (80 rows)  – historical admission score data 2018-2022
--
-- Compatible with SQLite, PostgreSQL, MySQL (minor syntax tweaks for MySQL)
-- =============================================================

PRAGMA foreign_keys = ON;


-- ─────────────────────────────────────────────────────────────
-- TABLE: universities
-- Fields: id, name, short, lat, lng, type, color,
--         website, admissions, tuition_range, lang, degrees,
--         has_mil, has_dorm, has_schol, has_exchange,
--         employ_outlook, prog_count
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS universities (
  id             TEXT    PRIMARY KEY,
  name           TEXT    NOT NULL,
  short          TEXT    NOT NULL,
  lat            REAL    NOT NULL,
  lng            REAL    NOT NULL,
  type           TEXT    NOT NULL CHECK(type IN ('State','Private','Interstate')),
  color          TEXT,
  website        TEXT,
  admissions_url TEXT,
  tuition_range  TEXT,
  lang           TEXT,
  degrees        TEXT,
  has_mil        INTEGER NOT NULL DEFAULT 0,
  has_dorm       INTEGER NOT NULL DEFAULT 0,
  has_schol      INTEGER NOT NULL DEFAULT 0,
  has_exchange   INTEGER NOT NULL DEFAULT 0,
  employ_outlook TEXT,
  prog_count     INTEGER
);

INSERT INTO universities VALUES
('YSU','Yerevan State University','YSU',40.18159,44.52633,'State','#059669','https://ysu.am','https://www.ysu.am/en/undergraduate-admission','600k-1.2M','AM/EN/RU','BA MA PhD',1,1,1,1,'High',54),
('NPUA','National Polytechnic University of Armenia','NPUA',40.19139,44.52311,'State','#059669','https://polytech.am','https://polytech.am/en/applicant','550k-900k','AM/RU','BA MA PhD',1,1,1,1,'High',4),
('ASUE','Armenian State University of Economics','ASUE',40.18422,44.52474,'State','#059669','https://asue.am','https://asue.am/en/applicant','600k-1M','AM/EN','BA MA PhD',1,1,1,1,'High',7),
('YSMU','Yerevan State Medical University','YSMU',40.18832,44.52585,'State','#059669','https://ysmu.am','https://ysmu.am/en/admission','800k-1.5M','AM/EN','BA MA PhD',1,1,1,1,'Very high',3),
('ASPU','Khachatur Abovian Pedagogical University','ASPU',40.17518,44.52366,'State','#059669','https://aspu.am','https://aspu.am/en/public/list_universal/id/50','450k-800k','AM','BA MA PhD',1,1,1,1,'Medium',43),
('Brusov','Brusov State University','Brusov',40.18726,44.51116,'State','#059669','https://brusov.am','https://brusov.am/hy/science_list/_dimord_haytern_yndunvum_en_/','500k-900k','AM/EN/RU','BA MA',1,1,1,1,'High',6),
('RAU','Russian-Armenian University','RAU',40.21051,44.50329,'Interstate','#2563eb','https://rau.am','https://rau.am/en/admissions','1.2M-2.5M','RU','BA MA',1,1,1,1,'Very high',27),
('AUA','American University of Armenia','AUA',40.19326,44.5045,'Private','#dc2626','https://aua.am','https://admissions.aua.am','3M-5M','EN','BA MA',0,0,1,1,'Very high',9),
('EUA','European University of Armenia','EUA',40.20415,44.52943,'Private','#dc2626','https://eua.am','https://eua.am/en','500k-800k','AM','BA MA',0,1,1,0,'Medium',15),
('UFAR','French University in Armenia','UFAR',40.20415,44.52943,'Interstate','#2563eb','https://ufar.am','https://ufar.am/admission/bachelors','1.5M-2.2M','FR','BA MA',1,0,1,1,'Very high',5),
('ANAU','Agrarian University','ANAU',40.18861,44.52222,'State','#059669','https://anau.am','https://anau.am/en/admission','400k-700k','AM','BA MA PhD',1,1,1,1,'Medium',24),
('Komitas','Komitas Conservatory','Komitas',40.18713,44.51695,'State','#059669','https://conservatory.am','https://conservatory.am/admissions/undergraduate','500k-900k','AM','BA MA',1,1,1,1,'Medium',5),
('SCAS','Physical Culture & Sport Institute','SCAS',40.1761,44.5239,'State','#059669','http://sportedu.am','https://sportedu.am/applicant/bachelors-degree?lang=en','450k-700k','AM','BA MA',1,1,1,0,'Medium',6);

-- ─────────────────────────────────────────────────────────────
-- TABLE: programs  (full bachelor catalog, B001–B208)
-- Fields: id, uid, name, field, lang, duration_years,
--         tuition_amd, seats_state, seats_paid,
--         apply_url, faculty
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS programs (
  id             TEXT    PRIMARY KEY,
  uid            TEXT    NOT NULL REFERENCES universities(id),
  name           TEXT    NOT NULL,
  field          TEXT,
  lang           TEXT,
  duration_years INTEGER,
  tuition_amd    INTEGER,
  seats_state    INTEGER,
  seats_paid     INTEGER,
  apply_url      TEXT,
  faculty        TEXT
);

INSERT INTO programs VALUES
('B001','YSU','Mathematics','STEM','Armenian',4,600000,20,15,'https://dimord.am/','Faculty of Mathematics and Mechanics'),
('B002','YSU','Mechanics','STEM','Armenian',4,600000,6,13,'https://dimord.am/','Faculty of Mathematics and Mechanics'),
('B003','YSU','Actuarial and Financial Mathematics','STEM','Armenian',4,800000,20,45,'https://dimord.am/','Faculty of Mathematics and Mechanics'),
('B004','YSU','Applied Statistics and Data Science','STEM','Armenian',4,800000,26,29,'https://dimord.am/','Faculty of Mathematics and Mechanics'),
('B005','YSU','Computer Science and Applied Mathematics','STEM','Armenian',4,900000,40,155,'https://dimord.am/','Faculty of Informatics and Applied Mathematics'),
('B006','YSU','Information Security','STEM','Armenian',4,900000,20,25,'https://dimord.am/','Faculty of Informatics and Applied Mathematics'),
('B007','YSU','Physics','STEM','Armenian',4,550000,47,23,'https://dimord.am/','Faculty of Physics'),
('B008','YSU','Data Processing in Physics and Artificial Intelligence','STEM','Armenian',4,550000,15,15,'https://dimord.am/','Faculty of Physics'),
('B009','YSU','Radiophysics and Computer Technologies','STEM','Armenian',4,550000,47,43,'https://dimord.am/','Faculty of Physics'),
('B010','YSU','Chemistry','STEM','Armenian',4,550000,12,8,'https://dimord.am/','Faculty of Chemistry'),
('B011','YSU','Food Safety','STEM','Armenian',4,550000,7,8,'https://dimord.am/','Faculty of Chemistry'),
('B012','YSU','Pharmacy','STEM','Armenian',4,600000,6,29,'https://dimord.am/','Faculty of Biology'),
('B013','YSU','Biology','STEM','Armenian',4,550000,20,10,'https://dimord.am/','Faculty of Biology'),
('B014','YSU','Biochemistry and Biotechnology','STEM','Armenian',4,550000,20,10,'https://dimord.am/','Faculty of Biology'),
('B015','YSU','Geography','STEM','Armenian',4,500000,7,8,'https://dimord.am/','Faculty of Geography and Geology'),
('B016','YSU','Geology','STEM','Armenian',4,500000,9,6,'https://dimord.am/','Faculty of Geography and Geology'),
('B017','YSU','Cartography and Cadastral Studies','STEM','Armenian',4,500000,4,11,'https://dimord.am/','Faculty of Geography and Geology'),
('B018','YSU','Service','Tourism','Armenian',4,700000,0,75,'https://dimord.am/','Faculty of Economics and Management'),
('B019','YSU','History','Humanities','Armenian',4,550000,5,35,'https://dimord.am/','Faculty of History'),
('B020','YSU','Art History','Arts','Armenian',4,550000,3,12,'https://dimord.am/','Faculty of History'),
('B021','YSU','Cultural Studies','Humanities','Armenian',4,550000,3,12,'https://dimord.am/','Faculty of History'),
('B022','YSU','Caucasus Studies','Humanities','Armenian',4,550000,6,14,'https://dimord.am/','Faculty of History'),
('B023','YSU','Archaeology and Ethnography','Humanities','Armenian',4,550000,4,11,'https://dimord.am/','Faculty of History'),
('B024','YSU','International Relations','Social','Armenian',4,950000,2,108,'https://dimord.am/','Faculty of International Relations'),
('B025','YSU','Political Science','Social','Armenian',4,800000,3,52,'https://dimord.am/','Faculty of International Relations'),
('B026','YSU','Public Administration','Social','Armenian',4,900000,3,57,'https://dimord.am/','Faculty of International Relations'),
('B027','YSU','Public Policy and Governance','Social','Armenian',4,900000,2,23,'https://dimord.am/','Faculty of International Relations'),
('B028','YSU','Economics','Business','Armenian',4,900000,2,58,'https://dimord.am/','Faculty of Economics and Management'),
('B029','YSU','Management (by field)','Business','Armenian',4,900000,2,68,'https://dimord.am/','Faculty of Economics and Management'),
('B030','YSU','Finance (by field)','Business','Armenian',4,900000,2,68,'https://dimord.am/','Faculty of Economics and Management'),
('B031','YSU','Philosophy','Humanities','Armenian',4,500000,3,12,'https://dimord.am/','Faculty of Philosophy and Psychology'),
('B032','YSU','Psychology','Social','Armenian',4,800000,5,75,'https://dimord.am/','Faculty of Philosophy and Psychology'),
('B033','YSU','Sociology','Social','Armenian',4,700000,4,11,'https://dimord.am/','Faculty of Sociology'),
('B034','YSU','Social Work','Social','Armenian',4,700000,4,16,'https://dimord.am/','Faculty of Sociology'),
('B035','YSU','Public Relations','Social','Armenian',4,850000,2,25,'https://dimord.am/','Faculty of Journalism'),
('B036','YSU','Armenian Language and Literature','Humanities','Armenian',4,500000,12,38,'https://dimord.am/','Faculty of Armenian Philology'),
('B037','YSU','Social Pedagogy','Education','Armenian',4,500000,2,18,'https://dimord.am/','Faculty of Education'),
('B038','YSU','Journalism','Social','Armenian',4,700000,4,41,'https://dimord.am/','Faculty of Journalism'),
('B039','YSU','Russian Language and Literature','Humanities','Armenian',4,500000,5,10,'https://dimord.am/','Faculty of Russian Philology'),
('B040','YSU','Intercultural Communication and Translation (Russian)','Humanities','Armenian',4,500000,5,10,'https://dimord.am/','Faculty of Russian Philology'),
('B041','YSU','English Language and Literature','Humanities','Armenian',4,800000,2,28,'https://dimord.am/','Faculty of European Languages'),
('B042','YSU','Translation Studies (English and Armenian)','Humanities','Armenian',4,800000,3,72,'https://dimord.am/','Faculty of European Languages'),
('B043','YSU','Intercultural Communication (English)','Humanities','Armenian',4,800000,2,88,'https://dimord.am/','Faculty of European Languages'),
('B044','YSU','English, French and Communication','Humanities','Armenian',4,800000,5,35,'https://dimord.am/','Faculty of European Languages'),
('B045','YSU','English, German and Communication','Humanities','Armenian',4,800000,5,20,'https://dimord.am/','Faculty of European Languages'),
('B046','YSU','English, Spanish and Communication','Humanities','Armenian',4,800000,5,45,'https://dimord.am/','Faculty of European Languages'),
('B047','YSU','English, Italian and Communication','Humanities','Armenian',4,800000,4,21,'https://dimord.am/','Faculty of European Languages'),
('B048','YSU','Arabic Studies','Humanities','Armenian',4,750000,5,35,'https://dimord.am/','Faculty of Oriental Studies'),
('B049','YSU','Turkic Studies','Humanities','Armenian',4,800000,5,40,'https://dimord.am/','Faculty of Oriental Studies'),
('B050','YSU','Iranian Studies','Humanities','Armenian',4,750000,5,25,'https://dimord.am/','Faculty of Oriental Studies'),
('B051','YSU','Azerbaijani Studies','Humanities','Armenian',4,750000,5,25,'https://dimord.am/','Faculty of Oriental Studies'),
('B052','YSU','Law','Law','Armenian',4,1000000,2,138,'https://dimord.am/','Faculty of Law'),
('B053','YSU','Theology','Humanities','Armenian',4,500000,5,10,'https://dimord.am/','Faculty of Theology'),
('B054','YSU','Religious Tourism','Tourism','Armenian',4,500000,2,23,'https://dimord.am/','Faculty of Theology'),
('B055','NPUA','Bachelor of Computer Science','IT','Armenian',4,800000,0,0,'https://dimord.am/','Faculty of Computer Systems and Informatics'),
('B056','NPUA','Bachelor of Economics','Economics','Armenian',4,800000,0,0,'https://dimord.am/','Faculty of Economics'),
('B057','NPUA','Bachelor of Design','Arts','Armenian',4,800000,0,0,'https://dimord.am/','Faculty of Design and Architecture'),
('B058','NPUA','Bachelor of Biomedicine','Medical','Armenian',4,800000,0,0,'https://dimord.am/','Faculty of Biomedical Engineering'),
('B059','ASUE','Bachelor of Business','Business','Armenian',4,1200000,0,0,'https://dimord.am/','Faculty of Management'),
('B060','ASUE','Bachelor of Finance & Banking','Economics','Armenian',4,1200000,0,0,'https://dimord.am/','Faculty of Finance'),
('B061','ASUE','Bachelor of Management','Business','Armenian',4,1200000,0,0,'https://dimord.am/','Faculty of Management'),
('B062','ASUE','Bachelor of Marketing','Business','Armenian',4,1200000,0,0,'https://dimord.am/','Faculty of Marketing'),
('B063','ASUE','Bachelor of Sociology','Social','Armenian',4,1200000,0,0,'https://dimord.am/','Faculty of Social Sciences'),
('B064','ASUE','Bachelor of Accounting & Auditing','Business','Armenian',4,1200000,0,0,'https://dimord.am/','Faculty of Accounting'),
('B065','ASUE','Bachelor of Information Systems & Statistics','IT','Armenian',4,1200000,0,0,'https://dimord.am/','Faculty of Computer Science and Statistics'),
('B066','SCAS','Health-Improving Physical Culture (Kinesiology)','Sport','Armenian',4,500000,0,0,'https://dimord.am/','Faculty of Health-Improving Technologies, Sport Tourism and Management'),
('B067','SCAS','Rescue Operations','Sport','Armenian',4,500000,0,0,'https://dimord.am/','Faculty of Health-Improving Technologies, Sport Tourism and Management'),
('B068','SCAS','Journalism','Humanities','Armenian',4,420000,0,0,'https://dimord.am/','Faculty of Health-Improving Technologies, Sport Tourism and Management'),
('B069','SCAS','Physical Education and Adaptive Physical Culture','Sport','Armenian',4,450000,0,0,'https://dimord.am/','Faculty of Coaching and Pedagogical'),
('B070','SCAS','Greco-Roman Wrestling','Sport','Armenian',4,450000,0,0,'https://dimord.am/','Faculty of Coaching and Pedagogical'),
('B071','SCAS','Freestyle Wrestling','Sport','Armenian',4,450000,0,0,'https://dimord.am/','Faculty of Coaching and Pedagogical'),
('B072','YSMU','Pharmacy','Medical','Armenian/English/Russian',4,0,0,0,'https://dimord.am/','Pharmacy Faculty'),
('B073','YSMU','General Medicine','Medical','Armenian/English/Russian',6,0,0,0,'https://dimord.am/','General Medicine Faculty'),
('B074','YSMU','Stomatology','Medical','Armenian/English/Russian',5,0,0,0,'https://dimord.am/','Stomatology Faculty'),
('B075','ASPU','Armenian Language and Literature','Humanities','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Philology'),
('B076','ASPU','History','Social','Armenian',4,0,0,0,'https://dimord.am/','Faculty of History and Social Sciences'),
('B077','ASPU','Social Science','Social','Armenian',4,0,0,0,'https://dimord.am/','Faculty of History and Social Sciences'),
('B078','ASPU','Pedagogy and Methodology (elementary education)','Education','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Primary Education'),
('B079','ASPU','Pedagogy and Methodology (preschool education)','Education','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Primary Education'),
('B080','ASPU','Chemistry','Natural Sciences','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Biology, Chemistry and Geography'),
('B081','ASPU','Biology','Natural Sciences','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Biology, Chemistry and Geography'),
('B082','ASPU','Geography','Natural Sciences','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Biology, Chemistry and Geography'),
('B083','ASPU','Biology-Chemistry','Natural Sciences','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Biology, Chemistry and Geography'),
('B084','ASPU','Geography-Natural science','Natural Sciences','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Biology, Chemistry and Geography'),
('B085','ASPU','Psychology','Social','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Education Psychology and Sociology'),
('B086','ASPU','Social Work','Social','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Education Psychology and Sociology'),
('B087','ASPU','Social Pedagogy','Social','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Education Psychology and Sociology'),
('B088','ASPU','Sociology','Social','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Education Psychology and Sociology'),
('B089','ASPU','English Language and Literature','Humanities','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Foreign Languages'),
('B090','ASPU','German Language and Literature','Humanities','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Foreign Languages'),
('B091','ASPU','Spanish Language and Literature','Humanities','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Foreign Languages'),
('B092','ASPU','Russian Language and Literature','Humanities','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Foreign Languages'),
('B093','ASPU','Physics','Natural Sciences','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Mathematics, Physics and Informatics'),
('B094','ASPU','Technology and Entrepreneurship','Natural Sciences','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Mathematics, Physics and Informatics'),
('B095','ASPU','Mathematics','Natural Sciences','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Mathematics, Physics and Informatics'),
('B096','ASPU','Informatics','Natural Sciences','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Mathematics, Physics and Informatics'),
('B097','ASPU','Mathematics-Physics','Natural Sciences','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Mathematics, Physics and Informatics'),
('B098','ASPU','Mathematics-Informatics','Natural Sciences','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Mathematics, Physics and Informatics'),
('B099','ASPU','Culturology','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Art Education'),
('B100','ASPU','Painting','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Art Education'),
('B101','ASPU','Musical Education','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Art Education'),
('B102','ASPU','Decorative Applied Art','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Art Education'),
('B103','ASPU','Theory, History and Management of Art','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Art Education'),
('B104','ASPU','Clothes Design','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Art Education'),
('B105','ASPU','Arts and Crafts','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Art Education'),
('B106','ASPU','Special Pedagogy','Education','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Special and Inclusive Education'),
('B107','ASPU','Speech therapy','Education','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Special and Inclusive Education'),
('B108','ASPU','Ergotherapy','Education','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Special and Inclusive Education'),
('B109','ASPU','Journalism','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Culture'),
('B110','ASPU','Directing','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Culture'),
('B111','ASPU','Instrumental Performance (brass-variety, folk instruments)','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Culture'),
('B112','ASPU','Library and Information Sources','Humanities','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Culture'),
('B113','ASPU','Museum Studies and Preservation of Cultural Sites','Humanities','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Culture'),
('B114','ASPU','Camerawork','Humanities','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Culture'),
('B115','ASPU','Management (by areas)','Business','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Culture'),
('B116','ASPU','Artistic Photography','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Culture'),
('B117','ASPU','Dance Education','Arts','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Culture'),
('B118','Brusov','Linguistics','Humanities','Russian/English/other',4,0,0,0,'https://dimord.am/','Linguistics & Pedagogy (brusov.am)'),
('B119','Brusov','Service','Social','Armenian',4,0,0,0,'https://dimord.am/','Public Communication & Service (brusov.am)'),
('B120','Brusov','Translation Studies (multiple pairs)','Humanities','Russian + other',4,0,0,0,'https://dimord.am/','Translation (brusov.am)'),
('B121','Brusov','Professional Pedagogy','Education','Russian/other',2,0,0,0,'https://dimord.am/','Linguistics & Pedagogy (brusov.am)'),
('B122','Brusov','Service (distance)','Social','Russian',2,0,0,0,'https://dimord.am/','Public Communication & Service (brusov.am)'),
('B123','Brusov','International Relations','Social','Russian',2,0,0,0,'https://dimord.am/','Intercultural Communication & Political Sciences (brusov.am)'),
('B124','RAU','Advertising and Public Relations','Humanities','Russian/Armenian',4,0,0,60,'https://rau.am/abitur/bachelor/','Institute of Advertising'),
('B125','RAU','Jurisprudence','Law','Russian/Armenian',4,0,0,70,'https://rau.am/abitur/bachelor/','Faculty of Law'),
('B126','RAU','Psychology','Social','Russian/Armenian',4,0,0,30,'https://rau.am/abitur/bachelor/','Institute of Psychology'),
('B127','RAU','Applied Mathematics and Informatics','IT','Russian/Armenian',4,0,0,50,'https://rau.am/abitur/bachelor/','Mathematic-Informatics Institute'),
('B128','RAU','Applied Mathematics and Informatics (state)','IT','Russian/Armenian',4,0,22,0,'https://rau.am/abitur/bachelor/','Mathematic-Informatics Institute'),
('B129','RAU','Infocommunication Technologies and Communication Systems','IT','Russian/Armenian',4,0,7,10,'https://rau.am/abitur/bachelor/','Institute of ICT'),
('B130','RAU','Electronics and Nanoelectronics','Engineering','Russian/Armenian',4,0,10,10,'https://rau.am/abitur/bachelor/','Engineering-Physical Institute'),
('B131','RAU','Psychology (budget)','Social','Russian/Armenian',4,0,9,0,'https://rau.am/abitur/bachelor/','Institute of Psychology'),
('B132','RAU','Psychology (distance)','Social','Russian/Armenian',4,0,0,20,'https://rau.am/abitur/bachelor/','Institute of Psychology'),
('B133','RAU','Economics (full-time)','Economics','Russian/Armenian',4,0,9,40,'https://rau.am/abitur/bachelor/','Faculty of Economics'),
('B134','RAU','Economics (distance)','Economics','Russian/Armenian',4,0,0,20,'https://rau.am/abitur/bachelor/','Faculty of Economics'),
('B135','RAU','Management (full-time)','Business','Russian/Armenian',4,0,9,70,'https://rau.am/abitur/bachelor/','Faculty of Economics'),
('B136','RAU','Management (distance)','Business','Russian/Armenian',4,0,0,20,'https://rau.am/abitur/bachelor/','Faculty of Economics'),
('B137','RAU','Jurisprudence (state, full-time)','Law','Russian/Armenian',4,0,9,0,'https://rau.am/abitur/bachelor/','Faculty of Law'),
('B138','RAU','Jurisprudence (distance)','Law','Russian/Armenian',4,0,0,10,'https://rau.am/abitur/bachelor/','Faculty of Law'),
('B139','RAU','Foreign Area Studies','Social','Russian/Armenian',4,0,5,15,'https://rau.am/abitur/bachelor/','Institute of Humanitarian Sciences'),
('B140','RAU','Political Science','Social','Russian/Armenian',4,0,2,10,'https://rau.am/abitur/bachelor/','Institute of Humanitarian Sciences'),
('B141','RAU','International Relations','Social','Russian/Armenian',4,0,4,40,'https://rau.am/abitur/bachelor/','Institute of International Relations'),
('B142','RAU','Advertising and Public Relations (state)','Humanities','Russian/Armenian',4,0,5,0,'https://rau.am/abitur/bachelor/','Institute of Advertising'),
('B143','RAU','Journalism (full-time)','Humanities','Russian/Armenian',4,0,5,20,'https://rau.am/abitur/bachelor/','Institute of Journalism'),
('B144','RAU','Journalism (distance)','Humanities','Russian/Armenian',4,0,0,20,'https://rau.am/abitur/bachelor/','Institute of Journalism'),
('B145','RAU','Tourism (full-time)','Tourism','Russian/Armenian',4,0,9,30,'https://rau.am/abitur/bachelor/','Institute of Tourism'),
('B146','RAU','Tourism (distance)','Tourism','Russian/Armenian',4,0,0,20,'https://rau.am/abitur/bachelor/','Institute of Tourism'),
('B147','RAU','Philology','Humanities','Russian/Armenian',4,0,14,5,'https://rau.am/abitur/bachelor/','Faculty of Philology'),
('B148','RAU','Linguistics (full-time)','Humanities','Russian/Armenian',4,0,9,65,'https://rau.am/abitur/bachelor/','Faculty of Philology'),
('B149','RAU','Linguistics (distance)','Humanities','Russian/Armenian',4,0,0,20,'https://rau.am/abitur/bachelor/','Faculty of Philology'),
('B150','RAU','Oriental and African Studies','Humanities','Russian/Armenian',4,0,5,10,'https://rau.am/abitur/bachelor/','Institute of Humanitarian Sciences'),
('B151','AUA','Bachelor of Arts in Business','Business','English',4,0,0,0,'https://apply.aua.am','College of Business'),
('B152','AUA','Bachelor of Science in Economics','Economics','English',4,0,0,0,'https://apply.aua.am','College of Business'),
('B153','AUA','Bachelor of Arts in English & Communications','Humanities','English',4,0,0,0,'https://apply.aua.am','College of Humanities'),
('B154','AUA','Bachelor of Arts in Politics & Governance','Social','English',4,0,0,0,'https://apply.aua.am','College of Social Sciences'),
('B155','AUA','Bachelor of Science in Computer Science','IT','English',4,0,0,0,'https://apply.aua.am','College of Science & Engineering'),
('B156','AUA','Bachelor of Science in Data Science','IT','English',4,0,0,0,'https://apply.aua.am','College of Science & Engineering'),
('B157','AUA','Bachelor of Science in Engineering Sciences','Engineering','English',4,0,0,0,'https://apply.aua.am','College of Science & Engineering'),
('B158','AUA','Bachelor of Science in Environmental & Sustainability Sciences','Natural Sciences','English',4,0,0,0,'https://apply.aua.am','College of Science & Engineering'),
('B159','AUA','Bachelor of Science in Nursing (bridging)','Medical','English',3,0,0,0,'https://apply.aua.am','College of Health Sciences'),
('B160','EUA','Management','Business','Armenian/English',4,0,0,0,'https://eua.am','Business/Management'),
('B161','EUA','Marketing','Business','Armenian/English',4,0,0,0,'https://eua.am','Business/Management'),
('B162','EUA','Financial Technologies and Banking','Economics','Armenian/English',4,0,0,0,'https://eua.am','Finance/Economics'),
('B163','EUA','Law','Law','Armenian/English',4,0,0,0,'https://eua.am','Law'),
('B164','EUA','International Relations','Social','Armenian/English',4,0,0,0,'https://eua.am','International Relations'),
('B165','EUA','Tourism and Hotel Management','Tourism','Armenian/English',4,0,0,0,'https://eua.am','Tourism/Hospitality'),
('B166','EUA','Language and Communication','Humanities','Armenian/English',4,0,0,0,'https://eua.am','Humanities'),
('B167','EUA','Psychology','Social','Armenian/English',4,0,0,0,'https://eua.am','Psychology'),
('B168','EUA','Architecture','Arts','Armenian/English',4,0,0,0,'https://eua.am','Architecture'),
('B169','EUA','Graphic Design','Arts','Armenian/English',4,0,0,0,'https://eua.am','Arts/Design'),
('B170','EUA','International Business','Business','Armenian/English',4,0,0,0,'https://eua.am','Business/Management'),
('B171','EUA','Data Science and AI (Information Systems)','IT','Armenian/English',4,0,0,0,'https://eua.am','IT/Data Science'),
('B172','EUA','Web Design and Network Systems','IT','Armenian/English',4,0,0,0,'https://eua.am','IT/Systems'),
('B173','EUA','Information Technologies and Security','IT','Armenian/English',4,0,0,0,'https://eua.am','IT/Security'),
('B174','EUA','Engineering & Technology, Innovation Management','Engineering','Armenian/English',4,0,0,0,'https://eua.am','Engineering/IT'),
('B175','UFAR','Law','Law','Armenian/French',4,0,0,0,'https://bureau.ufar.am','Faculty of Law'),
('B176','UFAR','Management','Business','Armenian/French',4,0,0,0,'https://bureau.ufar.am','Faculty of Management'),
('B177','UFAR','Marketing','Business','Armenian/French',4,0,0,0,'https://bureau.ufar.am','Faculty of Marketing'),
('B178','UFAR','Finance','Economics','Armenian/French',4,0,0,0,'https://bureau.ufar.am','Faculty of Finance'),
('B179','UFAR','Informatics & Applied Mathematics','IT','Armenian/English/French',4,0,0,0,'https://bureau.ufar.am','Faculty of Informatics'),
('B180','ANAU','Economics of agri-food system','Economics','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agribusiness and Economics'),
('B181','ANAU','Agribusiness and finance','Business','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agribusiness and Economics'),
('B182','ANAU','Agribusiness and finance (English)','Business','English',4,0,0,0,'https://dimord.am/','Agribusiness Teaching Center'),
('B183','ANAU','Agroecology','Agriculture','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agronomy'),
('B184','ANAU','Safety of Vital Activity','Engineering','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agrarian Engineering'),
('B185','ANAU','Agriculture Mechanization','Engineering','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agrarian Engineering'),
('B186','ANAU','Agriculture Electrification & Automation','Engineering','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agrarian Engineering'),
('B187','ANAU','Industrial technologies','Engineering','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agrarian Engineering'),
('B188','ANAU','Engineering of land & water resources','Engineering','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agrarian Engineering'),
('B189','ANAU','Engineering of machinery','Engineering','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agrarian Engineering'),
('B190','ANAU','Precision agriculture','Engineering','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agrarian Engineering'),
('B191','ANAU','Transport & logistics systems','Engineering','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agrarian Engineering'),
('B192','ANAU','Food technology','Agriculture','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Food Technologies'),
('B193','ANAU','Fermentation technology & winemaking','Agriculture','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Food Technologies'),
('B194','ANAU','Food safety','Agriculture','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Food Technologies'),
('B195','ANAU','Land Management & Land Cadaster','Engineering','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agrarian Engineering'),
('B196','ANAU','Land Reclamation & Soil Resources','Engineering','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agrarian Engineering'),
('B197','ANAU','Agronomy, selection & genetics','Agriculture','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agronomy'),
('B198','ANAU','Plant protection','Agriculture','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agronomy'),
('B199','ANAU','Greenhouse agrotechnology','Agriculture','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agronomy'),
('B200','ANAU','Animal science & biotechnology','Agriculture','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Veterinary Medicine & Animal Husbandry'),
('B201','ANAU','Forestry & landscaping of settlements','Agriculture','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Agronomy'),
('B202','ANAU','Veterinary medicine','Medical','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Veterinary Medicine & Animal Husbandry'),
('B203','ANAU','Veterinary sanitary expertise','Medical','Armenian',4,0,0,0,'https://dimord.am/','Faculty of Veterinary Medicine & Animal Husbandry'),
('B204','Komitas','Musical Art - Composition','Arts','Armenian',4,700000,0,0,'https://dimord.am/','Musical Art / Composition'),
('B205','Komitas','Performance - Instrumental Performance','Arts','Armenian',4,700000,0,0,'https://dimord.am/','Performance / Instrumental Performance'),
('B206','Komitas','Performance - Vocal Arts','Arts','Armenian',4,700000,0,0,'https://dimord.am/','Performance / Vocal Arts'),
('B207','Komitas','Performance - Conducting','Arts','Armenian',4,700000,0,0,'https://dimord.am/','Performance / Conducting'),
('B208','Komitas','Music Theory and History - Musicology','Arts','Armenian',4,700000,0,0,'https://dimord.am/','Music Theory & History / Musicology');

-- ─────────────────────────────────────────────────────────────
-- TABLE: subjects  (entrance exam subjects / SUBJ_META)
-- Fields: id, name, icon_key, color_hex
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS subjects (
  id        INTEGER PRIMARY KEY AUTOINCREMENT,
  name      TEXT    NOT NULL UNIQUE,
  icon_key  TEXT,
  color_hex TEXT
);

INSERT INTO subjects (name, icon_key, color_hex) VALUES
('Mathematics','math','#2563eb'),
('Physics','physics','#7c3aed'),
('Biology','biology','#059669'),
('Chemistry','chemistry','#dc2626'),
('History','history','#b45309'),
('English','english','#0284c7'),
('French','french','#2563eb'),
('Russian','russian','#dc2626'),
('Armenian','armenian','#dc2626'),
('Economics','economics','#0891b2'),
('Computer Science','cs','#6d28d9'),
('IT','it','#6d28d9'),
('Statistics','stats','#0891b2'),
('Law','law','#92400e'),
('SAT/ACT','satact','#475569'),
('GMAT','gmat','#475569'),
('Psychology','psy','#7c3aed'),
('Pedagogy','ped','#059669'),
('Music Theory','music','#db2777'),
('Performance','perf','#ea580c'),
('Instrument Performance','instr','#db2777'),
('Physical Test','phys','#16a34a'),
('Sports Norms','sport','#16a34a');

-- ─────────────────────────────────────────────────────────────
-- TABLE: exam_programs  (programs shown in the Exam Explorer)
-- Fields: pid, uid, name, field, lang, tuition_amd,
--         seats_state, seats_paid, apply_url
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS exam_programs (
  pid         TEXT  PRIMARY KEY,
  uid         TEXT  NOT NULL REFERENCES universities(id),
  name        TEXT  NOT NULL,
  field       TEXT,
  lang        TEXT,
  tuition_amd INTEGER,
  seats_state INTEGER,
  seats_paid  INTEGER,
  apply_url   TEXT
);

INSERT INTO exam_programs VALUES
('YSU001','YSU','Computer Science','IT','Armenian',800000,120,200,'https://dimord.am/'),
('YSU002','YSU','Data Science','IT','English',1500000,20,40,'https://dimord.am/'),
('YSU003','YSU','Applied Mathematics','Math','Armenian',800000,60,100,'https://dimord.am/'),
('YSU004','YSU','International Relations','Social','Armenian',900000,50,150,'https://dimord.am/'),
('YSU005','YSU','Management','Business','English',1500000,0,120,'https://dimord.am/'),
('NPUA001','NPUA','Software Engineering','IT','Armenian',1100000,70,140,'https://dimord.am/'),
('NPUA002','NPUA','Information Security','IT','Armenian',1100000,40,80,'https://dimord.am/'),
('NPUA003','NPUA','Robotics','Engineering','English',1300000,10,30,'https://dimord.am/'),
('NPUA004','NPUA','Civil Engineering','Engineering','Armenian',1000000,80,120,'https://dimord.am/'),
('AUA001','AUA','Computer Science','IT','English',2000000,0,120,'https://apply.aua.am'),
('AUA002','AUA','Data Science','IT','English',2700000,0,40,'https://apply.aua.am'),
('AUA003','AUA','MBA','Business','English',3200000,0,60,'https://apply.aua.am'),
('AUA004','AUA','Economics','Business','English',2000000,0,100,'https://apply.aua.am'),
('RAU001','RAU','Applied Mathematics & Informatics','IT','Russian',1400000,30,100,'https://rau.am/abitur/bachelor/'),
('RAU002','RAU','Computer Engineering','IT','Russian',1400000,40,120,'https://rau.am/abitur/bachelor/'),
('RAU003','RAU','International Relations','Social','Russian',1300000,20,80,'https://rau.am/abitur/bachelor/'),
('RAU004','RAU','Economics','Business','Russian',1300000,25,90,'https://rau.am/abitur/bachelor/'),
('ASUE001','ASUE','Finance','Business','Armenian',900000,80,200,'https://dimord.am/'),
('ASUE002','ASUE','Marketing','Business','Armenian',900000,60,180,'https://dimord.am/'),
('ASUE003','ASUE','Business Analytics','Business','English',1200000,20,40,'https://dimord.am/'),
('YSMU001','YSMU','General Medicine','Medical','English',1800000,0,300,'https://dimord.am/'),
('YSMU002','YSMU','Dentistry','Medical','English',2000000,0,120,'https://dimord.am/'),
('YSMU003','YSMU','Pharmacy','Medical','Armenian',900000,30,100,'https://dimord.am/'),
('BRUSOV001','Brusov','Linguistics','Humanities','Armenian',800000,50,120,'https://dimord.am/'),
('BRUSOV002','Brusov','Translation Studies','Humanities','English',900000,30,100,'https://dimord.am/'),
('ASPU001','ASPU','Psychology','Social','Armenian',700000,70,140,'https://dimord.am/'),
('ASPU002','ASPU','Primary Education','Education','Armenian',650000,80,150,'https://dimord.am/'),
('ANAU001','ANAU','Agronomy','Agriculture','Armenian',600000,60,100,'https://dimord.am/'),
('ANAU002','ANAU','Food Technology','Engineering','Armenian',750000,40,90,'https://dimord.am/'),
('UFAR001','UFAR','Management','Business','French',1700000,0,150,'https://bureau.ufar.am'),
('UFAR002','UFAR','Law','Law','French',1700000,0,120,'https://bureau.ufar.am'),
('EUA001','EUA','Law','Law','Armenian',850000,40,100,'https://eua.am'),
('EUA002','EUA','International Relations','Social','Armenian',850000,20,80,'https://eua.am'),
('KOM001','Komitas','Classical Vocal','Arts','Armenian',700000,15,40,'https://dimord.am/'),
('KOM002','Komitas','Instrumental Performance','Arts','Armenian',700000,20,50,'https://dimord.am/'),
('SPORT001','SCAS','Coaching','Sport','Armenian',650000,30,90,'https://dimord.am/'),
('SPORT002','SCAS','Kinesiology','Sport','Armenian',650000,20,60,'https://dimord.am/');

-- ─────────────────────────────────────────────────────────────
-- TABLE: exam_program_subjects
-- Junction table: which entrance subjects each exam_program requires
-- Fields: id, pid, subject_name
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS exam_program_subjects (
  id           INTEGER PRIMARY KEY AUTOINCREMENT,
  pid          TEXT    NOT NULL REFERENCES exam_programs(pid),
  subject_name TEXT    NOT NULL
);

INSERT INTO exam_program_subjects (pid, subject_name) VALUES
('YSU001','Mathematics'),
('YSU001','Physics'),
('YSU002','Mathematics'),
('YSU002','English'),
('YSU003','Mathematics'),
('YSU004','History'),
('YSU004','English'),
('YSU005','Economics'),
('YSU005','English'),
('NPUA001','Mathematics'),
('NPUA001','Physics'),
('NPUA002','Mathematics'),
('NPUA002','Computer Science'),
('NPUA003','Mathematics'),
('NPUA003','English'),
('NPUA004','Mathematics'),
('NPUA004','Physics'),
('AUA001','SAT/ACT'),
('AUA001','English'),
('AUA002','English'),
('AUA002','Mathematics'),
('AUA003','English'),
('AUA003','GMAT'),
('AUA004','English'),
('AUA004','Mathematics'),
('RAU001','Mathematics'),
('RAU001','Physics'),
('RAU002','Mathematics'),
('RAU002','IT'),
('RAU003','History'),
('RAU003','English'),
('RAU004','Economics'),
('RAU004','Mathematics'),
('ASUE001','Mathematics'),
('ASUE001','Economics'),
('ASUE002','Mathematics'),
('ASUE002','English'),
('ASUE003','Statistics'),
('ASUE003','Economics'),
('YSMU001','Biology'),
('YSMU001','Chemistry'),
('YSMU002','Biology'),
('YSMU002','Chemistry'),
('YSMU003','Chemistry'),
('BRUSOV001','English'),
('BRUSOV001','History'),
('BRUSOV002','English'),
('BRUSOV002','Russian'),
('ASPU001','Psychology'),
('ASPU001','Armenian'),
('ASPU002','Armenian'),
('ASPU002','Pedagogy'),
('ANAU001','Mathematics'),
('ANAU001','Biology'),
('ANAU002','Mathematics'),
('ANAU002','Chemistry'),
('UFAR001','French'),
('UFAR001','Mathematics'),
('UFAR002','French'),
('UFAR002','Law'),
('EUA001','Armenian'),
('EUA001','Law'),
('EUA002','Armenian'),
('EUA002','History'),
('KOM001','Performance'),
('KOM001','Music Theory'),
('KOM002','Instrument Performance'),
('SPORT001','Sports Norms'),
('SPORT001','Physical Test'),
('SPORT002','Physical Test');

-- ─────────────────────────────────────────────────────────────
-- TABLE: program_scores  (historical admission data 2018–2022)
-- Fields: id, pid, year, score_state, score_paid,
--         applicants, admitted_state
-- score_state / score_paid = minimum passing score (0–100)
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS program_scores (
  id             INTEGER PRIMARY KEY AUTOINCREMENT,
  pid            TEXT    NOT NULL REFERENCES exam_programs(pid),
  year           INTEGER NOT NULL,
  score_state    REAL,
  score_paid     REAL,
  applicants     INTEGER,
  admitted_state INTEGER
);

INSERT INTO program_scores (pid, year, score_state, score_paid, applicants, admitted_state) VALUES
('YSU001',2022,85.0,75.0,400,120),
('YSU001',2021,84.0,74.0,380,120),
('YSU001',2020,83.0,73.0,370,120),
('YSU001',2019,82.0,72.0,360,120),
('YSU001',2018,81.0,71.0,350,120),
('YSU002',2022,88.0,78.0,120,20),
('YSU002',2021,87.0,77.0,110,20),
('YSU002',2020,86.0,76.0,100,20),
('YSU002',2019,85.0,75.0,95,20),
('YSU002',2018,84.0,74.0,90,20),
('YSU005',2022,80.0,70.0,300,0),
('YSU005',2021,79.0,69.0,280,0),
('YSU005',2020,78.0,68.0,260,0),
('YSU005',2019,77.0,67.0,240,0),
('YSU005',2018,76.0,66.0,220,0),
('NPUA001',2022,82.0,72.0,300,70),
('NPUA001',2021,81.0,71.0,290,70),
('NPUA001',2020,80.0,70.0,280,70),
('NPUA001',2019,79.0,69.0,270,70),
('NPUA001',2018,78.0,68.0,260,70),
('NPUA004',2022,80.0,70.0,350,80),
('NPUA004',2021,79.0,69.0,340,80),
('NPUA004',2020,78.0,68.0,330,80),
('NPUA004',2019,77.0,67.0,320,80),
('NPUA004',2018,76.0,66.0,310,80),
('AUA001',2022,88.0,0,200,0),
('AUA001',2021,87.0,0,180,0),
('AUA001',2020,86.0,0,160,0),
('AUA001',2019,85.0,0,150,0),
('AUA001',2018,84.0,0,140,0),
('AUA002',2022,90.0,0,50,0),
('AUA002',2021,89.0,0,45,0),
('AUA002',2020,88.0,0,40,0),
('AUA002',2019,87.0,0,35,0),
('AUA002',2018,86.0,0,30,0),
('RAU001',2022,80.0,70.0,180,30),
('RAU001',2021,79.0,69.0,170,30),
('RAU001',2020,78.0,68.0,160,30),
('RAU001',2019,77.0,67.0,150,30),
('RAU001',2018,76.0,66.0,140,30),
('ASUE001',2022,78.0,68.0,250,80),
('ASUE001',2021,77.0,67.0,240,80),
('ASUE001',2020,76.0,66.0,230,80),
('ASUE001',2019,75.0,65.0,220,80),
('ASUE001',2018,74.0,64.0,210,80),
('YSMU001',2022,92.0,0,350,0),
('YSMU001',2021,91.0,0,330,0),
('YSMU001',2020,90.0,0,310,0),
('YSMU001',2019,89.0,0,300,0),
('YSMU001',2018,88.0,0,280,0),
('BRUSOV001',2022,70.0,0,100,0),
('BRUSOV001',2021,69.0,0,90,0),
('BRUSOV001',2020,68.0,0,80,0),
('BRUSOV001',2019,67.0,0,70,0),
('BRUSOV001',2018,66.0,0,60,0),
('ASPU001',2022,72.0,0,120,0),
('ASPU001',2021,71.0,0,110,0),
('ASPU001',2020,70.0,0,100,0),
('ASPU001',2019,69.0,0,90,0),
('ASPU001',2018,68.0,0,80,0),
('ANAU001',2022,70.0,0,80,0),
('ANAU001',2021,69.0,0,75,0),
('ANAU001',2020,68.0,0,70,0),
('ANAU001',2019,67.0,0,65,0),
('ANAU001',2018,66.0,0,60,0),
('UFAR001',2022,88.0,0,90,0),
('UFAR001',2021,87.0,0,85,0),
('UFAR001',2020,86.0,0,80,0),
('UFAR001',2019,85.0,0,75,0),
('UFAR001',2018,84.0,0,70,0),
('EUA001',2022,78.0,0,60,0),
('EUA001',2021,77.0,0,55,0),
('EUA001',2020,76.0,0,50,0),
('EUA001',2019,75.0,0,45,0),
('EUA001',2018,74.0,0,40,0),
('KOM001',2022,65.0,0,15,0),
('KOM001',2021,64.0,0,14,0),
('KOM001',2020,63.0,0,13,0),
('KOM001',2019,62.0,0,12,0),
('KOM001',2018,61.0,0,11,0),
('SPORT001',2022,68.0,0,30,0),
('SPORT001',2021,67.0,0,28,0),
('SPORT001',2020,66.0,0,26,0),
('SPORT001',2019,65.0,0,24,0),
('SPORT001',2018,64.0,0,22,22);

-- =============================================================
-- SAMPLE QUERIES
-- =============================================================

-- 1. All programs at a specific university (e.g. YSU):
-- SELECT id, name, field, lang, tuition_amd, seats_state, seats_paid
-- FROM programs WHERE uid = 'YSU' ORDER BY field, name;

-- 2. All exam programs with their required entrance subjects:
-- SELECT ep.pid, ep.name, u.short, GROUP_CONCAT(eps.subject_name, ', ') AS required_subjects
-- FROM exam_programs ep
-- JOIN universities u ON ep.uid = u.id
-- JOIN exam_program_subjects eps ON ep.pid = eps.pid
-- GROUP BY ep.pid ORDER BY u.short, ep.name;

-- 3. Top 10 most competitive programs by 2022 state score:
-- SELECT ep.name, u.short, ps.year, ps.score_state, ps.applicants
-- FROM program_scores ps
-- JOIN exam_programs ep ON ps.pid = ep.pid
-- JOIN universities u ON ep.uid = u.id
-- WHERE ps.year = 2022
-- ORDER BY ps.score_state DESC LIMIT 10;

-- 4. Universities with dormitory and scholarship support:
-- SELECT id, name, type, employ_outlook, tuition_range
-- FROM universities WHERE has_dorm = 1 AND has_schol = 1
-- ORDER BY employ_outlook DESC, name;

-- 5. Programs matching a student who can take Mathematics + Physics:
-- SELECT DISTINCT ep.pid, ep.name, u.short, ep.tuition_amd, ep.lang
-- FROM exam_programs ep
-- JOIN universities u ON ep.uid = u.id
-- WHERE ep.pid NOT IN (
--   SELECT pid FROM exam_program_subjects
--   WHERE subject_name NOT IN ('Mathematics','Physics')
-- )
-- ORDER BY ep.tuition_amd;

-- 6. Score trend for a specific program (Computer Science at YSU):
-- SELECT year, score_state, score_paid, applicants
-- FROM program_scores WHERE pid = 'YSU001' ORDER BY year;
