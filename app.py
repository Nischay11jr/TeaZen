from flask import Flask, render_template, url_for, session, redirect, g, request, make_response
from werkzeug.security import generate_password_hash, check_password_hash
from database import get_db, close_db
from flask_session import Session
from forms import RegistrationForm, LoginForm, QuantityForm, ReviewForm
from functools import wraps
import sqlite3, os

app = Flask(__name__)
app.config["SECRET_KEY"] = "this-is-my-secret-key"
app.teardown_appcontext(close_db)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)


@app.before_request
def logged_in_user():
    g.user = session.get("user_id", None)

def login_required(view):
    @wraps(view)
    def wrapped_view(*args, **kwargs):
        if g.user is None:
            return redirect(url_for("login", next=request.url))
        return view(*args, **kwargs)
    return wrapped_view

def save_image(image):
    if image:
        filename = image.filename
        image_path = os.path.join(app.root_path,'static', 'image', filename)
        image.save(image_path)
        return filename


# HOME Page
@app.route("/")
def home():
    return render_template("home.html")


# TEAS PAGE - CONTAINS ALL TEAS
@app.route("/teas")
def teas():
    db = get_db()
    teas = db.execute("""SELECT * FROM teas;""").fetchall()

    return render_template("teas.html", teas = teas)


@app.route("/tea/<int:tea_id>")
def tea(tea_id):
    form = QuantityForm()
    db = get_db()
    tea = db.execute("""SELECT * FROM teas WHERE tea_id=?;""", (tea_id,)).fetchone()

    if form.validate_on_submit():
        quantity = form.quantity.data
    return render_template("tea.html",form = form, tea=tea)


# ABOUT US PAGE
@app.route("/about")
def about():
    return render_template("about.html")


# JOURNAL PAGE
@app.route("/journal")
def journal():
    return render_template("journal.html")


# REVIEW PAGE
@app.route("/review", methods =["GET", "POST"])
def review():
    form = ReviewForm() 
    
    if g.user is None:
        return redirect(url_for("login"))
    else:
        if form.validate_on_submit():
            review = form.review.data
            stars = form.stars.data

            response = make_response(render_template("review_feedback.html",
                                                  message = "Your review has been submitted. Thanks for your review!", form = form ))
            response.set_cookie("reviewed", "yes", max_age= 3*365*24*60*60)
            return response
        return render_template("reviews.html", form = form)

    

# REGISTRATION PAGE
@app.route("/register", methods = ["GET", "POST"])
def register():
    form = RegistrationForm()

    if form.validate_on_submit():
        user_id = form.user_id.data
        password = form.password.data
        password2 = form.password2.data

        db = get_db()

        clashing_user = db.execute("""SELECT * FROM users WHERE user_id=?;""", (user_id,)).fetchone()

        if clashing_user is not None:
            form.user_id.errors.append("Sorry, but user_id is already in use!")
        elif password != password2:
            form.password2.errors.append("The password doesn't match, try again")
        else:
            db.execute("""INSERT INTO users (user_id, password) VALUES (?, ?);""", (user_id, generate_password_hash(password)))
            db.commit()
        return redirect(url_for("login"))
    return render_template("register.html", form = form)


# LOGIN PAGE
@app.route("/login", methods = ["GET", "POST"])
def login():
    form = LoginForm()

    if form.validate_on_submit():
        user_id = form.user_id.data
        password = form.password.data

        db = get_db()

        clashing_user = db.execute("""SELECT * FROM users WHERE user_id = ?;""", (user_id,)).fetchone()

        if clashing_user is None:
            form.user_id.errors.append("Sorry, this user id is not recognizable!")
        elif not check_password_hash(clashing_user["password"], password):
            form.password.errors.append("Incorrect Password!")
        else:
            session.clear()
            session["user_id"] = user_id
            next_page = request.args.get("next")
            if not next_page:
                next_page = url_for("home")
            return redirect(next_page)
    return render_template("login.html", form = form)


# LOGOUT PAGE
@app.route("/logout")
@login_required
def logout():
    session.clear()
    return redirect(url_for("home"))


# CART PAGE
@app.route("/cart")
@login_required
def cart():
    form = QuantityForm()
    total = " "
    if request.cookies.get("added") == "yes":
        return render_template("cart.html", cart = session["cart"], names = names, form = form)
    
    if "cart" not in session:
        session["cart"] = {}
    names = {}

    db = get_db()
    for tea_id in session["cart"]:
        tea = db.execute("""SELECT * FROM teas WHERE tea_id=?;""", (tea_id,)).fetchone()

        name = tea["name"]
        names[tea_id] = name
        
    if form.validate_on_submit():
        quantity = form.quantity.data
        total = total 

        response = make_response(render_template("cart.html", cart = session["cart"], names = names, form = form, total = total))
        response.set_cookie("added", "yes", max_age= 3*365*24*60*60)
        return response

    return render_template("cart.html", cart = session["cart"], names = names, form = form, total = total)


# ADDING TO CART 
@app.route("/add_to_cart/<int:tea_id>")
@login_required
def add_to_cart(tea_id):
    if "cart" not in session:
        session["cart"] = {}
    if tea_id not in session["cart"]:
        session["cart"][tea_id] = 1
    else:
        session["cart"][tea_id] = session["cart"][tea_id] + 1
    
    return redirect(url_for("cart"))



