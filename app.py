from flask import Flask
from flask import json
import logging
import result from results
import os
from datatime import datatime


app = Flask(__name__)

files = os.listdir(/data/redis/)

#speedee_test_result1 = "/export/speed_test_11_16_2022_22:05:51.json"
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


def results(files):
    
    for each in files:
      timestamp = each[
      converted = datetime.datetime.fromtimestamp(timestamp)
  # Return just the date portion 
  # Hint: how many characters are in “yyyy-mm-dd”?
  
  return ("{}".format(converted.date()))
      if current > each[ 

if __name__ == "__main__":
    ## stream logs to a file
    logging.basicConfig(filename='app.log',level=logging.DEBUG)
    
    app.run(host='0.0.0.0', port=5050)
