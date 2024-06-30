#! /bin/bash -

# extension to install
# websocket, lucee admin
export LUCEE_EXTENSIONS=07082C66-510A-4F0B-B5E63814E2FDF7BE;version=1.0.0.11-RC,CED6227E-0F49-6367-A68D21AACA6B07E8;version=1.0.0.5


installdir="$(pwd)/lucee6"
echo "install directory $installdir"


mkdir -p "$installdir"
mkdir -p "$installdir/www"

if [[ ! -e "$installdir/www/index.cfm" ]]; then
    cp ./index.cfm "$installdir/www/"
fi

if [[ ! -e "$installdir/www/websocket.cfm" ]]; then
    cp ./websocket.cfm "$installdir/www/"
fi

echo "starting Lucee Server"
#start Lucee Server with CommandBox
box start serverConfigFile=lucee6.json


#set Lucee Admin password
echo "set Lucee Admin password to commandbox"
echo "commandbox" > "$installdir/WEB-INF/lucee-server/context/password.txt"


echo "copying websocket components"
# websocket - "directory": "{lucee-config}/websockets/",
# lucee-config = lucee6/WEB-INF/lucee-server/context
mkdir -p "$installdir/WEB-INF/lucee-server/context/websockets"
cp ./test.cfc "$installdir/WEB-INF/lucee-server/context/websockets/"
cp ./test2.cfc "$installdir/WEB-INF/lucee-server/context/websockets/"

echo "using CFConfig to create websocket log file"
box cfconfig  import from=CFConfig-websocket-log.json to=lucee6 

echo "restarting Lucee Server"
# restart Lucee to ick up ne websocker
box restart serverConfigFile=lucee6.json

#Lucee Logs
box server log lucee6 --follow


### https://www.forgebox.io/view/lucee#versions
### box server log lucee6 --follow
### box server forget lucee6 - after updating lucee version
