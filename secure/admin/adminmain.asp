

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>4c Admin</title>

   <script type="text/javascript">
          function SubmitForm(URL, sanitizeName) {

              var donationEvent = document.getElementById("SelectListEventId");
    	      var fileName = donationEvent.options[donationEvent.selectedIndex].text;
            
    	      // Get rid of the item count in the fileName
    	      fileName = fileName.substr(fileName.indexOf(")")+1);

    	      if (sanitizeName) {
    	          // Get rid of all characters except numbers and letters
    	          fileName = fileName.replace(/[^a-zA-Z0-9]+/g, '');
    	      }

              window.location = URL + "?ID=" + donationEvent.value + "&Name=" + fileName;
              return false;
          }

          $(document).ready(function () {
              $('#EventList').dataTable({
                  "bProcessing": true,
                  "sAjaxSource": 'EventListJson.asp'
              });
          });
   </script>	
</head>

<body>



<!--#INCLUDE FILE="adminheader.asp"-->
<form method="post" action="displayEvent.asp">
    <label id="LabelDonationEvent">Select Event:</label><br />
    <!--#include file="donationeventlist.asp"-->
    <br/><br />
    <input name="ButtonEditEvent" type="submit" value="Edit Event" />
</form>

<form method="post" action="addNewEvent.asp">
    <label id="LabelCustomizeEvent">Customize Event (e.g. payment form)</label><br />
    <input name="ButtonAddEvent" type="submit" value="Add New Event" />
</form><BR />


<form>
    <label id="LabelEventVisitors">Event Visitors:</label><br />
	<input name="ButtonDisplayEventVisitors" type="submit" onclick="return SubmitForm('displayEventVisitors.asp', false);" value="Display List" /><br />
	<input name="ButtonDownloadEventVisitors" type="submit" onclick="return SubmitForm('DownloadEventVisitors.asp', true);" value="Download List" /><br /><br />	
</form>


<form method="post" action="DisplayDonationReasons.asp">
    <label id="LabelDonationReason">Donation Reasons</label><br />
    <input name="ButtonManageDonation" type=submit value="Manage Donation Reasons" />
</form>

</body>

</html>
