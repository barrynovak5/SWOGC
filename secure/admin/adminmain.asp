<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>4c Admin</title>

   <script type="text/javascript">
          function SubmitForm(URL)
	  {
		//alert(theFormId);
		 //var theForm = document.getElementById(theFormId);
		//alerForm.name);
		alert(URL);
                 var donationEvent = document.getElementById("SelectListEventId");
		 alert(donationEvent.value);
	        alert(URL + "?DonationEventID=" + donationEvent.value);

		 //theForm.DonationEventId.value = donationEvent.value;
		 window.location = URL + "?DonationEventID=" + donationEvent.value
		 

                 return false;  
          }
   </script>	
</head>

<body>

<button type="button" onclick="alert('Hello World'))">GetValue</button>

<!--#INCLUDE FILE="adminheader.asp"-->
<form method="post" action="displayEvent.asp">
<label id="LabelDonationEvent">Select Event:</label><br />
<!--#include file="donationeventlist.asp"-->
<br/>
<label id="LabelEventVisitors">Event Visitors:</label><br />
<input name="ButtonEditEvent" type="submit" value="Edit Event" />
</form>

<form id="displayvisitors" action="displayEventVisitors.asp" language="javascript" onsubmit="return SubmitForm('displayEventVisitors.asp');">
	<input name="DonationEventId" type="hidden" />
	<input name="ButtonDisplayEventVisitors" type="submit" value="Display List" /><br />
	
</form>

<form id="downloadvisitors" action="DownloadEventVisitors.asp" language="javascript" onsubmit="return SubmitForm('DownloadEventVisitors.asp');">
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
