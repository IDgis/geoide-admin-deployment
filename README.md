# Geoide admin
## meteorjs

### Installatie
Algemeen 
DEV - ontwikkel machine
TEST / ACC / PROD - test, acceptatie, productie machines

#### Windows TEST/ACC/PROD machine
##### Folder structuur 
 
    C:\Program Files
     |-- MongoDB 2.6 Standard
     
    C:\Programs
     |-- nssm-2.2.4
  
    C:\MongoDB
     |   mongo.config
     |-- data
     |-- logs
   
 
    C:\geoide-admin
     |
     |-- deployment [tar.gz files]
     |    |
     |    |-- TEST [meteor build structure, from tar.gz]
     |    |-- ACC
     |
     |-- logs [logs van service (stdout, stderr)]
     |    |
     |    |-- TEST
     |    |-- ACC
     |
     |-- tools [scripts]
     |     deploy-ga.bat
     |     nssm-install-meteor-service.bat
     

##### Installeren basis programma's   
 * meteor
 https://www.meteor.com/install
 
   
 * mongoDB
 https://www.mongodb.com/download-center#community    
 Download msi for version 2.x.x (2.6.12) for Windows server R2
 Full installation  
 maak een mongoDB service als volgt
 In C:\Program Files\MongoDB 2.6 Standard\bin
   mongod --config  C:\MongoDB\mongo.config --install
   
 * NSSM (Windows Service Manager)
 https://nssm.cc/
 Download nssm 2.24 (2014-08-31) zip bestand
 Zip uitpakken in C:\Programs\
   service toevoegen met C:\Programs\nssm-2.24\win64\nssm.exe install
   Zie nssm-install-meteor-service.bat voor instructies
 
##### Hulp programma's
 * build (DEV) 
  batch bestand om build voor juiste omgeving (TEST/ACC/PROD) te maken  
 * deploy  (TEST/ACC/PROD)
   batch bestand om zip file uit te pakken en voor TEST/ACC/PROD te 'installeren' 
 * startup  (TEST/ACC/PROD)
     batch bestand om TEST/ACC/PROD te starten
 * database  (TEST/ACC/PROD)
 
 backup / restore batch bestanden voor TEST/ACC/PROD 
   
##### build / deploy / run cyclus
 * build 
 
   DEV> build-ga.bat
   meteor build <output-directory>
   resultaat: <output-directory>\geoide-admin.tar.gz
   rename als geoide-admin-<TAGNR>.tar.gz
   kopieer dit bestand naar de doel machine op C:\geoide-admin\deployment
   
   !!  Dit werkt niet onder Windows !!
   Een bestand gemaakt met "meteor build" of "demeteorizer" is niet met 'node' of 'meteor' op te starten
   
   Dus zip de development code, zonder .git, .project, .settings, .meteor (??), node-modules (??)
      
 * deploy
 
   kopieert de tar.gz file naar de doel folder op machine (TEST/ACC/PROD)
   
   TEST>  deploy-ga.bat geoide-admin.tar.gz  TEST | ACC | PROD
   
   bijv. in C:\geoide-admin\deployment\TEST 
   staat dan de meteor app om met de service te starten
   of in dos prompt met commando "meteor"
   
    
 * run
  
   meteor als service uitvoeren, dit is mogelijk met nssm en script "nssm-install-meteor-service.bat".
   
   dit is eenmalig uit te voeren: voor elke omgeving of klant een service
   
   daarna kan de service gestopt of gestart worden
   
   

#### Linux
Meteor Up mupx.

Zie https://github.com/arunoda/meteor-up  

#### Galaxy
Commerciele meteor cloud dienst
  