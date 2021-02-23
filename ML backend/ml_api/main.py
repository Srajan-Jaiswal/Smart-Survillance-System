from keras.models import load_model
import cv2
import numpy as np 
import argparse
from PIL import Image
import imutils
import random
from api import firebase_database
import json




jval = json.load(open('request.json', 'r'))


def env_check(anamoly_count, idx):
    if idx == -1:
        return
    data = {
        'Location': jval['request'][idx]['area_name'],
        'Crowd density': jval['request'][idx]['crowd_density'],
        'Traffic Density': jval['request'][idx]['traffic_density'],
        'Anomalies detected': anamoly_count,
        'Anomaly rise': '{} % increase after 10 PM'.format(jval['request'][idx]['peak'])
    }
    # firebase_database(data)
    print(data)
    
def mean_squared_loss(x1,x2):
    difference = x1-x2
    a,b,c,d,e = difference.shape
    n_samples = a*b*c*d*e
    sq_difference = difference**2
    Sum = sq_difference.sum()
    distance = np.sqrt(Sum)
    mean_distance = distance/n_samples

    return mean_distance

def smart_cam(sample_video, idx):
    anamoly_count = 0
    threshold = 0.00057
    model = load_model("Xmodel.h5")

    cap = cv2.VideoCapture(sample_video)
    print("SMART SURVAILLANCE: {}".format(cap.isOpened()))

    while cap.isOpened():
        imagedump = []
        _, frame = cap.read()

        if frame.any()== None:
            break

        for i in range(10):
            _, frame = cap.read()
            image = imutils.resize(frame,width=700,height=600)
            people_count = 11
            frame = cv2.resize(frame, (227,227), interpolation = cv2.INTER_AREA)
            gray = 0.2989*frame[:,:,0]+0.5870*frame[:,:,1]+0.1140*frame[:,:,2]
            gray = (gray-gray.mean())/gray.std()
            gray = np.clip(gray,0,1)
            imagedump.append(gray)

        imagedump = np.array(imagedump)

        imagedump.resize(227,227,10)
        imagedump = np.expand_dims(imagedump,axis=0)
        imagedump = np.expand_dims(imagedump,axis=4)

        output = model.predict(imagedump)

        loss = mean_squared_loss(imagedump,output)

        
        if cv2.waitKey(10) & 0xFF==ord('q'):
                env_check(anamoly_count, idx)
                break
        

        if loss > threshold:
            if loss < 0.00060 and loss > 0.00056:
                anamoly_count += 1
                cv2.putText(image,"Abnormal Event",(100,80),cv2.FONT_HERSHEY_SIMPLEX,2,(0,0,255),4)
                cv2.putText(image,"Severity: Moderate",(100,120),cv2.FONT_HERSHEY_SIMPLEX,1,(255,0,0),2)
            elif loss > 0.00065:
                anamoly_count += 1
                cv2.putText(image,"Abnormal Event",(100,80),cv2.FONT_HERSHEY_SIMPLEX,2,(0,0,255),4)
                cv2.putText(image,"Severity: High",(100,120),cv2.FONT_HERSHEY_SIMPLEX,1,(0,0,255),2)

        cv2.imshow("video",image)
        
    
    cap.release()
    cv2.destroyAllWindows()
    


smart_cam(jval['sample']['ref_video'], -1)
smart_cam(jval['sample']['sample_anomaly_1'], 0)
smart_cam(jval['sample']['sample_anomaly_2'], 1)
smart_cam(jval['sample']['area_analysis'], 2)
