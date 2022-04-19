#!/usr/bin/python3
import os
from flask import Flask, render_template, request, redirect
from form_contact import ContactForm, csrf

# from app3 import filepath
# filepath
# import app3
# app3.filepath

app = Flask(__name__)

SECRET_KEY = os.urandom(32)
app.config['SECRET_KEY'] = SECRET_KEY
# app.config["SESSION_PERMANENT"] = False
app.config["SESSION_COOKIE_SECURE"] = False
csrf.init_app(app)

# @app.route('/index')
# def index():
#     return render_template('views/home/index.html')

@app.route('/', methods=['POST', 'GET'])
def contact():
    form = ContactForm()
    if form.validate_on_submit(): 
        print('-------------------------')
        print(request.form['file'])    
        print('-------------------------')
        if form.validate()== True:
            return "CSV Editado com Sucesso!"   
        return render_template('views/contacts/contact.html', form = form)
    return render_template('views/contacts/contact.html', form = form)

if __name__ == "__main__":
    # app.run(debug=True, port=8000)
    app.debug = True
    app.config.update(
        SESSION_COOKIE_SECURE=False,
        SESSION_COOKIE_HTTPONLY=True,
        SESSION_COOKIE_SAMESITE='Lax',
    )
    app.config["SESSION_PERMANENT"] = True
    app.run()