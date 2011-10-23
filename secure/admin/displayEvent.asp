
<!--#include file=adovbs.inc -->
<%
donationEventId = Request.Form("DonationEventId")
Response.Write(donationEventId)
%>

<%
Set objConn = Server.CreateObject("ADODB.Connection")
Set objCmd  = Server.CreateObject("ADODB.Command")
Set objRS   = Server.CreateObject("ADODB.Recordset")

objConn.Open "FourC"

objRS.CursorType = adOpenForwardOnly
objRS.LockType = adLockOptimistic
                
Set objCmd.ActiveConnection = objConn

'If a SQL statement with question marks is specified, then the
'CommandType is adCmdText.  If a query name is specified, then
'the CommandType is adCmdStoredProc.

objCmd.CommandText = "SELECT * FROM EVENTS WHERE EVENTID = ?"
objCmd.CommandType = adCmdText

'Create the parameter and populate it.

Set objParam = objCmd.CreateParameter("@EVENTID" , adInteger, adParamInput, 0, 0)
objCmd.Parameters.Append objParam

objCmd.Parameters("@EVENTID") = donationEventId

'Open and display the Recordset.

objRS.Open objCmd

Do While Not objRS.EOF
%>
<form method="POST" action="updateevent.asp"
<input type="hidden" value="<%= objRS.Fields("EVENTID")%>"/>
<label for="EventName">EventName:</label>
<input type="textbox" name="EventName" value="<%= objRS.Fields("EventName")%>"/>

<label for="EventDescription">EventDescription:</label>
<input type="textbox" name="EventDescription" value="<%= objRS.Fields("EventDescription")%>"/>

<label for="ReceiptEmailSender">ReceiptEmailSender:</label>
<input type="textbox" name="ReceiptEmailSender" value="<%= objRS.Fields("ReceiptEmailSender")%>"/>

todo:
ReceiptEmailHeader	ReceiptEmailFooter	PaymentFormHeader	PaymentFormFooter	ReceiptFormHeader	ReceiptFormFooter	CancelURL	ReceiptPageURL	ReceiptPageTitle	EventConfirmation	EventEmailConfirmation

<input type="submit" value="Save"/>
</form>
<%
objRS.MoveNext
Loop

objRS.Close
objConn.Close
Set objRS = Nothing
Set objCmd = Nothing
Set objConn = Nothing
%>

