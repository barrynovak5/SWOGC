<%
Function AddDonation()
DonationReasonId = Request.Form("DonationReasonId")
DonorFirstName = Request.Form("DonorFirstName")
DonorLastName = Request.Form("DonorLastName")
DonorEmailAddress = Request.Form("DonorEmailAddress")
DonorCity = Request.Form("DonorCity")
DonorState  = Request.Form("DonorState")
DonorZipCode = Request.Form("DonorZipCode")
DonationAmount = Request.Form("DonationAmount")
DonorAddress = Request.Form("DonorAddress")
DonorAddress2  = Request.Form("DonorAddress2")
DonorPhone = Request.Form("DonorPhone")
DonorPhoneDayOrEvening = Request.Form("DonorPhoneDayOrEvening")
AddToNewsletter = Request.Form("AddToNewsletter")


set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"

sql="INSERT INTO DONATIONS (DonationReasonID, DonorFirstName, DonorLastName, DonorEmailAddress, DonorCity, DonorState, DonorZipCode, DonationAmount, DonorAddress, DonorAddress2, DonorPhone, AddToNewsletter, DonorPhoneDayOrEvening)"
sql=sql & " VALUES "
sql=sql & "(" & DonationReasonID & ","
sql=sql & "'" & DonorFirstName & "',"
sql=sql & "'" & DonorLastName & "',"
sql=sql & "'" & DonorEmailAddress & "',"
sql=sql & "'" & DonorCity & "',"
sql=sql & "'" & DonorState & "',"
sql=sql & "'" & DonorZipCode & "',"
sql=sql & "'" & DonationAmount & "',"
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

