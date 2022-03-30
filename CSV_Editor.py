from cgitb import text
from distutils.command.upload import upload
import pandas as pd
import numpy as np
import os
import sys
import tkinter as tk
from pathlib import Path
from  tkinter import*
import tkinter.messagebox
from tkinter import filedialog
# from PIL import ImageTk, Image

def UploadAction():
    filename = filedialog.askopenfilename(initialdir="C:/Users//Downloads/", title="Selecione um Arquivo CSV", filetypes=(("csv files", "*.csv"),("all files", "*.*")))
    print('Escolha o Arquivo CSV: ', filename)

    mapadecaixa = pd.read_csv(filename, encoding='ANSI', sep=',', header=0, thousands = '.', decimal = ',', dtype = {'Valor':np.float64})

    # colunas = {'3o. Agrupamento':'3AGRUPAMENTO', '4o. Agrupamento':'FILIAL', 'Descrição':'DESCRIÇÃO', 'Cliente':'CLIENTE','Crédito':'DEBITO', 'Emissão':'DATA', 'Valor':'VALOR'}
    colunas = {'3o. Agrupamento':'3AGRUPAMENTO', '4o. Agrupamento':'FILIAL','Descrição':'DESCRIÇÃO','Cliente':'CLIENTE','Crédito':'DEBITO','Emissão':'DATA','Valor':'VALOR'}
    # colunas = {'3o. Agrupamento':'', '4o. Agrupamento':'FILIAL', 'Descrição':'', 'Cliente':'','Crédito':'DEBITO', 'Emissão':'DATA', 'Valor':'VALOR'}

    mapadecaixa['CREDITO'] = 10164 
    # mapadecaixa['HISTORICO'] = 10.01
    mapadecaixa['HISTORICO'] = '10.01'+ "," + mapadecaixa['3o. Agrupamento']+ "," + mapadecaixa['Cliente']+ "," + mapadecaixa['Descrição']
    # mapadecaixa['HISTORICO'] = '10.01' + mapadecaixa['3o. Agrupamento'] + mapadecaixa['Cliente'] + mapadecaixa['Descrição']

    # mapadecaixa['3o. Agrupamento'] = '3o. Agrupamento'
    # mapadecaixa['Cliente'] = 'Cliente'
    # mapadecaixa['Descrição'] = 'Descrição'

    mapadecaixa['HISTORICO'] = mapadecaixa['HISTORICO'].str.upper()
    # mapadecaixa['3o. Agrupamento'] = mapadecaixa['3o. Agrupamento'].str.upper()
    # mapadecaixa['Cliente'] = mapadecaixa['Cliente'].str.upper()


    mapadecaixa.rename(columns = colunas, inplace=True) 
    # new_ordem_colls = ['FILIAL', 'DATA', 'DEBITO', 'CREDITO', 'VALOR', 'HISTORICO', '3AGRUPAMENTO', 'CLIENTE', 'DESCRIÇÃO']
    # new_ordem_colls = ['FILIAL', 'DATA', 'DEBITO', 'CREDITO', 'VALOR', 'HISTORICO', '3o. Agrupamento', 'Cliente', 'Descrição']
    new_ordem_colls = ['FILIAL', 'DATA', 'DEBITO', 'CREDITO', 'VALOR', 'HISTORICO']
    mapadecaixa = mapadecaixa[new_ordem_colls]

    filial = en.get()
    mapadecaixa['FILIAL'] = filial
    mapadecaixa.to_csv('MapaCaixa.csv', encoding='latin-1', index=False) 

# root = tk.Tk()
root = Tk()
root.title('CSV - Mapa de Caixa')
# Tk.call('wm', 'iconphoto', Tk._w, ImageTk.PhotoImage(Image.open('csv-icon.png')))
# root.iconbitmap(os.path.join(sys.path[0], 'csv-icon.ico'))
# root.iconbitmap(r'csv-icon.ico')
# root.tk.call('wm', 'iconphoto', root._w, PhotoImage(file='csv-icon.png'))
# root.iconphoto(False, tk.PhotoImage(file='csv-icon.png'))
root.geometry('840x250')

def enviar():
    print(en.get())

def open():
    global en
    root2 = tk.Toplevel()
    # Tk.call('wm', 'iconphoto', Tk._w, ImageTk.PhotoImage(Image.open('csv-icon.png')))
    # root2.iconbitmap(os.path.join(sys.path[0], 'csv-icon.ico'))
    # root2.iconbitmap(r'csv-icon.ico')
    # root2.tk.call('wm', 'iconphoto', root._w, PhotoImage(file='csv-icon.png'))
    # root2.iconphoto(False, tk.PhotoImage(file='csv-icon.png'))
    root2.geometry("280x100")  
    root2.title("CSV - Mapa de Caixa")
    en = Entry(root2, validatecommand=('%S'))
    en.focus()
    en.pack()
    en.get()

    botao = Button(root2, text='OK', command=lambda: [enviar()])
    botao.pack()

def hello():
    tkinter.messagebox.showinfo('CSV - Mapa de Caixa', 'CSV Editado com Sucesso!') 

texto = Label(root, text='Selecione o Arquivo CSV: Movimentação geral')
texto.grid(column=1, row=0, padx=10, pady=10)

botao = Button(root, bg = "yellow", fg = "red", text='Digite a Filial', command=open) 
botao.grid(column=1, row=1, padx=10, pady=10)

botao = Button(root, bg = "yellow", fg = "red", text='Selecionar Arquivo...',  command=lambda: [UploadAction(), hello()])
botao.grid(column=1, row=2, padx=10, pady=10)

texto = Label(root, text='Obs.: Esta aplicação foi desenvolvida para manipular o arquivo CSV gerado em "/Menu/Retaguarda da Loja/Tesouraria/Mapa de Caixa" do ERP Innovaro.')
texto.grid(column=1, row=3, padx=0, pady=0)

texto = Label(root, text='Antes de gerar o arquivo CSV escolher o separador Virgula (,) e não o Ponto e Virgula (;).')
texto.grid(column=1, row=4, padx=0, pady=0)

texto = Label(root, text='Copyright © 2022 - Desenvolvido pelo Departamento de Tecnologia da Informação (DTI).')
texto.grid(column=1, row=5, padx=40, pady=40)

root.mainloop()


# ------------------------ 
if  (('3o. Agrupamento' == 'DUPLICATA') end ('3o. Agrupamento' == 'CRÉDITO BANCÁRIO') end ('3o. Agrupamento' == 'CHEQUE À VISTA')):
    '3o. Agrupamento' + '-' + 'Cliente'
else:
