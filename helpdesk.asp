<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<title>4C Computer Support Request</title>
<meta name="description" content="The mission of 4C is to improve the effectiveness and accessibility of early childhood education in Southwestern Ohio & Northern Kentucky.">
<meta name="keywords" content="4c, 4c for children, children, comprehensive community child care, cccc, sallie westheimer, westheimer, child care, childcare, quality, CCR&R, resource and referral, Ohio, referral agencies, early care and education, Child Development, Early Childhood Education, non-profit organization, education, healthy child care, T.E.A.C.H., Child Care Aware, children and families, early learning, early education, child care network, schoolage, SAC, OST, afterschool, right program, Ohio law, day care, daycare, babysitters, CDA, accreditation, professional development, family, child, community, help paying, infant, toddler, guidelines, hcco, healthy child care Ohio, training, start smart, first steps, step up to quality, parent central, quality rating system, online search">
</head>

<body>
<table width="100%"  border="0" align="center" cellpadding="3" cellspacing="3">
  <tr>
    <td><A href="index.html"><img src="images/4C.jpg" width="150" height="109" border="0"></A></td>
    <td><H2><FONT color="#003399" face="Arial, Helvetica, sans-serif">4C Computer Support Request </FONT></H2></td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="2" cellpadding="5">
    <tr valign="top">
      <td ALIGn="center">
        
				
        <%

Call ShowGeneral()
If Len(Request.Form("sendgeneral")) AND _
       Request.Form("sendgeneral") = "go" Then Call SendGeneral()

Sub ShowGeneral()
%>
        <FORM METHOD="POST" NAME="adv">
          <p align="center"><font face="Arial, Helvetica, sans-serif">Please be as detailed as possible in describing your request.</font>          </p>
          <p>
                       <input type="hidden" name="required" value="fname">
                       <input type="hidden" name="required" value="lname">
                       <input type="hidden" name="required" value="email">
                       <input type="hidden" name="required" value="classify">
                       <input type="hidden" name="sendgeneral" value="go">
          </p>
                   <CENTER>
                     <TABLE WIDTH="95%" BORDER="0" align="center" CELLPADDING="5" CELLSPACING="5">
                       <TR bgcolor="#FFFFFF"> 
                         <TD align="left" valign="top" bgcolor="#FFFFCC"><FONT face="Arial, Helvetica, sans-serif">Your Name:</FONT></td>
                      <TD align="left" valign="top" bgcolor="#FFFFCC"> <font face="Arial, Helvetica, sans-serif"> 
                        <INPUT NAME="staffname" TYPE="text" id="staffname" VALUE="" SIZE="30">
                      </font></td>
                    </tr>
                       <TR bgcolor="#FFFFFF"> 
                         <TD align="left" valign="top" bgcolor="#FFFFFF"> 
                         <P><font face="Arial, Helvetica, sans-serif" style="Times New Roman, Garamond, Serif">Office Location: </font></p>                      </td>
                      <TD align="left" valign="top"><FONT face="Arial, Helvetica, sans-serif">
                        <SELECT name="location" id="location">
                          <OPTION value="Dana">Dana office</OPTION>
                          <OPTION value="Kentucky">Kentucky office</OPTION>
                          <OPTION value="MiamiValley">Miami Valley office</OPTION>
                          <OPTION value="WarrenCounty">Warren county office</OPTION>
                          <OPTION value="ClintonCounty">Clinton county office</OPTION>
                          <OPTION value="FlorenceOne-Stop">Florence one-stop</OPTION>
                        </SELECT>
                      </FONT></td>
                    </tr>
                       
                   
                       <TR bgcolor="#FFFFFF"> 
                         <TD align="left" valign="top" bgcolor="#FFFFCC"> 
                         <P><font face="Arial, Helvetica, sans-serif" style="Times New Roman, Garamond, Serif">Extension: </font>                    </td>
                      <TD align="left" valign="top" bgcolor="#FFFFCC"><font style="Times New Roman, Garamond, Serif" face="Arial, Helvetica, sans-serif">
                        <INPUT NAME="extension" TYPE="text" id="extension" onChange = "checkPhone(this.value);" SIZE="20">
                      </font></td>
                    </tr>
                     
                       <TR bgcolor="#FFFFFF"> 
                         <TD align="left" valign="top" bgcolor="#FFFFFF">                           <P><FONT face="Arial, Helvetica, sans-serif" style="Times New Roman, Garamond, Serif">Priority</FONT></td>
                      <TD align="left" valign="top"><FONT face="Arial, Helvetica, sans-serif">
                        <LABEL>
                        <INPUT name="priority" type="radio" value="Now">
                        highest - need help within the hour <BR>  
                        <INPUT name="priority" type="radio" value="WithinHours">
