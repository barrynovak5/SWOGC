<!--#INCLUDE FILE="simlib.asp"-->
<!--#INCLUDE FILE="AuthorizeSettings.asp"-->

<%

Function ShowAuthorizeForm()

' Get Authorize Credentials
Dim loginID, transactionKey, testMode, authorizeUrl
Call getAuthorizeCredentials(loginId, transactionKey, testMode, authorizeUrl)


Dim amount, description
amount = Request.Form("DonationAmount")
description		= lineItemName

' an invoice ID is generated using the date and time
Dim invoiceNo
invoiceNo = Year(Date) & Month(Date) &  Day(Date) & Hour(Now) & Minute(Now) & Second(Now)

' Get the data we need from the POST info
dim lineItem, lineItemQuantity, lineItemIsTaxable
lineItemQuantity = "1"
lineItemIsTaxable = "N"
lineItem = Request.Form("EventId") & "<|>" & Request.Form("EventName") & "<|>" & Request.Form("EventDescription") & "<|>" & _
    lineItemQuantity & "<|>" & Request.Form("DonationAmount") & "<|>" & lineItemIsTaxable

' a sequence number is randomly generated
Dim sequence
Randomize
sequence	= Int(1000 * Rnd)
' a time stamp is generated (using a function from simlib.asp)
Dim timeStamp
timeStamp = simTimeStamp()
' a fingerprint is generated using the functions from simlib.asp and md5.asp
Dim fingerprint
fingerprint = HMAC (transactionKey, loginID & "^" & sequence & "^" & timeStamp & "^" & amount & "^")

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
	<INPUT type='hidden' name='x_amount' value='<% Response.Write(amount) %>' />
	<INPUT type='hidden' name='x_description' value='<% Response.Write(description) %>' />
	<INPUT type='hidden' name='x_invoice_num' value='<% Response.Write(invoiceNo) %>' />
	<INPUT type='hidden' name='x_fp_sequence' value='<% Response.Write(sequence) %>' />
	<INPUT type='hidden' name='x_fp_timestamp' value='<% Response.Write(timeStamp) %>' />
	<INPUT type='hidden' name='x_fp_hash' value='<% Response.Write(fingerprint) %>' />
	<INPUT type='hidden' name='x_test_request' value='<% Response.Write(testModeEnabled) %>' />
    <INPUT type='hidden' name='x_show_form' value='PAYMENT_FORM' />
	<INPUT type='hidden' name='x_line_item' value='<% Response.Write(lineItem) %>' />

	<INPUT type='hidden' name='x_first_name' value='<% Response.Write(Request.Form("DonorFirstName")) %>' />
	<INPUT type='hidden' name='x_last_name' value='<% Response.Write(Request.Form("DonorLastName")) %>' />
	<INPUT type='hidden' name='x_address' value='<% Response.Write(Request.Form("DonorAddress") & " " & Request.Form("DonorAddress2")) %>' />
	<INPUT type='hidden' name='x_state' value='<% Response.Write(Request.Form("DonorState")) %>' />
	<INPUT type='hidden' name='x_zip'     value='<% Response.Write(Request.Form("DonorZipCode")) %>' />

	<INPUT type='hidden' name='x_company' value='<% Response.Write(Request.Form("DonorCompany")) %>' />
	<INPUT type='hidden' name='x_city'    value='<% Response.Write(Request.Form("DonorCity")) %>' />
	<INPUT type='hidden' name='x_phone'   value='<% Response.Write(Request.Form("DonorPhone")) %>' />
	<INPUT type='hidden' name='x_email'   value='<% Response.Write(Request.Form("DonorEmailAddress")) %>' />

    <div style="display:none">
        <%
            Response.Write(vbCrLf)
            Dim i
            For i = 1 to Request.Form.Count
                If Left(Request.Form.Key(i),2) = "x_" Then
                    Response.Write("        <input type='hidden' name='" & CStr(Request.Form.Key(i)) & "' value=""" & CStr(Request.Form.Item(i)) & """ />" & vbCrLf) 
                End If
            Next
        %>


        <% If UCase(Request.Form("ReturnEnabled")) = "TRUE" Then
            Response.Write("    <INPUT TYPE=HIDDEN NAME='x_receipt_link_method' VALUE='LINK'>" & vbCrLf)
            Response.Write("    <INPUT TYPE=HIDDEN NAME='x_receipt_link_text' VALUE='" & Request.Form("ReturnTitle") & "'>" & vbCrLf)
            Response.Write("    <INPUT TYPE=HIDDEN NAME='x_receipt_link_URL' VALUE='" & Request.Form("ReturnUrl") & "'>" & vbCrLf)
        End If %>

    </div>


</FORM>

</BODY>
</HTML>
<%

End Function

%>