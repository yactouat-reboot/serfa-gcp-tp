FROM watch

WORKDIR /usr/src/app

# on met en place les variables d'environnement pour le debug
ENV FLASK_ENV=development
ENV FLASK_APP=app.py 

COPY app.py app.py

# `CMD` signifie "lance cette commande quand le container est lancé"
# `sh -c` => "j'ouvre une shell et je lui passe la commande suivante"
CMD ["sh", "-c", "flask run --host=0.0.0.0"]