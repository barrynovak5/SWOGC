<!--#INCLUDE FILE="EventDBDetails.asp"-->

<%
Dim EventId
EventId = "1"

Dim EventTypeId, ReceiptPageUrl, ReceiptPageTitle, ReceiptPageEnabled, EventName, _
    EventDescription, PaymentFormHeader, ReceiptFormHeader, ReceiptEmailHeader, _
    ReceiptFormHeader2, ReceiptFormFooter2, _
    PaymentFormFooter, ReceiptFormFooter, ReceiptEmailFooter

Call LoadEventDetails(ReceiptPageUrl, ReceiptPageTitle, ReceiptPageEnabled, EventName, _
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

    <script language="JavaScript" type="text/javascript"><!--

        function CreateHeaderAndFooterFields() {
            var header1 = document.getElementById("header1")
            var header2 = document.getElementById("header2");
            var footer1 = document.getElementById("footer1");
            var footer2 = document.getElementById("footer2");

            var style = "<style type='text/css' media='all'>" +
                                + "td{ 	font-family: arial, helvetica, verdana;	font-size: 14px; color: #474747;}"

                                + "div{	font-family: arial, helvetica, verdana;	font-size: 14px; color: #474747;}"
                                + "span{font-family: arial, helvetica, verdana;	font-size: 14px; color: #474747;}"
                                + "h1{font-family: arial, helvetica, verdana; font-size: 18px;	color: #000000;	font-weight: bold;}"
                                + "h2{font-family: arial, helvetica, verdana;	font-size: 16px; color: #000000; font-weight: bold;}"
                                + "h3{	font-family: arial, helvetica, verdana;	font-size: 16px; color: #00529f;	font-weight: bold;}"
                                + "a{ color: #00539f; text-decoration: underline;}"
                                + "a:hover{	color: #5995d3;	text-decoration: underline;}"
                                + "</style>";


            header2.value = style;
        }

        function Validator(theForm) {

            if (trim(theForm.DonationAmount.value) == "") {
                alert("Please enter a value for the \"Amount of Donation\" field.");
                theForm.DonationAmount.focus();
                return (false);
            }

            if (theForm.DonationAmount.value.length < 2) {
                alert("Please enter at least 2 characters in the \"Amount of Donation\" field.");
                theForm.DonationAmount.focus();
                return (false);
            }

            if (theForm.DonationAmount.value.length > 50) {
                alert("Please enter at most 50 characters in the \"Amount of Donation\" field.");
                theForm.DonationAmount.focus();
                return (false);
            }

            var checkOK = "0123456789-.,";
            var checkStr = theForm.DonationAmount.value;
            var allValid = true;
            var validGroups = true;
            var decPoints = 0;
            var allNum = "";
            for (i = 0; i < checkStr.length; i++) {
                ch = checkStr.charAt(i);
                for (j = 0; j < checkOK.length; j++)
                    if (ch == checkOK.charAt(j))
                    break;
                if (j == checkOK.length) {
                    allValid = false;
                    break;
                }
                if (ch == ".") {
                    allNum += ".";
                    decPoints++;
                }
                else if (ch == "," && decPoints != 0) {
                    validGroups = false;
                    break;
                }
                else if (ch != ",")
                    allNum += ch;
            }
            if (!allValid) {
                alert("Please enter only digit characters in the \"Amount of Donation\" field.");
                theForm.DonationAmount.focus();
                return (false);
            }

            if (decPoints > 1 || !validGroups) {
                alert("Please enter a valid number in the \"DonationAmount\" field.");
                theForm.DonationAmount.focus();
                return (false);
            }

            if (theForm.DonorEmailAddress.value.length > 0) {

                if (theForm.DonorEmailAddress.value.length < 6) {
                    alert("Please enter at least 6 characters in the \"E-mail\" field.");
                    theForm.DonorEmailAddress.focus();
                    return (false);
                }
                else {
                    var emailad = trim(theForm.DonorEmailAddress.value);
                    var exclude = /[^@\-\.\w]|^[_@\.\-]|[\._\-]{2}|[@\.]{2}|(@)[^@]*\1/;
                    var check = /@[\w\-]+\./;
                    var checkend = /\.[a-zA-Z]{2,3}$/;

                    if (((emailad.search(exclude) != -1) || (emailad.search(check)) == -1) || (emailad.search(checkend) == -1)) {
                        alert("Email is invalid. Please enter a       \nvalid email address.");
                        theForm.DonorEmailAddress.focus();
                        return false;
                    }

                }
            }

            if (theForm.DonorEmailAddress.value.length > 50) {
                alert("Please enter at most 50 characters in the \"E-mail\" field.");
                theForm.DonorEmailAddress.focus();
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
      

//--></script>

    <style type="text/css">
        .style2
        {
            width: 618px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" onload="CreateHeaderAndFooterFields()" rightmargin="0"
    topmargin="0" bgcolor="#ffffff" marginheight="0" marginwidth="0">
    <div class="SEODiv">
        <table border="0" cellspacing="0" bordercolor="red" cellpadding="0" width="100%">
            <tbody>
                <tr>
                    <td valign="top" width="100%" align="middle">
                        <table border="0" cellspacing="0" bordercolor="green" cellpadding="0" width="974">
                            <tbody>
                                <tr>
                                    <td class="SEOCell" valign="top" nowrap align="left">
                                        <a class="homeLink" href="http://secure.4cforchildren.org/" nowrap>4C for Children Home</a>
                                    </td>
                                    <td class="SEOCell" valign="top" nowrap align="right">
                                        Early Childhood Education - Southwest Ohio &amp; Northern Kentucky
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
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
        <tbody>
            <tr>
                <td class="pageBackgroundTop" height="100%" valign="top" width="100%" align="left">
                    <table border="0" cellspacing="0" bordercolor="red" cellpadding="0" width="974" align="center"
                        height="100%">
                        <tbody>
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
                                        <tbody>
                                            <tr>
                                                <td class="leftGutterBound" valign="top" align="left">
                                                    <img border="0" src="images/Donation/LeftGutterTop.jpg" width="15" height="204">
                                                </td>
                                                <td class="contentBound" height="100%" valign="top" width="100%" align="left">
                                                    <table border="0" cellspacing="0" bordercolor="red" cellpadding="0" width="100%"
                                                        height="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td valign="top" width="100%" align="left">
                                                                    <table border="0" cellspacing="0" bordercolor="red" cellpadding="0" width="100%">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="h1HeadingCell" valign="top" align="left">
                                                                                    <h1 class="H1Heading1">
                                                                                        Early Care and Education<br>
                                                                                        <div class="H1Heading2">
                                                                                            4C for children - Make a Donation</div>
                                                                                    </h1>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
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
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td valign="top" align="left">
                                                                                        <p align="left">
                                                                                            <b>A secure online credit-card</b> <b>donation</b> can be made by completing the
                                                                                            form below. Be sure to press the "Make Donation" button at the bottom when you have
                                                                                            completed this form.
                                                                                            <table border="0" cellpadding="2" align="center">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td valign="top" align="right">
                                                                                                            <b>4C is a Better Business Bureau<br>
                                                                                                                Accredited Charity</b>
                                                                                                        </td>
                                                                                                        <td valign="top" align="left">
                                                                                                            <img hspace="3" align="right" src="images/Donation/charityblue.jpg" width="50" height="87">
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
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
                                                                                            
                                                                                            <table>
                                                                                                <tr>
                                                                                                    <td class="required">
                                                                                                        <b>Donation Amount: </b>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <input value="" type="text" name="x_amount" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                            <br />
                                                                                            <table>
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <th colspan="7">
                                                                                                            Personal Information:
                                                                                                        </th>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <table>
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td align="right" class="style2">
                                                                                                            First Name:
                                                                                                        </td>
                                                                                                        <td colspan="6">
                                                                                                            <input maxlength="50" size="35" name="x_first_name">
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="right" class="style2">
                                                                                                            Last Name:
                                                                                                        </td>
                                                                                                        <td colspan="6">
                                                                                                            <input maxlength="50" size="35" name="x_last_name">
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="right" class="style2">
                                                                                                            &nbsp;E-Mail:
                                                                                                        </td>
                                                                                                        <td colspan="6" align="left">
                                                                                                            <input size="35" name="x_email" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="right" class="style2">
                                                                                                            &nbsp;Address:
                                                                                                        </td>
                                                                                                        <td colspan="6">
                                                                                                            <input maxlength="100" size="35" name="x_address">
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="right" class="style2">
                                                                                                        </td>
                                                                                                        <td colspan="6">
                                                                                                            <input size="35" name="DonorAddress2" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="right" class="style2">
                                                                                                            &nbsp;Company:
                                                                                                        </td>
                                                                                                        <td colspan="6">
                                                                                                            <input maxlength="50" size="35" name="x_company" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="right" class="style2">
                                                                                                            &nbsp;City:
                                                                                                        </td>
                                                                                                        <td colspan="6">
                                                                                                            <input maxlength="50" size="35" name="x_city" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="right" class="style2">
                                                                                                            &nbsp;State:
                                                                                                        </td>
                                                                                                        <td colspan="6">
                                                                                                            <input maxlength="50" size="35" name="x_state" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="right" class="style2">
                                                                                                            &nbsp;Zip:
                                                                                                        </td>
                                                                                                        <td colspan="6">
                                                                                                            <input maxlength="15" size="35" name="x_zip" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="right" valign="top" class="style2">
                                                                                                            &nbsp;Telephone:
                                                                                                        </td>
                                                                                                        <td valign="top" align="left">
                                                                                                            <input size="17" name="x_phone" />
                                                                                                            <br>
                                                                                                            Day
                                                                                                            <input value="D" checked="checked" type="radio" name="DonorPhoneDayOrEvening" />&nbsp;
                                                                                                            Evening
                                                                                                            <input value="E" type="radio" name="DonorPhoneDayOrEvening" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="left" class="style2">
                                                                                                            <b>What prompted this online gift? </b>
                                                                                                        </td>
                                                                                                        <td width="370" colspan="6" align="left">
                                                                                                            <!--#include file="picklist.asp"-->
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td colspan="2">
                                                                                                            <b>
                                                                                                                <br />
                                                                                                                Comments (if any):</b>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td colspan="2">
                                                                                                            <textarea wrap="physical" rows="7" cols="45" maxlength="1000" name="DonorComments"></textarea>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td class="style2">
                                                                                                            Include me in future notifications:
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <input value="true" type="radio" checked="checked" name="AddToNewsletter" />&nbsp;
                                                                                                            Yes
                                                                                                            <input value="false" type="radio" name="AddToNewsletter" />&nbsp; No
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <p>
                                                                                                <input value="Make Donation" type="submit" name="submit" />
                                                                                            </p>
                                                                                            <p>
                                                                                                <b>Thank You!</b></p>
                                                                                            </form>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                    <!----------------------------------->
                                                                    <!-- PAGE CONTENT ABOVE THIS POINT -->
                                                                    <!----------------------------------->
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td class="rightGutterBound" valign="bottom" align="middle">
                                                    <img border="0" src="images/Donation/RightGutterBottom.jpg" width="15" height="295">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" align="middle">
                                    <img border="0" src="images/Donation/ContentBottomSpacer.jpg" width="974" height="2">
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
                        </tbody>
                    </table>
</body>
</html>
