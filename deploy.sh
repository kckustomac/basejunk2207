mkdir /site/jtkc/
echo DEPLOY OUTPUT LOL > /site/jtkc/DEPLOY.LOG

ECHO. >> /site/jtkc/DEPLOY.LOG
ECHO. >> /site/jtkc/DEPLOY.LOG
   PATH >> /site/jtkc/DEPLOY.LOG
ECHO. >> /site/jtkc/DEPLOY.LOG
ECHO. >> /site/jtkc/DEPLOY.LOG
   SET >> /site/jtkc/DEPLOY.LOG
ECHO. >> /site/jtkc/DEPLOY.LOG
ECHO. >> /site/jtkc/DEPLOY.LOG

PATH
SET

set WEBSITE_SITE_NAME=innovationchallenge
set WEBSITE_CRASHMONITORING_ENABLED=true
set WEBSITE_SCM_ALWAYS_ON_ENABLED=1
set PORT=7777
set WEBSITE_HTTPLOGGING_ENABLED=1
set APPSERVICEAPPLOGS_TRACE_LEVEL=1

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

ECHO. >> /site/jtkc/DEPLOY.LOG
ECHO. >> /site/jtkc/DEPLOY.LOG
  npm config >> /site/jtkc/DEPLOY.LOG
ECHO. >> /site/jtkc/DEPLOY.LOG
ECHO. >> /site/jtkc/DEPLOY.LOG





npm start

