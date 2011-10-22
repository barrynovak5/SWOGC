<%

Function LoadEventDetails()

set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"

sql="SELECT EVENTNAME, EVENTDESCRIPTION, ReceiptPageUrl, DefaultReceiptPageUrl, ReceiptPageTitle, DefaultReceiptPageTitle, PaymentFormHeader, ReceiptFormHeader, ReceiptEmailHeader, " & _
    "PaymentFormFooter, ReceiptFormFooter, ReceiptEmailFooter FROM EVENTS_VW WHERE EventId = ?"
set objCommand = Server.CreateObject("ADODB.Command")
objCommand.ActiveConnection = conn
objCommand.CommandText = sql
objCommand.Parameters(0).value = EventId
set rs= objCommand.Execute()

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

End Function

%>
