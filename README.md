# Geoide Composer

Geoide Composer is gebouwd met meteorjs (Zie [Meteor](https://www.meteor.com/)).   

## Installatie
### Instructie voor inrichten Windows machine voor Geoide Composer 
De ingelogde gebruiker dient administratie rechten te hebben.   
In deze instructie wordt schijf C:\ als voorbeeld genomen om Geoide Composer in te installeren.   
U kunt hier desgewenst een andere schijf gebruiken.   
Voor het openen en uitpakken van zip bestanden wordt het programma [7-zip](http://www.7-zip.org/) aangeraden.
 
#### Installatieset van Geoide Composer (initieel)
Er moeten 3 zip bestanden worden gedownload.   
- [database](https://github.com/IDgis/mongodb/releases)   
``mongodb-[versieNr].zip`` MongoDB configuratie, data lokatie en scripts    
Deze wordt eenmalig gebruikt voor de initeele MongoDB data structuur.
- [configuratie](https://github.com/IDgis/geoide-admin-deployment/releases):   ``geoide-admin-deployment-[versieNr].zip**`` Geoide Composer configuratie, data en scripts      
Deze wordt gebruikt bij de installatie van elke nieuwe Geoide Composer instantie.
- [programmatuur](https://github.com/IDgis/geoide-admin/releases):  
``geoide-admin-[versieNr].zip**`` Geoide Composer programmatuur   
Deze wordt gebruikt bij het installeren van een nieuwe release van Geoide Composer 

Download bij de opgegeven versie van de release, de zip bestanden onder:   
  **Downloads** 
       *Source code (zip)*    

\*\* De naam de van de zip is die van de het github project *geoide-admin*, de naam van het product is *Geoide Composer*.

#### Installeren basis programma's   
Meteor en Mongo worden eenmalig geinstalleerd voor alle instanties van Geoide Composer. 
#####  *Meteor - develop/runtime omgeving*  

De standaard windows installatie installeert meteor altijd onder de gebruikers account waarmee je bent ingelogd. Dit betekent dat je de meteorservice ook alleen kunt draaien onder dit account. Dit is onwenselijk omdat na bijv het wijzigen van een wachtwoord van deze account de service niet meer automatisch opkomt na een herstart.

  
  [Meteor Installatie](https://www.meteor.com/install), volg de instructies voor Windows.   
  Start InstallMeteor.exe als administrator.  
  Wordt lokaal geinstalleerd voor de ingelogde gebruiker:  
  ``C:\Users\USER\AppData\Local\.meteor\``   
  Sla tijdens installatie de stap 'Create developer account' over.    
  (Geoide Composer is gebouwd met meteor 1.4)  
  
  
   
#####  *mongoDB - NoSQL database systeem*   
  [Mongo](https://www.mongodb.com/download-center#community)       
  Centrale Mongo applicatie waar alle meteor applicaties mee kunnen verbinden   
  Kies *Previous Releases*, versie 2.6.12 en download msi 'versie 2.6.12 for Windows server R2' en volg de instructies:   
  Voer het MSI bestand uit als administrator en kies 'Complete Installation'.  
  ![Mongo 2.6. download](images/mongo26.png)   
  
  Mongo wordt in een van de standaard Windows folders geinstalleerd C:\Program Files of C:\Program Files (x86)   
  
  Aanmaken van folder structuur en starten van MongoDB service.   
   1. Kopieer de folder ``mongodb`` uit ``mongo-[versieNr].zip`` naar een schijf.   
      Het resultaat is dan bijvoorbeeld ``C:\mongodb\``   
      (In de rest van de tekst wordt aangenomen dat de installatie in ``C:\mongodb\`` heeft plaatsgevonden)   
   2. Maak een MongoDB service als volgt:   
    Open een terminal (DOS prompt)als Administrator (run as administrator) en ga naar C:\Program Files\MongoDB 2.6 Standard\bin\   
    Als schijf C: is gekozen als installatie schijf voor de database bestanden, voer uit:   
    ``C:\Program Files\MongoDB 2.6 Standard\bin> mongod --config  C:\mongodb\config\mongo.config --install``   
    Als schijf D: is gekozen als installatie schijf voor de database bestanden :   
    ``C:\Program Files\MongoDB 2.6 Standard\bin> mongod --config  D:\mongodb\config\mongoSchijfD.config --install``   
   3. Open Windows Service beheer en start de service MongoDB.   
    
NB. Als een andere schijf dan C of D of een andere folder wordt gebruikt, dan moeten de paden in mongo.config worden aangepast.


#### Voorbereiding Geoide Composer
 
*Geoide Composer*   
   
Kopieer de folder geoide-composer uit  ``geoide-admin-deployment-[versieNr].zip`` naar een schijf.   
  Het resultaat is dan bijvoorbeeld ``C:\geoide-composer``   


#### Installeren van Geoide Composer
1. Open de programmatuur zip:  ``geoide-admin-[versieNr].zip``   
2. ga naar ``C:\geoide-composer\``
3. kopieer inhoud van zip (onder ``geoide-admin-[versieNr]``, dus niet deze foldernaam zelf) naar ``C:\geoide-composer\meteor\``   
4. Pas de configuratie aan:   

##### Configuratie   
 De configuratie van de geoide-composer staat in het bestand ``C:\geoide-composer\conf\settings.json``     
 Dit bestand heeft de volgende structuur:
 
    {
      "viewer": {
        "reloadConfigUrl": "http://<VIEWER-HOST>:<VIEWER-POORT>/geoide/refresh"
      },
      "legendGraphic": {
        "uploadFolder": "C:/geoide-crs-config/images/"
      },
      "requestcache": {
        "delay" : 600000 
      }
    }

Dit bestand kan gewijzigd worden met een teksteditor zoals Windows kladblok of NotePad++.   
De volgende onderdelen moeten aangepast worden aan de huidige Composer instantie:
  * reloadConfigUrl - dit is de url van de Geoide Viewer.
     ``<VIEWER-HOST>`` is de host naam waarop de Geoide viewer is geïnstalleerd   
     ``<VIEWER-POORT>`` is de poort waarop de Geoide viewer is te benaderen (bijvoorbeeld 9000). Deze kan gevonden worden in de viewer configuratie   
    Geoide Composer roept deze url aan telkens als er iets wordt opgeslagen.    
    Hierdoor blijft de Viewer up-to-date bij wijzigingen met de Composer.   
  * uploadFolder - dit is de folder waar legendGraphic plaatjes, die met de Geoide Composer zijn geüpload, worden bewaard.   
    Het is aan te bevelen om hier de locatie van de images folder van de viewer configuratie te gebruiken bijv   "C:/geoide-crs-config/images/"  (gebruik hier "/" in plaats van de in Windows gebruikelijke "\"). 
  
NB. het bestand kan gewijzigd worden terwijl de service draait, wijzigingen worden vanzelf overgenomen.


#### Geoide-Composer als service starten   
   Open een terminal (als administrator uitvoeren) en ga naar folder ``C:\geoide-composer\nssm\`` en 
   start batch bestand nssm-install-meteor-service.bat met de volgende parameters:   
   ``nssm-install-meteor-service.bat [lokatie meteor installaties] [meteor programma naam] [meteor poort]``   
    ``nssm-install-meteor-service.bat C: geoide-composer 3010``
   
Zie hier voor nadere [toelichting] (#toelichting).
    
Voer de volgende aanpassingen door:  
1. Start Windows Service beheer op.     
2. Ga naar de service ``geoide-composer`` en klik op eigenschappen   
3. Ga naar tab Aanmelden en voer bij 'Dit account' de naam en wachtwoord in van de gebruiker die meteor heeft geinstalleerd.   
4. Druk op OK en start de service.   

NB. Het opstarten kan lang duren omdat meteor eerst de applicatie moet bouwen

Zie hier voor een instructie voor [update] van de Composer programmatuur (#composer-update)


### Installeren initieele dataset voor CRS in Geoide Composer 
De database van Geoide composer kan voor gebruik worden gevuld. Er is data beschikbaar gemaakt voor CRS2 gebruikers.   
1. stop de service ``geoide-composer``   
2. Open een terminal (DOS prompt) en ga naar C:\Program Files\MongoDB 2.6 Standard\bin\   
Voer het restore commando uit:   
``C:\mongodb\scripts\mongo-restore.bat C:\geoide-composer\data\geoide-composer-basis_crs2 geoide-composer``   
Waarbij geoide-composer (de database naam) gelijk is aan de programma naam en de service naam.   
3. (her)start de service ``geoide-composer`` 


## Verificatie   
### Geoide Composer programma
1. Kijk of de service onder de opgegeven naam is geïnstalleerd (Windows beheer, services) en draait
2. Ga met een browser naar http://Composer-host:Composer-port
   (bijv http://localhost:3020)
3. Maak een nieuwe gebruiker aan en log in, de Composer is nu klaar voor gebruik   
4. Controleer of de initieele dataset geladen is.
5. Ga naar services en wijzig de url naar de interne wms en wfs service (service-crs-wms en service-crs-wfs).
   Verander de host naam in de url naar de viewer-host naam
   (http://host:8080/crs-deegree-webservices/services/crs2_wfs)
   
   De installatie voor de composer is hiermee afgerond

## Overige informatie


### Log bestanden 
Log bestanden bevinden zich in    
   Geoide Composer: ``C:\geoide-composer\logs``    
   Mongo: ``C:\mongodb\logs`` 

  
### Backup en restore van Geoide Composer gegevens
Zie voor gebruik en toelichting het [mongodb](https://github.com/IDgis/mongodb/tree/master/mongodb/scripts) project in Github.

    
### Verbinden van Geoide-Viewer met Geoide-Composer
#### Lokatie van Geoide-Composer opgeven


In de configuratie van Geoide-Viewer staan de url's waarmee de database van Geoide-Composer als json bestanden kunnen worden opgehaald.   
Het configuratie bestand staat in ``crs-geoide.conf``, bijvoorbeeld:   
``C:\geoide-crs\conf\crs-geoide.conf``

In de 'resources' items staat de url van de Geoide-Composer:   

      geoide.service.components{
          mapProvider {              
              resources.maps = "http://localhost:3020/json-gv-api-maps"
              resources.services = "http://localhost:3020/json-gv-api-services"
              resources.featureTypes = "http://localhost:3020/json-gv-api-featuretypes"
              resources.serviceLayers = "http://localhost:3020/json-gv-api-servicelayers"
              resources.layers = "http://localhost:3020/json-gv-api-layers"
              configDir = null
          }
          imageProvider {
              dir = null
          }
      }   
   
Pas hier de url aan (meestal alleen het poortnummer).

Toelichting: deze urls worden aangeroepen, telkens als de Composer een refresh commando richting de Viewer geeft.   


### Internet Explorer beveiligingswaarschuwing 
Het kan voorkomen dat bij het openen van een kaart configuratie de kaart niet wordt getoond, of zelfs een pop-up met beveiligingswaarschuwing verschijnt.   
Dit komt voor in Internet Explorer. In Chrome of Firefox is het niet gezien.   
Er moet dan een tekst aan de *Trusted Sites* worden toegevoegd. 

Oplossing:   
In Internet Explorer:   
* Menu: Tools/Internet Options, tab *Security*
 * Kies *Local Intranet*
  * klik op *Sites* en voeg *about:blob* toe.
  * probeer opnieuw een kaart te openen via de lijst met geconfigureerde kaarten. 
  * voeg *about:internet* aan *Sites* toe als het probleem nog niet weg is.
  
  
### Meerdere instanties Composer 
   Als u meerdere instanties naast elkaar wilt gebruiken, kopieer de gehele geoide-composer folder en geef deze een andere naam:    
    bijv:
   
      C:\
      |
      |-- geoide-composer-test\
      |       \ ...
      |
      |-- geoide-composer-live\
      |       \ ...
      |
      
 ### url's 
Het onderscheid tussen meteor applicaties zit in het poort nummer van de url.  
Dus bijvoorbeeld ``http://localhost:3010/`` en ``http://localhost:3020/``.   
Externe urls kunnen dan zijn ``http://www.MijnBedrijf.nl:3010/``, ``http://www.MijnBedrijf.nl:3020/``.  
Het gebruik als ``http://www.MijnBedrijf.nl/composer-test/`` en ``http://www.MijnBedrijf.nl/composer-live/``   
blijkt tot problemen te kunnen leiden in de applicatie, in ieder geval bij gebruik van Windows IIS.        
  
### Folder structuur na voorbereiding en installatie
  *Geoide-Composer*  
  De geoide-composer applicatie    
  
   
    C:\geoide-composer-test\
     |    \-- conf\
     |        settings.json # configuratie van het meteor programma
     |    \-- data\         # data voor een initiele vulling van de database
     |    \-- logs\         # logging van het meteor programma
     |        out.log
     |        err.log
     |    \-- meteor\       # meteor programma
     |       (inhoud van folder geoide-admin-[versieNr] uit zip file)
     |    \-- nssm\         # scripts voor het maken en starten van het meteor programma als Windows service  
     |    \-- upload\       # lokatie voor geÃ¼ploade legendGraphic plaatjes en scripts
     |
     |


  *MongoDB*  
  Beheer van gegevens van alle Geoide Composer instanties   
  
    
    C:\mongodb\
     | README
     |-- backup\                  # mogelijke lokatie voor backups
     |-- config\
     |     mongo.config           # Configuratie om MongoDB als service te starten
     |     mongoSchijfD.config    # idem als folderstructuur op schijf D is geplaatst
     |-- data\                    # centrale locatie voor alle databases van de mongo service
     |-- images\                  # plaatjes voor README
     |-- logs\                    # mongo log files
     |-- scripts\                 # backup en restore scripts
     |     mongo-backup.bat
     |     mongo-restore.bat
     |
 

<a name="toelichting"></a>

### Toelichting  Geoide-Composer als service starten:
   Open een terminal (als administrator uitvoeren) en ga naar folder ``C:\geoide-composer\nssm\`` en 
   start batch bestand nssm-install-meteor-service.bat met de volgende parameters:   
   ``nssm-install-meteor-service.bat [lokatie meteor installaties] [meteor programma naam] [meteor poort]``    
Parameters:   
``[lokatie meteor installaties]`` hoofdlokatie van Geoide composer installaties bijv. ``C:``   
``[meteor programma naam]`` een subfolder van de hoofdlokatie bijv. ``geoide-composer-test``   
  De *service naam* en *database naam* worden gelijk aan de *programma naam*   
``[meteor poort]``
Kies meteor poorten uit de reeks 3010, 3020, 3030 etc.   
Elk meteor programma moet een uniek poort nummer krijgen.   
*Voorbeelden:*   
1. bij installatie op ``C:\geoide-composer-test\`` :   
      ``nssm-install-meteor-service.bat  C:  geoide-composer-test  3010``   
   de service en database naam worden dan 'geoide-composer-test'   
2. bij installatie op ``C:\geoide-composer\live\`` :   
      ``nssm-install-meteor-service.bat  C:\geoide-composer  live  3020``   
   de service en database naam worden dan 'live'    
   
   
<a name="composer-update"></a>

### Instructie voor update van Geoide Composer

1. stop de service bijv. ``geoide-composer``
2. ga naar ``C:\geoide-composert\meteor``
3. delete alles in deze folder
4. Open de programmatuur zip: ``geoide-admin-[versieNr].zip``
5. kopieer inhoud van zip (onder ``geoide-admin-[versieNr]``, dus niet deze foldernaam zelf) naar ``C:\geoide-composer\meteor``
6. Ga in de command prompt naar ``C:\geoide-composert\meteor`` en voer daar de volgende regel uit: ``meteor npm install --save``
7. start de service ``geoide-composer``
NB: Het opstarten kan lang duren omdat meteor eerst de applicatie moet bouwen.
