component {

	static {
		static.wsclients=[];
	}

	variables.hiThereCounter=0;

	/**
	 * static function that is called when the first connection opens
	 */
	public static function onFirstOpen(wsclients) {
		systemOutput("--- first open ---",1,0);
		systemOutput(arguments,1,0);

		// example to use the client object to communicate ,you can of course do that in all functions that getting the client object, you can also store it and use it at any time
		static.wsclients = arguments.wsclients; // store it so every functions can use it
		systemOutput("--- clients object test ---",1,0);
		
		// send a message to ALL client conneted
		systemOutput("--- clients object test ---",1,0);
		wsclients.broadcast("hope you all have a great time!!!");
		systemOutput("- size: "&wsclients.size(),1,0);
		// more example in onMessage
		// wsclients.close() // close all connections!
	}
	

	function onOpen(wsclient) {
		systemOutput("--- open ---",1,0);
		systemOutput(arguments,1,1);
	}
	/**
	* same as onOpen, but does not wait for a response
	*/
	function onOpenAsync(wsclient) {
		systemOutput("--- onOpenAsync ---",1,0);
		systemOutput(arguments,1,1);


		// example to use the client object to communicate ,you can of course do that in all functions that getting the client object, you can also store it and use it at any time

		systemOutput("--- client object test ---",1,0);
		systemOutput("- open? "&wsclient.isOpen(),1,0);
		systemOutput("- close? "&wsclient.isClose(),1,0);

		// send a message to the current client
		wsclient.send("how can we help you?");

		// send a message to ALL client conneted
		wsclient.broadcast("hope you all have a great time!");
		// wsclient.close() // close connection!
	}




	function onMessage(wsclient,message) {
		systemOutput("--- message ---",1,0);
		systemOutput(arguments.message,1,1);
		
		// use wsclients stored in 
		systemOutput("how many clients are open? "&static.wsclients.size(),1,0);
		// get client object for every single client
		loop array=static.wsclients.getClients() item="local.c" {
			c.send("Salve!");
		}


		// example that shows that the instance is reused between calls, so you can keep a state, in this case the counter
		if("hi there!" == arguments.message) {
			variables.hiThereCounter++;
			// first time we answer fiendly
			if(variables.hiThereCounter==1) {
				return "hi there also!";
			}
			else if(variables.hiThereCounter==2) {
				return "hi there also,again!!!";
			}
			else {
				return "fuck off!!!";
			}
		}
		return reverse(arguments.message);
 	}

	 function onError() {
		systemOutput("--- error ---",1,1);
		systemOutput(arguments,1,1);
 	}
	


	function onClose() {
		systemOutput("--- close ---",1,0);
		systemOutput(arguments,1,0);
	}



	/**
	 * static function that is called when the last connection ends
	 */
	public static function onLastClose() {
		systemOutput("--- last close ---",1,1);
		systemOutput(arguments,1,1);
	}

	
}