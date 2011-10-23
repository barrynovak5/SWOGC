<%
Function AddDonation(invoiceNo, amount)

Set objConn = Server.CreateObject("ADODB.Connection")
Set objCmd  = Server.CreateObject("ADODB.Command")
Set objRS   = Server.CreateObject("ADODB.Recordset")

objConn.Open "FourC"
objRS.Open "DONATIONS", objConn, adOpenKeyset, adLockOptimistic, adCmdTable

objRs.AddNew
objRs("EventId") = Request.Form("EventID")
objRs("InvoiceNumber") = invoiceNo
objRs("DonationReasonID") = Request.Form("DonationReasonId")
objRs("DonorFirstName") = Request.Form("x_first_name")
objRs("DonorLastName") = Request.Form("x_last_name")
objRs("DonorCompany") = Request.Form("x_company")
objRs("DonorEmailAddress") = Request.Form("x_email")
objRs("DonorCity") = Request.Form("x_city")
objRs("DonorState") = Request.Form("x_state")
objRs("DonorZipCode") = Request.Form("x_zip")
objRs("DonationAmount") = amount
objRs("DonorAddress") = Request.Form("x_address")
objRs("DonorAddress2") = Request.Form("DonorAddress2")
objRs("DonorPhone") = Request.Form("x_phone")
objRs("AddToNewsletter") = Request.Form("AddToNewsletter")
objRs("DonorPhoneDayOrEvening") = Request.Form("DonorPhoneDayOrEvening")
objRs("DonorComments") = Request.Form("DonorComments")
objRs.Update

objConn.close

End Function
%>

