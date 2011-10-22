<!--#INCLUDE FILE="simlib.asp"-->

<%

Function getAuthorizeCredentials(ByRef loginId, ByRef transactionKey, ByRef testModeEnabled, ByRef authorizeUrl)

    loginID			= "2Hd97eVe4"
    transactionKey	= "9v67FYp97NeVRe3X"

    testModeEnabled = "false"

    ' By default, this sample code is designed to post to our test server for
    ' developer accounts: https://test.authorize.net/gateway/transact.dll
    ' for real accounts (even in test mode), please make sure that you are
    ' posting to: https://secure.authorize.net/gateway/transact.dll

    ' Developers can post to https://developer.authorize.net/param_dump.asp to get a parameter dump

    authorizeUrl = "https://test.authorize.net/gateway/transact.dll"

End Function

%>