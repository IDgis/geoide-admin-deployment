@echo off
rem -------- INTRO -------
rem This script can be run  
rem to install a meteor service with NSSM (https://nssm.cc/)
rem run it from the nssm command location (e.g. C:\Programs\nssm-2.24\win64) 
rem -----------------
rem  check arguments
rem -----------------
rem if METEOR_MAIN_FOLDER_=="" exit 
if "%~1"=="" goto usage
rem if METEOR_PROGRAM_NAME_=="" exit 
if "%~2"=="" goto usage
rem if METEOR_PORT_=="" exit 
if "%~3"=="" goto usage
goto ok
:usage
echo Gebruik:
echo  nssm-install-meteor-service.bat [lokatie meteor installaties] [meteor programma naam] [meteor poort]
echo  Hier is de programma naam (2e argument) een subfolder van de (hoofd)lokatie (1e argument).
echo  De service naam en database naam worden hetzelfde als de programma naam
echo  Voorbeelden:
echo  1. bij installatie op C:\geoide-composer-test\
echo        nssm-install-meteor-service.bat  C:  geoide-composer-test  3010
echo     de service en database naam is dan 'geoide-composer-test'
echo  2. bij installatie op C:\geoide-composer\live\
echo        nssm-install-meteor-service.bat  C:\geoide-composer  live  3020
echo     de service en database naam is dan 'live'
echo  Kies meteor poorten uit de reeks 3010, 3020, 3030 etc.
echo  Elk meteor programma krijgt een uniek poort nummer
EXIT /B 1
:ok
rem -----------------
set METEOR_MAIN_FOLDER_=%1
rem install folder = program name = service name = database name:
set METEOR_PROGRAM_NAME_=%2 
set MONGO_DB_NAME_=%2
rem prefix needed for service name? e.g. meteor_%SERVICE_NAME_%
set SERVICE_NAME_=%2
set METEOR_PORT_=%3
rem programma lokatie nssm relatief t.o.v. deze bat file
set NSSM_=nssm-2.24\win64\nssm.exe
rem install service and set parameters
%NSSM% install %SERVICE_NAME_% %METEOR_MAIN_FOLDER_%\%METEOR_PROGRAM_NAME_%\nssm\nssm-start-meteor-service.bat %METEOR_PORT_% %MONGO_DB_NAME_%  
%NSSM% set %SERVICE_NAME_% AppDirectory %METEOR_MAIN_FOLDER_%\%METEOR_PROGRAM_NAME_%\meteor
%NSSM% set %SERVICE_NAME_% DisplayName %METEOR_PROGRAM_NAME_%
%NSSM% set %SERVICE_NAME_% Description "Meteor service %METEOR_PROGRAM_NAME_%"
%NSSM% set %SERVICE_NAME_% Start SERVICE_AUTO_START
rem %NSSM% set %SERVICE_NAME_% ObjectName LocalSystem
%NSSM% set %SERVICE_NAME_% AppStdout %METEOR_MAIN_FOLDER_%\%METEOR_PROGRAM_NAME_%\logs\out.log
%NSSM% set %SERVICE_NAME_% AppStderr %METEOR_MAIN_FOLDER_%\%METEOR_PROGRAM_NAME_%\logs\err.log
rem Now start the service
%NSSM% start %SERVICE_NAME_% 
