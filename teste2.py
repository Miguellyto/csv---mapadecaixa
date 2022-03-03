from cgitb import text
from cmath import e
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
    filial = e.get()

    mapadecaixa['FILIAL'] = filial
# Exportando o DataFrame para um file CSV
# O Index false, remove a coluna de indice que o dataframe cria no inicio.
    mapadecaixa.to_csv('MapaCaixa.csv', index=False) 
class main(Frame):
    def __init__(self, master):
        Frame.__init__(self, master=None)
        self.master.title("CSV - Mapa de Caixa")
        self.master.geometry("300x50")
        Button(root, text="Selecionar CSV", command=self.dialogo).pack()
        self.valor = StringVar()
        self.valor.set("Selecione o Arquivo CSV: Movimentação geral")
        Label(self.master, textvariable=self.valor).pack()
 
    def dialogo(self):
        d = MyDialog(root, self.valor, "CSV - Mapa de Caixa", "Digite a Filial")
        root.wait_window(d.top)
        #self.valor.set(d.ejemplo)
 
class MyDialog:
    def __init__(self, parent, valor, title, labeltext = '' ):
        self.valor = valor
 
        self.top = Toplevel(parent)
        self.top.transient(parent)
        self.top.grab_set()
        if len(title) > 0: self.top.title(title)
        if len(labeltext) == 0: labeltext = 'Valor'
        Label(self.top, text=labeltext).pack()
        self.top.bind("<Return>", self.ok)
        self.e = Entry(self.top, text=valor.get())
        self.e.bind("<Return>", self.ok)
        self.e.bind("<Escape>", self.cancel)
        self.e.pack(padx=15)
        self.e.focus_set()
        b = Button(self.top, text="OK", command=self.ok)
        b.pack(pady=5)
 
    def ok(self, event=None):
        # print "Has escrito ...", self.e.get()
        self.valor.set(self.e.get())
        self.top.destroy()
 
    def cancel(self, event=None):
        self.top.destroy()
 
root = Tk()
a = main(root)
root.mainloop()