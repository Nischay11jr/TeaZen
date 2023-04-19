from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, SelectField, DecimalField
from wtforms.validators import InputRequired, EqualTo

class RegistrationForm(FlaskForm):
    user_id = StringField("User id: ", validators = [InputRequired()])
    password = PasswordField("Password: ", validators = [InputRequired()])
    password2 = PasswordField("Confirm Password: ", validators = [InputRequired(), EqualTo("password")])
    submit = SubmitField("Submit")

class LoginForm(FlaskForm):
    user_id = StringField("User id: ", validators = [InputRequired()])
    password = PasswordField("Password: ", validators = [InputRequired()])
    submit = SubmitField("Submit")

class QuantityForm(FlaskForm):
    quantity = SelectField("Select Quantity: ",validators=[InputRequired()], choices=["1", "2", "3", "4", "5"], default = "1")

    
class ReviewForm(FlaskForm):
    review = StringField("Enter your review: ")
    stars = SelectField("How many stars would you give based on your prior experience? ", choices=["1", "2", "3", "4", "5"], default = "1")
    submit = SubmitField("Submit")