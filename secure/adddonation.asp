<!--

Response.Write("DonationReasonId " & DonationReasonId & "<br/>")
Response.Write("DonorFirstName " & DonorFirstName& "<br/>")
Response.Write("DonorLastName " & DonorLastName& "<br/>")
Response.Write("DonorEmailAddress " & DonorEmailAddress& "<br/>")
Response.Write("DonorCity " & DonorCity& "<br/>")
Response.Write("DonorZipCode " & DonorZipCode& "<br/>")
Response.Write("DonationAmount " & DonationAmount& "<br/>")
-->

<%


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

sql="INSERT INTO DONATIONS (DonationReasonID, DonorFirstName, DonorLastName, DonorEmailAddress, DonorCity, DonorState, DonorZipCode, DonationAmount, DonorAddress, DonorAddress2, DonorPhone, DonorPhoneDayOrEvening, AddToNewsletter)"
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
sql=sql & "'" & DonorPhoneDayOrEvening & "',"
sql=sql & "'" & AddToNewsletter & "')"

Response.Write(sql)

on error resume next
conn.Execute sql,recaffected
if err<>0 then
  Response.Write(err)
else
  Response.Write("<h3>" & recaffected & " record added</h3>")
end if
conn.close

%>

