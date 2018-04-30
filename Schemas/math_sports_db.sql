CREATE TABLE IF NOT EXISTS QUESTION (
  question_id INT(30) NOT NULL AUTO_INCREMENT,
  question VARCHAR(60) NOT NULL,
  answer INT(60) NOT NULL,
  question_type VARCHAR(30) NOT NULL,
  question_set_id INT(30) NOT NULL DEFAULT 1,
  PRIMARY KEY(question_id));

CREATE TABLE IF NOT EXISTS STUDENT_PROFILE(
  student_id INT(30) NOT NULL AUTO_INCREMENT,
  Fname VARCHAR(15)	NOT NULL,
  Minit VARCHAR(9),
  Lname VARCHAR(15)	NOT NULL,
  Grade INT(9) NOT NULL,
  Class VARCHAR(30),
  Username VARCHAR(15) NOT NULL,
  Password VARCHAR(15) NOT NULL,
  PRIMARY KEY(student_id));

CREATE TABLE IF NOT EXISTS STUDENT_QUESTIONS (
  question_id INT(30) NOT NULL,
  student_id INT(30) NOT NULL,
  response VARCHAR(30)
);


CREATE TABLE IF NOT EXISTS STUDENT_PROFILE_PROGRESS (
  progress_id INT(30) NOT NULL,
  student_id INT(30) NOT NULL
);

CREATE TABLE STUDENT_PROGRESS
(
  student_id INT(30) NOT NULL,
  correct_answers INT(30) NOT NULL,
  incorrect_answers INT(30) NOT NULL,
  total_answers INT(30) NOT NULL,
	total_percent_correct FLOAT(30) NOT NULL,
  current_question INT(30) NOT NULL DEFAULT 1,
  PRIMARY KEY(student_id)
);

CREATE TABLE IF NOT EXISTS QUESTION_SET (
  question_set_id INT(30) NOT NULL AUTO_INCREMENT,
  question_set_name VARCHAR(60) NOT NULL,
  difficulty VARCHAR(30) NOT NULL,
  PRIMARY KEY(question_set_id)
);
--
-- CREATE TABLE IF NOT EXISTS PLACEHOLDER (
--   question_id INT(30) NOT NULL AUTO_INCREMENT,
--   question VARCHAR(60) NOT NULL,
--   answer INT(60) NOT NULL,
--   question_type VARCHAR(30) NOT NULL,
--   description VARCHAR(60) NOT NULL,
--   PRIMARY KEY(question_id)
-- );

-- ALTER TABLE QUESTION_SET ADD CONSTRAINT FOREIGN KEY(question_id) REFERENCES QUESTION(question_id);
ALTER TABLE QUESTION ADD CONSTRAINT FOREIGN KEY(question_set_id) REFERENCES QUESTION_SET(question_set_id);

ALTER TABLE STUDENT_QUESTIONS ADD CONSTRAINT FOREIGN KEY(student_id) REFERENCES STUDENT_PROGRESS(student_id);
ALTER TABLE STUDENT_QUESTIONS ADD CONSTRAINT FOREIGN KEY(question_id) REFERENCES QUESTION(question_id);

ALTER TABLE STUDENT_PROGRESS ADD CONSTRAINT FOREIGN KEY(student_id) REFERENCES STUDENT_PROFILE(student_id);

-- INSERT INTO PLACEHOLDER(question, answer, question_type, description) VALUES ('120', 2, "placeholder", "Which number is in the tens place?");
-- INSERT INTO PLACEHOLDER(question, answer, question_type, description) VALUES ('710', 7, "placeholder", "Which number is in the hundreds place?");
-- INSERT INTO PLACEHOLDER(question, answer, question_type, description) VALUES ('19', 9, "placeholder", "Which number is in the ones place?");
-- INSERT INTO PLACEHOLDER(question, answer, question_type, description) VALUES ('56', 5, "placeholder", "Which number is in the tens place?");

INSERT INTO QUESTION_SET(question_set_name, difficulty) VALUES ('Assignment1', 'Easy');

