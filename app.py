### Version 0.0.2

from flask import Flask,render_template,request
from flask import json
import json
import logging
import requests
 

app = Flask(__name__)

@app.route('/speedtest')
def speedtest():

    return render_template('speedtest.html')


@app.route('/status')
def status():

    return render_template('status.html')



@app.route('/myip')
def myip(ip_address=None):
    test = requests.get("http://ip-api.com/json/"+ip_address)
    my_ip = test.json()
    response = app.response_class(
            response=json.dumps({ "IP address": my_ip}),
            status=200,
            mimetype='application/json'
    )
    
    app.logger.info('Metrics request successfull')
  
    return response

@app.route("/",methods=['GET','POST'])
def hello():
    app.logger.info('Main request successfull')
    return render_template("index.html", form=request.form)
    
    # return render_template('index.html', my_ip=my_ip["query"],)

from api import app # Flask instance of the API

def test_index_route():
    response = app.test_client().get('/')

    assert response.status_code == 200
    assert response.data.decode('utf-8') == 'Testing, Flask!'

if __name__ == "__main__":
    ## stream logs to a file
    logging.basicConfig(filename='app.log',level=logging.DEBUG)
    
    app.run(host='0.0.0.0', port=5050,debug=True)
