import os
import json
from sqlalchemy import Column, String, Integer, ForeignKey
from sqlalchemy.orm import relationship, backref
from flask_sqlalchemy import SQLAlchemy

# db_name = "capstone"
# db_user = 'postgres'
# db_host = 'localhost'
# db_port = '5432'
# database_path = "postgres://{}@{}:{}/{}".format(
#     db_user,
#     db_host,
#     db_port,
#     db_name)
database_path = 'postgres://odrxvqaadakxdk:0182a2a9f8352cb034049499b0ea146a05f61a91608a8536c0a115e015852294@ec2-34-225-162-157.compute-1.amazonaws.com:5432/d4bvrc1k8j4jck'
db = SQLAlchemy()


def setup_db(app, db_path=database_path):
    app.config["SQLALCHEMY_DATABASE_URI"] = db_path
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
    db.app = app
    db.init_app(app)
    db.create_all()


def db_drop_and_create_all():
    db.drop_all()
    db.create_all()


class Movie(db.Model):
    __tablename__ = 'movies'
    id = Column(Integer, primary_key=True)
    title = Column(String(80), nullable=False)
    release_date = Column(db.Date)
    actor_id = Column(Integer, ForeignKey('actors.id'))
    actors = relationship('Actor', backref=backref('movies', lazy=True))

    def __init__(self, title, release_date, actor_id):
        self.title = title
        self.release_date = release_date
        self.actor_id = actor_id

    def insert(self):
        db.session.add(self)
        db.session.commit()

    def update(self):
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def format(self):
        return {
            'Title': self.title,
            'Release Date': self.release_date,
            'Movie ID': self.id,
            'Actor ID': self.actor_id,
        }


class Actor(db.Model):
    __tablename__ = 'actors'
    id = Column(Integer, primary_key=True)
    name = Column(String(80), nullable=False)
    gender = Column(String(8))
    age = Column(Integer)

    def __init__(self, name, gender, age):
        self.name = name
        self.gender = gender
        self.age = age

    def insert(self):
        db.session.add(self)
        db.session.commit()

    def update(self):
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def format(self):
        return {
            'Actor ID': self.id,
            'Name': self.name,
            'Gender': self.gender,
            'Age': self.age
        }
