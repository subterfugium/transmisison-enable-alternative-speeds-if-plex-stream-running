transmisison-enable-alternative-speeds-if-plex-stream-running
=============================================================

Enable transmission alternative speed if Plex stream is running.

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
