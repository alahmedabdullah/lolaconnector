LOLA Connector
================

Setup
-----
1. Install Chiminey (https://github.com/chiminey/docker-chiminey)
2. Go to docker-chiminey directory
```
	$ cd docker-chiminey
```
3. Enter into the Chiminey container
```
	$ ./chimineyterm
```
4. Go to chiminey directory
```
	$ cd /opt/chiminey/current/chiminey
```
5. Modify the SMART_CONNECTORES dictionary in settings_change.py file to have following:
```
	'lola':  {'init': 'chiminey.lolaconnector.initialise.LolaInitial',
             	      'name': 'lola',
            	      'description': 'The LOLA Model Checker',
             	      'payload': '/opt/chiminey/current/chiminey/lolaconnector/payload_lola'
                    },
```
6. Modify the INPUT_FIELDS dictionary in settings_change.py file to have following:
```
	'lola':  SCHEMA_PREFIX + "/input/lola",
```
7. Clone the git repository https://github.com/alahmedabdullah/lolaconnector.git in /opt/chiminey/current/chiminey
```
	$ git clone https://github.com/alahmedabdullah/lolaconnector.git
```
8. Change ownership of the newly created uppalconnector directory
```
	$ chown -R chiminey.nginx lolaconnector
```
9. Exit from the chiminey container
```
	$ exit
```
10. Restart the chiminey container
```
	$ docker-compose restart chiminey
```
11. Check that lola connector is listed in available smart connectors list
```
	$ ./listscs
```
12. Activate the lola connector and follow the prompts
```
	$ ./activatesc lola
```
