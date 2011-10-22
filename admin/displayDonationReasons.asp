<html>
<head title="Donation Reasons">
     <script type="text/javascript">
     
            function GetEditForm()
            {
               var existingReasonsForm = document.getElementById("existingReasonsForm");
               return existingReasonsForm;               
            }
     
            function SetBasicFormParameters(action, id, theForm)
            {
                theForm.DonationReasonId.value = id;                
                theForm.DonationReasonAction = action;
            }            
         
            function UpdateDonation(donationId)
            {                
                var theForm = GetEditForm();
            
                SetBasicFormParameters("U", donationId, theForm);
                var donationReasonText = document.getElementById("Reason" + donationId);
                theForm.DonationReasonValue.value = donationReasonText.value;
                
                theForm.sumit();
            }
            
            function DeleteDonation(donationId)
            {
                var theForm = GetEditForm();
                        
                SetBasicFormParameters("D", donationId, theForm);
                
                theForm.submit();            
            }
            
            function ValidateAddReason(theForm)
            {
                if (!theForm.DonationReasonValue.length)
                {
                    alert("Please enter a donation reason to add");
                    return (false);
                }
                return true;
            }
     </script>
</head>
<body>

    <%

    successMessage = ""

    DonationReasonAction = Request.Form("DonationReasonAction")
    DonationReasonID = Request.Form("DonationReasonId")
    DonationReasonValue = Request.Form("DonationReasonValue")

    set conn=Server.CreateObject("ADODB.Connection")

 Sub AddDonationReason()

    conn.Open "FourC"

    sql="INSERT INTO DONATIONREASONS (ID, LISTVALUE)"
    sql=sql & " VALUES "
    sql=sql & "(" & DonationReasonID & ","
    sql=sql & "'" & DonationReasonValue & "')"

    conn.Execute sql,recaffected
    if err<>0 then
	    Response.Write(sql)
    Response.Write("Error " & err.Description)
    end if
    conn.close
    
    successMessage = "Donation added successfully"

End Sub

Sub UpdateDonationReason()

    conn.Open "FourC"

    sql="UPDATE DONATIONREASONS SET LISTVALUE = " & DonationReasonValue
    sql = sql & " WHERE ID =" & DonationReasonID

    on error resume next
    conn.Execute sql,recaffected
    if err<>0 then
	    Response.Write(sql)
    Response.Write("Error " & err.Description)
    end if
    conn.close
    
    successMessage = "Donation Updated Successfully"

End Sub

Sub DeleteDonationReason()

    conn.Open "FourC"

    sql="UPDATE DONATIONREASONS SET ACTIVE = 0"
    sql = sql & " WHERE ID =" & DonationReasonID

    on error resume next
    conn.Execute sql,recaffected
    if err<>0 then
	    Response.Write(sql)
    Response.Write("Error " & err.Description)
    end if
    conn.close
    
    successMessage = "Donation Deleted Successfully"

End Sub

  'Process the donation reasons depending on the action specified.
  'D=Delete U=Update A=Add
   
  Select Case donationReason
  
  Case "A"
      Call AddDonationReason()     
  Case "U"
      Call UpdateDonationReason()
  Case "D"
      Call DeleteDonationReason()
  End Select     


conn.Open "FourC"
set rs=Server.CreateObject("ADODB.recordset")
sql="SELECT ID, LISTVALUE FROM DONATIONREASONS"
rs.Open sql, conn
    %>
    <table>
        <tr>
            <td>                
                 <h4><%=successMessage%></h4>
            </td>
        </tr>
        <tr>
            <td>
                <h3>
                    Donation Reasons</h3>
            </td>
        </tr>
        <tr>
            <td>
                <form onsubmit="return ValidateAddReason(this)" action="displayDonationReasons.asp">
                    <input value="A" name="DonationReasonAction" type="hidden" />
                    <table>
                        <tr>
                        <td>
                            Add new donation reason&nbsp;&nbsp;
                        </td>
                        <td>
                            <input name="DonationReasonValue" type="text" style="width: 408px" />
                        </td>
                        <td>
                            &nbsp;&nbsp;
                            <input type="submit" value="Add" />
                        </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
        <tr>
            <td>
                <form id="existingReasonsForm" action ="displayDonationReasons.asp">
                    <input value="U" name="DonationReasonAction" type="hidden" />
                    <input name="DonationReasonValue" type="hidden" />
                    <input name="DonationReasonId" type="hidden" />                     
                </form>
                
                <table border="1" width="700px">
                    <tr>
                        <td>
                            Id
                        </td>
                        <td>
                            Donation Reason Name
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <%do until rs.EOF%>
                    <tr>
                        <td>
                            <%= rs.Fields.Item("ID") %>
                        </td>
                        <td>
                            <input id="<%="Reason" &  rs.Fields.Item("ID")%>" value="<%= rs.Fields.Item("LISTVALUE") %>" type="text" 
                                style="width: 515px" />
                        </td>
                        <td>
                            <input value="Update" type="button" onclick="UpdateDonation(<%= rs.Fields.Item("ID") %>)"/>
                        </td>
                        <td>
                            <input value="Delete" type="button" onclick="DeleteDonation(<%= rs.Fields.Item("ID") %>)"/>
                        </td>
                    </tr>
                    <%rs.MoveNext%>
                    <%loop
  rs.close
  conn.close%>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
