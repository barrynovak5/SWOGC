
<!--#include file=adovbs.inc -->


<!--#include file=DonationStatusDropdown.asp -->

<%
donationEventId = Request.Querystring("ID")
donationEventName = Request.Querystring("Name")

Set objConn = Server.CreateObject("ADODB.Connection")
Set objCmd  = Server.CreateObject("ADODB.Command")

sub UpdateDonationStatus (donationId, statusId)

    objConn.Open "FourC"

    Set objCmd.ActiveConnection = objConn
    
    objCmd.CommandText = "UPDATE Donations WHERE Set DonationStatusID = ? Donations.DonationID = ?"
    objCmd.CommandType = adCmdText

    'Create the parameter and populate it.

    Set objParam = objCmd.CreateParameter("@DonationStatusId" , adInteger, adParamInput, 0, 0)
    objCmd.Parameters.Append objParam

    objCmd.Parameters("@DonationStatusId") = CInt(statusId)

    Set objParam = objCmd.CreateParameter("@DonationId" , adInteger, adParamInput, 0, 0)
    objCmd.Parameters.Append objParam

    objCmd.Parameters("@DonationId") = CInt(donationId)
    
    objCmd.Execute
        
    objConn.Close

end sub

if (Request.Form("PostAction") = "U") then
    
    Call UpdateDonationStatus(Request.Form("DonationID"), Request.Form("DonationStatusID"))

end if

Set objRS   = Server.CreateObject("ADODB.Recordset")
objConn.Open "FourC"

objRS.CursorType = adOpenForwardOnly
objRS.LockType = adLockOptimistic
                
Set objCmd.ActiveConnection = objConn

'If a SQL statement with question marks is specified, then the
'CommandType is adCmdText.  If a query name is specified, then
'the CommandType is adCmdStoredProc.

Dim fieldList
fieldList = "DonationID, DonorFirstName, DonorLastName, DonorCompany, DonationStatusID" 
objCmd.CommandText = "SELECT " & fieldList & " FROM Donations WHERE Donations.AddToNewsletter = True AND Donations.EventID = ?"
objCmd.CommandType = adCmdText

'Create the parameter and populate it.

Set objParam = objCmd.CreateParameter("@EVENTID" , adInteger, adParamInput, 0, 0)
objCmd.Parameters.Append objParam

objCmd.Parameters("@EVENTID") = donationEventId

'Open and display the Recordset.

objRS.Open objCmd
%>
<html>
<body>
<head>
    <script type="text/javascript">
        function UpdateStatus(donationID)
        {
            var theForm = document.getElementById("ManageEventVisitorStatuses");
            var status = document.getElementById("DonationStatuses" + donationID);
            
            theForm.DonationID.value = donationID;
            theForm.DonationStatusID.value = status.value;
            theForm.submit();
            return true;
        }
    </script>
</head>
<h2><%= donationEventName %></h2>
<table style="font-weight:bold" border=1 cellpadding=2 cellspacing=2>
<tr>
<td><b> ID </td>
<td>
    First Name
</td>
<td>
    Last Name
</td>
<td>
    Company
</td>
<td>
  <b> Donation Status</b>
</td>
<td></td>
</tr>
<%
//objRS.MoveFirst
Do While Not objRS.EOF
 %> 
 <tr>
    <td>
        <%=objRS("DonationID") %> 
    </td>
    <td>
        <%=objRS("DonorFirstName") %> &nbsp;
    </td><td>
        <%=objRS("DonorLastName") %>&nbsp;
    </td><td>
        <%=objRS("DonorCompany") %>&nbsp;
    </td>
    <td>
        &nbsp;<%=Replace(StatusDropDownText, "DonationStatusDropDown", "DonationStatuses" & objRS("DonationID"))%>
    </td>
    <td>
        <input type="button" value="Update Status" onclick="return UpdateStatus(<%=objRS("DonationID")%>)" />
    </td>
 </tr>

<%  
objRS.MoveNext
Loop
%>
</table>
 <form method="post" name="ManageEventVisitorStatuses" id="ManageEventVisitorStatuses" action="ManageEventVisitorStatuses.asp?ID<%=donationEventId%>&Name=<%=donationEventName%>">
        <input value="U" type="hidden" name="PostAction"/>
        <input value="" name="DonationID" type="hidden" />
        <input value="" name="DonationStatusID" type="hidden" />      
</form>
<%
objRS.Close
objConn.Close
Set objRS = Nothing
Set objCmd = Nothing
Set objConn = Nothing
%>

</body>
</html>