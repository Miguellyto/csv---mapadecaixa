from cgitb import text
from distutils.command.upload import upload
from click import argument, command
import pandas as pd
import numpy as np
import os
from pathlib import Path
# import requests
import tkinter as tk
from  tkinter import*
# from PIL import ImageTk, Image
# import tkMessageBox
from tkinter import filedialog

# ----------------
# def csv_mapaDEcaixa():
# Criando o DataFreme "mapadecaixa" e atribuindo o conteúdo do file "Movimentao geral - CSV.csv" a ele
def UploadAction():
    # filename = input("Escolha o Arquivo CSV: ")
    filename = filedialog.askopenfilename(initialdir="C:/Users//Downloads/", title="Selecione um Arquivo CSV", filetypes=(("csv files", "*.csv"),("all files", "*.*")))
    print('Escolha o Arquivo CSV: ', filename)

    # filename = input("Escolha o Arquivo CSV: ") 
    mapadecaixa = pd.read_csv(filename, encoding='ANSI', sep=',', header=0, thousands = '.', decimal = ',', dtype = {'Valor':np.float64})
# mapadecaixa = pd.read_csv(os.getcwd() + "\\Movimentação geral - CSV.csv", encoding='ANSI', sep=',', header=0, thousands = '.', decimal = ',', dtype = {'Valor':np.float64})
#adicionando colunas
    mapadecaixa['HISTORICO'] = 10.01
#adicionando colunas 
    mapadecaixa['CREDITO'] = 10164 
# Renomeando as colunas
    colunas = {'4o. Agrupamento':'FILIAL', 'Descrição':'DESCRIÇÃO','Crédito':'DEBITO', 'Emissão':'DATA', 'Valor':'VALOR'}

    mapadecaixa.rename(columns = colunas, inplace=True) # o inplace=True muda os dados diretamente no DataFreme
# Ordenando colunas
    new_ordem_colls = ['FILIAL', 'DATA', 'DEBITO', 'CREDITO', 'VALOR', 'HISTORICO']
    mapadecaixa = mapadecaixa[new_ordem_colls]
# Inserindo valores nas linhas da coluna 'FILIAL' a partir da entrada do usuário
# def validate():
    # filial = input("Digite a Filial: ")
    # filial = entry.get()
    filial = entry

    mapadecaixa['FILIAL'] = filial
# Exportando o DataFrame para um file CSV
# O Index false, remove a coluna de indice que o dataframe cria no inicio.
    mapadecaixa.to_csv('MapaCaixa.csv', index=False) 

    texto_resultado['text'] = mapadecaixa
    # print(mapadecaixa)
# csv_mapaDEcaixa()

janela = Tk()
janela.iconphoto(False, tk.PhotoImage(file='C:\BKP DESKTOP\MAPA DE CAIXA\csv - mapadecaixa\static\imagem\csv-icon.png'))
janela.title('CSV - Mapa de Caixa')
janela.geometry('840x200')
# janela.configure(background='#dde')
# --------------------------------------------------------------------------------------
# Cria janela para menssagem
janela2 = Tk()
janela2.geometry("280x100")  
janela2.title("CSV - Mapa de Caixa") 
mensagem = str
entry = Entry(janela2, validatecommand=('%S'))
entry.pack()

def enviar():
    mensagem = str(entry.get())
    # return mensagem.isdigit()
    print(mensagem)

button = Button(janela2, text='OK', command=lambda: [enviar(), janela2.destroy()])
button.pack()
# def salvar_filial():
#     global filial
#     filial = l1.get()

# def validate(filial): # callback function
#     # return filial.isalnum() #Somente alfanumérico
#     return filial.isdigit()
# janela2_valid = janela2.register(validate) # register 
# # janela2_valid = janela2.register(salvar_filial) # register 

# l1=tk.Label(janela2, text='Digite a Filial:')
# l1.grid(row=1,column=1,padx=20,pady=20)
# e1 = Entry(janela2, validate='key', validatecommand=(janela2_valid,'%S'))
# e1.grid(row=1,column=2,padx=20)

# botao = Button(janela2, bg = "yellow", fg = "red", text='OK', command='')
# botao.grid(row=2,column=2,padx=20)
# janela2.destroy()

# def recuperar_filial():
#     global filial
#     lbl_filial['text'] = filial
# lbl_filial = Label(janela2, text='filial: ')

# botao = Button(janela2, bg = "yellow", fg = "red", text='OK', command=recuperar_filial)
# botao.grid(row=2,column=3,padx=20)
# --------------------------------------------------------------------------------------
texto = Label(janela, text='Selecione o Arquivo CSV: Movimentação geral')
texto.grid(column=1, row=0, padx=10, pady=10)

botao = Button(janela, bg = "yellow", fg = "red", text='Digite a Filial', command='')
botao.grid(column=1, row=1, padx=10, pady=10)

botao = Button(janela, bg = "yellow", fg = "red", text='Selecionar Arquivo...', command=UploadAction)
botao.grid(column=1, row=2, padx=10, pady=10)

texto = Label(janela, text='Obs.: Esta aplicação foi desenvolvida para manipular o arquivo CSV gerado em "/Menu/Retaguarda da Loja/Tesouraria/Mapa de Caixa" do ERP Innovaro.')
texto.grid(column=1, row=3, padx=10, pady=10)

texto = Label(janela, text='Antes de gerar o arquivo CSV escolher o separador Virgula (,) e não o Ponto e Virgula (;).')
texto.grid(column=1, row=4, padx=10, pady=10)

# janela.filename = filedialog.askopenfilename(initialdir="/", title="Selecione um Arquivo CSV", filetypes=(("CSV", "*.csv")))

# botao = Button(janela, text='Editar CSV', command=csv_mapaDEcaixa)
# botao.grid(column=1, row=1, padx=10, pady=10)

texto_resultado = Label(janela, text="", bg = "yellow")
texto_resultado.grid(column=1, row=4, padx=10, pady=10)

janela.mainloop()

# ----------------


# from werkzeug import SharedDataMiddleware
# app.add_url_rule('/uploads/<filename>', 'uploaded_file',
#                  build_only=True)
# app.wsgi_app = SharedDataMiddleware(app.wsgi_app, {
#     '/uploads':  app.config['UPLOAD_FOLDER']
# })

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