high - need help within 2-3 hours <BR>
<INPUT name="priority" type="radio" value="OneDay" CHECKED>
medium - need help in one day (24 hours) <BR>
<INPUT name="priority" type="radio" value="OneWeek">
low - need help within the week (5-7 days) <BR>
<INPUT name="priority" type="radio" value="Whenever">
lowest - need help when you have time </LABEL>
                      </FONT></td>
                    </tr>
                       <TR bgcolor="#FFFFFF" valign="top"> 
                         <TD align="left" valign="top" bgcolor="#FFFFCC"><FONT face="Arial, Helvetica, sans-serif">Type of request </FONT></td>
                      <TD align="left" valign="top" bgcolor="#FFFFCC"><FONT face="Arial, Helvetica, sans-serif">
                        <SELECT name="TypeofRequest" id="TypeofRequest">
                          <OPTION value="empty"></OPTION>
                          <OPTION value="pcnotworking">PC not working</OPTION>
                          <OPTION value="personalprinter">Personal printer not working</OPTION>
                          <OPTION value="networkprinter">Network printer or copier not working</OPTION>
                          <OPTION value="program">Need help witha program</OPTION>
                          <OPTION value="project">Need help with a project</OPTION>
                        </SELECT>
                      </FONT></td>
                       <TR bgcolor="#FFFFFF">
                         <TD align="left" VALIGN="top"><FONT face="Arial, Helvetica, sans-serif">Check all that apply: </FONT></td>
                         <TD align="left" valign="top"><P><FONT face="Arial, Helvetica, sans-serif">Need help with or question about:</FONT></P>
                         <TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
                           
                           <TR>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="access" type="checkbox" id="access" value="yes">
Access </FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <LABEL>
                               <INPUT name="accutrack" type="checkbox" id="accutrack" value="yes">
AccuTrack </LABEL>
                             <LABEL> </LABEL>
                             </FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="remoteaccess" type="checkbox" id="citrix" value="yes">
Remote Access </FONT></TD>
                           </TR>
                           <TR>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="excel" type="checkbox" id="excel" value="yes">
Excel </FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="filemgmt" type="checkbox" id="filemgmt" value="yes">
File management </FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="geocoding" type="checkbox" id="geocoding" value="yes">
Geocoding</FONT></TD>
                           </TR>
                           <TR>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <LABEL>
                               <INPUT name="gp" type="checkbox" id="gp" value="yes">
Great Plains</LABEL>
                             </FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <LABEL>
                               <INPUT name="itrack" type="checkbox" id="itrack" value="yes">
iTrack</LABEL>
                             </FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                             <LABEL>
                             <INPUT name="nw" type="checkbox" id="nw" value="yes">
                             NACCRRAware</LABEL>
                             </FONT></TD>
                           </TR>
                           <TR>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="indesign" type="checkbox" id="indesign" value="yes">
InDesign </FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="ppt" type="checkbox" id="ppt" value="yes">
PowerPoint </FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="publisher" type="checkbox" id="publisher" value="yes">
Publisher </FONT></TD>
                           </TR>
                           <TR>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="re" type="checkbox" id="re" value="yes">
Raiser's Edge</FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <LABEL>
                               <INPUT name="scheduler" type="checkbox" id="scheduler" value="yes">
Resource Scheduler </LABEL>
                             </FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="website" type="checkbox" id="website" value="yes">
Website</FONT></TD>
                           </TR>
                           <TR>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="word" type="checkbox" id="word" value="yes">
Word </FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <LABEL>
                               <INPUT name="wkshopdb" type="checkbox" id="wkshopdb" value="yes">
Workshop database</LABEL>
                             <LABEL> </LABEL>
                             </FONT></TD>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                               <INPUT name="email" type="checkbox" id="email" value="yes">
                             Email
                             </FONT></TD>
                           </TR>
                           <TR>
                             <TD><FONT face="Arial, Helvetica, sans-serif">
                             <INPUT name="av" type="checkbox" id="av" value="yes">
