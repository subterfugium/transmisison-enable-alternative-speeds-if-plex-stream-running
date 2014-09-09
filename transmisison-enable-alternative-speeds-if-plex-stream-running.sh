#!/bin/sh

# Install transmission-remote before using this script

# --- EDIT HERE START ---
mediarootpath='/media/Storage'
transip=192.168.148.100
transuser=tranmission_rpc_username_here
transpass=tranmission_rpc_password_here
# --- EDIT HERE STOP

# Variables for the script
service2grep='Plex New Transc'

# Run this in crontab every minute
#
# For example:
#
# crontab -e
#
#  m h  dom mon dow   command
#  * *  *   *   *     sh /home/seppo/transmisison-enable-alternative-speeds-if-plex-stream-running.sh
#
# 
#  Script will check that Plex New Trancoder is running and stream from $mediarootpath
#  
#  ps will print Plex New Transcoder task with parameter -i showing
#  the path of the media. Best way to ensure that streaming is on is to
#  check that "Plex New Transcoder" is running and it has root path of your media
#
#  Example ps line when running Plex stream:
#
#   otto@server:~/scripts$ ps ax |grep -v grep |grep "$service2grep" |grep "\-i $mediarootpath"
#
#   29939 ?        S<l    0:06 /usr/lib/plexmediaserver/Resources/Plex New Transcoder -i /media/#   Storage/Pictures/2013 Zillertal/videos/2013-02-09_10-23-52+02-00.mp4 
#
#
# After you have verified that the script work you can comment out the echo prints.
#
#
#  If Plex streaming from media path
#
if ps ax |grep -v grep |grep "$service2grep" |grep "\-i $mediarootpath" >/dev/null 2>&1
then
    echo "Plex Transcoding service running, enabling Transmission alt-speed"
    transmission-remote $transip -n $transuser:$transpass --alt-speed >/dev/null 2>&1
#
# If Acestream player is running
#
elif ps ax |grep -v grep |grep acestreamplayer >/dev/null 2>&1
then
    echo "Acestreamplayer service running, enabling Transmission alt-speed"
    transmission-remote $transip -n $transuser:$transpass --alt-speed >/dev/null 2>&1
#
#
# If nothing is running then disable transmission alternative speed
#
else
    echo "No watched services running, disable Transmission alt-speed" 
    transmission-remote $transip -n $transuser:$transpass --no-alt-speed >/dev/null 2>&1
fi
