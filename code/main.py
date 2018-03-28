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
            return redirect(url_for('question'))


        elif data is None:

            return render_template('login.html')
        else:
            return redirect(url_for('question'))

    return render_template('login.html')


#@app.route ('/checklogin', methods = ['GET', 'POST'])
#def checklogin():


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
        cur = db.cursor()
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
        question_number += 1
	if(int(student_answer) == int(correct_answer)):					#make a query from the database here for the answer.
		answer = 'True';
		return render_template('check_answer.html', answer=answer, data=data_list, question_number=question_number)
	else:
		answer = 'False';
		return render_template('check_answer.html', answer=answer, data=data_list, question_number=question_number)
# @app.route('/<string:page_name>/')
# def static_page(page_name):
#     return render_template('%s.html' % page_name)

if __name__ == "__main__":
    app.run(debug=True)
