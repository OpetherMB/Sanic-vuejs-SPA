import sqlalchemy
from  sqlalchemy.ext.declarative import declarative_base
import config
from sqlalchemy.inspection import inspect



# helper class
class Serializer(object):

    def serialize(self):
        return {c: getattr(self, c) for c in inspect(self).attrs.keys()}

    @staticmethod
    def serialize_list(l):
        return [m.serialize() for m in l]



 # Define and create the table
Base = declarative_base()


# todo  move this to models 

#Creating model table for our CRUD database
class student(Base , Serializer):
    
    __tablename__ = 'students'

    id = sqlalchemy.Column(sqlalchemy.Integer, primary_key=True)
    prenom = sqlalchemy.Column(sqlalchemy.String(length=50))
    nom = sqlalchemy.Column(sqlalchemy.String(length=50))
    birthDate = sqlalchemy.Column(sqlalchemy.String(length=10))
    mark_1 = sqlalchemy.Column(sqlalchemy.Integer)
    mark_2 = sqlalchemy.Column(sqlalchemy.Integer)
    mark_3 = sqlalchemy.Column(sqlalchemy.Integer)


    def serialize(self):
        d = Serializer.serialize(self)
        return d



# Define the MySQL engine using MySQL Connector/Python

# TODO change this to private variable 
engine = sqlalchemy.create_engine(
                             'mysql+mysqlconnector://{0}:{1}@{2}:{3}/{4}'.format(config.DATABASE['user'], 
                                                                                config.DATABASE['password'],
                                                                                config.DATABASE['host'],
                                                                                config.DATABASE['port'],
                                                                                config.DATABASE['database']),
                             echo=True
                                 )
 
Base.metadata.create_all(engine)
