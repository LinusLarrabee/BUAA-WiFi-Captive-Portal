#!/bin/sh

# author: JeffMa
# created: 2016.11.17
# launchd-with-networkchange

# proxifier
proxifier_quit()
{
    ps -ef | grep Proxifier | awk '{print $2}' | xargs kill
}

# WORK MOD
at_work_mod()
{
    # empty dns servers when connect office wifi
    /usr/sbin/networksetup -setdnsservers Wi-Fi Empty

    # set pac url for work place Wi-Fi
t
    # slient
    osascript -e "set Volume 0"

    osascript <<EOD
    tell application "RTX"
	    run
    end tell
    tell application "ShadowsocksX"
        quit
    end tell
EOD

curl -X POST --data "action=login&ac_id=1&user_ip=&nas_ip=&user_mac=&save_me=1&ajax=1&username=12345678&password=abcdefgh "  https://gw.buaa.edu.cn:801/include/auth_action.php -k
}

# HOME MOD
at_home_mod()
{
	# set my pac url so that i can across the GFW at home.
    # /usr/sbin/networksetup -setautoproxyurl Wi-Fi http://example.pac

	# run or quit apps
    osascript <<EOD
    tell application "RTX"
        quit
    end tell
EOD

}

NAME="$0:t:r"

PPID_NAME=$(ps -cp "$PPID" | fgrep -v 'PID TTY')

case "$PPID_NAME" in
    *launchd*)
        # delay 15s for Mac's first wakes up.
        sleep 15
    ;;
    *)              
        # These settings are used when the script is not called via `launchd`
    ;;
esac

# delay
sleep 3

# GET SSID
SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk -F': ' '/ SSID/{print $NF}')

# whether at home or working by detecting SSID.
# Please change the code according to your contexts,
# especially the SSID name.
if [[ $SSID == 'BUAA-WiFi-Free' ]];then
    at_work_mod

    SHOW_MOD="原来你在图书馆也用的这个垃圾网路啊！"
elif [[ $SSID == 'BUAA-WiFi' ]];then
    at_work_mod

    SHOW_MOD="原来你不在图书馆也要用的这个垃圾网路啊！"
else
    at_home_mod

    SHOW_MOD="选择对了正确的网络，中午给我充一下电吧！"
fi

# notification
if [[ $SHOW_MOD != '' ]];then

osascript <<EOD
    display notification "[ $SHOW_MOD ]" with title "Launchd With Networkchange"
EOD

fi

exit 0
