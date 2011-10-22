<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>4c Admin</title>
</head>

<body>
<%
donationEventId = Request.Form("DonationEventId")

set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"
set objCommand = Server.CreateObject("ADODB.Command")
objCommand.ActiveConnection = conn
objCommand.CommandText = "SELECT * FROM DONATIONEVENT WHERE EVENTID = @EVENTID"

objCommand.Parameters.Append(objCommand.CreateParameter("@EVENTID", adInteger, adParamInput, , donationEventId))

Set rs = objCommand.Execute()

If Not rs.EOF Then
%>
<p> here</p>
<%
rs.Close
set rs = nothing
set cmd = nothing
set conn = nothing
%>

