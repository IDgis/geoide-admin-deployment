@echo off
rem ---------------------
rem Mongo DB backup
rem can be used in Windows
rem task scheduler
rem ---------------------
rem Mongo dump command 
rem dump a specific database 
rem ---------------------
rem Check parameters
set MD_DESTINATION_FOLDER=%1
set MD_SOURCE_DB=%2
if "%~1"=="" goto usage
if "%~2"=="" goto usage
goto ok
:usage
echo Gebruik:
echo  mongo-backup.bat [folder voor database backup] [database naam]
echo  bijvoorbeeld mongo-backup.bat C:\backup\geoide-composer geoide-composer1 
EXIT /B 1
:ok
mongodump --host localhost:27017 --db %MD_SOURCE_DB% --out %MD_DESTINATION_FOLDER%
rem =====================
rem Check
dir %MD_DESTINATION_FOLDER%\%MD_SOURCE_DB%
