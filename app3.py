import pandas as pd
import numpy as np
import os
from pathlib import Path
from flask import request
# VIRIFICAR A IMPORTAÇÃO ABAIXO:
from app import ContactForm

# Criando o DataFreme "mapadecaixa" e atribuindo o conteúdo do file "Movimentao geral - CSV.csv" a ele
# filepath = input("Escolha o Arquivo CSV: ")
# while not os.path.isfile(filepath):
#     print("Error: Digite o endereço coreto...")

ContactForm.file

# filepath = input("Escolha o Arquivo CSV: ")
filepath = file
mapadecaixa = pd.read_csv(os.getcwd() + filepath, encoding='ANSI', sep=',', header=0, thousands = '.', decimal = ',', dtype = {'Valor':np.float64})
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
filial = input("Digite a Filial: ")
mapadecaixa['FILIAL'] = filial
# Exportando o DataFrame para um file CSV
# O Index false, remove a coluna de indice que o dataframe cria no inicio.
mapadecaixa.to_csv('MapaCaixa.csv', index=False) 

