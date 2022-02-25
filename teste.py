from werkzeug import SharedDataMiddleware
app.add_url_rule('/uploads/<filename>', 'uploaded_file',
                 build_only=True)
app.wsgi_app = SharedDataMiddleware(app.wsgi_app, {
    '/uploads':  app.config['UPLOAD_FOLDER']
})

# import pandas as pd
# import numpy as np
# import os
# from nome_do_arquivo_SemExtensão import Nome_da_classe_nesse_arquivo ou variavel 
# from app3 import * # importar tudo do código app3.py

# from app3 import filepath

# \\Movimentação geral - CSV.csv

# mapadecaixa = pd.read_csv()

# import sys
# sys.path.append(mapadecaixa)

# from app3 import mapadecaixa
# print(mapadecaixa)

# import app3
# mapadecaixa()
# print(app3.mapadecaixa)
# return = app3.mapadecaixa

# import app3 as mapadecaixa
# print(mapadecaixa)

