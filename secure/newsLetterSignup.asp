<!--#INCLUDE FILE="EventDBDetails.asp"-->

<%
Dim EventId
EventId = "3"

Dim EventTypeId, ReceiptPageUrl, ReceiptPageTitle, ReceiptPageEnabled, EventName, _
    EventDescription, PaymentFormHeader, ReceiptFormHeader, ReceiptEmailHeader, _
    ReceiptFormHeader2, ReceiptFormFooter2, _
    PaymentFormFooter, ReceiptFormFooter, ReceiptEmailFooter

Call LoadEventDetails(EventId, EventTypeId, ReceiptPageUrl, ReceiptPageTitle, ReceiptPageEnabled, EventName, _
    EventDescription, PaymentFormHeader, ReceiptFormHeader, ReceiptEmailHeader, _
    ReceiptFormHeader2, ReceiptFormFooter2, _
    PaymentFormFooter, ReceiptFormFooter, ReceiptEmailFooter)

%>

<html>
<head>
    <title>4C for Children, Early Childhood Education, Community Child Care</title>
    <meta name="description" content="The mission of 4C is to improve the effectiveness and accessibility of early childhood education in Southwestern Ohio &amp; Northern Kentucky.">
    <meta name="keywords" content="4C, 4C for children, comprehensive community child care, cccc, child care, childcare, CCR&amp;R, Ohio referral agencies, early care and education, Child Development, Early Childhood Education, non-profit organization, education, healthy child care, T.E.A.C.H., Child Care Aware, children and families, early learning, early education, child care network, SAC, OST, afterschool, right program, Ohio law, day care, daycare, babysitters, CDA, professional development, family, child, community, healthy child care Ohio">
    <meta name="robots" content="INDEX,FOLLOW">
    <meta name="revisit-after" content="14 Days">
    <link rel="stylesheet" type="text/css" href="styles/css.css" />

   <script language="javascript" type="text/javascript">

        function LoadData()
        {
            var lblEmail = document.getElementById("lblEmail");
            
            lblEmail.className= "required";
            
            return true;
        }

        function Validator(theForm) {

            if (theForm.x_email.value.length) {

                if (theForm.x_email.value.length < 6) {
                    alert("Please enter at least 6 characters in the \"E-mail\" field.");
                    theForm.x_email.focus();
                    return (false);
                }
                else {
                    var emailad = trim(theForm.x_email.value);
                    var exclude = /[^@\-\.\w]|^[_@\.\-]|[\._\-]{2}|[@\.]{2}|(@)[^@]*\1/;
                    var check = /@[\w\-]+\./;
                    var checkend = /\.[a-zA-Z]{2,3}$/;

                    if (((emailad.search(exclude) != -1) || (emailad.search(check)) == -1) || (emailad.search(checkend) == -1)) {
                        alert("Email is invalid. Please enter a       \nvalid email address.");
                        theForm.x_email.focus();
                        return false;
                    }

                }
            }
            else
            {
                alert("Please enter an email address");
                return false;
            }

            if (theForm.x_email.value.length > 50) {
                alert("Please enter at most 50 characters in the \"E-mail\" field.");
                theForm.x_email.focus();
                return (false);
            }


            return (true);
        }

        function trim(inputStringTrim) {
            fixedTrim = "";
            lastCh = " ";
            for (x = 0; x < inputStringTrim.length; x++) {
                ch = inputStringTrim.charAt(x);
                if ((ch != " ") || (lastCh != " ")) {
                    fixedTrim += ch;
                }
                lastCh = ch;
            }
            if (fixedTrim.charAt(fixedTrim.length - 1) == " ") {
                fixedTrim = fixedTrim.substring(0, fixedTrim.length - 1);
            }
            return fixedTrim;
        }
      

