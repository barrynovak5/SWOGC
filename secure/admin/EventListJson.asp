<!--#include file="JSON_2.0.4.asp"-->
<!--#include file="JSON_UTIL_0.1.1.asp"-->
{ "aaData": <%
set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"
QueryToJSON(conn, "SELECT EVENTID, EVENTNAME FROM EVENTS").Flush
%> }
