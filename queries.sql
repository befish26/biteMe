select student_progress.student_id, student_progress.total_percent_correct, student_questions.question_id  from student_progress inner join student_questions on student_progress.student_id = student_questions.student_id;

UPDATE student_questions set response = "correct" where student_id = 1 AND question_id = 1;

select student_progress.student_id, student_questions.response, student_questions.question_id  from student_progress
inner join student_questions on student_progress.student_id = student_questions.student_id;


SELECT COUNT(RESPONSE) FROM STUDENT_QUESTIONS WHERE response = "correct";
select count(*) from student_questions;
