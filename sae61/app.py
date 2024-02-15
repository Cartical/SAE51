from flask import Flask, render_template, request
import re
import mysql.connector

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


# Route principale
@app.route('/')
def index():
    return 'Page principale du TP4 <br> <a href="/newuser/">Accédez au formulaire</a>'

# Nouvelle route pour le formulaire
@app.route('/newuser/', methods=['GET', 'POST'])
def new_user():
    if request.method == 'POST':
        # Récupérer la saisie utilisateur
        username = request.form.get('username')

        # Valider la saisie avec une regex
        if re.match(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$', username):
            message = 'La saisie respecte les critères.'
        else:
            message = 'La saisie ne respecte pas les critères. <br> Veuillez respecter les règles suivantes :<br> - Au moins 6 caractères<br> - Au moins 1 chiffre<br> - Au moins 1 majuscule et 1 minuscule.'

        # Renvoyer la page avec le message en utilisant le template Jinja
        return render_template('newuser.html', message=message)

    # Affichage de la page formulaire avec get
    return render_template('newuser.html', message=None)

if __name__ == '__main__':
	app.run(debug=True)
    

