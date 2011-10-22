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

'--- Create your objects.
Set cmd = Server.CreateObject("ADODB.Command")
Set recordset = Server.CreateObject("ADODB.Recordset")

cmd.ActiveConnection = conn  '--- Assuming connection is already set up.

cmd.Prepared = true  '--- When "true," any uses of this command should be processed more quickly

cmd.CommandText = "SELECT EVENTNAME, EVENTDESCRIPTION " & _
                               "FROM DONATIONEVENT  " & _
                               "WHERE (EVENTID=?) "

'--- Create and append parameter for eventID
Set newParameter = cmd.CreateParameter("@EVENTID", adInteger, adParamInput, 1, donationEventId )
cmd.Parameters.Append newParameter

Set recordset = cmd.Execute

Dim eventName, eventDescription
eventName = Trim(recordset.Fields("EVENTNAME"))
eventDescription = Trim(recordset.Fields("EVENTDESCRIPTION"))

'--- Always clean up after yourself.
Set newParameter = Nothing
Set cmd = Nothing

recordset.Close
Set recordset = Nothing
%>
<div>
<label id="LabelEventName">Event Name</label><br />
<input name="TextEventName" type="text" value="<%eventName%>" /><br /><br />
<label id="LabelEventdescription">Event Description</label><br />
<textarea name="TextAreaEventDescription" cols="80" rows="4">eventDescription</textarea><br /><br />
<input name="ButtonSave" type="submit" value="Save" />
<input name="ButtonCancel" type="submit" value="Cancel" />
</div>
</body>