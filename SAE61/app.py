import mysql.connector
from flask import Flask, render_template, request
from flask_bcrypt import Bcrypt
import re

app = Flask(__name__)
bcrypt = Bcrypt(app)

# Connexion à la base de données MySQL
db = mysql.connector.connect(
    host="db",
    user="myuser",
    password="mysql",
    database="mydbsql"
)
cursor = db.cursor()

@app.route('/')
def home():
    return '<a href="/newuser">Nouvel utilisateur</a>'

@app.route('/newuser', methods=['GET', 'POST'])
def new_user():
    error = None
    message = None

    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']

        # Vérification de l'identifiant
        if not re.match(r'^[a-zA-Z0-9_-]{6,15}$', username):
            error = 'L\'identifiant doit contenir entre 6 et 15 caractères alphanumériques.'

        # Vérification du mot de passe
        if not re.match(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[%#{}@])[a-zA-Z0-9#%{}@]{6,15}$', password):
            error = 'Le mot de passe doit contenir entre 6 et 15 caractères, au moins 1 chiffre, au moins 1 majuscule, au moins 1 minuscule et au moins 1 caractère parmi #%{}@.'

        # Vérification de l'adresse e-mail
        if not re.match(r'^[\w\.-]+@[\w\.-]+$', email):
            error = 'Adresse e-mail invalide.'

        # Vérification de l'unicité de l'identifiant et de l'adresse e-mail
        cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
        result_username = cursor.fetchone()
        if result_username:
            error = 'Identifiant déjà utilisé.'
        else:
            cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
            result_email = cursor.fetchone()
            if result_email:
                error = 'Adresse e-mail déjà utilisée.'

        if not error:
            # Hashage du mot de passe
            hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')
            # Insertion de l'utilisateur dans la base de données avec le mot de passe hashé
            cursor.execute("INSERT INTO users (username, password_hash, email) VALUES (%s, %s, %s)", (username, hashed_password, email))
            db.commit()
            message = 'Utilisateur créé avec succès.'

    return render_template('newuser.html', error=error, message=message)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

