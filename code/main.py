import logging
from flask import Flask,g, url_for, request, redirect, session, render_template, Response, request, redirect, url_for, jsonify
import pymysql
import json
import datetime
import random
import MySQLdb
import os



#https://www.youtube.com/watch?v=VVCny4gmT6M
#!/usr/bin/python
import MySQLdb
app = Flask(__name__)
app.secret_key = os.urandom(24)

db = pymysql.connect("localhost", "admin", "admin", "MathSportsDB")
question_number = 1
student_id = 1

@app.route('/')
def start_demo():
    return render_template('start_demo.html')

@app.route('/login', methods=['GET','POST'])
def login():
    if request.method =='POST':
        username_form = str(request.form['username'])
        password_form = str(request.form['password'])
        cur = db.cursor()
        #cursor = mysql.connect().cursor()
        cur.execute("SELECT Username, Password FROM student_profile WHERE Username= '{}' and Password= '{}';".format(username_form, password_form))
        data = cur.fetchone()
        print "Works"
        if username_form == 'admin' and password_form == 'admin':
            # return redirect(url_for('teacher_view'))
            return render_template('teacher_view.html')


        elif data is None:

            return render_template('login.html')
        else:
            return redirect(url_for('question'))

    return render_template('login.html')


#@app.route ('/checklogin', methods = ['GET', 'POST'])
#def checklogin():

@app.route('/student_profiles/', methods=['GET','POST'])
def student_profiles():
    cur = db.cursor()
    if(request.method =='POST'):
        print "Post method"
        if('remove_student' in request.form):
            print "REMOVE QUESTION"
            student_id = request.form['remove_student']
            print "Remove Student #: ", student_id
            remove_progress_query = "DELETE FROM STUDENT_PROGRESS WHERE student_id = {};".format(student_id)
            cur.execute(remove_progress_query)
            db.commit()
            remove_profile_query = "DELETE FROM STUDENT_PROFILE WHERE student_id = {};".format(student_id)
            cur.execute(remove_profile_query)
            db.commit()
        if('first_name' in request.form):
            print "ADD QUESTION"
            first_name = request.form['first_name']
            middle_initial = request.form['middle_initial']
            last_name = request.form['last_name']
            grade = request.form['grade']
            class_teacher = request.form['class_teacher']
            username = request.form['username']
            password = request.form['password']

            add_query = "INSERT INTO STUDENT_PROFILE(Fname, Minit, Lname, Grade, Class, Username, Password) VALUES ('{}', '{}', '{}', {}, '{}', '{}', '{}');".format(first_name, middle_initial, last_name, grade, class_teacher, username, password)
            cur.execute(add_query)
            db.commit()
            print add_query

            find_student_id_query = "select count(student_id) from student_profile;"
            cur.execute(find_student_id_query)
            db.commit()

            students=[students[0] for students in cur.description]
            numberOfStudents_query = cur.fetchall()
            student_list=[]
            for student in numberOfStudents_query:
                student_list.append(dict(zip(students,student)))

            number_of_students = student_list[0]['count(student_id)']

            add_student_progress_query = "INSERT INTO STUDENT_PROGRESS(student_id, correct_answers, incorrect_answers, total_answers, total_percent_correct) VALUES ({}, 0, 0, 0, 0.0);".format(number_of_students)
            cur.execute(add_student_progress_query)
            db.commit()

    print "Display Only"
    cur = db.cursor()
    query = "Select Fname, student_profile.student_id, Lname, Grade, Class, Username, Password, student_progress.total_percent_correct from student_profile inner join student_progress on student_profile.student_id = student_progress.student_id;"
    cur.execute(query)

    students=[students[0] for students in cur.description]
    students_data = cur.fetchall()
    students_list=[]
    for student in students_data:
        students_list.append(dict(zip(students,student)))

    questions_query = "Select question_id, question, answer from question;"
    cur.execute(questions_query)

    questions=[question[0] for question in cur.description]
    data = cur.fetchall()
    data_list=[]
    for element in data:
        data_list.append(dict(zip(questions,element)))

    return render_template('student_profiles.html', data=students_list, questions=data_list)

