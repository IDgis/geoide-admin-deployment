# Meteor migration 1.3.5 --> 1.4
Zie https://guide.meteor.com/1.4-migration.html

##Aannames
Windows 10
## Stappen
* Installeer MS Build Tools 2015
https://www.microsoft.com/en-us/download/details.aspx?id=48159
* Installeer nodejs, indien nodig (Zie C:\Program Files\nodejs)
https://nodejs.org/en/download/
* open administrator command terminal

Voer een npm install uit:

-----------------------------------------------
``C:\WINDOWS\system32>npm install --global --production windows-build-tools``
-----------------------------------------------

```
/
> windows-build-tools@0.4.1 postinstall C:\Users\Rob\AppData\Roaming\npm\node_modules\windows-build-tools
> node ./lib/index.js

Downloading BuildTools_Full.exe
Downloading python-2.7.11.msi
[>                                            ] 0.0% (0 B/s)
Downloaded python-2.7.11.msi. Saved to C:\Users\Rob\.windows-build-tools\python-2.7.11.msi.
Starting installation...
Launched installers, now waiting for them to finish.
This will likely take some time - please be patient!
Waiting for installers... /Successfully installed Python 2.7
Waiting for installers... |Successfully installed Visual Studio Build Tools.
windows-build-tools@0.4.1 C:\Users\Rob\AppData\Roaming\npm\node_modules\windows-build-tools
├── cli-spinner@0.2.5
├── debug@2.2.0 (ms@0.7.1)
├── chalk@1.1.3 (ansi-styles@2.2.1, escape-string-regexp@1.0.5, supports-color@2.0.0, strip-ansi@3.0.1, has-ansi@2.0.0)
├── fs-extra@0.30.0 (path-is-absolute@1.0.0, jsonfile@2.3.1, klaw@1.3.0, graceful-fs@4.1.5, rimraf@2.5.4)
└── nugget@2.0.0 (single-line-log@0.4.1, throttleit@0.0.2, minimist@1.2.0, progress-stream@1.2.0, pretty-bytes@1.0.4, request@2.74.0)

```
Nog een npm install:

-----------------------------------------------
``C:\WINDOWS\system32>npm install -g node-gyp``
-----------------------------------------------

```
C:\Users\Rob\AppData\Roaming\npm\node-gyp -> C:\Users\Rob\AppData\Roaming\npm\node_modules\node-gyp\bin\node-gyp.js
node-gyp@3.4.0 C:\Users\Rob\AppData\Roaming\npm\node_modules\node-gyp
├── rimraf@2.5.4
├── graceful-fs@4.1.5
├── semver@5.3.0
├── osenv@0.1.3 (os-homedir@1.0.1, os-tmpdir@1.0.1)
├── nopt@3.0.6 (abbrev@1.0.9)
├── which@1.2.10 (isexe@1.1.2)
├── minimatch@3.0.3 (brace-expansion@1.1.6)
├── glob@7.0.5 (path-is-absolute@1.0.0, fs.realpath@1.0.0, inherits@2.0.1, inflight@1.0.5, once@1.3.3)
├── fstream@1.0.10 (inherits@2.0.1)
├── tar@2.2.1 (block-stream@0.0.9, inherits@2.0.1)
├── mkdirp@0.5.1 (minimist@0.0.8)
├── npmlog@3.1.2 (set-blocking@2.0.0, console-control-strings@1.1.0, are-we-there-yet@1.1.2, gauge@2.6.0)
├── request@2.74.0 (aws-sign2@0.6.0, tunnel-agent@0.4.3, forever-agent@0.6.1, oauth-sign@0.8.2, is-typedarray@1.0.0, caseless@0.11.0, stringstream@0.0.5, isstream@0.1.2, aws4@1.4.1, json-stringify-safe@5.0.1, extend@3.0.0, tough-cookie@2.3.1, qs@6.2.1, node-uuid@1.4.7, combined-stream@1.0.5, mime-types@2.1.11, form-data@1.0.0-rc4, bl@1.1.2, hawk@3.1.3, http-signature@1.1.1, har-validator@2.0.6)
└── path-array@1.0.1 (array-index@1.0.0)

```

cd naar meteor project en update meteor:

-----------------------------------------------
``C:\Users\Rob\git\geoide-admin>meteor update``
-----------------------------------------------

```
Changes to your project's package version selections from updating the release:

accounts-base       upgraded from 1.2.8 to 1.2.9
accounts-password   upgraded from 1.1.13 to 1.2.12
babel-compiler      upgraded from 6.8.5 to 6.9.0
babel-runtime       upgraded from 0.1.9_1 to 0.1.10
ecmascript          upgraded from 0.4.8 to 0.5.7
ecmascript-runtime  upgraded from 0.2.12 to 0.3.12
email               upgraded from 1.0.16 to 1.1.16
http                upgraded from 1.1.8 to 1.2.8
logging             upgraded from 1.0.14 to 1.1.14
meteor              upgraded from 1.1.16 to 1.2.16
modules             upgraded from 0.6.5 to 0.7.5
modules-runtime     upgraded from 0.6.5 to 0.7.5
mongo               upgraded from 1.1.9_1 to 1.1.10
npm-bcrypt          upgraded from 0.8.6_3 to 0.8.7
npm-mongo           upgraded from 1.4.45 to 1.5.45
promise             upgraded from 0.7.3 to 0.8.3
tracker             upgraded from 1.0.15 to 1.1.0
webapp              upgraded from 1.2.11 to 1.3.10

geoide-admin: updated to Meteor 1.4.0.1.  <======================

Changes to your project's package version selections from updating package versions:

accounts-base       upgraded from 1.2.9 to 1.2.10
accounts-password   upgraded from 1.2.12 to 1.2.14
ecmascript-runtime  upgraded from 0.3.12 to 0.3.13
npm-bcrypt          upgraded from 0.8.7 to 0.8.7_1


The following top-level dependencies were not updated to the very latest version available:
  aldeed:template-extension 3.4.3 (4.0.0 is available)
  msavin:mongol 0.7.2 (2.0.1 is available)
  npm-bcrypt 0.8.7_1 (0.9.0 is available)

Newer versions of the following indirect dependencies are available:
  autoupdate 1.2.11 (1.3.11 is available)
  babrahams:editable-json 0.3.13 (0.6.4 is available)
  caching-compiler 1.0.6 (1.1.6 is available)
  ddp-client 1.2.9 (1.3.0 is available)
  ddp-server 1.2.10 (1.3.9 is available)
  less 2.6.5 (2.7.4 is available)
  mdg:validation-error 0.2.0 (0.5.1 is available)
  minifier-js 1.1.13 (1.2.13 is available)
  momentjs:moment 2.10.6 (2.14.4 is available)
  templating 1.1.14 (1.2.13 is available)
To update one or more of these packages, pass their names to `meteor update`.

```

* open command prompt (user)
cd to meteor project en run meteor:

-----------------------------------------------
``C:\Users\Rob\git\geoide-admin>meteor``
-----------------------------------------------

