<!--
DonationReasonId = Request.Form("DonationReasonId")
DonorFirstName = Request.Form("DonorFirstName")
DonorLastName = Request.Form("DonorLastName")
DonorEmailAddress = Request.Form("DonorEmailAddress")
DonorCity = Request.Form("DonorCity")
DonorZipCode = Request.Form("DonorZipCode")
DonationAmount = Request.Form("DonationAmount")

DonorAddress	DonorAddress2	DonorCity	DonorState	DonorZipCode	DonorPhone	DonorPhoneDayOrEvening	DonorEmailAddress	AddToNewsletter
DonationAmount	IsMemorial	MemorialName	IsTribute	TributeName	TributeReason	NotificationName	NotificationAddress	NotificationCity	NotificationState	NotificationZipCode	DonorComments

<!-- test -->
<%
DonationReasonID = 1
DonorFirstName = "Steve"
DonorLastName = "Gentile"
DonorEmailAddress = "steven.gentile@gmail.com"
DonorCity = "Dayton"
DonorZipCode = "45440"
DonationAmount = "5.50"


set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"

sql="INSERT INTO DONATIONS (DonationReasonID, DonorFirstName,DonorLastName, DonorEmailAddress, DonorCity, DonorZipCode, DonationAmount)"
sql=sql & " VALUES "
sql=sql & "('" & DonorFirstName & "',"
sql=sql & "'" & DonationReasonID & "',"
sql=sql & "'" & DonorLastName & "',"
sql=sql & "'" & DonorEmailAddress & "',"
sql=sql & "'" & DonorCity & "',"
sql=sql & "'" & DonorZipCode & "',"
sql=sql & "'" & DonationAmount & "')"

on error resume next
conn.Execute sql,recaffected
if err<>0 then
  Response.Write(err)
else
  Response.Write("<h3>" & recaffected & " record added</h3>")
end if
conn.close

%>

