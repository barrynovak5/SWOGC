﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>4c Admin</title>
</head>

<body>

<label id="Label1">Select an Event...</label><br />
<select name="EventName" style="width: 246px">
<! include="../secure/picklist.asp">
</select><br /><br />
<label id="Label2">Download/display registered visitors for Event:</label><br />
<input name="Button1" type="button" value="Download" />
<input name="Button2" type="button" value="Display" /><br /><br />
<label id="Label3">Customize Event (e.g. payment form)</label><br />
<input name="Button3" type="button" value="Edit" />
<input name="Button4" type="button" value="Create" />
<input name="Button5" type="button" value="Copy" /><br />
<br />
<label id="Label4">Donation Reason</label><br />
<select name="DonationReason" style="width: 301px">
<option></option>
<option selected="selected" value="1">I want to</option>
</select><br />
<input name="Button6" type="button" value="Edit" />
<input name="Button7" type="button" value="Add" />
<input name="Button8" type="button" value="Delete" />

</body>

</html>
