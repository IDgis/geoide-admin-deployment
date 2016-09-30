@echo off
rem ---------------------
rem Mongo DB restore
rem can be used in Windows
rem task scheduler
rem ---------------------
rem Mongo restore command 
rem restores a dump to specific database 
rem ---------------------
rem Check parameters
set MR_SOURCE_FOLDER=%1
set MR_DESTINATION_DB=%2
if "%~1"=="" goto usage
if "%~2"=="" goto usage
goto ok
:usage
echo Gebruik:
echo  mongo-restore.bat [folder van database backup] [database naam]
echo  bijvoorbeeld mongo-restore.bat C:\backup\geoide-admin\geoide-admin1 geoide-admin1 
echo  NB: de bestaande database wordt overschreven met de inhoud van de backup
EXIT /B 1
:ok
mongorestore --host localhost:27017 --drop --db %MR_DESTINATION_DB% %MR_SOURCE_FOLDER%
rem =====================
