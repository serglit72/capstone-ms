from flask import Flask
from flask import json
import logging
import json
import os
from datetime import datetime


app = Flask(__name__)

# dir = "/Users/serg/Capstone/git-capstone/capstone-ms/data/redis"
dir = "data/redis"
files = os.listdir(dir)     


def results(files):
    res = {}
    for each in files:
        t_l = each[-24:-5].split("-")
        t_l0 = t_l[0].split("_") 
        t_h,t_m,t_s = t_l[1].split(":")
        timestamp  = datetime(int(t_l0[2]), int(t_l0[0]), int(t_l0[1]),int(t_h),int(t_m),int(t_s))
        # print(timestamp)
        with open(dir+"/"+each, 'r') as f:
            rd = f.read()
            # print(rd)
        res[str(timestamp)] = rd.lstrip("'")
    
    return res
        
speedee_test_result = results(files)

@app.route('/status')
def healthcheck():
    response = app.response_class(
            response=json.dumps({"result":"OK - healthy"}),
            status=200,
            mimetype='application/json'
    )

    app.logger.info('Status request successfull')
    return response

@app.route('/speedee')
def speedee():

    response = app.response_class(
            response=json.dumps(speedee_test_result),
            status=200,
            mimetype='application/json'
    )
    
    app.logger.info('Metrics request successfull')
    return response

@app.route("/")
def hello():
    app.logger.info('Main request successfull')
   
    return "Hello World!"



if __name__ == "__main__":
    ## stream logs to a file
    logging.basicConfig(filename='app.log',level=logging.DEBUG)
    
    app.run(host='0.0.0.0', port=5050)

   
