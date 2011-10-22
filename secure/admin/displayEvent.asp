<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>4c Admin</title>
</head>

<body>

<%
donationEventId = Request.Form("DonationEventId")

strCmd = "SELECT * FROM DONATIONEVENT WHERE EVENTID = ?"
Set objCommand.ActiveConnection = objConn
objCommand.CommandText = strCmd
objCommand.CommandType = adCmdText
Set param1 = objCommand.CreateParameter ("EVENTID", adWChar, adParamInput, 50)
param1.value = strAuthor
objCommand.Parameters.Append param1
Set objRS = objCommand.Execute()


Response.Write(sql)
rs.Open sql, conn
%>

table border="1" width="100%">
  <tr>
  <%for each x in rs.Fields
    response.write("<th>" & x.name & "</th>")
  next%>
  </tr>
  <%do until rs.EOF%>
    <tr>
    <%for each x in rs.Fields%>
      <td>
	  <%Response.Write(x.value)%></td>
    <%next
    rs.MoveNext%>
    </tr>
  <%loop
  rs.close
  conn.close%>
</table>
