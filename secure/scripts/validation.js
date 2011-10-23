         // Check if string is currency  

        var isCurrency_re    = /^(?:(?:\d{0,3}(?:[, ]\d{0,3})*[, ])+\d{3}|\d+)(?:\.\d*)?(?:\s*\$)?$/;

        function isCurrency (s) {  
                return String(s).search (isCurrency_re) != -1 ; 
        }
        
        // checks that an input string looks like a valid email address.
        var isEmail_re       = /^\s*[\w\-\+_]+(\.[\w\-\+_]+)*\@[\w\-\+_]+\.[\w\-\+_]+(\.[\w\-\+_]+)*\s*$/;
        function isEmail (s) 
        {
            return String(s).search (isEmail_re) != -1;
        }
        
         function ValidateEmail(email)
        {
        
            var emailad = trim(email.value);
                    
            if (emailad.length) {

                if (emailad.length < 6) {
                    alert("Please enter at least 6 characters in the \"E-mail\" field.");
                    email.focus();
                    return (false);
                }
                else {
                    if (!isEmail(emailad))
                    {
                        alert("Email is invalid. Please enter a       \nvalid email address.");
                        email.focus();
                        return false;
                    }
                }
            }
            else
            {
                alert("Please enter an email address");
                return false;
            }

            if (emailad.length > 50) {
                alert("Please enter at most 50 characters in the \"E-mail\" field.");
                email.focus();
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


