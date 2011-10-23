<!--#INCLUDE FILE="adminheader.asp"-->
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"

set rs=Server.CreateObject("ADODB.recordset")
sql="SELECT * FROM EVENTTYPE"
rs.Open sql, conn
%>
<form method="post" action="saveNewEvent.asp">
<div>
<label for="EventTypeID">EventType:</label>
<SELECT name="EventTypeID">
  <% Do While Not rs.EOF %>
	  <OPTION value="<%= rs.Fields.Item("EventTypeID") %>"><%= rs.Fields.Item("EventTypeDescription") %> </OPTION>
    <%rs.MoveNext%>
  <%loop
  rs.close
  conn.close%>
</SELECT>
</div>
<div>
	<label for="EventName">EventName:</label>
	<input type="textbox" name="EventName" value=""/>
</div>
<div>
	<label for="EventDescription">EventDescription:</label>
	<input type="textbox" name="EventDescription" value=""/>
</div>
<div>
	<label for="ReceiptLink">ReceiptLink:</label>
	<input type="textbox" name="ReceiptLink" value=""/>
</div>	
<div>
	<label for="ReceiptMethod">ReceiptMethod:</label>
	<input type="textbox" name="ReceiptMethod" value=""/>
</div>
<div>
	<label for="SendEmailReceipt">SendEmailReceipt:</label>
	<!--<input type="textbox" name="SendEmailReceipt" value=""/>-->
	<input type="checkbox" name="SendEmailReceipt" value="True" /> 
</div>

<div>
	<label for="ReceiptEmailSender">ReceiptEmailSender:</label>
	<input type="textbox" name="ReceiptEmailSender" value=""/>
</div>

<div>
	<label for="ReceiptEmailFooter">ReceiptEmailFooter:</label>
	<input type="textbox" name="ReceiptEmailFooter" value=""/>
</div>

<div>
	<label for="PaymentFormHeader">PaymentFormHeader:</label>
	<input type="textbox" name="PaymentFormHeader" value=""/>
</div>

<div>
	<label for="PaymentFormFooter">PaymentFormFooter:</label>
	<input type="textbox" name="PaymentFormFooter" value=""/>
</div>

<div>
	<label for="ReceiptFormHeader">ReceiptFormHeader:</label>
	<input type="textbox" name="ReceiptFormHeader" value=""/>
</div>

<div>
	<label for="ReceiptFormFooter">ReceiptFormFooter:</label>
	<input type="textbox" name="ReceiptFormFooter" value=""/>
</div>

<div>
	<label for="CancelURL">CancelURL:</label>
	<input type="textbox" name="CancelURL" value=""/>
</div>

<div>
	<label for="ReceiptPageURL">ReceiptPageURL:</label>
	<input type="textbox" name="ReceiptPageURL" value=""/>
</div>

<div>
	<label for="ReceiptPageTitle">ReceiptPageTitle:</label>
	<input type="textbox" name="ReceiptPageTitle" value=""/>
</div>

<div>
	<label for="EventConfirmation">EventConfirmation:</label>
	<input type="textbox" name="EventConfirmation" value=""/>
</div>

<div>
	<label for="EventEmailConfirmation">EventEmailConfirmation:</label>
	<input type="textbox" name="EventEmailConfirmation" value=""/>
</div>

<input type="submit" value="Save"/>
<div>
</div>
</form>