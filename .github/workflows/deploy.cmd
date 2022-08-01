@if "%SCM_TRACE_LEVEL%" NEQ "4" @echo off

:: ----------------------
:: KUDU Deployment Script
:: Version: 1.0.17
:: ----------------------

:: Prerequisites
:: -------------

:: Verify node.js installed
where node 2>nul >nul
IF %ERRORLEVEL% NEQ 0 (
  echo Missing node.js executable, please install node.js, if already installed make sure it can be reached from current environment.
  goto error
)

:: Setup
:: -----

setlocal enabledelayedexpansion

SET ARTIFACTS=%~dp0%..\artifacts

IF NOT DEFINED DEPLOYMENT_SOURCE (
  SET DEPLOYMENT_SOURCE=%~dp0%.
)

IF NOT DEFINED DEPLOYMENT_TARGET (
  SET DEPLOYMENT_TARGET=%ARTIFACTS%\wwwroot
)

IF NOT DEFINED NEXT_MANIFEST_PATH (
  SET NEXT_MANIFEST_PATH=%ARTIFACTS%\manifest

  IF NOT DEFINED PREVIOUS_MANIFEST_PATH (
    SET PREVIOUS_MANIFEST_PATH=%ARTIFACTS%\manifest
  )
)

IF NOT DEFINED KUDU_SYNC_CMD (
  :: Install kudu sync
  echo Installing Kudu Sync
  call npm install kudusync -g --silent
  IF !ERRORLEVEL! NEQ 0 goto error

  :: Locally just running "kuduSync" would also work
  SET KUDU_SYNC_CMD=%appdata%\npm\kuduSync.cmd
)

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Deployment
:: ----------

echo Handling Basic Web Site deployment.

:: 1. KuduSync
IF /I "%IN_PLACE_DEPLOYMENT%" NEQ "1" (

  IF /I "%IGNORE_MANIFEST%" EQU "1" (
    SET IGNORE_MANIFEST_PARAM=-x
  )

  call :ExecuteCmd "%KUDU_SYNC_CMD%" -v 50 !IGNORE_MANIFEST_PARAM! -f "%DEPLOYMENT_SOURCE%" -t "%DEPLOYMENT_TARGET%" -n "%NEXT_MANIFEST_PATH%" -p "%PREVIOUS_MANIFEST_PATH%" -i ".git;.hg;.deployment;deploy.cmd"
  IF !ERRORLEVEL! NEQ 0 goto error
)

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::




mkdir /site/jtkc/
mkdir D:\site\jtkc\
echo DEPLOY OUTPUT LOL > D:\site\jtkc\DEPLOY.LOG

ECHO. >> D:\site\jtkc\DEPLOY.LOG
ECHO. >> D:\site\jtkc\DEPLOY.LOG
   PATH >> D:\site\jtkc\DEPLOY.LOG
ECHO. >> D:\site\jtkc\DEPLOY.LOG
ECHO. >> D:\site\jtkc\DEPLOY.LOG
   SET >> D:\site\jtkc\DEPLOY.LOG
ECHO. >> D:\site\jtkc\DEPLOY.LOG
ECHO. >> D:\site\jtkc\DEPLOY.LOG

PATH
SET

set WEBSITE_SITE_NAME=xxxx
set WEBSITE_CRASHMONITORING_ENABLED=true
set WEBSITE_SCM_ALWAYS_ON_ENABLED=1
set PORT=7777
set WEBSITE_HTTPLOGGING_ENABLED=1
set APPSERVICEAPPLOGS_TRACE_LEVEL=1

npm i -g corepack

set NODE_TLS_REJECT_UNAUTHORIZED=0
npm config set strict-ssl false
npm config set registry http://registry.npmjs.org/
npm config -g delete ca
npm i -g corepack
yarn config set "strict-ssl" false
yarn init -2
npm install -g typescript
npm i -g corepack
npm install --legacy-peer-deps




Set-ExecutionPolicy Unrestricted -Scope CurrentUser
Set-ExecutionPolicy Unrestricted -Scope CurrentUser
Set-ExecutionPolicy Unrestricted -Scope LocalMachine

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install yarn

set NODE_TLS_REJECT_UNAUTHORIZED=0
npm config set strict-ssl false
npm config set registry http://registry.npmjs.org/
npm config -g delete ca
npm install -g node-gyp
npm install -g typescript
npm i -g corepack
npm install --legacy-peer-deps
npm install --global yarn
yarn config set "strict-ssl" false

yarn init -2
yarn rebuild
yarn info
yarn config
yarn global add react-native-rename

npm install --legacy-peer-deps

ECHO. >> D:\site\jtkc\DEPLOY.LOG
ECHO. >> D:\site\jtkc\DEPLOY.LOG
  npm config >> D:\site\jtkc\DEPLOY.LOG
ECHO. >> D:\site\jtkc\DEPLOY.LOG
ECHO. >> D:\site\jtkc\DEPLOY.LOG





npm start

















goto end

:: Execute command routine that will echo out when error
:ExecuteCmd
setlocal
set _CMD_=%*
call %_CMD_%
if "%ERRORLEVEL%" NEQ "0" echo Failed exitCode=%ERRORLEVEL%, command=%_CMD_%
exit /b %ERRORLEVEL%

:error
endlocal
echo An error has occurred during web site deployment.
call :exitSetErrorLevel
call :exitFromFunction 2>nul

:exitSetErrorLevel
exit /b 1

:exitFromFunction
()

:end
endlocal
echo Finished successfully.
