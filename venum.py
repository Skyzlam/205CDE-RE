from flask import Flask, render_template, request, url_for, redirect, session
import pymysql

username = 0
userID = 0

app = Flask(__name__)

db = pymysql.connect("localhost", "root", "12345678", "venum")
cursor = db.cursor()

@app.route("/")
def main():
	return render_template("venum.html")

@app.route("/order")
def order():
    return render_template("venum_order.html")

@app.route("/done")
def done():
    return render_template("venum_done.html")

@app.route("/clothes")
def clothes():
	db = pymysql.connect("localhost", "root", "12345678", "venum")

	with db.cursor() as cursor:

		cursor.execute( """SELECT * from clothes """)
		clothes=(cursor.fetchall())
	db.close()
	return render_template("venum_clothes.html", clothes = clothes)

@app.route("/login", methods= ['POST', 'GET'])
def login():
	if username != 0:
		return redirect(url_for("profile"))
	else: 
		return render_template("venum_login.html")

@app.route("/log", methods = ['POST', 'GET'])
def log():
	if request.method == 'POST':
   
		login = request.form
		username = request.form["username"]
		password = request.form["password"]

		db = pymysql.connect("localhost", "root", "12345678", "venum")
		with db.cursor() as cursor:
			found=False
			a = """SELECT user_Password from userdata WHERE user_Name='""" + username+"""'"""
			cursor.execute(a)
			x=(cursor.fetchall())

			len_x =len(str(x))
			y= str(x)

			if password ==  y[3:len_x-5] and ((y[3:len_x-5])!= ""):
				cursor.execute("""SELECT user_ID from userdata WHERE user_Name='""" + username+"""'""")
				
				
				cusid_db=(cursor.fetchall()[0])
				str_cusid_db = str(cusid_db)
				len_cusid_db = len(str(cusid_db))
				cursor.execute("""SELECT user_ID from userdata WHERE user_Name='""" + username +"""'""")
				x=(cursor.fetchall())
				len_x =len(str(x))
				y= str(x)
				userID=y[2:len_x-4]
				found=True
				return redirect(url_for("profile"))
				global username
				global userID

			else:
				username = 0
				userID
				global username
				global userID
				return render_template("venum_error.html")
		db.close()
	return render_template("venum_profile.html")


@app.route('/profile',methods = ['POST', 'GET'])

def profile():

	db = pymysql.connect("localhost", "root", "12345678", "venum")
	with db.cursor() as cursor:
		cursor.execute( """SELECT * from userdata Where user_Name = '"""+username+"""'""")
		customerinfo=(cursor.fetchall())
	db.close()
	
	

	return render_template("venum_user.html",customerinfo = customerinfo)

@app.route("/logout", methods = ['POST', 'GET'])
def logout():
	if request.method == 'POST':
		username = 0
		global username

	return redirect(url_for("login"))

@app.route("/signup", methods = ['POST', 'GET'])
def signup():
	return render_template("venum_reg.html")

@app.route("/sign", methods = ['POST', 'GET'])
def sign():
	if request.method == 'POST':
		username=request.form['username']
		phone=request.form['phone']
		email=request.form['email']
		password=request.form['password']

		db = pymysql.connect("localhost", "root", "12345678", "venum")

		cursor = db.cursor() 

		sql="""INSERT INTO userdata (user_Name,user_Email,user_Phone,user_Password) VALUES ('%s','%s','%d','%s')"""\
	  %(str(username),str(email),int(phone),str(password))


		cursor.execute(sql)
		db.commit()

		return render_template("venum_success.html")




if __name__ == "__main__":
	app.debug = True
	app.run(host="0.0.0.0", port=8000)