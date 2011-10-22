<!--#INCLUDE FILE="simlib.asp"-->

<%

Function getAuthorizeCredentials(ByRef loginId, ByRef transactionKey, ByRef testModeEnabled, ByRef authorizeUrl)

    loginID			= "6RT5cpN7n"
    transactionKey	= "9M9T3s3bxvY55rZE"

    testModeEnabled = "false"

    ' By default, this sample code is designed to post to our test server for
    ' developer accounts: https://test.authorize.net/gateway/transact.dll
    ' for real accounts (even in test mode), please make sure that you are
    ' posting to: https://secure.authorize.net/gateway/transact.dll
    authorizeUrl = "https://test.authorize.net/gateway/transact.dll"

End Function

%>