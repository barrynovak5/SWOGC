<!--#include file="adovbs.inc"-->
<%

Function LoadEventDetails()

set conn= Server.CreateObject("ADODB.Connection")
set cmd = Server.CreateObject("ADODB.Command")
set rs = Server.CreateObject("ADODB.RecordSet")

conn.Open "FourC"
rs.CursorType = adOpenForwardOnly
rs.LockType = adLockOptimistic
cmd.ActiveConnection = conn

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



Dim ReceiptPageUrl, ReceiptPageTitle, ReceiptPageEnabled, EventName, EventDescription, PaymentFormHeader, ReceiptFormHeader, ReceiptEmailHeader
Dim PaymentFormFooter, ReceiptFormFooter, ReceiptEmailFooter

If Not rs.EOF Then

    ReceiptPageUrl = rs.Fields.Item("ReceiptPageURL") 'http://www.4c.org
    ReceiptPageTitle = rs.Fields.Item("ReceiptPageTitle")
    ReceiptPageUrl = rs.Fields.Item("ReceiptPageUrl")
    DefaultReceiptPageTitle = ""  ' UPDATE AFTER DB UPDATE rs.Fields.Item("DefaultReceiptPageTitle")
    DefaultReceiptPageUrl = rs.Fields.Item("DefaultReceiptPageUrl")
    If ReceiptPageTitle = "" OR ReceiptPageUrl = "" Then
        If DefaultReceiptPageTitle = "" OR DefaultReceiptPageUrl = "" Then
            ReceiptPageEnabled = false
        Else
            ReceiptPageEnabled = true
            ReceiptPageTitle = DefaultReceiptPageTitle
            ReceiptPageUrl = DefaultReceiptPageUrl
        End If
    End If

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
