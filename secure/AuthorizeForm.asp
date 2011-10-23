<!--#INCLUDE FILE="simlib.asp"-->
<!--#INCLUDE FILE="AuthorizeSettings.asp"-->
<!--#INCLUDE FILE="EventDBDetails.asp"-->

<%

Function Sanitize(str)
    Sanitize = Replace(CStr(str) , """", "")
End Function

Function ShowAuthorizeForm(invoiceNo)

Dim EventId
EventId = Request.Form("EventId")

Dim EventTypeId, ReceiptPageUrl, ReceiptPageTitle, ReceiptPageEnabled, EventName, _
    EventDescription, PaymentFormHeader, ReceiptFormHeader, ReceiptEmailHeader, _
    ReceiptFormHeader2, ReceiptFormFooter2, _
    PaymentFormFooter, ReceiptFormFooter, ReceiptEmailFooter

Call LoadEventDetails(EventId, EventTypeId, ReceiptPageUrl, ReceiptPageTitle, ReceiptPageEnabled, EventName, _
    EventDescription, PaymentFormHeader, ReceiptFormHeader, ReceiptEmailHeader, _
    ReceiptFormHeader2, ReceiptFormFooter2, _
    PaymentFormFooter, ReceiptFormFooter, ReceiptEmailFooter)


' Get Authorize Credentials
Dim loginID, transactionKey, testModeEnabled, authorizeUrl
Call getAuthorizeCredentials(loginId, transactionKey, testModeEnabled, authorizeUrl)

dim Amount
Amount = CStr(CSng(Request.Form("x_amount")))

' Get the data we need from the POST info
dim lineItem, lineItemQuantity, lineItemIsTaxable
lineItemQuantity = "1"
lineItemIsTaxable = "N"
lineItem = EventId & "<|>" & EventName & "<|>" & EventDescription & "<|>" & _
    lineItemQuantity & "<|>" & Amount & "<|>" & lineItemIsTaxable

' a sequence number is randomly generated
Dim sequence
Randomize
sequence	= Int(1000 * Rnd)
' a time stamp is generated (using a function from simlib.asp)
Dim timeStamp
timeStamp = simTimeStamp()
' a fingerprint is generated using the functions from simlib.asp and md5.asp
Dim fingerprint
fingerprint = HMAC (transactionKey, loginID & "^" & sequence & "^" & timeStamp & "^" & Amount & "^")

' Create the HTML form containing necessary SIM post values
' Additional fields can be added here as outlined in the SIM integration guide
' at: http://developer.authorize.net
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
  "http://www.w3.org/TR/html4/loose.dtd">
<HTML lang='en'>
<HEAD>
	<TITLE> Sending donation information to Authorize.Net... </TITLE>

    <script type="text/javascript">
        function load() {
            if (confirm("Post to Authorize.Net?")) {
                document.forms["authorizedotnetform"].submit();
            }
        }
    </script>
</HEAD>
<BODY onload="load()">

<FORM id='authorizedotnetform' method='post' action='<% Response.Write(authorizeUrl) %>' >
	<INPUT type='hidden' name='x_login' value='<% Response.Write(loginId) %>' />
	<INPUT type='hidden' name='x_test_request' value='<% Response.Write(testModeEnabled) %>' />
	<INPUT type='hidden' name='x_invoice_num' value='<% Response.Write(invoiceNo) %>' />
	<INPUT type='hidden' name='x_fp_sequence' value='<% Response.Write(sequence) %>' />
	<INPUT type='hidden' name='x_fp_timestamp' value='<% Response.Write(timeStamp) %>' />
	<INPUT type='hidden' name='x_fp_hash' value='<% Response.Write(fingerprint) %>' />
    <INPUT type='hidden' name='x_show_form' value='PAYMENT_FORM' />
	<INPUT type='hidden' name='x_line_item' value='<% Response.Write(lineItem) %>' />

    <div style="display:none">
        <%
            Response.Write(vbCrLf)
            Dim i
            For i = 1 to Request.Form.Count
                If Left(Request.Form.Key(i),2) = "x_" Then
                    Dim Key, Value
                    Response.Write("        <input type='hidden' name=""" & Sanitize(Request.Form.Key(i)) & """ value=""" & Sanitize(Request.Form.Item(i)) & """ />" & vbCrLf) 
                End If
            Next
        %>


        <% If UCase(Request.Form("ReturnEnabled")) = "TRUE" Then
            Response.Write("    <INPUT TYPE=HIDDEN NAME='x_receipt_link_method' VALUE='LINK'>" & vbCrLf)
            Response.Write("    <INPUT TYPE=HIDDEN NAME='x_receipt_link_text' VALUE=""" & Sanitize(Request.Form("ReturnTitle")) & """>" & vbCrLf)
            Response.Write("    <INPUT TYPE=HIDDEN NAME='x_receipt_link_URL' VALUE=""" & Sanitize(Request.Form("ReturnUrl")) & """>" & vbCrLf)
        End If %>

    </div>


</FORM>

</BODY>
</HTML>
<%

End Function

%>