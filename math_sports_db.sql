CREATE TABLE IF NOT EXISTS QUESTION (
  question_id INT(30) NOT NULL AUTO_INCREMENT,
  question VARCHAR(30) NOT NULL,
  answer INT(30) NOT NULL,
  PRIMARY KEY(question_id));

INSERT INTO QUESTION(question, answer) VALUES ('4+4=', 8);
INSERT INTO QUESTION(question, answer) VALUES ('2+2=', 4);
INSERT INTO QUESTION(question, answer) VALUES ('23+22=', 45);
INSERT INTO QUESTION(question, answer) VALUES ('60+31=', 91);
INSERT INTO QUESTION(question, answer) VALUES ('9+8=', 17);
INSERT INTO QUESTION(question, answer) VALUES ('9-3=', 6);
INSERT INTO QUESTION(question, answer) VALUES ('45-25=', 20);
INSERT INTO QUESTION(question, answer) VALUES ('99-50=', 49);
INSERT INTO QUESTION(question, answer) VALUES ('34-27=', 7);
INSERT INTO QUESTION(question, answer) VALUES ('15-8=', 7);

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

CREATE TABLE STUDENT_PROGRESS
(
	student_number	CHAR(9) NOT NULL AUTO_INCREMENT,
	Fname		VARCHAR(15)	NOT NULL,
	Minit		CHAR,
	Lname		VARCHAR(15)	NOT NULL,
	Grade		CHAR(9)		NOT NULL,
	Class		VARCHAR(30),
	PRIMARY KEY(student_number)
);
