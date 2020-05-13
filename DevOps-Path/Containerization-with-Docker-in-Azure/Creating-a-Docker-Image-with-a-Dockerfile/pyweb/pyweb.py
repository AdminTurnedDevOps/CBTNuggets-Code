from flask import Flask, render_template, request, jsonify

pyweb = Flask(__name__)

@pyweb.route("/")
def home():
    return 'Hello, CBT Friends!'

pyweb.run(host ='0.0.0.0', port=5000)
