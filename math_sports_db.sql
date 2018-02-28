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
