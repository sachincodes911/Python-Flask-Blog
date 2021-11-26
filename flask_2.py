
from flask import Flask,render_template,request,flash,redirect,get_flashed_messages,session
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
import json
import math

# for json
with open("config.json","r") as c:
    params=json.load(c)["params"]

# creating object
app=Flask(__name__)

#creating a secret key for session to work
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

# for mailing
app.config.update(
    MAIL_SERVER="smtp.gmail.com",
    MAIL_PORT="465",
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params["mail_id"],
    MAIL_PASSWORD=params["mail_pass"]
)
mail=Mail(app)


#For connecting to the database.
if params["local_server"]:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"]
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["prod_uri"]

db = SQLAlchemy(app)

#uploading the contact form to the database.defining database schema
class Contacts(db.Model):
    '''sno,name,email,phone_num,msg,date'''
    sno= db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)


#fetching the content from the database.defining database schema
class Posts(db.Model):
    '''sno,name,email,phone_num,msg,date'''
    sno= db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(25), nullable=False)
    img=db.Column(db.String(100), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)





@app.route("/")
def home():
    # Pagination
    posts = Posts.query.all()# query function is used to fetch data from the database
    last=math.ceil(len(posts)/int(params["no_of_post"]))

    # [0: params["no_of_post"]]
    page=request.args.get("page")
    if not (str(page).isnumeric()) or page==0:
        page=1
    # posts=posts[0:2]
    posts = posts[(int(page)-1)*(int(params["no_of_post"])):(int(page)-1)*(int(params["no_of_post"]))+int(params["no_of_post"])]
    print(posts)
    print(page)


    page=int(page)

    # Main logic
    if page==1:
        prev="#"
        next="?page="+str(page+1)   # “?” in URL acts as separator, it indicates end of URL resource path and start of query parameters ,it is used to send some paramater to the server
    elif page==last:
        prev="?page="+str(page-1)
        next ="#"
    else:
        next = "?page=" + str(page + 1)
        prev = "?page=" + str(page - 1)




    for post in posts:#this loop is not useful,just for testing
        print(post.slug)
    return render_template("index.html",params=params,posts=posts,prev=prev,next=next)


@app.route("/about")
def about():
    return render_template("about.html",params=params)


@app.route("/contact",methods = ['GET','POST'])
def contact():
    if request.method=="POST":
        '''ADD ENTRY TO THE DATABASE'''
        name=request.form.get("name")
        email=request.form.get("email")
        phone=request.form.get("phone")
        message=request.form.get("message")
        entry=Contacts(name=name,phone_num=phone,email=email,msg=message,date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        '''send mail '''
        mail.send_message("New message from blog",
                          sender=email,
                          recipients=[params["recp_mail_id"]],
                          body=message + "\n" + name+'\n'+phone)
        print(entry)
        print(name)



    return render_template("contact.html",params=params)


@app.route("/post/<string:post_slug>",methods=["GET"])
def post_route(post_slug):
    post=Posts.query.filter_by(slug=post_slug).first()

    image=str(post.img)

    return render_template("post.html",params=params,post=post,image=image)

@app.route("/dashboard",methods=['GET','POST'])
def dash():
    posts=Posts.query.all()
    if "user" in session and session["user"]==params['admin_id']:
        alt = 'logged in'
        return render_template("welcome_admin.html", alt=alt,posts=posts)


    if request.method=="POST":
        id=request.form.get("id")
        password=request.form.get("password")
        if id==params['admin_id'] and password==params['admin_pass']:
            session['user']=id
            alt='logged in'
            return render_template("welcome_admin.html", alt= alt,posts=posts)
        else:
             alt='invalid credentials'
        return render_template("login.html",alt=alt)
    else:
        return render_template("login.html")


@app.route("/login")
def login():
    session.clear()
    return render_template("login.html")

@app.route("/submit",methods=['GET','POST'])
def submit():
    if "user" in session and session["user"]==params['admin_id']:
        posts = Posts.query.all()
        '''ADD ENTRY TO THE DATABASE'''
        if request.method=="POST":
            title = request.form.get("title")
            slug = request.form.get("slug")
            image = request.form.get("image")
            content = request.form.get("content")
            entry=Posts(title=title,slug=slug,img=image,content=content,date=datetime.now())
            db.session.add(entry)
            db.session.commit()
            return redirect("/dashboard")
        else:
            return "invalid url"
    else:
        return "<html><head></head><body><script type='text/javascript'>alert('Come through the login page')</script></body></html>"



@app.route("/edit/<string:post_sno>",methods=["GET","POST"])
def edit(post_sno):
    post=Posts.query.filter_by(sno=post_sno).first()
    if "user" in session and session["user"] == params['admin_id']:
        if request.method=="POST":
            post.title=request.form.get("title")
            post.slug=request.form.get("slug")
            post.img=request.form.get("image")
            post.content=request.form.get("content")
            db.session.commit()
            return redirect("/dashboard")
        else:
            return render_template("edit.html", params=params, post=post)
    else:
        return "<html><head></head><body><script type='text/javascript'>alert('Come through the login page')</script></body></html>"


@app.route("/delete/<string:sno>",methods=["GET","POST"])
def delete(sno):
    post=Posts.query.filter_by(sno=sno).first()
    db.session.delete(post)
    db.session.commit()
    return redirect("/dashboard")


app.run(debug=True)