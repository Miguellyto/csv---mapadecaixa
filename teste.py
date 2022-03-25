from cgitb import text
from distutils.command.upload import upload
# from click import argument, command
import pandas as pd
import numpy as np
import os
from pathlib import Path
# import requests
from  tkinter import*
# import tkinter as tk
import tkinter.messagebox
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
    # global filial
    filial = en.get()

    mapadecaixa['FILIAL'] = filial
# Exportando o DataFrame para um file CSV
# O Index false, remove a coluna de indice que o dataframe cria no inicio.
    mapadecaixa.to_csv('MapaCaixa.csv', index=False) 

    # texto_resultado['text'] = mapadecaixa
    # print(mapadecaixa)
# csv_mapaDEcaixa()

janela = Tk()
# janela.eval('tk::PlaceWindow %s center' % janela.winfo_toplevel()) #Abri a janela no centro da tela.
# janela.iconphoto(False, tk.PhotoImage(file='C:\BKP DESKTOP\MAPA DE CAIXA\csv - mapadecaixa\static\imagem\csv-icon.png'))
janela.title('CSV - Mapa de Caixa')
janela.geometry('840x250')
# janela.configure(background='#dde')
# --------------------------------------------------------------------------------------
# def nome():
#     en = input('Digite a Filial')
#     # en.pack()
#     return nome
# Cria janela para menssagem
def enviar():
    # print(en.get())
    en.delete(0,END)

def open():
    global en
    janela2 = Toplevel()
    # janela2.eval('tk::PlaceWindow %s center' % janela2.winfo_toplevel())
    janela2.geometry("280x100")  
    janela2.title("CSV - Mapa de Caixa") 
    en = Entry(janela2, )
    # en = int(Entry(janela2, validatecommand=('%S')))
    en.pack()
    en.get()
    botao = Button(janela2, text='OK', command=lambda: [enviar()])
    botao.pack()

    # def enviar():
    #     print(en.get())
    #     en.delete(0,END)
        # mensagem = str
        # mensagem = str(en.get())
        # return mensagem.isdigit()
        # return en
        # print(mensagem)
        # fileial = en.get()
        # janela2.destroy()

def hello():
    tkinter.messagebox.showinfo('CSV - Mapa de Caixa', 'CSV Editado com Sucesso!')  
# --------------------------------------------------------------------------------------
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

# janela.filename = filedialog.askopenfilename(initialdir="/", title="Selecione um Arquivo CSV", filetypes=(("CSV", "*.csv")))

# botao = Button(janela, text='Editar CSV', command=csv_mapaDEcaixa)
# botao.grid(column=1, row=1, padx=10, pady=10)

# texto_resultado = Label(janela, text="")
# texto_resultado.grid(column=1, row=5, padx=10, pady=10)

janela.mainloop()
