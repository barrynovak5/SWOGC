todo - save save event and say done or redirect

<%
Response.Write("="EventId " & Request.Form("="EventId"))

Response.Write("EventName " & Request.Form("EventName"))
Response.Write("EventDescription " & Request.Form("EventDescription"))
Response.Write("ReceiptEmailSender " & Request.Form("ReceiptEmailSender"))
%>