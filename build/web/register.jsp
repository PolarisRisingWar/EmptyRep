<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="userBean" class="bags.Register" scope="request"/>
<HEAD><title>ע��ҳ��</title></HEAD>
<HTML><BODY><Font size=2>
<div align="center">
<FORM action="HandleRegister" method="post">
<table>
   <tr><td>*�û�����:</td><td><Input type=text name="logname" ></td>
       <td>*�û�����:</td><td><Input type=password name="password">
       </td></tr>
   <tr><td>*�ٴ���������:</td><td>
       <Input type=password name="again_password"></td>
       <td><Input type=submit name="g" value="�ύ"></td> </tr>
</table>
</Form>
</div >
<div align="center">
<p> 
<jsp:getProperty name="userBean"  property="backNews" /> 
<a href="index.jsp">���ص�¼ </a>
</div >
</Body></HTML>
