
<!--#include file=adovbs.inc -->
<%
donationEventId = Request.Form("DonationEventId")
Response.Write("<p>EventID=" & donationEventId & "</p>")
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

objCmd.CommandText = "SELECT Donations.DonorFirstName, Donations.DonorLastName, Donations.DonorCompany, Donations.DonorAddress, Donations.DonorAddress2, Donations.DonorCity, Donations.DonorState, Donations.DonorZipCode, Donations.DonorPhoneDayOrEvening, Donations.DonorEmailAddress FROM Donations WHERE Donations.AddToNewsletter = True AND Donations.EventID = ?"
objCmd.CommandType = adCmdText

'Create the parameter and populate it.

Set objParam = objCmd.CreateParameter("@EVENTID" , adInteger, adParamInput, 0, 0)
objCmd.Parameters.Append objParam

objCmd.Parameters("@EVENTID") = donationEventId

'Open and display the Recordset.

objRS.Open objCmd
%>
<%
Do While Not objRS.EOF
  Response.Write "<p>"
  For I = 0 To objRS.Fields.Count - 1
    	if I > 0 then Response.Write ", "
	Response.Write """" & objRS(I) & """"
  Next
  Response.Write "</p>"
  objRS.MoveNext
Loop
%>


<%
objRS.Close
objConn.Close
Set objRS = Nothing
Set objCmd = Nothing
Set objConn = Nothing
%>

