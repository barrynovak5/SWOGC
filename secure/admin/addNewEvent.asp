<!--#INCLUDE FILE="adminheader.asp"-->
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"

set rs=Server.CreateObject("ADODB.recordset")
sql="SELECT * FROM EVENTTYPE"
rs.Open sql, conn
%>
<form method="post" action="saveNewEvent.asp">
<SELECT name="EventTypeID">
  <% Do While Not rs.EOF %>
	  <OPTION value="<%= rs.Fields.Item("EventTypeID") %>"><%= rs.Fields.Item("EventTypeDescription") %> </OPTION>
    <%rs.MoveNext%>
  <%loop
  rs.close
  conn.close%>
</SELECT>

</form>