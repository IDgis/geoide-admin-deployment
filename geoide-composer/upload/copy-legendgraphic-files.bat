@echo off
rem -------- INTRO -------
rem This script copies files from one location to the one this script resides in. 
rem Its purpose is to copy legendGraphic files.
rem Start it in the upload folder of the meteor application that is the destination of the files:
rem    copy-legendgraphic-files.bat [folder] 
rem    where folder is the source folder
rem    All files will be copied except the ones in exclude.txt
set OLD_LOCATION_=%1
rem -----------------
rem  check arguments
rem -----------------
rem if OLD_LOCATION_=="" exit 
if "%~1"=="" goto usage
goto ok
:usage
echo Kopieert bestanden van een folder naar de huidige lokatie.
echo Gebruik:
echo   copy-legendgraphic-files.bat [folder] 
echo bijvoorbeeld 
echo   copy-legendgraphic-files.bat C:\geoide-composer-test\upload 
EXIT /B 1
:ok
rem -----------------
@echo copy files from '%OLD_LOCATION_%' to '.' :
XCOPY  %OLD_LOCATION_% . /Y /EXCLUDE:exclude.txt
