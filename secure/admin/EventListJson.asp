<!--#include file="JSON_2.0.4.asp"-->
<!--#include file="JSON_UTIL_0.1.1.asp"-->
{ "aaData": <%
set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"
QueryToJSON(conn, "SELECT EVENTS.EVENTID, EVENTNAME, EVENTTYPEDESCRIPTION FROM EVENTS INNER JOIN EVENTTYPE ON EVENTS.EVENTTYPEID = EVENTTYPE.EVENTTYPEID").Flush
%> }