</script>

    <style type="text/css">
        .leftSideCol
        {
            width: 650px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" onload="LoadData();" rightmargin="0"
    topmargin="0" bgcolor="#ffffff" marginheight="0" marginwidth="0">
    <div class="SEODiv">
        <table border="0" cellspacing="0" bordercolor="red" cellpadding="0" width="100%">
            
                <tr>
                    <td valign="top" width="100%" align="middle">
                        <table border="0" cellspacing="0" bordercolor="green" cellpadding="0" width="974">
                            
                                <tr>
                                    <td class="SEOCell" valign="top" nowrap align="left">
                                        <a class="homeLink" href="http://secure.4cforchildren.org/" nowrap>4C for Children Home</a>
                                    </td>
                                    <td class="SEOCell" valign="top" nowrap align="right">
                                        Early Childhood Education - Southwest Ohio &amp; Northern Kentucky
                                    </td>
                                </tr>
                            
                        </table>
                    </td>
                </tr>
            
        </table>
    </div>
    <!-- Top Menu Mouseover Code ----------------------------------->

    <script>
<!--
        function cellOnTop(div) {
            if (document.getElementById || (document.all && !(document.getElementById))) {
                div.style.color = "#76b2ff";
                div.style.display = "block";
                div.style.cursor = "pointer";
                div.style.textDecoration = "none";
            }
        }

        function cellOffTop(div) {
            if (document.getElementById || (document.all && !(document.getElementById))) {
                div.style.color = "#003273";
                div.style.display = "block";
                div.style.cursor = "pointer";
                div.style.textDecoration = "none";
            }
        }

        // Store Button Mouseover Code

        function cellOnStore(div) {
            if (document.getElementById || (document.all && !(document.getElementById))) {
                div.style.color = "#00529f";
                div.style.display = "block";
                div.style.cursor = "pointer";
                div.style.backgroundColor = "#76b2ff";
                div.style.textDecoration = "none";
            }
        }

        function cellOffStore(div) {
            if (document.getElementById || (document.all && !(document.getElementById))) {
                div.style.color = "#ffffff";
                div.style.display = "block";
                div.style.cursor = "pointer";
                div.style.backgroundColor = "#00529f";
                div.style.textDecoration = "none";
            }
        }

        // Left Menu Mouseover Code

        function cellOn(div) {
            if (document.getElementById || (document.all && !(document.getElementById))) {
                div.style.color = "#2B450B";
                div.style.display = "block";
                div.style.cursor = "pointer";
                div.style.backgroundColor = "#ffffff";
                div.style.textDecoration = "none";
                div.style.borderColor = "#2B450B";
                div.style.padding = "3px 4px 3px 4px"
            }
        }

        function cellOff(div) {
            if (document.getElementById || (document.all && !(document.getElementById))) {
                div.style.color = "#2B450B";
                div.style.display = "block";
                div.style.cursor = "pointer";
                div.style.backgroundColor = "#D5E3C0";
                div.style.textDecoration = "none";
                div.style.borderColor = "#2B450B";
                div.style.padding = "3px 4px 3px 4px"
            }
        }

        // Left Menu Mouseover Code (for Highlighted Menu Items)

        function cellOn2(div) {
            if (document.getElementById || (document.all && !(document.getElementById))) {
                div.style.color = "#AB2C66";
                div.style.display = "block";
                div.style.cursor = "pointer";
                div.style.backgroundColor = "#ffffff";
                div.style.textDecoration = "none";
                div.style.borderColor = "#AB2C66";
                div.style.padding = "3px 4px 3px 4px"
            }
        }

        function cellOff2(div) {
            if (document.getElementById || (document.all && !(document.getElementById))) {
                div.style.color = "#AB2C66";
                div.style.display = "block";
                div.style.cursor = "pointer";
                div.style.backgroundColor = "#FFBDC1";
                div.style.textDecoration = "none";
                div.style.borderColor = "#AB2C66";
                div.style.padding = "3px 4px 3px 4px"
            }
        }
//-->
    </script>

    <!-- Flyout Menu Code ----------------------------------->

    <script type="text/javascript" src="anylink.js">
        /***********************************************
        * AnyLink CSS Menu script- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
        * This notice MUST stay intact for legal use
        * Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
        ***********************************************/
    </script>

    <table class="pageBackground" border="0" cellspacing="0" bordercolor="red" cellpadding="0"
        width="100%" height="100%">
        
            <tr>
                <td class="pageBackgroundTop" height="100%" valign="top" width="100%" align="left">
                    <table border="0" cellspacing="0" bordercolor="red" cellpadding="0" width="974" align="center"
                        height="100%">
                        
                            <tr>
                                <td class="bannerCell" id="headerTD" valign="top" width="100%" align="left">
                                    <!--#include file="header.asp"-->
                                </td>
                            </tr>
                            <!-- Main 100% height row for left nav and body ---------------->
                            <tr>
                                <td class="mainAreaBound" height="100%" valign="top" align="left">
                                    <table border="0" cellspacing="0" bordercolor="red" cellpadding="0" width="100%"
                                        height="100%">
                                        
                                            <tr>
                                                <td class="leftGutterBound" valign="top" align="left">
                                                    <img border="0" src="images/Donation/LeftGutterTop.jpg" width="15" height="204">
                                                </td>
                                                <td class="contentBound" height="100%" valign="top" width="100%" align="left">
                                                    <table border="0" cellspacing="0" bordercolor="red" cellpadding="0" width="100%"
                                                        height="100%">
                                                        
                                                            <tr>
                                                                <td valign="top" width="100%" align="left">
                                                                    <table border="0" cellspacing="0" bordercolor="red" cellpadding="0" width="100%">
                                                                        
                                                                            <tr>
                                                                                <td class="h1HeadingCell" valign="top" align="left">
                                                                                    <h1 class="H1Heading1">
                                                                                        Early Care and Education<br>
                                                                                        <div class="H1Heading2">
                                                                                            4C for children - Subscribe to Newsletter</div>
                                                                                    </h1>
                                                                                </td>
                                                                            </tr>
                                                                        
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="contentCell" height="100%" valign="top" width="100%" align="left">
                                                                    <!----------------------------------->
                                                                    <!-- PAGE CONTENT BELOW THIS POINT -->
                                                                    <!----------------------------------->
                                                                    <div align="center">
                                                                        <table border="0" cellpadding="5" width="60%">
                                                                            
                                                                                <tr>
                                                                                    <td valign="top" align="left">
                                                                                        <p align="left">
                                                                                            You can <b>sign up to our newsletter </b> by completing the
                                                                                            form below. Be sure to press the "Subscribe" button at the bottom when you have
                                                                                            completed this form.<p align="left">
                                                                                            &nbsp;<table border="0" cellpadding="2" align="center">
                                                                                                
                                                                                                    <tr>
                                                                                                        <td valign="top" align="right">
                                                                                                            
                                                                                                            
                                                                                                            <b>4C is a Better Business Bureau<br>
                                                                                                                Accredited Charity</b>
                                                                                                        </td>
                                                                                                        <td valign="top" align="left">
                                                                                                            <img hspace="3" align="right" src="images/Donation/charityblue.jpg" width="50" height="87">
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                
                                                                                            </table>
                                                                                            <div align="center" class="required">
                                                                                                Fields in red are required fields.</div>
                                                                                            <form language="JavaScript" onsubmit="return Validator(this)" method="post" name="frm1Donation"
                                                                                            action="process.asp">

                                                                                            <input value="<% Response.Write(EventTypeId) %>" type="hidden" name="EventTypeId" />
                                                                                            <input value="<% Response.Write(EventId) %>" type="hidden" name="EventID" />
                                                                                            <input value="<% Response.Write(ReceiptPageUrl) %>" type="hidden" name="ReturnUrl" />
                                                                                            <input value="<% Response.Write(ReceiptPageTitle) %>" type="hidden" name="ReturnTitle" />
                                                                                            <input value="<% Response.Write(ReceiptPageEnabled) %>" type="hidden" name="ReturnEnabled" />
                                                                                            <input value="<% Response.Write(EventName) %>" type="hidden" name="EventName" />
                                                                                            <input value="<% Response.Write(EventDescription) %>" type="hidden" name="x_description" />
                                                                                            <input value="<% Response.Write(PaymentFormHeader) %>" type="hidden" name="x_header_html_payment_form" />
                                                                                            <input value="<% Response.Write(PaymentFormHeader) %>" type="hidden" name="x_header2_html_payment_form" />
                                                                                            <input value="<% Response.Write(ReceiptFormHeader) %>" type="hidden" name="x_header_html_receipt" />
                                                                                            <input value="<% Response.Write(ReceiptEmailHeader) %>" type="hidden" name="x_header_email_receipt" />

                                                                                            <input value="<% Response.Write(PaymentFormFooter) %>" type="hidden" name="x_Footer_html_payment_form" />
                                                                                            <input value="<% Response.Write(PaymentFormFooter) %>" type="hidden" name="x_Footer2_html_payment_form" />
                                                                                            <input value="<% Response.Write(ReceiptFormFooter) %>" type="hidden" name="x_Footer_html_receipt" />
                                                                                            <input value="<% Response.Write(ReceiptEmailFooter) %>" type="hidden" name="x_Footer_email_receipt" />
                                                                                            
                                                                                            <br />
                                                                                            <table width="100%">
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <!--#include file="customerInformation.asp"-->                                                                                           
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td align="right">
                                                                                                        <input value="Subscribe" type="submit" name="submit" />         
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                           
                                                                                            </form>
                                                                                    </td>
                                                                                </tr>
                                                                            
                                                                        </table>
                                                                    </div>
                                                                    <!----------------------------------->
                                                                    <!-- PAGE CONTENT ABOVE THIS POINT -->
                                                                    <!----------------------------------->
                                                                </td>
                                                            </tr>
                                                        
                                                    </table>
                                                </td>
                                                <td class="rightGutterBound" valign="bottom" align="middle">
                                                    <img border="0" src="images/Donation/RightGutterBottom.jpg" width="15" height="295">
                                                </td>
                                            </tr>
                                        
                                    </table>
                                </td>
                            </tr>
                            <!-- Below is for footer, etc. ----------------->
                            <tr>
                                <td class="baseAreaBound" id="footerTD" valign="top" align="middle">
                                    <!--#include file="footer.asp"-->
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" align="left">
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        
                    </table>
</body>
</html>
