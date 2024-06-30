<cfsetting requesttimeout="300">
<cfset host=CGI.remote_addr>
<cfset port=CGI.server_port> <!--- lucee6.json 8888 8091 --->
<cfset isSecure = (CGI.https == "on")>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<!---
<input type="button" name="test" value="open 8196" onclick="openSocket(8196);">
<input type="button" name="test" value="open 8181" onclick="openSocket(8181);">
398672
--->
<cfset lens=[10,125,126,130,200,255,256,257,65535,65536,100000,1000000,10000000]>
<cfoutput>
<input type="button" name="test" value="open #host#:#port#" onclick="openSocket('#host#',#port#, #isSecure#);">
<input type="button" name="lkkkjl" value="send cgi scope" onclick="sendMyData();">
<input type="button" name="ljl" value="say hello" onclick="socket.send('hi there!');">

<cfloop array="#lens#" item="v">
    <input type="button" name="ljl" value="#v#" onclick="socket.send('#repeatString("x",v)#');">
</cfloop>

<input type="button" name="ljlqq" value="say bye" onclick="socket.send('bye!');">
<input type="button" name="test" value="close" onclick="closeSocket();">

</cfoutput>
<div id="response" style="with:100%;height:200px;background-color:grey;color:white;overflow-y:scroll"></div>

<input type="button" name="ljlqq" value="clear" onclick="clearcmd();">

<script type="text/javascript">
 <cfoutput>
cgi=#serializeJson(cgi)#;
 </cfoutput>


function sendMyData() {
    socket.send(JSON.stringify(cgi));
}


function openSocket(host,port, isSecure) {
    
    if (isSecure) {
        protocol ="wss";
    } else {
        protocol ="ws";
    }
    socket = new WebSocket(protocol+"://"+host+":"+port+"/ws/Test2");

    socket.onopen = function(evt) {
        console.log(['AJM onopen()', evt]);
        $('#response').css('background-color','black');
    };

    socket.onclose = function(evt) {
        console.log(['AJM onclose()', evt]);
        $("#response").html( "connection closed: "+evt.code );
        $('#response').css('background-color','grey');
    };

    socket.onerror = function (event) {
        console.log(['AJM onerror()', event]);
      alert("error:"+event.data);
      $('#response').css('background-color','red');
      $("#response").html( event.data);
    };

    socket.onmessage = function (event) {
        console.log(['AJM onmessage()', event]);
      //alert(event.data);
      $("#response").append( "<pre>"+event.data+"</pre>" );
    }

}

function closeSocket() {
    socket.close();
    socket=null;
}
function clearcmd() {
    $("#response").html("");
}
</script>


