#!/bin/bash

function rcon {
        /opt/minecraft/tools/mcrcon/mcrcon -H 10.2.10.15 -p Bigdonkypassword13 "$1"
}

rcon "save-off"
rcon "save-all"
#wrap it up, compress it, remove owner/group, dont backup dynmap tiles(huge) and stick it on the nas
tar --owner=0 --group=0 -cvpzf /opt/minecraft/backups/server-$(date +%F).tar.gz --exclude='/opt/minecraft/server/plugins/dynmap/*' /opt/minecraft/server
## Delete older backups to prevent clutter
find /opt/minecraft/backups/ -type f -mtime +7 -name '*.gz' -delete

