<!--#INCLUDE FILE="adminheader.asp"-->
<!--#include file=adovbs.inc -->
<%
Set objConn = Server.CreateObject("ADODB.Connection")
Set objCmd  = Server.CreateObject("ADODB.Command")
Set objRS   = Server.CreateObject("ADODB.Recordset")

objConn.Open "FourC"
objRS.Open "EVENTS", objConn, adOpenKeyset, adLockOptimistic, adCmdTable

objRS.AddNew

objRS("EventTypeID") = Request.Form("EventTypeID")
objRS("EventName") = Request.Form("EventName")
objRS("EventDescription") = Request.Form("EventDescription")
objRS("ReceiptMethod") = Request.Form("ReceiptMethod")
objRS("ReceiptLink") = Request.Form("ReceiptLink")
objRS("SendEmailReceipt") = Request.Form("SendEmailReceipt")
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