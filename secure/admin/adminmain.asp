<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>4c Admin</title>

   <script type="text/javscript">
          function SubmitForm(theFormId)
	  {

		 var theForm = document.getElementById(theFormId);
                 var donationEvent = document.getElementById("DonationEventId");

		 theForm.DonationEventId.value = donationEvent.value;
		
                 return true;  
          }
   </script>	
</head>

<body>

<form 

<form method="post" action="displayEvent.asp">
<label id="LabelDonationEvent">Select Event:</label><br />
<!--#include file="donationeventlist.asp"-->
<br/>
<label id="LabelEventVisitors">Event Visitors:</label><br />
<input name="ButtonEditEvent" type="submit" value="Edit Event" />
</form>

<form action="displayEventVisitors.asp" language="javascript" onsubmit="return SubmitForm(this)">
	<input name="DonationEventId" type="hidden" />
	<input name="ButtonDisplayEventVisitors" type="submit" value="Display List" /><br /><br />
	
</form>

<input name="ButtonDownloadEventVisitors" type="button" value="Download List" />
<label id="LabelCustomizeEvent">Customize Event (e.g. payment form)</label><br />
<input name="ButtonAddEvent" type="button" value="Add New Event" />
<input name="ButtonCopyEvent" type="button" value="Copy an Event" /><br />
<br />
</form>
<form method="post" action="DisplayDonationReasons.asp">
<label id="LabelDonationReason">Donation Reasons</label><br />
<input name="ButtonManageDonation" type=submit value="Manage Donation Reasons" />
</form>

</body>

</html>
