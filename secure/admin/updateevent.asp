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

objCmd.CommandText = "SELECT * FROM EVENTS WHERE EVENTID = ?"
objCmd.CommandType = adCmdText

'Create the parameter and populate it.

Set objParam = objCmd.CreateParameter("@EVENTID" , adInteger, adParamInput, 0, 0)
objCmd.Parameters.Append objParam

EventId = Request.Form("EventId")
objCmd.Parameters("@EVENTID") = EventId

'Open and display the Recordset.

objRS.Open objCmd

objRS("EventName") = Request.Form("EventName")
objRS("EventDescription") = Request.Form("EventDescription")
objRS("ReceiptEmailSender") = Request.Form("ReceiptEmailSender")
objRS("ReceiptEmailFooter") = Request.Form("ReceiptEmailFooter")
objRS("PaymentFormHeader") = Request.Form("PaymentFormHeader")
objRS("PaymentFormFooter") = Request.Form("PaymentFormFooter")
objRS("ReceiptFormHeader") = Request.Form("ReceiptFormHeader")
objRS("ReceiptFormFooter") = Request.Form("ReceiptFormFooter")
objRS("CancelURL") = Request.Form("CancelURL")
objRS("ReceiptPageURL") = Request.Form("ReceiptPageURL")
objRS("ReceiptPageTitle") = Request.Form("ReceiptPageTitle")
objRS("EventConfirmation") = Request.Form("EventConfirmation")
objRS("EventEmailConfirmation") = Request.Form("EventEmailConfirmation")

objRS.Update

objRS.Close
objConn.Close
Set objRS = Nothing
Set objCmd = Nothing
Set objConn = Nothing
%>

<p>Record Saved!<p>
<a href="adminmain.asp">Back</a>