<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"

set rs=Server.CreateObject("ADODB.recordset")
sql="SELECT EVENTID, EVENTNAME FROM EVENTS"
rs.Open sql, conn
%>


<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
	<thead>
		<tr>
			<th>Id</th>
			<th>Event Name</th>
		</tr>
	</thead>
	<tbody>
		<tr class="">
			<td>Trident</td>
			<td>Internet
				 Explorer 4.0</td>

			<td>Win 95+</td>
			<td class="center">4</td>
			<td class="center">X</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<th>Id</th>
			<th>Event Name</th>
		</tr>
	</tfoot>
</table>


<SELECT id="SelectListEventId" name="DonationEventId">
  <% Do While Not rs.EOF %>
	  <OPTION value="<%= rs.Fields.Item("EVENTID") %>">(<%= rs.Fields.Item("EventId") %>)<%= rs.Fields.Item("EVENTNAME") %> </OPTION>
    <%rs.MoveNext%>
  <%loop
  rs.close
  conn.close%>
</SELECT>


