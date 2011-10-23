<!--#include file=adovbs.inc -->
<%
EventId = Request.Form("EventId")
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

objCmd.Parameters("@EVENTID") = EventId

'Open and display the Recordset.

objRS.Open objCmd, adOpenKeyset, adLockOptimistic

objRS("EventName") = Request.Form("EventName")
objRS.Update

objRS.Close
objConn.Close
Set objRS = Nothing
Set objCmd = Nothing
Set objConn = Nothing
%>