A/V Equipment
<LABEL></LABEL>
                             </FONT></TD>
                             <TD>&nbsp;</TD>
                             <TD>&nbsp;</TD>
                           </TR>
                         </TABLE>                        </td>
                       <TR bgcolor="#FFFFFF"> 
                      <TD align="left" VALIGN="top" bgcolor="#FFFFCC"> 
                        <P><font style="Times New Roman, Garamond, Serif" face="Arial, Helvetica, sans-serif"> 
                          Describe what you need:</font> 
                        <p></p>                    </td>
                      <TD align="left" valign="top" bgcolor="#FFFFCC"> <font face="Arial, Helvetica, sans-serif"> 
                        <TEXTAREA NAME="Description" COLS="50" ROWS="5" id="Description"></textarea>
                      </font></td>
                  </table>
          </center>
                <P ALIGN="center"> 
                  <INPUT TYPE="submit" NAME="Submit" VALUE="Submit help request" onclick="return adv_Validator(this)" language="JavaScript">
                  &nbsp;&nbsp; 
                  <INPUT TYPE="reset" VALUE="Clear Form & Start Over">
                </p>
                    </FORM>
        <%
End Sub


Sub SendGeneral()
On Error Resume Next

'Dimension variables 
Dim objCDOSYSCon
Dim objMessage ' As CDO.Message
Dim Fields     ' As ADODB.Fields

'Create the e-mail server object 
Set objCDOSYSMail = Server.CreateObject("CDO.Message") 
Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration") 
'Out going SMTP server 
objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost" 
objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
objCDOSYSCon.Fields.Update 

'Update the CDOSYS Configuration 
Set objCDOSYSMail.Configuration = objCDOSYSCon 
objCDOSYSMail.From = "computerhelpdesk@4cforchildren.org" 
objCDOSYSMail.To = "computerhelpdesk@4cforchildren.org" 
objCDOSYSMail.Subject = "Help Desk Support Request - " & Request.Form("priority")
objCDOSYSMail.HTMLBody = "-----------------" & "<br>"_
	& VbCrLf & "Need help...<B>" & Request.Form("priority")& "</b><br>"_
	& VbCrLf & "-----------------"_
	& VbCrLf & "<P>Support request for: <B>" & Request.Form("staffname") & "</b>"_
	& VbCrLf & " in the <B>" & Request.Form("location") & " </b>office.<br>"_
	& VbCrLf & "Extension: " & Request.Form("extension") & "<br>"_
	& VbCrLf &  Request.Form("typeofrequest") & "</p>"_
	& VbCrLf & "<TABLE BORDER=1 WIDTH=450 BGCOLOR=silver><TR><TD WIDTH=150>Access: " & Request.Form("access") & "</td>"_
	& VbCrLf & "<TD WIDTH=150>AccuTrack: " & Request.Form("accutrack") & "</td>"_
	& VbCrLf & "<TD>Remote Access: " & Request.Form("remoteaccess") & "</td></tr>"_
	& VbCrLf & "<TR><TD>Excel: " & Request.Form("excel") & "</td>"_
	& VbCrLf & "<TD>File Management: " & Request.Form("filemgmt") & "</td>"_
	& VbCrLf & "<TD>Geocoding: " & Request.Form("geocoding") & "</td></tr>"_
	& VbCrLf & "<TR><TD>Great Plains: " & Request.Form("gp") & "</td>"_
	& VbCrLf & "<TD>iTrack: " & Request.Form("itrack") & "</td>"_
	& VbCrLf & "<TD>NW: " & Request.Form("nw") & "</td></tr>"_
	& VbCrLf & "<TR><TD>InDesign: " & Request.Form("indesign") & "</td>"_
	& VbCrLf & "<TD>PowerPoint: " & Request.Form("ppt") & "</td>"_
	& VbCrLf & "<TD>Publisher: " & Request.Form("publisher") & "</td></tr>"_
	& VbCrLf & "<TR><TD>Raiser's Edge: " & Request.Form("re") & "</td>"_
	& VbCrLf & "<TD>Resource Scheduler: " & Request.Form("scheduler") & "</td>"_
	& VbCrLf & "<TD>Website: " & Request.Form("website") & "</td></tr>"_
	& VbCrLf & "<TR><TD>Word: " & Request.Form("word") & "</td>"_
	& VbCrLf & "<TD>Workshop database: " & Request.Form("wkshopdb") & "</td>"_
	& VbCrLf & "<TD>Email: " & Request.Form("email") & "</td></tr>"_
	& VbCrLf & "<TR><TD COLSPAN=3>AV Equipment: " & Request.Form("av") & "</td></tr></table>"_
	& VbCrLf & "<P>Description: " & Request.Form("description") & "</p>"_
	& VbCrLf & "-----------------"_
	& VbCrLf 

objCDOSYSMail.Send 

'Close the server mail object 
Set objCDOSYSMail = Nothing 
Set objCDOSYSCon = Nothing 
 
Response.Redirect("helpthanks.html")

Set Fields = Nothing
Set objMessage = Nothing
Set objConfig = Nothing