INSERT INTO STUDENT_PROFILE(Fname, Minit, Lname, Grade, Class, Username, Password) VALUES ('Ian', 'E', 'Sime', 1, 'Mrs. Riley', 'ianS', 'password');
INSERT INTO STUDENT_PROFILE(Fname, Minit, Lname, Grade, Class, Username, Password) VALUES ('Bridger', 'B', 'Fisher', 2, 'Mr. Dooley', 'bridgerF', 'password');
INSERT INTO STUDENT_PROFILE(Fname, Minit, Lname, Grade, Class, Username, Password) VALUES ('Charchit', '', 'Dahal', 1, 'Mrs. Riley', 'charchitD', 'password');
INSERT INTO STUDENT_PROFILE(Fname, Minit, Lname, Grade, Class, Username, Password) VALUES ('Hassan', '', 'Rao', 2, 'Mr. Dooley', 'hassanR', 'password');
INSERT INTO STUDENT_PROFILE(Fname, Minit, Lname, Grade, Class, Username, Password) VALUES ('James', 'E', 'Jones', 1, 'Mrs. Riley', 'jamesJ', 'password');

INSERT INTO QUESTION(question, answer, question_type, question_set_id) VALUES ('4+4=', 8, "addition", 1);
INSERT INTO QUESTION(question, answer, question_type, question_set_id) VALUES ('2+2=', 4, "addition", 1);
INSERT INTO QUESTION(question, answer, question_type, question_set_id) VALUES ('23+22=', 45, "addition", 1);
INSERT INTO QUESTION(question, answer, question_type, question_set_id) VALUES ('60+31=', 91, "addition", 1);
INSERT INTO QUESTION(question, answer, question_type, question_set_id) VALUES ('9+8=', 17, "addition", 1);
INSERT INTO QUESTION(question, answer, question_type, question_set_id) VALUES ('9-3=', 6), "subtraction", 1;
INSERT INTO QUESTION(question, answer, question_type, question_set_id) VALUES ('45-25=', 20, "subtraction", 1);
INSERT INTO QUESTION(question, answer, question_type, question_set_id) VALUES ('99-50=', 49, "subtraction", 1);
INSERT INTO QUESTION(question, answer, question_type, question_set_id) VALUES ('34-27=', 7, "subtraction", 1);
INSERT INTO QUESTION(question, answer, question_type, question_set_id) VALUES ('Which number is in the tens place? 120', 2, "placevalue", 1);
INSERT INTO QUESTION(question, answer, question_type, question_set_id) VALUES ('Which number is in the ones place? 325', 5, "placevalue", 1);

INSERT INTO STUDENT_PROGRESS(student_id, correct_answers, incorrect_answers, total_answers, total_percent_correct, current_question) VALUES (1, 0, 0, 10, 0.0, 1);
INSERT INTO STUDENT_PROGRESS(student_id, correct_answers, incorrect_answers, total_answers, total_percent_correct, current_question) VALUES (2, 0, 0, 10, 0.0, 1);
INSERT INTO STUDENT_PROGRESS(student_id, correct_answers, incorrect_answers, total_answers, total_percent_correct, current_question) VALUES (3, 0, 0, 10, 0.0, 1);
INSERT INTO STUDENT_PROGRESS(student_id, correct_answers, incorrect_answers, total_answers, total_percent_correct, current_question) VALUES (4, 0, 0, 10, 0.0, 1);

INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (1, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (2, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (3, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (4, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (5, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (6, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (7, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (8, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (9, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (10, 1, null);

-- UPDATE STUDENT_PROGRESS SET current_question = 1 where student_id = 1;
-- UPDATE STUDENT_PROGRESS SET current_question = 1 where student_id = 2;
-- UPDATE STUDENT_PROGRESS SET current_question = 1 where student_id = 3;
-- UPDATE STUDENT_PROGRESS SET current_question = 1 where student_id = 4;

-- ALTER TABLE student_profile AUTO_INCREMENT = 5;

-- SELECT concat('DROP TABLE IF EXISTS ', table_name, ';')
--     -> FROM information_schema.tables
--     -> WHERE table_schema = 'MathSportsDB';
