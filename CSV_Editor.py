from cgitb import text
from distutils.command.upload import upload
import pandas as pd
import numpy as np
import os
from pathlib import Path
from  tkinter import*
import tkinter.messagebox
from tkinter import filedialog

def UploadAction():
    filename = filedialog.askopenfilename(initialdir="C:/Users//Downloads/", title="Selecione um Arquivo CSV", filetypes=(("csv files", "*.csv"),("all files", "*.*")))
    print('Escolha o Arquivo CSV: ', filename)

    mapadecaixa = pd.read_csv(filename, encoding='ANSI', sep=',', header=0, thousands = '.', decimal = ',', dtype = {'Valor':np.float64})
    mapadecaixa['HISTORICO'] = 10.01
    mapadecaixa['CREDITO'] = 10164 
    colunas = {'4o. Agrupamento':'FILIAL', 'Descrição':'DESCRIÇÃO','Crédito':'DEBITO', 'Emissão':'DATA', 'Valor':'VALOR'}

    mapadecaixa.rename(columns = colunas, inplace=True) 
    new_ordem_colls = ['FILIAL', 'DATA', 'DEBITO', 'CREDITO', 'VALOR', 'HISTORICO']
    mapadecaixa = mapadecaixa[new_ordem_colls]

    filial = en.get()
    mapadecaixa['FILIAL'] = filial
    mapadecaixa.to_csv('MapaCaixa.csv', index=False) 

janela = Tk()
janela.title('CSV - Mapa de Caixa')
janela.geometry('840x250')

def enviar():
    print(en.get())

def open():
    global en
    janela2 = Toplevel()
    janela2.geometry("280x100")  
    janela2.title("CSV - Mapa de Caixa")
    en = Entry(janela2, validatecommand=('%S'))
    en.focus()
    en.pack()
    en.get()

    botao = Button(janela2, text='OK', command=lambda: [enviar()])
    botao.pack()

def hello():
    tkinter.messagebox.showinfo('CSV - Mapa de Caixa', 'CSV Editado com Sucesso!') 

texto = Label(janela, text='Selecione o Arquivo CSV: Movimentação geral')
texto.grid(column=1, row=0, padx=10, pady=10)

botao = Button(janela, bg = "yellow", fg = "red", text='Digite a Filial', command=open) 
botao.grid(column=1, row=1, padx=10, pady=10)

botao = Button(janela, bg = "yellow", fg = "red", text='Selecionar Arquivo...',  command=lambda: [UploadAction(), hello()])
botao.grid(column=1, row=2, padx=10, pady=10)

texto = Label(janela, text='Obs.: Esta aplicação foi desenvolvida para manipular o arquivo CSV gerado em "/Menu/Retaguarda da Loja/Tesouraria/Mapa de Caixa" do ERP Innovaro.')
texto.grid(column=1, row=3, padx=10, pady=10)

texto = Label(janela, text='Antes de gerar o arquivo CSV escolher o separador Virgula (,) e não o Ponto e Virgula (;).')
texto.grid(column=1, row=4, padx=10, pady=10)

janela.mainloop()
