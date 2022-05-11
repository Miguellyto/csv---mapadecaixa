 Os arquivos: CSV_Editor.py e CSV_Editor.pyw
 contem o código final do CSV_Editor e o CSV_Editor.ipynb
 é utilizado para testar os código dos files acima.

 Iniciar o jupyter: jupyter notebook 
 
 - OS ARQUIVOS:  app.py  que é o principal, app - Copia.py, SEUS CÓDIGOS DIZ RESPEITO AO DESENVOVIMENTO DA APLICAÇÃO WEB EM FLASK.

 AS DEFINIÇÕES ABAIXO SE REFERE AO ARQUIVO: app2 copy.ipynb que é o principal, app2.ipynb, e CSV_Editor.py
 e os arquvios app3.py, app3 - Copia.py, teste.py, teste2.py e CSV-MapaCaixa.py são modificações mais antigas dos arquivos anteriores.

--OS ARQUVIOS CSVs: Movimentação geral LJ 880 CSV, principal, são usados para testes e manipulação. e o Movimentação geral LJ 880 excel, usado para
comparação. o MapaCaixa1 e MapaCaixa2 são exemplo de saída.

PARA RODAR OS ARQUIVOS PELO TERMINAL: python app.py
------------------------------------------------------------
https://pypi.org/project/pyinstaller/

pip install pyinstaller

Entre na pasta e digite o comando: 
# pyinstaller app.pyw --onefile

Criando EXE com Icon:
# pyinstaller CSV_Editor.pyw -i csv-icon.ico --onefile
# pyinstaller --noconsole exec_main.py 
# https://pt.stackoverflow.com/questions/266610/problema-com-execut%C3%A1vel-python-gerado-pelo-pyinstaller
Obs.:
--onefile (dois traços e depois a palavra "onefile").
ele transforma tudo num arquivo só (e um terço de tamanho. Fica bem menor. O meu programa de 16MB caiu para 6.5MB).
--Tkinter, abrir apenas interface gráfica
Basta salvar seu arquivo com a extensão ".pyw" em vez de ".py". (isso é só no Windows - nos outros sistemas um programa Python executado pela interface gráfica não abre um terminal automaticamente)

OBS.: Failed to import any qt binding
pip install PyQt5

pip uninstall matplotlib
python -m pip install --upgrade pip
pip install matplotlib
------------------------------------------------
No prompt de comando, utilize as instruções abaixo de acordo com sua necessidade:
Para inicializar: net start “nome do serviço”
Para parar: net stop “nome do serviço”
Para pausar: net pause “nome do serviço”
Para continuar um serviço pausado: net continue “nome do serviço”

--------------------------------------------------
Instalando Ambiente virtual:
pip install virtualenv
virtualenv venv #Nome do virtual env
.\venv\Scripts\Activate
activate env
python3 -m venv --upgrade Flask #Upgrade
deactivate #Sai do virtual env
--------------------------------------------------

cx-Freeze
pip install cx-Freeze
https://pypi.org/project/cx-Freeze/
você deve considerar o downgrade para o Python 3.9. A última versão do Cx_freeze e do Python 3.9.9 está funcionando bem. Para mais ajuda: https://cx-freeze.readthedocs.io/en/latest/setup_script.html#setup-script
passo a passo:

install python 3.9.9
pip install cx-freeze
python -m pip install --upgrade pip
cxfreeze -c hello.py --target-dir dist
--------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------------------- 
# mapadecaixa.apply(lambda x: '3o. Agrupamento' if x.'3o. Agrupamento' == 'DUPLICATA' else '3o. Agrupamento', axis=1)

# Criando nova coluna
mapadecaixa['nova_coluna'] = ''
# Fazendo a iteração:
for index, row in mapadecaixa.iterrows():
    if row['3o. Agrupamento'] == 'DUPLICATA':
    # if row['LOCALIDADE'] == row['ds_cidade']:
        mapadecaixa.loc[index,'nova_coluna'] =  str(mapadecaixa.loc[index,'Cliente'])  
# -------------------------------------------------------------------------------------
    valores = []
for linha in mapadecaixa.itertuples(): # Melhor e mais rápido.
    valores.append('3o. Agrupamento' if linha['3o. Agrupamento'] == 'DUPLICATA' else '')
mapadecaixa['4AGRUPAMENTO'] = valores
# -------------------------------------------------------------------------------------
if  (('4o. Agrupamento' == 'DUPLICATA') end ('4o. Agrupamento' == 'CRÉDITO BANCÁRIO') end ('4o. Agrupamento' == 'CHEQUE À VISTA')):
    '4o. Agrupamento' + '-' + 'Cliente'
# -------------------------------------------------------------------------------------
var = '3o. Agrupamento'

if (var =='DUPLICATA' end var =='CRÉDITO BANCÁRIO'):
    ('4o. Agrupamento' + '-' + 'Cliente')
elif ('3o. Agrupamento' == 'CHEQUE À VISTA'):
    ('4o. Agrupamento' + '-' + 'Cliente')
else:

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

--------------CUSTOMIZAÇÃO DO CSV MAPA DE CAIXA------------------------------------

