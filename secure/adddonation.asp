<%
Function AddDonation(invoiceNo)
' Fields used by both Authorize.net and our database
EventId = Request.Form("EventID")
DonorFirstName = Request.Form("x_first_name")
DonorLastName = Request.Form("x_last_name")
DonorCompany = Request.Form("x_company")
DonorEmailAddress = Request.Form("x_email")
DonorCity = Request.Form("x_city")
DonorState  = Request.Form("x_state")
DonorZipCode = Request.Form("x_zip")
DonationAmount = Request.Form("x_amount")
DonorAddress = Request.Form("x_address")
DonorPhone = Request.Form("x_phone")

' Fields only used by our database
DonationReasonId = Request.Form("DonationReasonId")
DonorAddress2  = Request.Form("DonorAddress2")
DonorPhoneDayOrEvening = Request.Form("DonorPhoneDayOrEvening")
AddToNewsletter = Request.Form("AddToNewsletter")


set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"

sql="INSERT INTO DONATIONS (EventID, InvoiceNumber, DonationReasonID, DonorFirstName, DonorLastName, DonorCompany, DonorEmailAddress, DonorCity, DonorState, DonorZipCode, DonationAmount, DonorAddress, DonorAddress2, DonorPhone, AddToNewsletter, DonorPhoneDayOrEvening)"
sql=sql & " VALUES (" & _
    EventId & "," & _
    "'" & invoiceNo & "'," & _
    DonationReasonID & "," & _
    "'" & DonorFirstName & "',"
sql=sql & "'" & DonorLastName & "',"
sql=sql & "'" & DonorCompany & "',"
sql=sql & "'" & DonorEmailAddress & "',"
sql=sql & "'" & DonorCity & "',"
sql=sql & "'" & DonorState & "',"
sql=sql & "'" & DonorZipCode & "',"
sql=sql & "" & DonationAmount & ","
sql=sql & "'" & DonorAddress & "',"
sql=sql & "'" & DonorAddress2 & "',"
sql=sql & "'" & DonorPhone & "',"
sql=sql & "" & AddToNewsletter & ","
sql=sql & "'" & DonorPhoneDayOrEvening & "')"



on error resume next
conn.Execute sql,recaffected
if err<>0 then
	Response.Write(sql)
  Response.Write("Error " & err.Description)
end if
conn.close

End Function
%>

