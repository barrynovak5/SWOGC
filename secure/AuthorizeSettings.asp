<!--#INCLUDE FILE="simlib.asp"-->

<%

Function getAuthorizeCredentials(ByRef loginId, ByRef transactionKey, ByRef testModeEnabled, ByRef authorizeUrl)

set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"

set rs=Server.CreateObject("ADODB.recordset")
sql="SELECT * FROM PaymentIntegration"
rs.Open sql, conn



    loginID = rs.Fields.Item("APILoginID")
    transactionKey = rs.Fields.Item("TransactionKey") 

    testModeEnabled = "false"

    ' By default, this sample code is designed to post to our test server for
    ' developer accounts: https://test.authorize.net/gateway/transact.dll
    ' for real accounts (even in test mode), please make sure that you are
    ' posting to: https://secure.authorize.net/gateway/transact.dll
    authorizeUrl = "https://test.authorize.net/gateway/transact.dll"

End Function

%>