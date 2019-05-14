<%@page contentType="text/html" pageEncoding="gb2312"%>
<jsp:useBean id="log" class="bags.Log" scope="session"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>烂萝卜-登录</title>
    </head>
    <body>
        <br><p align="center">登录</p>
        <div id="content" align="center">
            <form action="LoginServlet" method="post">
                <br>用户名：<input type="text" name="logname">
                <br><br>密码：&nbsp;<input type="password" name="password">
                <br><br><input type="submit" value="登录">
            </form>
            <br><br><jsp:getProperty name="log" property="tip"/>
        </div>
    </body>
</html>
