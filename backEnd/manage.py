from sanic import Sanic
from sanic import response
from sanic.response import redirect
import sqlalchemy
import json   
import config
from sanic_cors import CORS, cross_origin

CORS()

# locals
from models.student import student, engine , Base


# create the web app

app = Sanic(__name__)

CORS(app)


# TODO  add all fo the api to blueprints 
# app.blueprint(Blueprints.auth, url_prefix='app/blueprints/blueprint')

                        
 
Base.metadata.create_all(engine)
 
# Create a session
Session = sqlalchemy.orm.sessionmaker()
Session.configure(bind=engine)
session = Session()


# This is the index route where we are going to
# query on all our students

@app.route('/')
async def Index(req):
    our_user = session.query(student).order_by(student.nom).all()
        # Serializing json    
    json_object = json.dumps([student.serialize(m) for m in our_user] ,  separators=(',' , ':'))  
        
    return response.json(json_object )
 

#this route is for inserting data to mysql database via html bodys
@app.route('/insert', methods = ['POST'])
async def insert(request):
 
    if request.method == 'POST':
        data = request.json
 
        prenom = str(data['prenom'])
        nom = str(data['nom'])
        birthDate = str(data['birthDate'])
        mark_1  = str(data['mark_1'])
        mark_2 = str(data['mark_2'])
        mark_3 = str(data['mark_3'])

        student_ = student(
                            prenom = prenom, 
                            nom =  nom , 
                            birthDate = birthDate , 
                            mark_1 = mark_1, 
                            mark_2 = mark_2, 
                            mark_3 = mark_3

                            )

# check if student already exists 

        count  = session.query(student).filter(student.nom == student_.nom ).count()
        if count > 0:
            print ('user exists')
        else : 
            session.add(student_)
            session.commit()

        url = app.url_for('Index')
        return redirect(url)
 
 

# #this is our update route where we are going to update our employee
@app.route('/update/<id>', methods = ['GET', 'POST'])
async def update(request,id):
 
    if request.method == 'POST':
        
        student_ =  session.query(student).get(id)
            
        student_.prenom = request.json['prenom']
        student_.nom  = request.json['nom']
        student_.birthDate = request.json['birthDate']
        student_.mark_1  = request.json['mark_1']
        student_.mark_2 = request.json['mark_2']
        student_.mark_3 = request.json['mark_3']
        session.commit()
                
        url = app.url_for('Index')
        return redirect(url)
  
 
 
# #This route is for deleting our employee
@app.route('/delete/<id>', methods = [ 'POST'])
async def delete(request , id ):
    #    check if user exists 
        if session.query(student).filter(student.id == id).delete():

            session.commit() #take effect
            
        else : 
            print("####### user does not exist in database #########")
       
        url = app.url_for('Index')
        return redirect(url)


@app.route('/search/<NameID>', methods = ['GET'])
async def FindByName(request , NameID ):
    #    check if user exists 

        student_ = session.query(student).filter(student.nom == NameID)
        json_object = json.dumps([student.serialize(m) for m in student_] ,  separators=(',' , ':'))  
        # print("student found is //////",json_object)

        return response.json(json_object)
  

if __name__ == '__main__':

    app.go_fast(port=config.PORT, workers=config.WORKERS,
                debug=config.DEBUG)