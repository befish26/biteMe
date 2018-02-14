import logging
from flask import Flask, render_template, Response, request, redirect, url_for, jsonify
# import pymysql
import json
import datetime
import random

#initializing mysql database connection
# db = pymysql.connect("localhost", "owner", "", "database")

#initializing app
app = Flask(__name__)

@app.route('/')
def question():
	return render_template('question.html')

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
