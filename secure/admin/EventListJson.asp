<!--#include file="util/JSON_latest.asp"-->
<!--#include file="util/JSON_UTIL_latest.asp"-->
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Open "FourC"
QueryToJSON(conn, "SELECT EVENTID, EVENTNAME FROM EVENTS").Flush
%>
