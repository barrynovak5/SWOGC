<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>4c Admin</title>
</head>

<body>

<form method="post" action="displayEvent.asp">
<label id="LabelDonationEvent">Select an Event...</label><br />
<!--#include file="donationeventlist.asp"-->
<br/>
<label id="Label2">Download/display registered visitors for Event:</label><br />
<input name="ButtonDisplayEvent" type="submit" value="Display" /><br /><br />
</form>
<label id="LabelCustomizeEvent">Customize Event (e.g. payment form)</label><br />
<input name="ButtonEditEvent" type="button" value="Edit" />
<input name="ButtonAddEvent" type="button" value="Add" />
<input name="ButtonCopyEvent" type="button" value="Copy" /><br />
<br />

<form method="post" action="EditDonation.asp">
<label id="LabelDonationReason">Donation Reason...</label><br />
<!-- #include virtual="/secure/picklist.asp"-->
<br/>
<input name="ButtonEditDonation" type="button" value="Edit" /><br /><br />
<input name="ButtonAddDonation" type="button" value="Add" /><br /><br />

</form>

</body>

</html>