@app.route('/teacher_questions/', methods=['GET','POST'])
def teacher_questions():
    cur = db.cursor()
    if(request.form.get('question')):
        question = request.form['question']
        answer = request.form['answer']
        question_type = request.form['category']
        add_query = "INSERT INTO QUESTION(question, answer, question_type) VALUES ('{}', {}, '{}');".format(question, answer, question_type)
        cur.execute(add_query)
        db.commit()

    else:
        for i in request.form:
            delete_query = "delete from question where question_id = {};".format(request.form[i])
            cur.execute(delete_query)
            db.commit()

    questions_query = "Select question_id, question, answer, question_type from question;"
    cur.execute(questions_query)

    questions=[question[0] for question in cur.description]
    data = cur.fetchall()
    data_list=[]
    for element in data:
        data_list.append(dict(zip(questions,element)))

    return render_template('teacher_questions.html', questions=data_list)

@app.route('/question')
def question():
        global question_number
        # Create a Cursor object to execute queries.
        cur = db.cursor()
        # Select data from table using SQL query.
        query = "SELECT question, answer FROM question WHERE question_id = {};".format(question_number)
        cur.execute(query)

        questions=[question[0] for question in cur.description] #return headers with values
        data = cur.fetchall()
        data_list=[]
        for element in data:
            data_list.append(dict(zip(questions,element)))
        return render_template('question.html', data=data_list, question_number=question_number)

@app.before_request
def before_request():
    g.user = None
    if 'user' in session:
        g.user = session ['user']

@app.route('/checkAnswer/', methods=['POST'])
def check_answer():
    global question_number
    print "Question: ",question_number
    if(question_number == 10):
        question_number = 1
        return render_template('end_demo.html')
    student_answer = request.form["answer"]
    print "Student Answer is:", student_answer
    cur = db.cursor()
    secondCur = db.cursor()
    thirdCur = db.cursor()
    ScoreQuery = "SELECT correct_answers from STUDENT_PROGRESS WHERE student_id = {};".format(student_id)
    secondCur.execute(ScoreQuery)
    score_set = secondCur.fetchall()
    score = score_set[0][0]
    query = "SELECT question, answer FROM question WHERE question_id = {};".format(question_number)
    cur.execute(query)
    questions=[question[0] for question in cur.description] #return headers with values
    data = cur.fetchall()
    data_list=[]
    for element in data:
        data_list.append(dict(zip(questions,element)))
    correct_answer = data_list[0]["answer"]
    print 'correct_answer', type(correct_answer)
    print 'student answer', type(student_answer)
    print "Current Score", score
    cur.close()
    cursor = db.cursor()
    try:
        test_answer = int(student_answer)
        if(int(student_answer) == int(correct_answer)):
            score += 1
            CorrectQuery = "UPDATE STUDENT_PROGRESS SET correct_answers = {0} WHERE student_id = {1};".format(score, student_id)
            thirdCur.execute(CorrectQuery)
            update_progress = "UPDATE student_questions set response = 'correct' where student_id=1 AND question_id={};".format(question_number)
            cursor.execute(update_progress)
            question_number += 1
            print question_number
            print update_progress
            print CorrectQuery
            answer = 'True';
            cursor.close()
            return render_template('check_answer.html', answer=answer, data=data_list, question_number=question_number, score=score)
        else:
            answer = 'False';
            update_progress = "UPDATE student_questions set response = 'incorrect' where student_id=1 AND question_id={};".format(question_number)
            cursor.execute(update_progress)
            question_number += 1
            print question_number
            print update_progress
            cursor.close()
            return render_template('check_answer.html', answer=answer, data=data_list, question_number=question_number,score=score)
    except:
        print "Please enter a number"
        answer = 'False'
        return render_template('check_answer.html', answer=answer, data=data_list, question_number=question_number,score=score)

# def update_incorrect_answer():
#     cur = db.cursor()
#     query = "Select Fname, student_profile.student_id, Lname, Grade, Class, total_percent_correct from student_profile inner join student_progress on student_profile.student_id = student_progress.student_id;"
#     cur.execute(query)
#
#     questions=[question[0] for question in cur.description] #return headers with values
#     data = cur.fetchall()
#     data_list=[]
#     for element in data:
#         data_list.append(dict(zip(questions,element)))
#     return render_template('student_profiles.html', data=data_list)

# def update_incorrect_answer():
# @app.route('/<string:page_name>/')
# def static_page(page_name):
#     return render_template('%s.html' % page_name)

if __name__ == "__main__":
    app.run(debug=True)
    # app.run(threaded=True)
