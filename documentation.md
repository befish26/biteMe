# Math Sports
### Designed by Byte Me

Our Web Application was built for the purpose of teaching math skills through interactive games with a sport theme.  The students will be able to practice their addition and subtraction skills along with place values.


## Front end
Our interactive & engaging front end is written in raw HTML, CSS and Javascript to ensure an exciting and clean User Experience.  The User Interface has been designed specifically to be able to dynamically change to fit the proportions of whatever screen the user prefers.

## Backend
Our backend is written in Python using the Flask framework.  We chose this part for our stack in order to easily connect to our database and be able to retrieve information quickly and efficiently.

### Methods
Each of our methods servers at the route to each page of the application.  Inside, there is the specific functionality that we want for each page and the specific queries we want to run on the database.
* start_demo(): Shows the start up page for the demo/prototype and has a start button to begin the demo.
* question(): Creates the query to pull the question, answer, and user's input and sends them to the rendered check_answer() page.
* check_answer(): Takes the user's input and checks if their answer is correct or not, then plays the animation related to their correctness/incorrectness.

### Database
The first iteration of the database includes only the questions table that holds the question_id, question, and answer.
