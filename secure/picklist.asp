<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"

set rs=Server.CreateObject("ADODB.recordset")
sql="SELECT ID, LISTVALUE FROM DONATIONREASONS WHERE ACTIVE = 1 ORDER BY LISTVALUE ASC"
rs.Open sql, conn
%>
<SELECT name="DonationReasonId">
  <% Do While Not rs.EOF %>
	  <OPTION value="<%= rs.Fields.Item("ID") %>"><%= rs.Fields.Item("LISTVALUE") %> </OPTION>
    <%rs.MoveNext%>
  <%loop
  rs.close
  conn.close%>
</SELECT>


