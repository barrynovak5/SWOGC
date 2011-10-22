<!--#INCLUDE FILE="simlib.asp"-->
<!--#INCLUDE FILE="AuthorizeSettings.asp"-->

<%

Function TestAuthorizeSettings()

' Get Authorize Credentials
Dim loginID, transactionKey, testMode, authorizeUrl
Call getAuthorizeCredentials(loginId, transactionKey, testMode, authorizeUrl)

%>

<HTML lang='en'>
<HEAD>
	<TITLE> Sending donation information to Authorize.Net... </TITLE>

</HEAD>
<BODY>

<P> AuthorizerUrl:<% Response.Write(authorizeUrl) %>' </P>
<P> APILoginID:<% Response.Write(loginId) %>' </P>
<P> transactionKey, :<% Response.Write(transactionKey, ) %>' </P>

</BODY>
</HTML>
<%

End Function

%>