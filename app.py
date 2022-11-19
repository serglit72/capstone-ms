from flask import Flask
from flask import json
import logging
import requests
import subprocess

### Version 0.0.2

app = Flask(__name__)


speedtest = subprocess.run(["bash","-c", "curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"],stdout=subprocess.PIPE)
txt = speedtest.stdout.decode("utf-8")
   

@app.route('/speed')
def speed():
    response = app.response_class(
            response=json.dumps({"Internet speed test":txt}),
            status=200,
            mimetype='application/json'
    )

    app.logger.info('Speedtest running...')
    return response


@app.route('/status')
def healthcheck():
    response = app.response_class(
            response=json.dumps({"result":"OK - healthy"}),
            status=200,
            mimetype='application/json'
    )

    app.logger.info('Status request successfull')
    return response

test = requests.get("http://ip-api.com/json")
my_ip = test.json()
my_ip = my_ip["query"]



@app.route('/myip')
def myip():
    # print(speedee_test_result)
    response = app.response_class(
            response=json.dumps({ "IP address": my_ip}),
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
