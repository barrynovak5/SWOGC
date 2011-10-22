<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>4c Admin</title>
</head>

<body>

<form method="POST" action="displayEvent.asp">
<label id="Label1">Select an Event...</label><br />
<!--#include file="donationeventlist.asp"-->
<br/>
<label id="Label2">Download/display registered visitors for Event:</label><br />
<input name="Button2" type="submit" value="Display" /><br /><br />
</form>
<label id="Label3">Customize Event (e.g. payment form)</label><br />
<input name="Button3" type="button" value="Edit" />
<input name="Button4" type="button" value="Create" />
<input name="Button5" type="button" value="Copy" /><br />
<br />

<form method="POST" action="EditDonation.asp">
<label id="Label1">Donation Reason...</label><br />
<!-- #include virtual="/secure/picklist.asp"-->
<br/>
<label id="Label2">I want to:</label><br />
<input name="Button2" type="submit" value="Edit" /><br /><br />
</form>

</body>

</html>
