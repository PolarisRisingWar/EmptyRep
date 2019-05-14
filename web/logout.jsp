<%@page contentType="text/html" pageEncoding="gb2312"%>
<html>
<%
    session.invalidate();
    RequestDispatcher dispatcher= 
      request.getRequestDispatcher("index.jsp");
      dispatcher.forward(request, response);
%>

