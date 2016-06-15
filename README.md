# Geoide admin
## meteorjs

### Installatie
Algemeen 
DEV - ontwikkel machine
TEST / ACC / PROD - test, acceptatie, productie machines

#### Windows
##### Installeren basis programma's op TEST/ACC/PROD 
 * meteor
 ACC>    
   
 * mongoDB
 ACC> 
 
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
   DEV> build-ga
   meteor build <output-directory>
   resultaat: geoide-admin.tar.gz
 * deploy
   kopieert de tar.gz file naar de doel machine (TEST/ACC/PROD)
   ACC> deploy-ga geoide-admin.tar.gz  TEST | ACC | PROD 
 * run 
   (zal tezijnertijd vervangen worden als deployment voor Windows automatisch kan worden uitgevoerd)
   stopt de huidige run van meteor
   ACC> stop-ga TEST | ACC | PROD
   voert het commando meteor uit op de opgegeven omgeving (TEST/ACC/PROD) 
   ACC> run-ga TEST | ACC | PROD
   
   Deze commands veronderstellen een DOS prompt en een ingelogde gebruiker.
   Beter scenario is meteor als service uit te voeren, dit is (nog) niet mogelijk.
   Alternatief is om run-ga in Windows taakplanner te starten.
   

#### Linux
Meteor Up mupx.

Zie https://github.com/arunoda/meteor-up  

#### Galaxy
Commerciele meteor cloud dienst
  