@echo off
cls

set /P user=User-Name (Default = dev): || set user=dev
set /P roleSessionName=Role-Session-Name (Default = devsession): || set roleSessionName=devsession
set /P expiration=Duracao (Default = 900): || set expiration=900
set /P region=Region (Default = us-east-1): || set region=us-east-1

set profileName=%user%-user
set roleName=%user%-role
set ROLE_SESSION_FULL_NAME=%roleSessionName%_aws_cli

for /f "delims=" %%a in ('aws sts get-caller-identity --query Account --output text') do @set AWS_ACCOUNT=%%a 

set AWS_ACCOUNT=%AWS_ACCOUNT: =%

aws sts assume-role --role-arn "arn:aws:iam::%AWS_ACCOUNT%:role/%roleName%" --role-session-name "%ROLE_SESSION_FULL_NAME%" --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken,Expiration]" --duration-seconds %expiration% --output text > temp.txt
set /p TEMP_ROLE=<temp.txt

for /f "tokens=1,2,3,4 delims=	" %%a in (temp.txt) do (
  setx AWS_ACCESS_KEY_ID %%a
  setx AWS_SECRET_ACCESS_KEY %%b
  setx AWS_SESSION_TOKEN %%c
  setx AWS_SESSION_EXPIRATION %%d
)

setx AWS_DEFAULT_REGION %region%

del temp.txt

set /p DUMMY=AssumeRole efetuado com sucesso ! Pressione ENTER para fechar a tela...

cls