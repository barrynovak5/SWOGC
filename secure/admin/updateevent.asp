todo - save save event and say done or redirect

<%
Response.Write("EVENTID " & Request.Form("EVENTID"))

Response.Write("EventName " & Request.Form("EventName"))
Response.Write("EventDescription " & Request.Form("EventDescription"))
Response.Write("ReceiptEmailSender " & Request.Form("ReceiptEmailSender"))
%>