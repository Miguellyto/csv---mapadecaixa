import pandas as pd
import numpy as np
import os
import tkinter as tk
from pathlib import Path
from  tkinter import*
import tkinter.messagebox
from tkinter import filedialog

def UploadAction():
    filename = filedialog.askopenfilename(initialdir="C:/Users//Downloads/", title="Selecione um Arquivo CSV", filetypes=(("csv files", "*.csv"),("all files", "*.*")))
    print('Escolha o Arquivo CSV: ', filename)

    mapadecaixa = pd.read_csv(filename, encoding='ANSI', sep=',', header=0, thousands = '.', decimal = ',', dtype = {'Valor':np.float64})

    mapadecaixa[['4o. Agrupamento','DEBITO']] = mapadecaixa['4o. Agrupamento'].str.split(';', expand=True)

    mapadecaixa['FILIAL'] = ''
    mapadecaixa['CREDITO'] = '10164' 
    mapadecaixa['HISTORICO'] = '10.01'+ "," + mapadecaixa['4o. Agrupamento']+ "," + mapadecaixa['Cliente']+ "," + mapadecaixa['Descrição']
    mapadecaixa['HISTORICO'] = mapadecaixa['HISTORICO'].str.upper()

    colunas = {'4o. Agrupamento':'4AGRUPAMENTO','Descrição':'DESCRIÇÃO','Cliente':'CLIENTE','Emissão':'DATA','Valor':'VALOR'}
    mapadecaixa.rename(columns = colunas, inplace=True) 

    new_ordem_colls = ['FILIAL', 'DATA', 'DEBITO', 'CREDITO', 'VALOR', 'HISTORICO']
    mapadecaixa = mapadecaixa[new_ordem_colls]

    filial = en.get()
    mapadecaixa['FILIAL'] = filial
    # mapadecaixa.to_csv('MapaCaixa.csv', index=False)
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


# ----------------------------------------------------------------------------------------------------------------------------------- 
# if  (('4o. Agrupamento' == 'DUPLICATA') end ('4o. Agrupamento' == 'CRÉDITO BANCÁRIO') end ('4o. Agrupamento' == 'CHEQUE À VISTA')):
#     '4o. Agrupamento' + '-' + 'Cliente'
# else:

# mapadecaixa.apply(lambda x: '3o. Agrupamento' if x.'3o. Agrupamento' == 'DUPLICATA' else '3o. Agrupamento', axis=1)

valores = []
for linha in mapadecaixa.itertuples(): # Melhor e mais rápido.
    valores.append('3o. Agrupamento' if linha['3o. Agrupamento'] == 'DUPLICATA' else '')
mapadecaixa['4AGRUPAMENTO'] = valores

# 03:20 https://www.youtube.com/watch?v=vJ45uEISJco

valores = []
for indice, linha in mapadecaixa.iterrows():
    valores.append('3o. Agrupamento' if linha['3o. Agrupamento'] == 'DUPLICATA' else '')
mapadecaixa['4AGRUPAMENTO'] = valores

# 03:06 https://www.youtube.com/watch?v=jq2UVaMJTyc

# ORDENANDO COLLUNAS
mapadecaixa.sort_values('DEBITO', ascending=False, ignore_index=True, na_position='first', inplace=True) 
# O ignore_index=True permanece com o indece sempre em ordem independente se o ASCENDING seja FALSE ou TRUE.
# O na_position='first' ordena as linhas vázias/NULAS nas primeiras posições.
# O inplace=True grava a mudança no DataFrame

mapadecaixa.sort_values() #Ordena todas as linhas do DataFrame do maior para o menor
mapadecaixa.sort_values(axis=1, 'DEBITO', ascending=False, ignore_index=True, na_position='first', inplace=True) 
# O axis=1 para as COLUNAS e axis=0 para as LINHAS

# https://www.youtube.com/watch?v=2oTmQPQD2EU&list=PLEdfCNsWt0gxURVswsV_STMrCo_n7rD5M&index=65

