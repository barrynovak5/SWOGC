<!--#INCLUDE FILE="adddonation.asp"-->
<!--#INCLUDE FILE="AuthorizeForm.asp"-->

<%

Dim EventTypeId, invoiceNo
EventTypeId = Request.Form("EventTypeId")

If EventTypeId = "1" Then 'Donation

    ' an invoice ID is generated using the date and time
    invoiceNo = Year(Date) & Month(Date) &  Day(Date) & Hour(Now) & Minute(Now) & Second(Now)

    AddDonation(invoiceNo)
    ShowAuthorizeForm(invoiceNo)

ElseIf EventTypeId = "2" Or EventTypeId = "3" Then '2 = Event, 3 = Newsletter
    
    AddDonation(invoiceNo)
    ShowThankYou()    

End If


%>