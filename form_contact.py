from flask_wtf import FlaskForm, CSRFProtect
from wtforms import StringField, TextAreaField, SubmitField, FileField
from wtforms.validators import DataRequired, Email

csrf = CSRFProtect()

class ContactForm(FlaskForm):

    file = FileField(validators=[DataRequired('Selecione o Arquivo CSV')])
    submit = SubmitField("EditarCSV")

