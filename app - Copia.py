#!/usr/bin/python3
import os
from flask import Flask, render_template, request, redirect
# from flask_mail import Mail, Message
from form_contact import ContactForm, csrf

# from nome_do_arquivo_SemExtensão import Nome_da_classe_nesse_arquivo ou variavel 
# from csv_file import mapadecaixa

# import csv_file as mapadecaixa
# mapadecaixa

# mapadecaixa = read_csv()
# mail = Mail()

app = Flask(__name__)

SECRET_KEY = os.urandom(32)
app.config['SECRET_KEY'] = SECRET_KEY
csrf.init_app(app)

# app.config['MAIL_SERVER']='smtp.gmail.com'
# app.config['MAIL_PORT'] = 465
# app.config['MAIL_USERNAME'] = 'yourId@gmail.com'
# app.config['MAIL_PASSWORD'] = '*****'
# app.config['MAIL_USE_TLS'] = False
# app.config['MAIL_USE_SSL'] = True

# mail.init_app(app)

@app.route('/index')
def index():
    return render_template('views/home/index.html')

@app.route('/', methods=['POST', 'GET'])
def contact():
    form = ContactForm()
    if form.validate_on_submit():     
              # request.files
        print('-------------------------')
        print(request.form['file'])
                # print(request.files)  
        # print(request.form['email'])
        # print(request.form['subject'])
        # print(request.form['message'])       
        print('-------------------------')
        # send_message(request.form)
        # return redirect('/contact')    

    return render_template('views/contacts/contact.html', form=form)

# @app.route('/success')
# def success():
#     return render_template('views/contacts/contact.html')

# def send_message(message):
#     print(message.get('name'))

#     msg = Message(message.get('subject'), sender = message.get('email'),
#             recipients = ['id1@gmail.com'],
#             body= message.get('message')
#     )  
#     mail.send(msg)

if __name__ == "__main__":
    app.run(
        debug=True, 
        use_reloader=True, 
        port=8000
        )
        
    app.config.update(
        SESSION_COOKIE_SECURE = False,
        SESSION_COOKIE_HTTPONLY = True,
        SESSION_COOKIE_SAMESITE = 'Lax',
        SESSION_PERMANENT = True
    )
    # app.config["SESSION_PERMANENT"] = True
    # app.run()