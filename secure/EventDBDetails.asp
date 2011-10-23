<!--#include file="adovbs.inc"-->
<%

Function LoadEventDetails(EventId, ByRef EventTypeId, ByRef ReceiptPageUrl, ByRef ReceiptPageTitle, ByRef ReceiptPageEnabled, ByRef EventName, _
    ByRef EventDescription, ByRef PaymentFormHeader, ByRef ReceiptFormHeader, ByRef ReceiptEmailHeader, _
    ByRef ReceiptFormHeader2, ByRef ReceiptFormFooter2, _
    ByRef PaymentFormFooter, ByRef ReceiptFormFooter, ByRef ReceiptEmailFooter,  ByRef PaymentFormHeader2, ByRef PaymentFormFooter2)

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
cmd.Parameters("@EventId") = EventId

'Open and display the Recordset.
rs.Open cmd

If Not rs.EOF Then

    ReceiptPageUrl = rs.Fields.Item("ReceiptPageURL") 'http://www.4c.org
    ReceiptPageTitle = rs.Fields.Item("ReceiptPageTitle")
    DefaultReceiptPageTitle = ""  ' UPDATE AFTER DB UPDATE rs.Fields.Item("DefaultReceiptPageTitle")
    DefaultReceiptPageUrl = rs.Fields.Item("DefaultReceiptPageUrl")
    If ReceiptPageTitle = "" OR ReceiptPageUrl = "" Then
        If DefaultReceiptPageTitle = "" OR DefaultReceiptPageUrl = "" Then
            ReceiptPageEnabled = "false"
        Else
            ReceiptPageEnabled = "true"
            ReceiptPageTitle = DefaultReceiptPageTitle
            ReceiptPageUrl = DefaultReceiptPageUrl
        End If
    Else
        ReceiptPageEnabled = "true"
    End If

    EventName = rs.Fields.Item("EventName")
    EventTypeId = rs.Fields.Item("EventTypeId")
    EventDescription = rs.Fields.Item("EventDescription")
    PaymentFormHeader = rs.Fields.Item("PaymentFormHeader")
    ReceiptFormHeader = rs.Fields.Item("ReceiptFormHeader")
    ReceiptEmailHeader = rs.Fields.Item("ReceiptEmailHeader")
    PaymentFormFooter = rs.Fields.Item("PaymentFormFooter")
    ReceiptFormFooter = rs.Fields.Item("ReceiptFormFooter")
    ReceiptEmailFooter = rs.Fields.Item("ReceiptEmailFooter")
    PaymentFormHeader2 = rs.Fields.Item("PaymentFormHeader2")
    PaymentFormFoote2r = rs.Fields.Item("PaymentFormFooter2")

End If

rs.Close
set rs = nothing
set cmd = nothing
set conn = nothing

End Function

%>
