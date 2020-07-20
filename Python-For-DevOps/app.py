from flask import Flask

pythonapp = Flask(__name__)

@pythonapp.route('/')
def hello_python_learners():
    return 'Hello Python Learners'

@pythonapp.route('/learners')
def learners():
    return 'This is the learner page'

pythonapp.run(host='127.0.0.1', port=5000)