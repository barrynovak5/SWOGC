<!-- Add the donation -->
<!-- need to check if checkbox was checked!!! ->
<!--#include file="adddonation.asp"-->


<%

Function getAuthorizeCredentials(ByRef loginId, ByRef transactionId, ByRef testModeEnabled, ByRef authorizeUrl)

    loginID			= "57UFrC96t9e"
    transactionKey	= "76VXFF7535ngnCxr"

    testModeEnabled = "false"
    authorizeUrl = "https://test.authorize.net/gateway/transact.dll"

End Function


Function getDonationInfo(form, _
    ByRef designationId, ByRef designationName, ByRef designationDescription, ByRef amount, _
    ByRef lineItemQuantity, ByRef lineItemIsTaxable, _
    ByRef linkTitle, ByRef linkUrl, ByRef linkEnabled _
    )

    designationId = "12345"
    designationName = "Holiday 5K Fundraiser"
    ' Note that the single quote is HTML Encoded as &#039;
    designationDescription = "Our 5K is a great opportunity to contribute to 4Cs mission"
    amount = 15.95

    lineItemQuantity = "1"
    lineItemIsTaxable = "N"

    linkTitle = "4C Homepage"
    linkUrl = "http://www.4c.org"
    linkEnabled = true

End Function


Function storeContactInfo(form, invoiceNo)

End Function
 
%>
