#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import os
from pathlib import Path
from flask import request


# In[2]:


# Criando o DataFreme "mapadecaixa" e atribuindo o conteúdo do file "Movimentao geral - CSV.csv" a ele
mapadecaixa = pd.read_csv(os.getcwd() + "\\Movimentação geral - CSV.csv", encoding='ANSI', sep=',', header=0, thousands = '.', decimal = ',', dtype = {'Valor':np.float64})

# Exemplo Old: Movimentação geral - CSV PontoVirgula
# mapadecaixa = pd.read_csv(os.getcwd() + "\\Movimentao geral - CSV.csv", encoding='ANSI', sep=',', header=0)
# Obtendo arquivo de um endereço da web
# mapadecaixa = pd.read_csv(os.getcwd() + "https://media.geeksforgeeks.org/wp-content/uploads/nba.csv", encoding='ANSI', sep=',', header=0)

# mapadecaixa = pd.read_csv(os.getcwd() + "\\..\\..\\Users\\lmiguel\\Downloads\\Movimentao geral - CSV.csv", encoding='ANSI', sep=',', header=0)
# os.getcwd()

#Retorna as 5 primeiras linhas


mapadecaixa.head() 


# In[ ]:


# Qualquer coisa que não seja numerico o Pandas exibe como objeto


mapadecaixa.dtypes


# In[3]:


mapadecaixa['HISTORICO'] = 10.01 #adicionando colunas
mapadecaixa['CREDITO'] = 10164 #adicionando colunas
# Renomeando as colunas
colunas = {'4o. Agrupamento':'FILIAL', 'Descrição':'DESCRIÇÃO','Crédito':'DEBITO', 'Emissão':'DATA', 'Valor':'VALOR'}
mapadecaixa.rename(columns = colunas, inplace=True) # o inplace=True muda os dados diretamente no DataFreme
# Lendo o DataFreme com as colunas renomeadas


mapadecaixa.head() 
# mapadecaixa.columns.to_list()


# In[ ]:


#Substituindo a Virgula por Ponto
# Obs.: Quando converte os valores da coluna "VALOR" para str (STRING) não conseguira mais realizar funções matemática, pois não será mais do tipo int, float

# mapadecaixa['VALOR'] = mapadecaixa['VALOR'].astype(str)
# mapadecaixa['VALOR'] = mapadecaixa['VALOR'].str.replace(',','.')
# mapadecaixa.head()

# Convertendo para "float64" para fazer calculos, caso necessario:
# mapadecaixa['VALOR'] = mapadecaixa['VALOR'].str.replace(',', '.').astype('float64')

########## Obs.: Não precisa usar o codigo acima pois já foi inserindo a seguinte linha na abertura do arquivo que já faz esse tratativa:
# mapadecaixa = pd.read_csv(os.getcwd() + "\\Movimentao geral - CSV.csv", encoding='ANSI', sep=',', header=0, thousands = '.', decimal = ',', dtype = {'Valor':np.float64})


# In[4]:


# listando colunas do DataFreme


mapadecaixa.columns


# In[ ]:


# Ordenando colunas
new_ordem_colls = ['FILIAL', 'DATA', 'DEBITO', 'CREDITO', 'VALOR', 'HISTORICO']
mapadecaixa = mapadecaixa[new_ordem_colls]


mapadecaixa.head()


# In[5]:


### Inserindo valores nas linhas da coluna 'FILIAL' a partir da entrada do usuário
# mapadecaixa = str(input("Digite a Filial: "))
filial = input("Digite a Filial: ")
mapadecaixa['FILIAL'] = filial

# Inserindo o valor '8080' em todas as linhas da coluna 'Descrição'
# mapadecaixa['Descrição'] = '8080'
# Inserindo o valor '8080' na linha '1' da coluna 'Valor'
# mapadecaixa.Valor[1] = '8080'
# Inserindo o valor '8080' na linha '3' da coluna 'Valor'usando o LOC
# mapadecaixa.loc[3, 'Valor'] = '8080'


# In[ ]:


# Qualquer coisa que não seja numerico o Pandas exibe como objeto

mapadecaixa.dtypes


# In[ ]:


# Usando o to_csv para exportar o arquivo
mapadecaixa.to_csv('MapaCaixa.csv', index=False) # O Index false, remove a coluna de indice que o dataframe cria no inicio.


# In[ ]:


# Lendo o file csv


mapadecaixa = pd.read_csv(os.getcwd() + "\\MapaCaixa.csv", encoding='ANSI', sep=',', header=0)
mapadecaixa.head() 


# In[ ]:


#Qualquer coisa que não seja numerico o Pandas exibe como objeto
# mapadecaixa.dtypes


# In[ ]:


#Tipos de dados do DataFreme
# type(mapadecaixa)


# In[ ]:


#Retorna a 2 primeiras linhas
# mapadecaixa.loc[:2] 


# In[ ]:


# mapadecaixa.columns.to_list()
# mapadecaixa.columns


# In[ ]:


#p = Path(os.getcwd())
#pd.read_csv(str(p.parent.parent) + '\\Users\\lmiguel\\Downloads\\Movimentao geral - CSV.csv', encoding='ANSI', sep=',', header=0)


# In[ ]:


# df = pd.read_csv('Movimentao geral - CSV.csv', encoding='ANSI', sep=',', header=0)
# df.head()


# In[ ]:


# O método read_csv bem como outros métodos de leitura de arquivo do Pandas vem com parâmetros que facilitam a coleta dos dados adaptando-os a realidade da região que os dados foram construídos. Para o caso de existir separação de milhar com pontos e casas decimais com vírgula, o que é algo um pouco fora do comum em algumas regiões e banco de dados, o Pandas trouxe a opção de definir os parâmetros thousands, decimal e dtype logo no método de leitura.
# O parâmetro thousands permite que seja definido qual o separador das casas de milhar, decimal permite definir o separador das casas decimais e o dtype permite que possamos definir o tipo das variáveis presentes nas colunas do nosso banco de dados. Então, atribuindo o ponto a thousands, a vírgula a decimal e float64 como o tipo da colunas 'dotacao' e 'empenhada', teremos os dados numéricos, da forma que precisamos para trabalhar com eles, segue abaixo o código dessa aplicação:

# orcamento = pd.read_csv('orcamento.csv', thousands = '.', decimal = ',', dtype = {'dotacao':np.float64,'empenhada': np.float64})

# Nosso Exemplo:
# mapadecaixa = pd.read_csv(os.getcwd() + "\\Movimentao geral - CSV.csv", encoding='ANSI', sep=',', header=0, thousands = '.', decimal = ',', dtype = {'Valor':np.float64})

