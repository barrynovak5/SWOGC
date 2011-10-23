

function Validator(theForm) {
	if (!theForm.EventName.value.length || trim(theForm.EventName.value) == "") {
                alert("Please enter a value for the \"Event Name\" field.");
                theForm.EventName.focus();
                return (false);
            }
    return true;        
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