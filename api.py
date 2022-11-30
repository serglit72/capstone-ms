### Version 0.0.2

from flask import Flask,render_template,request
from flask import json
# import logging
import requests
 

app = Flask(__name__)

@app.route('/speedtest')
def speedtest():
    return render_template('speedtest.html')


@app.route('/status')
def status():

    return render_template('status.html')

# 
@app.route('/myip')
def myip(ip_address=None):
    test = requests.get("http://ip-api.com/json/"+ip_address,timeout=3)
    my_ip = test.json()
    response = app.response_class(
            response=json.dumps({ "IP address": my_ip}),
            status=200,
            mimetype='application/json'
    )
    
    return response

@app.route("/",methods=['GET','POST'])
def hello():
    return render_template("index.html", form=request.form)
    
    # return render_template('index.html', my_ip=my_ip["query"],)


if __name__ == "__main__":
    ## stream logs to a file
    # logging.basicConfig(filename='app.log',level=logging.DEBUG)
    
    app.run(host='0.0.0.0', port=5050,debug=True)
