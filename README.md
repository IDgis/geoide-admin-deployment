# Geoide admin
## meteorjs
Geoide admin is gebouwd met meteorjs.   

## Installatie
###Algemeen 
DEV - ontwikkel machine  
TEST / ACC / PROD - test, acceptatie, productie machines  

Conventie voor naamgeving   
  Windows service: geoide-admin-SERVICE_NAAM       
    bijv: geoide-admin-*test* geoide-admin-*klant1*      
  
  Github release artifact:       
    geoide-admin-*TAG*.tar.gz   

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
	*Application\Path* the path of the nssm-install-meteor-service.bat script   
	*Application\startup directory* meteor build e.g. C:\geoide-admin\deployment\TEST\   
	*Application\service name* e.g. geoide-admin-test   
	*Application\Arguments* METEOR_PORT_  MONGO_DB_NAME_  < <empty> | MONGO_PORT_NR >   
	  e.g. 3010 geoide-admin-test  27017   
	*Details\display name* e.g. geoide-admin-test   
	*Details\description*   
	*Startup type* e.g. manual   
	*Login\Log* on as the User that installed meteor   
	*IO\Output stdout* choose C:\geoide-admin\logs\TEST\out.log   
	*IO\Error stderr* choose C:\geoide-admin\logs\TEST\err.log   
    
	verificatie   
	kijk of de service onder de opgegeven naam is geinstalleerd (Windows beheer, services)   
	start de service en ga met een browser naar http://localhost:METEOR_PORT   
	

#### build / deploy / run cyclus
##### Algemeen
   SERVICE = als in geoide-admin-SERVICE (test, klant-1-acc, ...)    
   TAG = als in geoide-admin-TAG.tar.gz (bijv. *0.0.0* in geoide-admin-0.0.0.tar.gz)   

##### build (DEV)    

	Maak een release in github,    
	gebruik een tag als "0.0.0"   	
         
##### deploy  (TEST/ACC/PROD)   
   
   Stop de service geoide-admin-SERVICE
   
   Maak folder C:\geoide-admin\deployment\SERVICE\ leeg   
   
   Download de gewenste release op https://github.com/IDgis/geoide-admin/releases  als zip bestand.   
   Kopieer dit naar C:\geoide-admin\deployment      
   Open het bestand met 7z (7zFM.exe)   
   Extract de inhoud (folder geoide-admin-TAG) naar C:\geoide-admin\deployment\SERVICE\   
   
   Kopieer met Windows Explorer de *inhoud* van folder geoide-admin-TAG naar de parent folder C:\geoide-admin\deployment\SERVICE   
   De lege folder blijft staan   
   
  In deployment folder structuur:   
	   C:\geoide-admin
	     |
	     |-- deployment 
	          |  geoide-admin-*TAG*.tar.gz
	          |
	          |-- *SERVICE_NAAM* 
	                 |
	                 |-- geoide-admin-TAG\ 
	                 |...

  
  Start de service geoide-admin-SERVICE   
  
  N.B.   
  De folder(naam) geoide-admin-TAG kan gebruikt worden om de tag versie zichtbaar te maken in het beheer programma.   
    
 * run   
  
   meteor als service uitvoeren, dit is mogelijk met nssm en script "nssm-install-meteor-service.bat".   
   
   dit is eenmalig uit te voeren: voor elke omgeving of klant een service   
   
   daarna kan de service gestopt of gestart worden op de standaard Windows wijze    
   
 * database  (TEST/ACC/PROD)   
 
   backup / restore kan uitgevoerd worden met mongo commandos   
     mongodump ...     
     mongorestore ...     
     
       C:\Program Files\MongoDB 2.6 Standard\bin
   
### Linux
Meteor Up mupx.   

Zie https://github.com/arunoda/meteor-up     

### Galaxy
Commerciele meteor cloud dienst   
  