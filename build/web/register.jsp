<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="userBean" class="bags.Register" scope="request"/>
<HEAD><title>注册页面</title></HEAD>
<HTML><BODY><Font size=2>
<div align="center">
<FORM action="HandleRegister" method="post">
<table>
   <tr><td>*用户名称:</td><td><Input type=text name="logname" ></td>
       <td>*用户密码:</td><td><Input type=password name="password">
       </td></tr>
   <tr><td>*再次输入密码:</td><td>
       <Input type=password name="again_password"></td>
       <td><Input type=submit name="g" value="提交"></td> </tr>
</table>
</Form>
</div >
<div align="center">
<p> 
<jsp:getProperty name="userBean"  property="backNews" /> 
<a href="index.jsp">返回登录 </a>
</div >
</Body></HTML>
