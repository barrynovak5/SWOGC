
<!--#include file=adovbs.inc -->
<%
donationEventId = Request.Form("DonationEventId")
Response.Write(donationEventId)
%>

<%
Set objConn = Server.CreateObject("ADODB.Connection")
Set objCmd  = Server.CreateObject("ADODB.Command")
Set objRS   = Server.CreateObject("ADODB.Recordset")

objConn.Open "FourC"

objRS.CursorType = adOpenForwardOnly
objRS.LockType = adLockOptimistic
                
Set objCmd.ActiveConnection = objConn

'If a SQL statement with question marks is specified, then the
'CommandType is adCmdText.  If a query name is specified, then
'the CommandType is adCmdStoredProc.

objCmd.CommandText = "SELECT * FROM EVENTS WHERE EVENTID = ?"
objCmd.CommandType = adCmdText

'Create the parameter and populate it.

Set objParam = objCmd.CreateParameter("@EVENTID" , adInteger, adParamInput, 0, 0)
objCmd.Parameters.Append objParam

objCmd.Parameters("@EVENTID") = donationEventId

'Open and display the Recordset.

objRS.Open objCmd
%>
<table border=1 cellpadding=2 cellspacing=2>
<tr>
<%
For I = 0 To objRS.Fields.Count - 1
  Response.Write "<td><b>" & objRS(I).Name & "</b></td>"
Next
%>
</tr>
<%
Do While Not objRS.EOF
  Response.Write "<tr>"
  For I = 0 To objRS.Fields.Count - 1
    Response.Write "<td>" & objRS(I) & "</td>"
  Next
  Response.Write "</tr>"
  objRS.MoveNext
Loop
%>
</table>

<%
objRS.Close
objConn.Close
Set objRS = Nothing
Set objCmd = Nothing
Set objConn = Nothing
%>

