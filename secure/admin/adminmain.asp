<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>4c Admin</title>

   <script type="text/javascript">
          function SubmitForm(URL) {

              var donationEvent = document.getElementById("SelectListEventId");
    	      var fileName = donationEvent.options[donationEvent.selectedIndex].text;

    	      // Get rid of the item count in the fileName
    	      var fileName1 = fileName.substr(fileName.indexOf(")")+1);
              alert(fileName1);

              // Get rid of all characters except numbers and letters
    	      var fileName3 = fileName.replace(/[^a-zA-Z0-9]+/g, '');

              alert(fileName3);
            
//              window.location = URL + "?ID=" + donationEvent.value + "&Name=" + fileName;
              return false;  
          }
   </script>	
</head>

<body>

<!--#INCLUDE FILE="adminheader.asp"-->
<form method="post" action="displayEvent.asp">
<label id="LabelDonationEvent">Select Event:</label><br />
<!--#include file="donationeventlist.asp"-->
<br/>
<label id="LabelEventVisitors">Event Visitors:</label><br />
<input name="ButtonEditEvent" type="submit" value="Edit Event" />
</form>

<form id="displayvisitors" action="displayEventVisitors.asp" language="javascript" onsubmit="SubmitForm('displayEventVisitors.asp');">
	<input name="DonationEventId" type="hidden" />
	<input name="ButtonDisplayEventVisitors" type="submit" value="Display List" /><br />
	
</form>

<form id="downloadvisitors" action="DownloadEventVisitors.asp" language="javascript" onsubmit="SubmitForm('DownloadEventVisitors.asp');">
	<input name="DonationEventId" type="hidden" />
	<input name="ButtonDownloadEventVisitors" type="submit" value="Download List" /><br /><br />
	
</form>

<label id="LabelCustomizeEvent">Customize Event (e.g. payment form)</label><br />
<form method="post" action="addNewEvent.asp">
<input name="ButtonAddEvent" type="submit" value="Add New Event" />
</form>
<input name="ButtonCopyEvent" type="button" value="Copy an Event" /><br />
<br />
</form>
<form method="post" action="DisplayDonationReasons.asp">
<label id="LabelDonationReason">Donation Reasons</label><br />
<input name="ButtonManageDonation" type=submit value="Manage Donation Reasons" />
</form>

</body>

</html>
