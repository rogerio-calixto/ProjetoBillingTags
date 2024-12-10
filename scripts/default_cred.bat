@echo off

setx AWS_ACCESS_KEY_ID ""
setx AWS_SECRET_ACCESS_KEY ""
setx AWS_SESSION_TOKEN ""
setx AWS_SESSION_EXPIRATION ""
setx AWS_DEFAULT_REGION ""

cls

echo .
set /P defaultAccessKey=AccessKey default: 
set /P defaultSecretKey=SecretKey default: 
setx AWS_ACCESS_KEY_ID %defaultAccessKey%
setx AWS_SECRET_ACCESS_KEY %defaultSecretKey%

echo cls

set /p DUMMY=Credencial default aplicada com sucesso ! Pressione ENTER para fechar a tela...

cls

@echo on