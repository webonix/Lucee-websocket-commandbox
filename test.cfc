component {

    variables.wsClients = 'not defined yet';

    public function onMissingMethod(missingMethodName, missingMethodArguments) {
        systemOutput("WS onMissingMethod(#arguments.missingMethodName#)",1,1);
    }
    

    function onFirstOpen(clients) {
        systemOutput("WS onFirstOpen()",1,0);
        variables.wsClients = arguments.clients;
    }
    
    // yes
    function onOpenAsync(client) {
        systemOutput("WS onOpenAsync()",1,0);
        systemOutput(arguments.client,1,0);
        systemOutput("------------------------------------------",1,0);
    }

    //yes
    function onOpen(client) {
        arguments.client.send('Welcome to Lucee 6 WebSockets');
		arguments.client.broadcast('Someone has joined');


        systemOutput("WS onOpen()",1,0);
        systemOutput(arguments.client,1,0);
        systemOutput("------------------------------------------",1,0);
    }


 

	function onMessage(client,msg) {
		systemOutput("test.cfc  msg=#arguments.msg#",1,0);
		systemOutput(arguments.client,1,0);
        systemOutput("------------------------------------------",1,0);

		//return "return:"& arguments.msg & " | atm we have variables.wsClients.size() connected, including you";
        arguments.client.broadcast(arguments.msg);
        
	}

    function onLastClose() {
        systemOutput("WS onLastClose()",1,0);
    }

    // yes
    function onClose(client,reasonPhrase) {
        systemOutput("WS onClose('#arguments.reasonPhrase#')",1,0);
    }

    function onError(client,cfcatch) {
        systemOutput("WS onError() message=#arguments.cfcatch.message#",1,1);
    }
}