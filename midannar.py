from bottle import *
import os, json, urllib.request, datetime

with urllib.request.urlopen("http://apis.is/petrol") as f:
    data = json.loads(f.read().decode())
import datetime
date = datetime.datetime.strptime(data["timestampPriceCheck"], '%Y-%m-%dT%H:%M:%S.%f')
date = date.strftime('%H:%M | %d/%m/%Y')

fyrirtaeki = []
for x in data["results"]:
	if x["company"] not in fyrirtaeki:
		fyrirtaeki.append(x["company"])

odyrtBensin = data["results"][0]
for x in data["results"]:
    if x["bensin95"] < odyrtBensin["bensin95"]:
        odyrtBensin = x
odyrastaB = []
for x in data["results"]:
    if x["bensin95"] == odyrtBensin["bensin95"]:
        odyrastaB.append(x)

odyrtDiesel = data["results"][0]
for x in data["results"]:
    if x["diesel"] < odyrtDiesel["diesel"]:
        odyrtDiesel = x
odyrastaD = []
for x in data["results"]:
    if x["diesel"] == odyrtDiesel["diesel"]:
        odyrastaD.append(x)
@route('/')
def index():
    return template('v6/index',date=date,fyrirtaeki=fyrirtaeki,odyrastaB=odyrastaB,odyrastaD=odyrastaD)

@route('/fyrirtaeki/<stadsetning>')
def fyrirt(stadsetning):
    stodvar = []
    fannst = False
    for x in data["results"]:
        if x["company"].lower() == stadsetning.lower():
            stodvar.append(x)
            fannst = True
    if fannst == True:
        return template('v6/fyrirtaeki',date=date,stodvar=stodvar,odyrastaB=odyrastaB,odyrastaD=odyrastaD)
    else:
        return template('v6/villa',villa="Fyrirtæki ekki til",date=date,odyrastaB=odyrastaB,odyrastaD=odyrastaD)


@route('/stod/<stadsetning>')
def stod(stadsetning):
    stodFannst = False
    for x in data["results"]:
        if x["key"] == stadsetning:
            stod = x
            stodFannst = True
            break
    if stodFannst == True:
        return template('v6/stod',date=date,stod=stod,odyrastaB=odyrastaB,odyrastaD=odyrastaD)
    else:
        return template('v6/villa',villa="Bensínstöð ekki til",date=date,odyrastaB=odyrastaB,odyrastaD=odyrastaD)

@route('/css/<skjal>')
def server_static(skjal):
    return static_file(skjal, root='./v6/css')

@route('/myndir/<skjal>')
def server_static(skjal):
    return static_file(skjal, root='./v6/img')

@error(404)
def villa404(error):
    return template('v6/villa',villa="Villa 404",date=date,odyrastaB=odyrastaB,odyrastaD=odyrastaD)

@error(500)
def villa500(error):
    return template('v6/villa',villa="Villa 500",date=date,odyrastaB=odyrastaB,odyrastaD=odyrastaD)

run(host="0.0.0.0", port=os.environ.get('PORT'))
#run(host='localhost', port=80, debug=True, reloader=True)
