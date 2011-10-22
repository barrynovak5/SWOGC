<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"

set rs=Server.CreateObject("ADODB.recordset")
sql="SELECT EVENTID, EVENTNAME FROM EVENTS"
rs.Open sql, conn
%>
<SELECT name="DonationEventId">
  <% Do While Not rs.EOF %>
	  <OPTION value="<%= rs.Fields.Item("EVENTID") %>"><%= rs.Fields.Item("EVENTNAME") %> </OPTION>
    <%rs.MoveNext%>
  <%loop
  rs.close
  conn.close%>
</SELECT>


