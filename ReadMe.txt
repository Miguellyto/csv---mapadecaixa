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
--------------------------------------------------
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
--------------------------------------------------

3 agrupamento
quando for DUPLICATA a conta "DEBITO" = 10265
quando for CRÉDITO BANCÁRIO a conta "DEBITO" = 10265
quando for CHEQUE A VISTA a conta "DEBITO" = 10267

4 agrupamento
quando for "Carteira Cobrança Simples" a conta "DEBITO" = 45534
quando for "Cart Credito Garantia" a conta "DEBITO" = 344640

DESCRIÇÃO
quando na DESCRIÇÃO = "RC*" a conta a CRÉDITO = 31472