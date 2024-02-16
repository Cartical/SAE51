from flask import Flask, render_template, request
import re
import mysql.connector
import hashlib

app = Flask(__name__)

# MySQL configuration
db_config = {
    'host': 'sae61-sql',
    'user': 'root',
    'password': 'foo',
    'database': 'sae61',
    'port': '3306'
}

# Initialize MySQL connection
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

# Regex identifiant : entre 6 et 10 caractères, uniquement en minuscules et alphanumérique ASCII
username_regex = r'^[a-z0-9]{6,10}$'

# Regex mot de passe : entre 6 et 15 caractères, au moins 1 chiffre, 1 majuscule, 1 minuscule, et 1 des caractères spéciaux #%{}@
password_regex = r'^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[%#{}@]).{6,15}$'

# Regex e-mail
email_regex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'

# Route principale
@app.route('/')
def index():
    return 'Page principale du TP4 <br> <a href="/newuser/">Accédez au formulaire de création d\'utilisateur</a>'

# Route pour le formulaire de création d'utilisateur
@app.route('/newuser/', methods=['GET', 'POST'])
def new_user():
    if request.method == 'POST':
        # Récupérer les données du formulaire
        username = request.form.get('username')
        password = request.form.get('password')
        email = request.form.get('email')

        # Valider l'identifiant avec une regex
        if not re.match(username_regex, username):
            return render_template('newuser.html', message="L'identifiant doit contenir entre 6 et 10 caractères, uniquement en minuscules et alphanumérique ASCII.")
        
        # Valider le mot de passe avec une regex
        if not re.match(password_regex, password):
            return render_template('newuser.html', message="Le mot de passe doit contenir entre 6 et 15 caractères, au moins 1 chiffre, 1 majuscule, 1 minuscule, et 1 des caractères spéciaux #%{}@.")
        
        # Valider l'adresse e-mail avec une regex
        if not re.match(email_regex, email):
            return render_template('newuser.html', message="L'adresse e-mail n'est pas valide.")

        # Vérifier si l'identifiant ou l'adresse e-mail est déjà utilisé
        cursor.execute("SELECT * FROM users WHERE username = %s OR email = %s", (username, email))
        test_champs = cursor.fetchone()

        # Si l'utilisateur existe déjà
        if test_champs:
            champs = []
            if test_champs[1] == username:
                champs.append("identifiant")
            if test_champs[3] == email:
                champs.append("adresse e-mail")

            message = f"Les champs suivants sont déjà utilisés : {', '.join(champs)}"
            return render_template('newuser.html', message=message)

        # Hasher le mot de passe
        hashed_password = hashlib.sha256(password.encode()).hexdigest()

        # Insérer le nouvel utilisateur dans la base de données
        cursor.execute("INSERT INTO users (username, password, email) VALUES (%s, %s, %s)", (username, hashed_password, email))
        conn.commit()

        return render_template('newuser.html', message="L'utilisateur a été créé avec succès.")
    
    # Affichage du formulaire avec la méthode GET
    return render_template('newuser.html', message=None)

if __name__ == '__main__':
    app.run(debug=True)
