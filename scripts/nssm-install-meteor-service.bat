@echo off
rem -------- INTRO -------
rem This script can be run standalone 
rem to start a meteor instance for an application:
rem   Start it in the folder of the meteor application:
rem   nssm-install-meteor-service.bat [Meteor poort] [Mongo database naam]
rem or 
rem as the script in a NSSM service installation:
rem   Start 'nssm install' and fill in the fields described below
rem v---v NSSM v---v
rem https://nssm.cc/
rem nssm install (starts GUI with Admin rights)
rem Application\Path this script
rem Application\startup directory meteor build e.g. C:\geoide-admin\deployment\TEST\
rem Application\service name e.g. geoide-admin-TEST
rem Application\Arguments: METEOR_PORT_  MONGO_DB_NAME_  
rem   e.g. 3010 geoide-admin-TEST  
set METEOR_PORT_=%1
set MONGO_DB_NAME_=%2
set MONGO_PORT_=27017
rem Details\display name e.g. geoide-admin-TEST
rem Details\description
rem Startup type e.g. manual
rem Login\Log on as the User that installed meteor
rem IO\Output stdout choose C:\geoide-admin\logs\TEST\out.log
rem IO\Error stderr choose C:\geoide-admin\logs\TEST\err.log
rem ^---^ NSSM ^---^
rem -----------------
rem  check arguments
rem -----------------
rem if METEOR_PORT_=="" exit 
if "%~1"=="" goto usage
rem if MONGO_DB_NAME_=="" exit 
if "%~2"=="" goto usage
goto ok
:usage
echo Gebruik:
echo  nssm-install-meteor-service.bat [Meteor poort] [Mongo database naam]
echo  bijvoorbeeld nssm-install-meteor-service.bat 3010 geoide-composer-test 
EXIT /B 1
:ok
rem -----------------
set MONGO_URL=mongodb://localhost:%MONGO_PORT_%/%MONGO_DB_NAME_%
set PORT=%METEOR_PORT_%
set ROOT_URL=http://localhost:%PORT%
@echo Start meteor, METEOR_URL=%ROOT_URL%
@echo MONGO_URL=%MONGO_URL% 
meteor --port %PORT% --settings ./settings.json

