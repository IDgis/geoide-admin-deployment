@echo off
rem ---------------------
rem Mongo DB backup
rem to be used in Windows
rem task scheduler
rem ---------------------
rem mongodump --host localhost --port 27017 --db geoide-admin4 --collection maps --out C:/tmp/mongo_dump/GeoideComposer
rem ---------------------
rem Mongo dump command 
rem backups all databases 
rem from the default Mongo instance 
rem To restore use:
rem mongorestore --host localhost --port 27017 C:/tmp/mongo_dump/GeoideComposer 
rem ---------------------
mongodump --host localhost --port 27017 --out C:/tmp/mongo_dump/GeoideComposer
rem =====================
