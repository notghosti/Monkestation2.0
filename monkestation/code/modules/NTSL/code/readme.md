https://github.com/Monkestation/Monkestation2.0/pull/2199

## \<NTSL Coding> 

MODULE ID: NTSL

### Description:

Allows people to change how comms work via NTSL
for example, adding in their job after their name

### TG Proc/File Changes:

- code\__DEFINES\achievements.dm -- Added poly achievement defines, since apparently we dont modularize dat
- code\__DEFINES\logging.dm -- Added NTSL log stuff
- code\datums\chatmessage.dm -- Added a if(!speaker); return; due to NTSL code apparently not passing a speaker, i think, maybe, idk
- code\game\machinery\telecomms\telecomunications.dm -- Added some logging if there's a wrong filter path
- code\game\machinery\telecomms\machines\server.dm -- Added stuff to make the servers actually compile NTSL
- interface\skin.dmf -- Added stuff to make NTSL code editing UI work... im sorry... i really need to turn it to TGUI

### Defines:

- code\__DEFINES\~monkestation\NTSL.dm

### Credits:

- Altoids1 -- Original author in 2019
- JohnFulpWillard -- Doing a lot of stuff apparently
- Gboster-0 -- Porting to Monkestation, fixes
