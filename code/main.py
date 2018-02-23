import logging
from flask import Flask, render_template, Response, request, redirect, url_for, jsonify
import pymysql
import json
import datetime
import random
import MySQLdb

#!/usr/bin/python
import MySQLdb
app = Flask(__name__)
db = pymysql.connect("localhost", "admin", "admin", "MathSportsDB")
question_number = 1

@app.route('/')
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

@app.route('/checkAnswer/', methods=['POST'])
def check_answer():
        global question_number
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
