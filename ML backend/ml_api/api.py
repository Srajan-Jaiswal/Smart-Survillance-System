from firebase import firebase

def firebase_database(report):
#     print(report)
    con = firebase.FirebaseApplication('https://hackathon-ff4c0-default-rtdb.firebaseio.com/')        
    result = con.post('/hackathon-ff4c0-default-rtdb/realdata', report)