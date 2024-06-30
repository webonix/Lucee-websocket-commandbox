# Lucee WebSocket Server on CommandBox

- clone repo
- cd to newly created directory
- run `./lucee6.sh`
- browse [http://127.0.0.1:80/](http://127.0.0.1:80/) or [https://127.0.0.1:4433/](https://127.0.0.1:4433/)
- Lucee Admin [https://127.0.0.1:4433/lucee/admin/index.cfm](https://127.0.0.1:4433/lucee/admin/index.cfm)
  - password=commandbox

## Requirements

- CommandBox
- CFConfig for CommandBox

## What does the script do?

- Set environment variable `LUCEE_EXTENSIONS` to install Lucee Extension 
    - Lucee Admin 1.0.0.5
	- WebSocket 1.0.0.11-RC
- Creates directories for webroot and websocket and copies sample files
- Starts CommandBox using `lucee6.json` config file
    - name = lucee6
	- cfengine = lucee@6.1.0-RC+193
	- HTTP Port = 8091
	- HTTPS Port = 4433

## Reseting CommndBox Server

If you want to blow everything away and start again

`box server forget lucee6 `