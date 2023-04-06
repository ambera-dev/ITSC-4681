import os, platform
from .static.commandTest import *
from flask import Flask, render_template, request, redirect, url_for, session

#inital configuration
app = Flask(__name__)
#maybe put this in a config file?
app.config['SECRET_KEY'] = 'NAWI'

@app.route('/')
#Basic layout for each route
def index():
    return render_template("index.html", platform=platform.system())

@app.route('/', methods=['POST'])
def response():
    return render_template("index.html")


if __name__ == "__main__":
    app.run(host=os.getenv('IP', '127.0.0.1'),port=int(os.getenv('PORT', 5000)),debug=True)

#this will be hosted on http://localhost:5000
#debug is true so we get dynamic updates as we change code.