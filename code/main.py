import logging
from flask import Flask, render_template, Response, request, redirect, url_for, jsonify
import pymysql
import json
import datetime
import random
import MySQLdb

#!/usr/bin/python
import MySQLdb

# db = MySQLdb.connect(host="localhost",  # your host
#                      user="admin",   # username
#                      passwd="admin",        # password
#                      db="MathSportsDB") # name of the database

db = pymysql.connect("localhost", "admin", "admin", "MathSportsDB")

#initializing app
app = Flask(__name__)

@app.route('/')
def question():
    # Create a Cursor object to execute queries.
    cur = db.cursor()
    #query = ("SELECT FIRST FROM students ")
    # Select data from table using SQL query.
    cur.execute("SELECT question, answer FROM question WHERE question_id = 1;")
    #cur.execute(query)

    questions=[question[0] for question in cur.description] #return headers with values
    data = cur.fetchall()
    data_list=[]
    for element in data:
        data_list.append(dict(zip(questions,element)))
	return render_template('question.html', data=data_list)

@app.route('/checkAnswer/', methods=['POST'])
def check_answer():
	student_answer = request.form["answer"]
	print student_answer
	if(student_answer == '8'):					#make a query from the database here for the answer.
		answer = 'True';
		return render_template('check_answer.html', answer=answer)
	else:
		answer = 'False';
		return render_template('check_answer.html', answer=answer)

# @app.route('/<string:page_name>/')
# def static_page(page_name):
#     return render_template('%s.html' % page_name)

if __name__ == "__main__":
    app.run(debug=True)
