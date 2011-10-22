<!--#include file="adovbs.inc"-->
<%

Function LoadEventDetails(ByRef ReceiptPageUrl, ByRef ReceiptPageTitle, ByRef ReceiptPageEnabled, ByRef EventName, _
    ByRef EventDescription, ByRef PaymentFormHeader, ByRef ReceiptFormHeader, ByRef ReceiptEmailHeader, _
    ByRef PaymentFormFooter, ByRef ReceiptFormFooter, ByRef ReceiptEmailFooter)

set conn= Server.CreateObject("ADODB.Connection")
set cmd = Server.CreateObject("ADODB.Command")
set rs = Server.CreateObject("ADODB.RecordSet")

conn.Open "FourC"
rs.CursorType = adOpenForwardOnly
rs.LockType = adLockOptimistic
cmd.ActiveConnection = conn

' From http://support.microsoft.com/kb/200190

'If a SQL statement with question marks is specified, then the
'CommandType is adCmdText.  If a query name is specified, then
'the CommandType is adCmdStoredProc.
cmd.CommandText = "Events_vw"
cmd.CommandType = adCmdStoredProc

'Create the parameter and populate it.
Set param = cmd.CreateParameter("@EventId" , adInteger, adParamInput, 0, 0)
cmd.Parameters.Append param
cmd.Parameters("@EventId") = 1 

'Open and display the Recordset.
rs.Open cmd

If Not rs.EOF Then

    ReceiptPageUrl = rs.Fields.Item("ReceiptPageURL") 'http://www.4c.org
Response.Write("MMMM:" + ReceiptPageEnabled)
    ReceiptPageTitle = rs.Fields.Item("ReceiptPageTitle")
    DefaultReceiptPageTitle = ""  ' UPDATE AFTER DB UPDATE rs.Fields.Item("DefaultReceiptPageTitle")
    DefaultReceiptPageUrl = rs.Fields.Item("DefaultReceiptPageUrl")
Response.Write("NNNN:" + ReceiptPageEnabled)
    If ReceiptPageTitle = "" OR ReceiptPageUrl = "" Then
        If DefaultReceiptPageTitle = "" OR DefaultReceiptPageUrl = "" Then
            ReceiptPageEnabled = "false"
Response.Write("QQQQ:" + ReceiptPageEnabled)
        Else
            ReceiptPageEnabled = "true"
            ReceiptPageTitle = DefaultReceiptPageTitle
            ReceiptPageUrl = DefaultReceiptPageUrl
Response.Write("OOOO:" + ReceiptPageEnabled)
        End If
    Else
        ReceiptPageEnabled = "true"
Response.Write("PPPP:" + ReceiptPageEnabled)
    End If
Response.Write("RRRR:" + ReceiptPageEnabled)

    EventName = rs.Fields.Item("EventName")
    EventDescription = rs.Fields.Item("EventDescription")
    PaymentFormHeader = rs.Fields.Item("PaymentFormHeader")
    ReceiptFormHeader = rs.Fields.Item("ReceiptFormHeader")
    ReceiptEmailHeader = rs.Fields.Item("ReceiptEmailHeader")
    PaymentFormFooter = rs.Fields.Item("PaymentFormFooter")
    ReceiptFormFooter = rs.Fields.Item("ReceiptFormFooter")
    ReceiptEmailFooter = rs.Fields.Item("ReceiptEmailFooter")

End If

rs.Close
set rs = nothing
set cmd = nothing
set conn = nothing

End Function

%>
