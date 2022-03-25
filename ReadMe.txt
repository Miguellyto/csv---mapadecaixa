https://pypi.org/project/pyinstaller/

pip install pyinstaller

Entre na pasta e digite o comando: 
# pyinstaller app.pyw --onefile

Obs.:
--onefile (dois traços e depois a palavra "onefile").
ele transforma tudo num arquivo só (e um terço de tamanho. Fica bem menor. O meu programa de 16MB caiu para 6.5MB).
--Tkinter, abrir apenas interface gráfica
Basta salvar seu arquivo com a extensão ".pyw" em vez de ".py". (isso é só no Windows - nos outros sistemas um programa Python executado pela interface gráfica não abre um terminal automaticamente)
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

