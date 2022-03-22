https://pypi.org/project/pyinstaller/

pip install pyinstaller

Entre na pasta e digite o comando: 

# pyinstaller app.pyw --onefile

Obs.:
--onefile (dois traços e depois a palavra "onefile").
ele transforma tudo num arquivo só (e um terço de tamanho. Fica bem menor. O meu programa de 16MB caiu para 6.5MB)

cx-Freeze
pip install cx-Freeze
https://pypi.org/project/cx-Freeze/
------------------------------------------------
No prompt de comando, utilize as instruções abaixo de acordo com sua necessidade:
Para inicializar: net start “nome do serviço”
Para parar: net stop “nome do serviço”
Para pausar: net pause “nome do serviço”
Para continuar um serviço pausado: net continue “nome do serviço”
--------------------------------------------------
Instalando Ambiente virtual:
virtualenv venv
python3 -m venv --upgrade Flask
.\venv\Scripts\Activate
activate env
--------------------------------------------------
Tkinter, abrir apenas interface gráfica
Basta salvar seu arquivo com a extensão ".pyw" em vez de ".py". (isso é só no Windows - nos outros sistemas um programa Python executado pela interface gráfica não abre um terminal automaticamente)