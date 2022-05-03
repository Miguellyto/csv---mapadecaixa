Obs.:
O CSV_Editor é um execultável feito em Python3.10.4 para rodar em sistemas windows. Ao execultar em um sistema desatualizado pode gerar
o seguinte erro de DLL ausente:

"O programa não pode ser iniciado porque está faltando api-ms-win-core-path-l1-1-0.dll no seu computador. tente resinsta-lo" 

SOLUÇÃO:
baixe a atualização referente ao sistema onde será excultado o App e instale.

https://support.microsoft.com/pt-br/topic/atualiza%C3%A7%C3%A3o-para-o-universal-c-runtime-no-windows-c0514201-7fe6-95a3-b0a5-287930f3560c


Windows SDK: 
Para que o aplicativo construído seja executado em versões anteriores do Windows. Isso é permitido pela licença do SDK do Windows 10, em "Arquivos Distribuíveis"

https://github.com/pyinstaller/pyinstaller/issues/1566
https://developer.microsoft.com/en-us/windows/downloads/windows-sdk/

Pos Install Windows SDK
C:\Program Files (x86)\Windows Kits\10\Redist\10.0.22000.0\ucrt\DLLs
C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.UniversalCRT.Debug\10.0.22000.0\Redist\Debug
https://stackoverflow.com/questions/46416221/pyinstaller-distributing-opencv-from-windows-10-to-windows-10-missing-ucrt-dll
https://stackoverflow.com/questions/46416221/pyinstaller-distributing-opencv-from-windows-10-to-windows-10-missing-ucrt-dll

"Instale o Windows Software Development Kit (SDK) para Windows 10 e expanda o arquivo .spec para incluir as DLLs necessárias, consulte "Distribuindo software que usa o CRT Universal" no link acima mencionado, número 6."

- Não consegui fazer isso funcionar, mesmo depois de encontrar as dlls. A "solução" foi apenas usar meu instalador para instalar 
vcredist_x86.exe na máquina do usuário, isso resolveu


[RESOLVIDO] O PROGRAMA NÃO PODE SER INICIADO PORQUE ESTÁ FALTANDO API-MS-WIN
https://www.youtube.com/watch?v=Z8KTL77AcMM

--------------------------------------------
Aparentemente, ao instalar o SDK do Windows 10 ( 1,9 GB ) no Windows 10, você também instalará as DLLs "ausentes" api-ms-win-crt-*que serão encontradas em C:\Program Files\Windows Kits\10\Redist\ucrt. Isso dificilmente é o começo de uma solução. Ninguém vai instalar o SDK apenas para usar o PyInstaller.

Eu olhei para os outros downloads para o UCRT (tanto os KB2999226downloads quanto o VC 2015 redist). As KB2999226atualizações simplesmente não serão executadas no Windows 10. O VC 2015 Redist não instala as DLLs "ausentes" no Windows 10.
--------------------------------------------

Eu recomendaria corrigir esse problema incluindo essas dlls com o PyInstaller para ter uma solução alternativa antes de tentar qualquer outra coisa mais complexa que possa não funcionar. Você então não precisa se preocupar se outra solução não funcionar.

Sugiro esta implementação:

Adicione essas dlls em diretórios./PyInstaller/bootloader/Windows-32/64bit
Tenha essas dlls no repositório do github
python setup.py installem outro sistema operacional não instalará essas dlls e carregadores de inicialização do Windows.
Agrupe essas dlls com .exe congelado ao usar o Windows e o Python 3.5+.