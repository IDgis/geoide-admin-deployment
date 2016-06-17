# Geoide admin
## meteorjs
Geoide admin is gebouwd met meteorjs.   

## Installatie
###Algemeen 
DEV - ontwikkel machine  
TEST / ACC / PROD - test, acceptatie, productie machines  

### Development machine DEV

### Windows TEST/ACC/PROD doel machine

#### Voorbereiding
Voor de volgende onderdelen dienen folders aangemaakt te worden.  
    *Mongo data en logs*  
    *Windwos service manager*   
 	*Geoide-admin deployment*  

Zie folderstructuur hieronder  

#### Installeren basis programma's   
 * meteor - develop/runtime omgeving  
 https://www.meteor.com/install  
 Volg instructies voor Windwos.  
 Wordt lokaal geinstalleerd voor de ingelogde gebruiker:  
 C:\Users\geoideadmin\AppData\Local\.meteor\meteor.bat   
   
 * mongoDB - NoSQL database systeem   
 https://www.mongodb.com/download-center#community       
 Download msi for version 2.x.x (2.6.12) for Windows server R2   
 Full installation     
 maak een mongoDB service als volgt   
 In C:\Program Files\MongoDB 2.6 Standard\bin   
   mongod --config  C:\MongoDB\mongo.config --install   
   
 * NSSM - Windows Service Manager   
 https://nssm.cc/   
 Download nssm 2.24 (2014-08-31) zip bestand   
 Zip uitpakken in C:\Programs\   
   service toevoegen met C:\Programs\nssm-2.24\win64\nssm.exe install   
   Bekijk nssm-install-meteor-service.bat voor instructies   
 
#### Folder structuur na voorbereiding en installatie
 
 	*meteor runtime omgeving*   
 	C:\Users\USER\AppData\Local\.meteor   
 	meteor.bat wordt gebruikt om applicatie op te starten in een node js omgeving en te verbinden met een Mongo database.   
 	
    *Mongo database applicatie*   
    Centrale Mongo applicatie waar alle meteor applicaties mee kunnen verbinden   
    
    C:\Program Files   
     |-- MongoDB 2.6 Standard 
     
    *Mongo data en logs*
    Database en logfiles van mongo db
    
    C:\MongoDB
     |   mongo.config
     |-- data
     |-- logs
   
    *Windwos service manager* 
    Om een meteor applicatie als Windows service te kunnen installeren
    
    C:\Programs
     |-- nssm-2.2.4
  
 	*Geoide-admin deployment*
 	De geoide-admin applicaties voor verschillende klanten en OTAP versies 
 	
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
     

#### Hulp programma's
##### config
 * mongo configuratie   
   *mongo.config* bevat de mongo data en log directories   
   wordt gebruikt bij opstarten van mongo als service   

##### scripts
 * specifieke meteor deployement als service starten   
   *nssm-install-meteor-service.bat*   
   start C:\Programs\nssm-2.24\win64\nssm.exe install en vul onderdelen in zoals in het bat bestand aangegeven.   
	
    gebruik   
  	TBD   
    
	verificatie   
	kijk of de service onder de opgegeven naam is geinstalleerd (Windows beheer, services)   
	start de service en ga met een browser naar http://localhost:METEOR_PORT   
	
   
 * build (DEV)    
  *build-ga.bat*   
  batch bestand om build voor juiste omgeving (TEST/ACC/PROD) te maken   
  
  gebruik:   
  	TBD   
    
 * deploy  (TEST/ACC/PROD)   
   *deploy-ga.bat*   
   batch bestand om zip file uit te pakken en voor TEST/ACC/PROD te 'installeren'    

  gebruik:   
  	TBD   
    

#### build / deploy / run cyclus
 * build    
 
   DEV> *build-ga.bat*   
   meteor build <output-directory>   
   resultaat: <output-directory>\geoide-admin.tar.gz   
   rename als geoide-admin-TAGNR.tar.gz   
   kopieer dit bestand naar de doel machine op C:\geoide-admin\deployment   
   
   !!  Dit werkt niet onder Windows !!   
   Een bestand gemaakt met "meteor build" of "demeteorizer" is niet met 'node' of 'meteor' op te starten   
   
   Dus zip de development code, zonder .git, .project, .settings, .meteor (??), node-modules (??)   
      
 * deploy   
 
   kopieert de tar.gz file naar de doel folder op machine (TEST/ACC/PROD)   
   
   TEST>  *deploy-ga.bat* geoide-admin.tar.gz  TEST | ACC | PROD   
   
   bijv. in C:\geoide-admin\deployment\TEST    
   staat dan de meteor app om met de service te starten   
   of in dos prompt met commando "meteor"   
   
    
 * run   
  
   meteor als service uitvoeren, dit is mogelijk met nssm en script "nssm-install-meteor-service.bat".   
   
   dit is eenmalig uit te voeren: voor elke omgeving of klant een service   
   
   daarna kan de service gestopt of gestart worden op de standaard Windows wijze    
   
 * database  (TEST/ACC/PROD)   
 
   backup / restore batch bestanden voor TEST/ACC/PROD    
   
   

### Linux
Meteor Up mupx.   

Zie https://github.com/arunoda/meteor-up     

### Galaxy
Commerciele meteor cloud dienst   
  