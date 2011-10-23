<!--#include file=adovbs.inc -->

<%
donationEventId = Request.QueryString("Id")
fileName = Request.QueryString("Name")

'Response.Write("<p>EventID=" & CStr(donationEventId) & "</p>")

Call Response.AddHeader("Cache-Control", "must-revalidate")
Call Response.AddHeader("Pragma", "must-revalidate")
Call Response.AddHeader("Content-type", "application/vnd.ms-excel")
Call Response.AddHeader("Content-Disposition", "attachment; filename=""" & fileName & ".csv""")

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

Dim fieldList
fieldList = "DonorFirstName, DonorLastName, AddToNewsletter, DonorCompany, DonorAddress, DonorAddress2, DonorCity, DonorState, DonorZipCode, DonorPhoneDayOrEvening, DonorEmailAddress" 
objCmd.CommandText = "SELECT " & fieldList & " FROM Donations WHERE Donations.EventID = ?"
objCmd.CommandType = adCmdText

'Create the parameter and populate it.

Set objParam = objCmd.CreateParameter("@EVENTID" , adInteger, adParamInput, 0, 0)
objCmd.Parameters.Append objParam

objCmd.Parameters("@EVENTID") = donationEventId

'Open and display the Recordset.

objRS.Open objCmd

Response.Write(fieldList & vbCrLf)

Do While Not objRS.EOF
  For I = 0 To objRS.Fields.Count - 1
    If I > 0 Then 
        Response.Write ","
    End If
    ' Write it out to a file, surrounding it with double-quotes 
    Response.Write """" & objRs(I) & """"
  Next
  Response.Write vbcrlf
  objRS.MoveNext
Loop

objRS.Close
objConn.Close
Set objRS = Nothing
Set objCmd = Nothing
Set objConn = Nothing
%>

