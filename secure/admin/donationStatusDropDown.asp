<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"

set rs=Server.CreateObject("ADODB.recordset")
sql="SELECT DonationStatusId, DonationStatusDescription FROM DonationStatus"
rs.Open sql, conn



StatusDropDownText = "<SELECT id=""DonationStatusDropDown"" name=""DonationStatusDropDown"">"
Do While Not rs.EOF
	StatusDropDownText = StatusDropDownText & "<OPTION value=""" & rs.Fields.Item("DonationStatusId") & """>" & rs.Fields.Item("DonationStatusDescription") & "</OPTION>"
    
    rs.MoveNext
loop
  rs.close
  conn.close
StatusDropDownText = "</SELECT>"

%>
