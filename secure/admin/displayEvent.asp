<!--#INCLUDE FILE="adminheader.asp"-->
<!--#include file=adovbs.inc -->
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

objCmd.CommandText = "SELECT * FROM EVENTS INNER JOIN EVENTTYPE ON EVENTS.EventTypeID = EVENTTYPE.EventTypeID WHERE EVENTID = ?"
objCmd.CommandType = adCmdText

'Create the parameter and populate it.

Set objParam = objCmd.CreateParameter("@EVENTID" , adInteger, adParamInput, 0, 0)
objCmd.Parameters.Append objParam

donationEventId = Request.Form("DonationEventId")
objCmd.Parameters("@EVENTID") = donationEventId

'Open and display the Recordset.

objRS.Open objCmd

Do While Not objRS.EOF
%>
<form method="POST" action="updateevent.asp">
<div>
	<input type="hidden" name="EventId" value="<%= objRS.Fields("EVENTID")%>"/>
	<label for="EventName">EventName:</label>
	<input type="textbox" name="EventName" value="<%= objRS.Fields("EventName")%>"/>
</div>
<div>
	<label for="EventDescription">EventDescription:</label>
	<input type="textbox" name="EventDescription" value="<%= objRS.Fields("EventDescription")%>"/>
</div>
<div>
	<label for="ReceiptLink">ReceiptLink:</label>
	<input type="textbox" name="ReceiptLink" value="<%= objRS.Fields("ReceiptLink")%>"/>
</div>	
<div>
	<label for="ReceiptMethod">ReceiptMethod:</label>
	<input type="textbox" name="ReceiptMethod" value="<%= objRS.Fields("ReceiptMethod")%>"/>
</div>

<div>
	<label for="SendEmailReceipt">SendEmailReceipt:</label>
	<input type="textbox" name="SendEmailReceipt" value="<%= objRS.Fields("SendEmailReceipt")%>"/>
</div>

<div>
	<label for="SendEmailReceipt">SendEmailReceipt:</label>
	<input type="textbox" name="SendEmailReceipt" value="<%= objRS.Fields("SendEmailReceipt")%>"/>
</div>

<div>
	<label for="ReceiptEmailSender">ReceiptEmailSender:</label>
	<input type="textbox" name="ReceiptEmailSender" value="<%= objRS.Fields("ReceiptEmailSender")%>"/>
</div>

<div>
	<label for="ReceiptEmailFooter">ReceiptEmailFooter:</label>
	<input type="textbox" name="ReceiptEmailFooter" value="<%= objRS.Fields("ReceiptEmailFooter")%>"/>
</div>

<div>
	<label for="PaymentFormHeader">PaymentFormHeader:</label>
	<input type="textbox" name="PaymentFormHeader" value="<%= objRS.Fields("PaymentFormHeader")%>"/>
</div>

<div>
	<label for="PaymentFormFooter">PaymentFormFooter:</label>
	<input type="textbox" name="PaymentFormFooter" value="<%= objRS.Fields("PaymentFormFooter")%>"/>
</div>

<div>
	<label for="ReceiptFormHeader">ReceiptFormHeader:</label>
	<input type="textbox" name="ReceiptFormHeader" value="<%= objRS.Fields("ReceiptFormHeader")%>"/>
</div>

<div>
	<label for="ReceiptFormFooter">ReceiptFormFooter:</label>
	<input type="textbox" name="ReceiptFormFooter" value="<%= objRS.Fields("ReceiptFormFooter")%>"/>
</div>

<div>
	<label for="CancelURL">CancelURL:</label>
	<input type="textbox" name="CancelURL" value="<%= objRS.Fields("CancelURL")%>"/>
</div>

<div>
	<label for="ReceiptPageURL">ReceiptPageURL:</label>
	<input type="textbox" name="ReceiptPageURL" value="<%= objRS.Fields("ReceiptPageURL")%>"/>
</div>

<div>
	<label for="ReceiptPageTitle">ReceiptPageTitle:</label>
	<input type="textbox" name="ReceiptPageTitle" value="<%= objRS.Fields("ReceiptPageTitle")%>"/>
</div>

<div>
	<label for="EventConfirmation">EventConfirmation:</label>
	<input type="textbox" name="EventConfirmation" value="<%= objRS.Fields("EventConfirmation")%>"/>
</div>

<div>
	<label for="EventEmailConfirmation">EventEmailConfirmation:</label>
	<input type="textbox" name="EventEmailConfirmation" value="<%= objRS.Fields("EventEmailConfirmation")%>"/>
</div>

<input type="submit" value="Save"/>
<div>
</div>
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

