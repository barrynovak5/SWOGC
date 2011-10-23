<!--#INCLUDE FILE="adddonation.asp"-->
<!--#INCLUDE FILE="AuthorizeForm.asp"-->

<%

Dim EventTypeId
EventTypeId = Request.Form("EventTypeId")

' an invoice ID is generated using the date and time
Dim invoiceNo
invoiceNo = Year(Date) & Month(Date) &  Day(Date) & Hour(Now) & Minute(Now) & Second(Now)

AddDonation(invoiceNo)
ShowAuthorizeForm(invoiceNo)

%>