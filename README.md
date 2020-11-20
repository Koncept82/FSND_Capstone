Capstone: Casting Agency App
----
## Inspiration
This is my final project for the [Udacity Full Stack Web Developer Nanodegree](https://www.udacity.com/course/full-stack-web-developer-nanodegree--nd004). It covers following technical topics in 1 app:

1. Database modeling with `postgres` & `sqlalchemy` (see `models.py`)
2. API to performance CRUD Operations on database with `Flask` (see `app.py`)
3. Automated testing with `Unittest` (see `test_app`)
4. Authorization & Role based Authentification with `Auth0` (see `auth.py`)
5. Deployment on `Heroku`

----
## Introduction
The Casting Agency models a company that is responsible for creating movies and managing and assigning actors to those movies. You are an Executive Producer within the company and are creating a system to simplify and streamline your process.

* Roles:
    * Casting Assistant
        * Can view actors and movies
    * Casting Director
        * All permissions a Casting Assistant has and…
        * Add or delete an actor from the database
        * Modify actors or movies
    * Executive Producer
        * All permissions a Casting Director has and…
        * Add or delete a movie from the database

## Getting Started

### Dependencies

#### Python 3.8.5

Follow instructions to install the latest version of python for your platform in the [python docs](https://docs.python.org/3/using/unix.html#getting-and-installing-the-latest-version-of-python)

#### PIP Dependencies

Once you have your virtual environment setup and running, install dependencies by navigating to the home directory and running:

```bash
pip install -r requirements.txt
```

## Project Steps
##### Key Dependencies

- [Flask](http://flask.pocoo.org/)  is a lightweight backend microservices framework. Flask is required to handle requests and responses.

- [SQLAlchemy](https://www.sqlalchemy.org/) is the Python SQL toolkit and ORM we'll use handle the lightweight sqlite database. You'll primarily work in app.py and can reference models.py. 

- [Flask-CORS](https://flask-cors.readthedocs.io/en/latest/#) is the extension we'll use to handle cross origin requests from our frontend server.

- [jose](https://python-jose.readthedocs.io/en/latest/) JavaScript Object Signing and Encryption for JWTs. Useful for encoding, decoding, and verifying JWTS. 

## Database Setup
With Postgres running, restore a database using the `capstone.sql` file from the `database` directory in terminal run:
```bash
createdb capstone_test; 
GRANT ALL ON DATABASE capstone_test to postgres;

psql capstone_test < capstone.sql
```

## Running the server

From within the `home` directory first ensure you are working using your created virtual environment.

To run the server, execute:

```bash
export FLASK_APP=app.py
export FLASK_ENV=development
flask run
```

Setting the `FLASK_ENV` variable to `development` will detect file changes and restart the server automatically.

Setting the `FLASK_APP` variable to `app.py` directs flask to use the `app.py` file and the `__init__.py` file to find the application. 

## URL

* Heroku: https://capstone-fsnd-alf.herokuapp.com/
* Running locally: http://localhost:5000

## AUTH0 Login Details:
- To generate new Bearer Tokens
* Casting Assistant
    * Email:assistant@capstone.com 
    * Password: Password1!
* Casting Director
    * Email:director@capstone.com 
    * Password: Password1!
* Executive Producer
    * Email:producer@capstone.com 
    * Password: Password1!

## Testing
To run the tests, navigate to `database` and locate `casting.sql` file
```
dropdb capstone_test;
createdb capstone_test;

psql capstone_test < casting.sql
```

## [Postman](https://getpostman.com) Collections:
- Import the postman collection, navigate to `Postman_tests` directory and select any collections of Postman endpoints tests:
    * `Capstone-Heroku.postman_collection.json`: Heroku endpoints tests with (proper permission) bearer token included
    * `Capstone-Local.postman_collection.json`: Local endpoints tests with (proper permission) bearer token included

## API Reference
Getting Started
- Base URL: http://127.0.0.1:5000/

### Endpoints: 

#### GET /movies
- Fetches all movies from the database
- Request Arguments: None
- Sample: curl http://127.0.0.1:5000/movies
```
{
 "movies": [
    {
        "Actor ID": 11,
        "Movie ID": 1,
        "Release Date": "Fri, 03 Feb 1989 01:01:00 GMT",
        "Title": "Die Hard"
    },
    {
        "Actor ID": 17,
        "Movie ID": 2,
        "Release Date": "Fri, 03 Apr 2015 01:01:00 GMT",
        "Title": "Furious 7"
    },
    {
        "Actor ID": 9,
        "Movie ID": 3,
        "Release Date": "Sat, 13 Jul 2019 01:00:00 GMT",
        "Title": "Hobbs & Shaw"
    },
    {
        "Actor ID": 13,
        "Movie ID": 4,
        "Release Date": "Wed, 12 Nov 2008 01:00:00 GMT",
        "Title": "Slumdog Millionaire"
    },
    {
        "Actor ID": 3,
        "Movie ID": 5,
        "Release Date": "Tue, 13 Jul 2010 00:01:00 GMT",
        "Title": "Inception"
    },
    {
        "Actor ID": 7,
        "Movie ID": 6,
        "Release Date": "Fri, 05 May 2000 00:01:00 GMT",
        "Title": "Gladiator"
    },
    {
        "Actor ID": 4,
        "Movie ID": 7,
        "Release Date": "Fri, 24 Jul 1998 00:00:10 GMT",
        "Title": "Saving Private Ryan"
    },
    {
        "Actor ID": 8,
        "Movie ID": 8,
        "Release Date": "Fri, 19 Dec 1997 00:00:01 GMT",
        "Title": "Titanic"
    },
    {
        "Actor ID": 2,
        "Movie ID": 9,
        "Release Date": "Fri, 03 Oct 1989 00:01:00 GMT",
        "Title": "Top Gun
    },
    {
        "Actor ID": 19,
        "Movie ID": 10,
        "Release Date": "Fri, 18 Sep 1998 00:01:00 GMT",
        "Title": "Rush Hour"
    },
    {
        "Actor ID": 20,
        "Movie ID": 11,
        "Release Date": "Wed, 14 Jul 2010 00:00:01 GMT",
        "Title": "Ip Man"
    },
    {
        "Actor ID": 1,
        "Movie ID": 12,
        "Release Date": "Fri, 07 Dec 2001 01:00:00 GMT",
        "Title": "Ocean Eleven"
    },
    {
        "Actor ID": 6,
        "Movie ID": 13,
        "Release Date": "Fri, 15 Dec 2006 01:00:00 GMT",
        "Title": "The Pursuit of Happyness"
    },
    {
        "Actor ID": 12,
        "Movie ID": 14,
        "Release Date": "Wed, 06 Jul 1994 00:01:00 GMT",
        "Title": "Forrest Gump"
    },
    {
        "Actor ID": 14,
        "Movie ID": 15,
        "Release Date": "Fri, 09 Mar 2007 00:01:00 GMT",
        "Title": "300"
    }
    ],
    "success": true
}
```
#### GET /movie/{movie_id}
- Fetch details of provided movie_id from database
##### Input:
```
GET http://127.0.0.1:5000/movie/1
```
##### Output:
```
{
  "movie": {
    "Actor ID": 11,
    "Movie ID": 1,
    "Release Date": "Mon, 14 Jul 2008 01:01:00 GMT",
    "Title": "The Dark Kngiht"
  },
  "success": true
}
```


#### PATCH /movie/{movie_id}
- Update information of a movie. This endpoint takes title, or release_date, or actor_id in order to update the 
information of a movie. 
- Returns: multiple key/value pairs object with the following content: 
    * success: True or False 
    * movie: details of updated movie_id: movie id, release date, title, and actor id
##### Input:
```
curl http://127.0.0.1:5000/movie/1 -X PATCH 
{
  "release_date": "Fri, 11 Jun 1999 01:01:00 GMT",
  "title": "The Matrix",
  "actor_id": 3
}
```
##### Output:   
```
{
  "movie": {
    "Actor ID": 3,
    "Movie ID": 1,
    "Release Date": "Fri, 11 Jun 1999 01:01:00 GMT",
    "Title": "The Matrix"
  },
  "success": true
}
```

#### POST /movie
- Creates a new movie with the title, release date, and actor id  
- If title, or release date, or actor id field are left as blank, then return 422 
- Returns the id of the movie, new movie details, and success (true or false) value
##### Input:
```
curl http://127.0.0.1:5000/movie -X POST -H "Content-Type: application/json" -d   
{
  "release_date": "Mon, 18 Nov 2020 01:01:00 GMT",
  "title": "The Matrix 10",
  "actor_id": 10
}
```
##### Output:
```
{
  "movie": 25,
  "new movie": {
    "Actor ID": 10,
    "Movie ID": 25,
    "Release Date": "Mon, 18 Nov 2020 01:01:00 GMT",
    "Title": "The Matrix 10"
  },
  "success": true
}
```

#### DELETE /movie/{movie_id}
- Deleting a movie with provided movie_id if it exists. 
- Returns the id of the deleted movie, message, success value (true/false)
- Sample: http://127.0.0.1:5000/movie/11
##### Input:
```
curl -X DELETE http://127.0.0.1:5000/movie/5
```
##### Output:
```
{
  "deleted": 5,
  "message": "Movie has been deleted",
  "success": true
}
```
#### GET /actors
- Fetches all actors from the database
##### Input
```
curl http://127.0.0.1:5000/actors
```

##### Output
```
{
  "actors": [
    {
        "Actor ID": 1,
        "Age": 65,
        "Gender": "male",
        "Name": "Denzel Washington"
    },
    {
        "Actor ID": 2,
        "Age": 58,
        "Gender": "male",
        "Name": "Tom Cruise"
    },
    {
        "Actor ID": 3,
        "Age": 45,
        "Gender": "male",
        "Name": "Leonardo DiCaprio"
    },
    {
        "Actor ID": 4,
        "Age": 71,
        "Gender": "male",
        "Name": "Samule L Jackson"
    },
    {
        "Actor ID": 5,
        "Age": 83,
        "Gender": "male",
        "Name": "Morgan Freeman"
    },
    {
        "Actor ID": 6,
        "Age": 51,
        "Gender": "male",
        "Name": "Will Smith"
    },
    {
        "Actor ID": 7,
        "Age": 49,
        "Gender": "male",
        "Name": "Matt Damon"
    },
    {
        "Actor ID": 8,
        "Age": 56,
        "Gender": "male",
        "Name": "Brad Pitt"
    },
    {
        "Actor ID": 9,
        "Age": 48,
        "Gender": "male",
        "Name": "Dwayne Johnson"
    },
    {
        "Actor ID": 10,
        "Age": 59,
        "Gender": "male",
        "Name": "George Clooney"
    },
    {
        "Actor ID": 11,
        "Agev: 65,
        "Gender": "male",
        "Name": "Bruce Willis"
    },
    {
        "Actor ID": 12,
        "Age": 49,
        "Gender": "male",
        "Name": "Mark Wahlberg"
    },
    {
        "Actor ID": 13,
        "Age": 43,
        "Gender": "male",
        "Name": "Ryan Reynolds"
    },
    {
        "Actor ID": 14,
        "Age": 68,
        "Gender": "male",
        "Name": "Liam Neeson"
    },
    {
        "Actor ID: 15,
        "Age": 55,
        "Gender": "male",
        "Name": "Robert Downey Jr."
    },
    {
        "Actor ID": 16,
        "Age": 53,
        "Gender": "male",
        "Name": "Adam Sandler"
    },
    {
        "Actor ID": 17,
        "Age": 53,
        "Gender": "male",
        "Name": "Vin Diesel"
    },
    {
        "Actor ID": 18,
        "Age": 53,
        "Gender": "male",
        "Name": "Jason Statham"
    },
    {
        "Actor ID": 19,
        "Age": 66,
        "Gender": "male",
        "Name": "Jackie Chan"
    },
    {
        "Actor ID": 20,
        "Age": 57,
        "Gender": "male",
        "Name": "Donnie Yen"
    }
    ],
  success: true
}
```

#### GET /actor/{actor_id}
- This endpoint retrieves details of an actor with provided actor id 
##### Input: 
```
curl 127.0.0.1:5000/actors/1/
```
##### Output
```
{
  "actor": {
    "Actor ID": 1,
    "Age": 65,
    "Gender": "male",
    "Name": "Denzel Washington"
  },
  "success": true
}
```

#### PATCH /actor/{actor_id}
- This endpoint should take name, or age, or gender as input, and update according field with updated value
- Returns: success value (true/false), actor details: actor id, age, gender, name
##### Input: 
```
curl http://127.0.0.1:5000/actor/10 -X PATCH 
{
  "name": "Michael Fassbender",
  "age": 39,
  "gender": "male"
}
```
##### Output
```
{
  "actor": {
    "Actor ID": 22,
    "Age": 39,
    "Gender": "male",
    "Name": "Michael Fassbender"
  },
  "success": true
}
```

#### POST /actor
- This endpoint should take name, gender, and age for input 
- Returns: multiple key/value pairs object with the following content: 
    * movie: movie id
    * success: True or False 
    * new actor: details of new actor: actor id, age, gender, name 
##### Input: 
```
curl http://127.0.0.1:5000/actor -X POST 
{
  "name": "James Franco",
  "gender": "male",
  "age": 38
}
```
##### Output
```
{
  "movie": 24,
  "new actor": {
    "Actor ID": 24,
    "Age": 38,
    "Gender": "male",
    "Name": "James Franco"
  },
  "success": true
}
```
#### DELETE /actor/{actor_id}
- Deleting an actor with provided actor_id from the database 
- Returns the id of the deleted actor, message, success value (true/false)

##### Input:
```
curl -X DELETE http://127.0.0.1:5000/actor/1
```
##### Output:
```
{
  "deleted": 1,
  "message": "Actor has been deleted",
  "success": true
}
```

### Error Handling
```
Errors are returned as JSON objects in the following format:
{   
    "success": False, 
    "error": 422, 
    "message": "Unprocessable"
}
```
The API will return five error types when requests fail: 
- 400: Bad Request
- 404: Resource Not Found
- 405: Method Not Allowed
- 422: Not Processable
- 500: Internal Server Error