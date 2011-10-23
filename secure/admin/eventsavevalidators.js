function Validator(theForm) {
	if (!theForm.EventName.value.length || trim(theForm.EventName.value) == "") {
                alert("Please enter a value for the \"Event Name\" field.");
                theForm.EventName.focus();
                return (false);
            }
}