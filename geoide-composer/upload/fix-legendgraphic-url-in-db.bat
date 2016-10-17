@echo off
rem -------- INTRO -------
rem This script fixes the legendgraphic url's of a Geoide Composer mongo database. 
rem Start it in the \bin folder of the mongo application if the mongo command is not on the PATH.
rem    fix-legendgraphic-url-in-db.bat [Mongo database name] [old Url] [new Url] 
set DB_NAME_=%1
set OLD_URL_=%2
set NEW_URL_=%3
rem -----------------
rem  check arguments
rem -----------------
rem if DB_NAME_=="" exit 
if "%~1"=="" goto usage
rem if OLD_URL_=="" exit 
if "%~2"=="" goto usage
rem if NEW_URL_=="" exit 
if "%~3"=="" goto usage
goto ok
:usage
echo Repareert legendgraphic url's in de database van deze applicatie.
echo Gebruik:
echo   fix-legendgraphic-url-in-db.bat  [database]  [oude url]  [nieuwe url]  
echo bijvoorbeeld 
echo   fix-legendgraphic-url-in-db.bat  geoide-composer-test  localhost:3000  localhost:3010 
EXIT /B 1
:ok
rem -----------------

echo mongo db=%DB_NAME_%, replace '%OLD_URL_%' with '%NEW_URL_%'
mongo %DB_NAME_% --eval "db.layers.find({}).forEach(function(e) {e.service_layers.forEach(function(sl){sl.legendGraphic=sl.legendGraphic.replace('%OLD_URL_%','%NEW_URL_%');});db.layers.save(e);});"
