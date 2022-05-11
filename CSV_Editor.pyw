import pandas as pd
import numpy as np
import os
import tkinter as tk
from pathlib import Path
from  tkinter import*
import tkinter.messagebox
from tkinter import filedialog

def UploadAction():
    global LinhasEmBranco
    filename = filedialog.askopenfilename(initialdir="C:/Users//Downloads/", title="Selecione um Arquivo CSV", filetypes=(("csv files", "*.csv"),("all files", "*.*")))
    print('Escolha o Arquivo CSV: ', filename)

    mapadecaixa = pd.read_csv(filename, encoding='ANSI', sep=',', header=0, thousands = '.', decimal = ',', dtype = {'Valor':np.float64})

    for index, row in mapadecaixa.iterrows():
        if row ['3o. Agrupamento'] == 'Cartão de Crédito' and mapadecaixa['4o. Agrupamento'].isnull().values.any():
            mapadecaixa.loc[index, '4o. Agrupamento'] = 'Cart Hipercard Pagseguro;10221'
        elif row['3o. Agrupamento'] == 'Cartão de Débito' and mapadecaixa['4o. Agrupamento'].isnull().values.any():
            mapadecaixa.loc[index, '4o. Agrupamento'] = 'Cart Maestro Pagseguro;10221'

    mapadecaixa[['4o. Agrupamento','DEBITO']] = mapadecaixa['4o. Agrupamento'].str.split(';', expand=True)
    for index, row in mapadecaixa.iterrows():
        if row['3o. Agrupamento'] == 'Duplicata':
            mapadecaixa.loc[index, 'DEBITO'] = '10265'
        elif row['3o. Agrupamento'] == 'Crédito Bancário':
            mapadecaixa.loc[index, 'DEBITO'] = '10265'
        elif row['3o. Agrupamento'] == 'Cheque à vista':
            mapadecaixa.loc[index, 'DEBITO'] = '10267'

    for index, row in mapadecaixa.iterrows():
        if row['4o. Agrupamento'] == 'Carteira Cobrança Simples':
            mapadecaixa.loc[index, 'DEBITO'] = '45534'
        if row['4o. Agrupamento'] == 'Cart Credito Garantia':
            mapadecaixa.loc[index, 'DEBITO'] = '344640'
        elif row['3o. Agrupamento'] == 'Dinheiro':
            mapadecaixa.loc[index, 'DEBITO'] = '45534'

    mapadecaixa['CREDITO'] = '10164'
    mapadecaixa['HIST.cod'] = '10.01'
    for index, row in mapadecaixa.iterrows():
        if row['Descrição'].startswith('RC'):
            mapadecaixa.loc[index, 'CREDITO'] = '31472'

    for index, row in mapadecaixa.iterrows():
        if row['3o. Agrupamento'] == 'Duplicata':
            mapadecaixa.loc[index,'4o. Agrupamento'] =  str(mapadecaixa.loc[index,'3o. Agrupamento']) + ' - ' + str(mapadecaixa.loc[index,'Cliente'])
        elif row['3o. Agrupamento'] == 'Crédito Bancário':
            mapadecaixa.loc[index,'4o. Agrupamento'] =  str(mapadecaixa.loc[index,'3o. Agrupamento']) + ' - ' + str(mapadecaixa.loc[index,'Cliente'])
        elif row['3o. Agrupamento'] == 'Cheque à vista':
            mapadecaixa.loc[index,'4o. Agrupamento'] =  str(mapadecaixa.loc[index,'3o. Agrupamento']) + ' - ' + str(mapadecaixa.loc[index,'Cliente'])

    mapadecaixa['FILIAL'] = ''
    mapadecaixa['4o. Agrupamento'] = mapadecaixa['4o. Agrupamento'].str.upper()

    mapadecaixa = mapadecaixa.drop(['3o. Agrupamento','Cliente'], axis=1)

    colunas = {'Emissão':'DATA','Valor':'VALOR', '4o. Agrupamento':'HIST.p1', 'Descrição':'HIST.p2'}
    mapadecaixa.rename(columns = colunas, inplace=True) 

    new_ordem_colls = ['FILIAL', 'DATA', 'DEBITO', 'CREDITO', 'VALOR', 'HIST.cod', 'HIST.p1', 'HIST.p2']
    mapadecaixa = mapadecaixa[new_ordem_colls]

    filial = en.get()
    mapadecaixa['FILIAL'] = filial

    for index, row in mapadecaixa.iterrows():
        if row['HIST.p1'].startswith('CRÉDITO BANCÁRIO'):
            mapadecaixa.loc[index, 'DEBITO'] = '10265'
            
    mapadecaixa['VALOR'] = mapadecaixa['VALOR'].astype(str)

    mapadecaixa.to_csv('Filial_'+filial+' - MapaCaixa.csv', sep=';', encoding='latin-1', header=False, index=False) 
    # mapadecaixa.to_csv('Filial_'+filial+' - MapaCaixa.csv', encoding='latin-1', header=False, index=False) 
    LinhasEmBranco = "Existem:(",mapadecaixa['DEBITO'].isnull().sum(),")","Conta(s) em branco na coluna DÉBITO"
    print(LinhasEmBranco)

root = Tk()
root.title('CSV - Mapa de Caixa')
root.geometry('840x250')

def enviar():
    print(en.get())

def open():
    global en
    root2 = tk.Toplevel()
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
    texto = Label(root, bg = "yellow", fg = "red", text=LinhasEmBranco)
    texto.grid(column=1, row=5, padx=40, pady=40)

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
texto.grid(column=1, row=6, padx=40, pady=40)

root.mainloop()