If Err Then
%>
<TABLE width="100%">
  <TR>
    <TH>
      An Error has occurred.<br>
      <b>Number:</b> <%=err.number%><br>
      <b>Description:</b> <%=err.description%>    </TH>
  </TR>
</TABLE>
<%
Else
%>
<TABLE width="100%">
  <TR>
    <TH>
      Your E-Mail has been sent.<br>    </TH>
  </TR>
</TABLE>
            <%
End If
End Sub

%>            </td>
    </tr>
</table>

<hr>
<TABLE WIDTH="95%" align="center" BGCOLOR="#FFFFCC">
  <TR bgcolor="#FFFFFF">
    <TD colspan="2" ALIGN="center"><font size="-1" face="Arial, Helvetica, sans-serif">1924 Dana Avenue <img src="file:///F|/Apache2/htdocs/images/grdot.gif" width="10" height="10"> Cincinnati Ohio 45207 <img src="file:///F|/Apache2/htdocs/images/grdot.gif" width="10" height="10"> 513.221.0033<br>
20 North Grand Avenue <img src="file:///F|/Apache2/htdocs/images/grdot.gif" width="10" height="10"> Fort Thomas Kentucky 41075 <img src="file:///F|/Apache2/htdocs/images/grdot.gif" width="10" height="10"> 859.781.3511<br>
1000 N. Keowee Street <img src="file:///F|/Apache2/htdocs/images/grdot.gif" alt="green dot" width="10" height="10"> Dayton Ohio 45404 <img src="file:///F|/Apache2/htdocs/images/grdot.gif" alt="green dot" width="10" height="10"> 937.220.9660
    </font></TD>
  </TR>
  <TR>
    <TD WIDTH="30%" ALIGN="center"><FONT face="Arial, Helvetica, sans-serif" size="1">Send suggestions and comments to:<BR>
            <A HREF="mailto:4cswo@4cforchildren.org"><b>webmaster</b></A><BR>
&copy;4C - updated 4/2005</FONT></TD>
    <TD ALIGN="right" valign="top"><TABLE width="100%" border="0" cellspacing="5" cellpadding="5" align="center">
        <TR valign="top">
          <TD><DIV align="center"><FONT size="-2"> <a href="file:///F|/Apache2/htdocs/diversity.html" target="_blank">Non-Discrimination and Diversity</a> | <a href="file:///F|/Apache2/htdocs/service.html" target="_blank">Customer Service Policy</a> | <A href="file:///F|/Apache2/htdocs/legal.html#content" target="_new">Content Policy</A> | <A href="file:///F|/Apache2/htdocs/legal.html" target="_new">Copyright Notice and License</A> | <A href="file:///F|/Apache2/htdocs/legal.html#legaldis" target="_new">Legal Disclaimers</A> | <A href="file:///F|/Apache2/htdocs/private.html" target="_new">Privacy Statement</A> | <A href="file:///F|/Apache2/htdocs/jobs.html" target="_new">Career Opportunites</A><BR>
              Unless otherwise noted, all images &amp; text <A href="file:///F|/Apache2/htdocs/legal.html#copy">copyright</A> 4C.</FONT></DIV></TD>
        </TR>
    </TABLE></TD>
  </TR>
  <TR valign="top" bgcolor="#FFFFFF">
    <TD COLSPAN="2"><table width="75%" border="0" align="center" cellpadding="5" cellspacing="5">
        <tr valign="top" bgcolor="#FFFFFF">
          <td width="33%" valign="top"><p><font size="-1" face="Arial, Helvetica, sans-serif">4C strives to provide high quality service to all its customers and clients. Should you have a concern about our service, please contact us:</font></p></td>
          <td width="33%"><div align="center"><font size="-1" face="Arial, Helvetica, sans-serif">Chief Operating Officer <br>
              4C<br>
              1924 Dana Avenue<br>
              Cincinnati, OH 45207</font></div></td>
          <td width="33%"><p align="center"><font size="-1" face="Arial, Helvetica, sans-serif">513.221.0033 in the Greater Cincinnati area<br>
            937-220-9660 in the Miami Valley
            <br>
              859.781.3511 in Northern Kentucky<br>
              toll free at 800.256.1296<br>
              email <b><a href="mailto:4cswo@4cforchildren.org">agency@4cforchildren.org</a></b></font></p></td>
        </tr>
    </table></TD>
  </TR>
  <TR bgcolor="#FFFFFF">
    <TD COLSPAN="2"><P><FONT size="-1">Funding for this website provided in part by the City of Cincinnati; United Way;  The Kentucky Cabinet for Health and Family Services, Division of&nbsp;Child Care and the Ohio Department of Job and Family Services.</FONT></P></TD>
  </TR>
</TABLE>
</body>
</html>
