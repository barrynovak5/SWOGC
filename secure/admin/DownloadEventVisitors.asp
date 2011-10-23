
<!--#include file=adovbs.inc -->

<%
<<<<<<< HEAD
donationEventId = Request.QueryString("DonationEventId")
//Response.Write("<p>EventID=" & CStr(donationEventId) & "</p>")
Call Response.AddHeader("Content-Type", "application/csv")
Call Response.AddHeader("Content-Disposition", "attachment: filename=file.csv")
%>
<%
=======
donationEventId = Request.QueryString("Id")
fileName = Request.QueryString("Name")

'Response.Write("<p>EventID=" & CStr(donationEventId) & "</p>")

Call Response.AddHeader("Content-Type", "application/csv")
Call Response.AddHeader("Content-Disposition", "attachment; filename=""" & fileName & ".csv""")

>>>>>>> fa31079602572ab9b0ac67b01c40c8bd91d6797a
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
fieldList = "DonorFirstName, DonorLastName, DonorCompany, DonorAddress, DonorAddress2, DonorCity, DonorState, DonorZipCode, DonorPhoneDayOrEvening, DonorEmailAddress" 
objCmd.CommandText = "SELECT " & fieldList & " FROM Donations WHERE Donations.AddToNewsletter = True AND Donations.EventID = ?"
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

