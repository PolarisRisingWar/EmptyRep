<%@page contentType="text/html" pageEncoding="gb2312"%>
<jsp:useBean id="log" class="bags.Log" scope="session"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>���ܲ�-��¼</title>
    </head>
    <body>
        <br><p align="center">��¼</p>
        <div id="content" align="center">
            <form action="LoginServlet" method="post">
                <br>�û�����<input type="text" name="logname">
                <br><br>���룺&nbsp;<input type="password" name="password">
                <br><br><input type="submit" value="��¼">
            </form>
            <br><br><jsp:getProperty name="log" property="tip"/>
        </div>
    </body>
</html>
