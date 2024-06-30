<!--- https://docs.lucee.org/guides/developing-with-lucee-server/directory-placeholders.html --->
<cfset Placeholders = [
'{lucee-web}',
'{lucee-server}',
'{lucee-config}',
'{temp-directory}',
'{home-directory}',
'{web-root-directory}',
'{system-directory}',
'{web-context-hash}',
'{web-context-label}'
]>
<cfoutput>
<h1>Lucee Placeholders</h1>
<ul>
<cfloop array="#Placeholders#" item="Placeholder">
	<li>#Placeholder#: #expandPath(Placeholder)#</li>
</cfloop>
</ul>
</cfoutput>
<p>
	<a href="/websocket.cfm">Web Socket Test Script</a>
</p>

<cftry>
	<cfdump var="#websocketInfo()#" label="websocketInfo()" expand="true">
	<cfcatch>
		<p>WebSocket Extenstion Not Installed?</p>
		<cfdump var="#cfcatch#" label="ERROR">
	</cfcatch>
</cftry>


<cfdump var="#server.lucee#" label="server.lucee">

