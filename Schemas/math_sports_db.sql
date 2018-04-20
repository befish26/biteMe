CREATE TABLE IF NOT EXISTS QUESTION (
  question_id INT(30) NOT NULL AUTO_INCREMENT,
  question VARCHAR(60) NOT NULL,
  answer INT(60) NOT NULL,
  question_type VARCHAR(30) NOT NULL,
  PRIMARY KEY(question_id));

CREATE TABLE IF NOT EXISTS STUDENT_QUESTIONS (
  question_id INT(30) NOT NULL,
  student_id INT(30) NOT NULL,
  response VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS QUESTION_SET (
  question_set_id INT(30) NOT NULL AUTO_INCREMENT,
  question_set_name VARCHAR(60) NOT NULL,
  difficulty VARCHAR(30) NOT NULL,
  PRIMARY KEY(question_set_id));
);

ALTER TABLE QUESTION_SET ADD CONSTRAINT FOREIGN KEY(question_id) REFERENCES STUDENT_PROGRESS(student_id);
ALTER TABLE QUESTION ADD COLUMN question_set_id INT(30);
ALTER TABLE QUESTION ADD CONSTRAINT FOREIGN KEY(question_set_id) REFERENCES QUESTION_SET(question_set_id);

ALTER TABLE STUDENT_QUESTIONS ADD CONSTRAINT FOREIGN KEY(student_id) REFERENCES STUDENT_PROGRESS(student_id);
ALTER TABLE STUDENT_QUESTIONS ADD CONSTRAINT FOREIGN KEY(question_id) REFERENCES QUESTION(question_id);

INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (1, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (2, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (3, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (4, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (5, 1, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (1, 2, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (2, 2, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (3, 2, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (4, 2, null);
INSERT INTO STUDENT_QUESTIONS(question_id, student_id, response) VALUES (5, 2, null);

INSERT INTO QUESTION(question, answer, question_type) VALUES ('4+4=', 8, "addition");
INSERT INTO QUESTION(question, answer, question_type) VALUES ('2+2=', 4, "addition");
INSERT INTO QUESTION(question, answer, question_type) VALUES ('23+22=', 45, "addition");
INSERT INTO QUESTION(question, answer, question_type) VALUES ('60+31=', 91, "addition");
INSERT INTO QUESTION(question, answer, question_type) VALUES ('9+8=', 17, "addition");
INSERT INTO QUESTION(question, answer, question_type) VALUES ('9-3=', 6), "subtraction";
INSERT INTO QUESTION(question, answer, question_type) VALUES ('45-25=', 20, "subtraction");
INSERT INTO QUESTION(question, answer, question_type) VALUES ('99-50=', 49, "subtraction");
INSERT INTO QUESTION(question, answer, question_type) VALUES ('34-27=', 7, "subtraction");
INSERT INTO QUESTION(question, answer, question_type) VALUES ('15-8=', 7, "subtraction");

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

INSERT INTO STUDENT_PROFILE(Fname, Minit, Lname, Grade, Class, Username, Password) VALUES ('Ian', 'E', 'Sime', 1, 'Mrs. Riley', 'ianS', 'password');
INSERT INTO STUDENT_PROFILE(Fname, Minit, Lname, Grade, Class, Username, Password) VALUES ('Bridger', 'B', 'Fisher', 2, 'Mr. Dooley', 'bridgerF', 'password');
INSERT INTO STUDENT_PROFILE(Fname, Minit, Lname, Grade, Class, Username, Password) VALUES ('Charchit', '', 'Dahal', 1, 'Mrs. Riley', 'charchitD', 'password');
INSERT INTO STUDENT_PROFILE(Fname, Minit, Lname, Grade, Class, Username, Password) VALUES ('Hassan', '', 'Rao', 2, 'Mr. Dooley', 'hassanR', 'password');

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
  PRIMARY KEY(student_id)
);

ALTER TABLE STUDENT_PROGRESS ADD CONSTRAINT FOREIGN KEY(student_id) REFERENCES STUDENT_PROFILE(student_id);
ALTER TABLE STUDENT_PROGRESS ADD COLUMN current_question INT(30) NOT NULL DEFAULT 1;

INSERT INTO STUDENT_PROGRESS(student_id, correct_answers, incorrect_answers, total_answers, total_percent_correct) VALUES (1, 0, 0, 10, 0.0);
INSERT INTO STUDENT_PROGRESS(student_id, correct_answers, incorrect_answers, total_answers, total_percent_correct) VALUES (2, 0, 0, 10, 0.0);
INSERT INTO STUDENT_PROGRESS(student_id, correct_answers, incorrect_answers, total_answers, total_percent_correct) VALUES (3, 0, 0, 10, 0.0);
INSERT INTO STUDENT_PROGRESS(student_id, correct_answers, incorrect_answers, total_answers, total_percent_correct) VALUES (4, 0, 0, 10, 0.0);

UPDATE STUDENT_PROGRESS SET current_question = 1 where student_id = 1;
UPDATE STUDENT_PROGRESS SET current_question = 1 where student_id = 2;
UPDATE STUDENT_PROGRESS SET current_question = 1 where student_id = 3;
UPDATE STUDENT_PROGRESS SET current_question = 1 where student_id = 4;

-- ALTER TABLE student_profile AUTO_INCREMENT = 5;