30/03/2022
3 agrupamento
quando '3 agrupamento' for 'DUPLICATA' a conta "DEBITO" = 10265
quando '3 agrupamento' for 'CRÉDITO BANCÁRIO' a conta "DEBITO" = 10265
quando '3 agrupamento' for 'CHEQUE A VISTA' a conta "DEBITO" = 10267

4 agrupamento
quando 4 agrupamento for "Carteira Cobrança Simples" a conta "DEBITO" = 45534
quando 4 agrupamento for "Cart Credito Garantia" a conta "DEBITO" = 344640

3 agrupamento
quando '3o. Agrupamento' for = 'DUPLICATA' faça '3o. Agrupamento' + 'CLIENTE' em 'HISTORICO'
quando '3o. Agrupamento' for = 'CRÉDITO BANCÁRIO' faça '3o. Agrupamento' + 'CLIENTE' em 'HISTORICO'
quando '3o. Agrupamento' for = 'CHEQUE A VISTA' faça '3o. Agrupamento' + 'CLIENTE' em 'HISTORICO'

HISTORICO
A coluna 'HISTORICO' = '10.01' + 'DESCRIÇÃO'

31/03/2022
3 agrupamento
quando '3 agrupamento' for Cartão de Crédito e '4 agrupamento' = vázio faça = Cart Hipercard Pagseguro;10221 em '4 agrupamento'
quando '3 agrupamento' for Cartão de Débito e '4 agrupamento' = vázio faça = Cart Maestro Pagseguro;10221 em '4 agrupamento'

DEBITO
Conta a 'DEBITO' = '10221' para 'Cartão de Crédito' e 'Cartão de Débito'.

18/04/2022
DESCRIÇÃO
quando 'DESCRIÇÃO' = "RC*" a conta a 'CRÉDITO' = 31472

19/04/2022
Obs.:1- Retirar as aspas no CSV de saida.
Obs.:2- Não salvar o CSV com os titulos das colunas.

05/05/2022
Acrescentar as iformações da coluna '4. agrupamento' antes da 'HISTORICO'.
Salvar o CSV separado por ; para Excel.

06/05/2022
Excluir as iformações da coluna '4. agrupamento' antes da 'HISTORICO'.
O '10.01' fica depois da coluna 'VALOR' não componhe a coluna 'HISTORICO'

---------------------------------------------------------------

3 agrupamento
DUPLICATA = 10265
CRÉDITO BANCÁRIO = 10265
CHEQUE A VISTA = 10267

4 agrupamento
L880cofre
Cart Credito Devolução = 91392315
Carteira Cobrança Simples = 45534
Cart Credito Garantia = 344640
Cart Fortbrasil = 511077
Cart American Express Pagseguro = 10225
Cart Elo Credito Pagseguro = 45764
Cart Visa Credito Pagseguro = 45764
Cart Elo Debito  Pagseguro = 45764
Cart Visa Eletron Pagseguro = 45764
Cart Hipercard Pagseguro = 10221
Cart Mastercard Pagseguro = 10221
Cart Hiper Crédito Pagseguro = 10221
Cart Stone Hipercard = 10221
Cart Maestro Pagseguro = 10221
----------------------------------
-Uma dúvida o "4o. Agrupamento" você utiliza?
--é extamente no grupo 4 que vem as contas
veja:
Cart Fortbrasil;511077
o nome "Cart Fort brasil", passamos pra maiúsculo e colocamos como 1 histórico
após o código 10.01
a conta que vem ao lado do nome a gente separa e cola na conta a débito logo após a data
-
tipos de excessões que poderão vir no grupo3
DPL - 10265
CRÉDITO BANCÁRIO - 10265
CHEQUE  - 10267
--------------------------------06/05/2022-----------------------------------------
-quando 4o. Agrupamento = Carteira Cobrança Simples E 3o. Agrupamento = Dinheiro
faça DEBITO = 45534

-quando 3o. Agrupamento = Cheque à vista FACA EM 4o. Agrupamento = CHEQUE A VISTA + CLIENTE

quando 4o. Agrupamento = Carteira Cobrança Simples E 3o. Agrupamento = Crédito Bancário faça DEBITO = 10265 

E FAÇA no 4o. Agrupamento = CREDITO BANCARIO + CLIENTE

faltando no DEBITO 10265
Que deve trazer no hist.p1 CREDITO BANCARIO + CLIENTE

deve-se fazer uma escrita = ao DEBITO 10267
-------------
NA SUA COLUNA DE DEBITO QUANDO FIZER O FILTRO NA LOJA 880 TEM QUE TER AS SEGUINTES CONTAS
--DEBITO--
1- 10221
2- 10225
3- 10265
4- 10267
5- 45534
6- 45764
7- 344640
8- 511077
8- 91392315
-------------

widgets.FileUpload(
    accept='',  # Accepted file extension e.g. '.txt', '.pdf', 'image/*', 'image/*,.pdf'
    multiple=False  # True to accept multiple files upload else False
)
---
button = widgets.Button(  
    description='Converter CSV',  
)  
button 
---
    title_textbox = widgets.Text(  
        value = '',  
        description = 'Title:',  
    )  
    title_textbox  