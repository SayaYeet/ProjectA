from flask import Flask, render_template, request, redirect, url_for, session
import mysql.connector
import secrets

app = Flask(__name__)
app.secret_key = secrets.token_hex(16)  

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="projecta"
)

@app.route('/')
@app.route('/home')
def home():
    return render_template('home.html')

@app.route('/login', methods=["POST", "GET"])
def login():
    if request.method == "POST":
        nama = request.form['nama']
        password = request.form['password']
        cursor = mydb.cursor()
        query = "select * from user where nama = %s and password = md5(%s)"
        cursor.execute(query, (nama, password))
        user = cursor.fetchone()
        
        if user:
            session["user"] = nama
            return redirect(url_for('admin'))
        else:
            return "Salah!"
    return render_template('login.html')

@app.route('/admin')
def admin():
    if 'user' in session:
        return render_template('admin.html')
    else:
        return redirect(url_for('login'))

@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect(url_for('home'))

@app.route('/tampil')
def tampil():
    if 'user' in session:
        cursor = mydb.cursor()
        cursor.execute("select * from pemimpin")
        data = cursor.fetchall()
        return render_template('tampil.html', data=data)
    else:
        return redirect(url_for('login'))

@app.route('/simpan', methods=["POST"])
def simpan():
    if 'user' in session:
        nama_pemimpin = request.form['nama_pemimpin']
        tahun = request.form['tahun']
        negara = request.form['negara']
        
        cursor = mydb.cursor()
        query = "insert into pemimpin (nama_pemimpin, tahun, negara) values (%s, %s, %s)"
        cursor.execute(query, (nama_pemimpin, tahun, negara))
        mydb.commit()
        return redirect(url_for('tampil'))
    else:
        return redirect(url_for('login'))

@app.route('/hapus/<int:id>')
def hapus(id):
    if 'user' in session:
        cursor = mydb.cursor()
        query = "delete from pemimpin where id = %s"
        cursor.execute(query, (id,))
        mydb.commit()
        return redirect(url_for('tampil'))
    else:
        return redirect(url_for('login'))

@app.route('/update/<int:id>', methods=["GET", "POST"])
def update(id):
    if 'user' in session:
        cursor = mydb.cursor()
        if request.method == "POST":
            nama_pemimpin = request.form['nama_pemimpin']
            tahun = request.form['tahun']
            negara = request.form['negara']
            query = "update pemimpin set nama_pemimpin = %s, tahun = %s, negara = %s where id = %s"
            cursor.execute(query, (nama_pemimpin, tahun, negara, id))
            mydb.commit()
            return redirect(url_for('tampil'))
        else:
            cursor.execute("select * from pemimpin where id = %s", (id,))
            value = cursor.fetchone()
            return render_template('update.html', value=value)
    else:
        return redirect(url_for('login'))

if __name__ == "__main__":
    app.run(debug=True)
