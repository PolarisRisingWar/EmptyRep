<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.sql.*" %>
<%@page import="bags.Page" %>
<%@page import="bags.Log" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>���ܲ�-���������Լ��ĵ�Ӱ������վ</title>
    </head>
    <body>
        <style>
            #header-left{
                color:brown;
                height: 50px;
                width: 80%;
                float:left;
            }
            #header-right{
                height: 50px;
                width: 20%;
                float: right;
            }
            #content{
                width: 100%;
                float:left;
                
            }
        </style>
        <div id="header-left">
            <font size="8">���ܲ�-���������Լ��ĵ�Ӱ������վ
        </div>
        <div id="header-right" align="right">
            <jsp:useBean id="log" class="bags.Log" scope="session"/>
            <%
                if(log!=null){
                    boolean b =log.getLogname()==null||log.getLogname().length()==0;
                    if(!b){
                        out.println("<font size=4><a href=mymovie.jsp>"+log.getLogname()+"�ĵ�Ӱ</a>&nbsp;&nbsp;<a href=logout.jsp>�˳�</a>");
                    }
                    else{
                    out.println("<font size=4><a href=login.jsp>��¼</a>&nbsp;<a href=register.jsp>ע��</a>");
                    }
                }
                else{
                    out.println("<font size=4><a href=login.jsp>��¼</a>&nbsp;<a href=register.jsp>ע��</a>");
                }
            %>
        </div>
        <div id="content">
            <hr size="1" width="100%"><font size="4">
            <form action="SearchByCondition" method="post" align="right">
                ��ѯ��Ӱ��<input type="text" name="searchMess">
                    <input type="submit" value="�ύ" name="search">
            </form>
            <br>��Ӱ������
            <jsp:useBean id="page0" class="bags.Page" scope="session"/>
            <%try{%><jsp:setProperty name="page0" property="currentPage" param="currentPage"/><%}catch(Exception e){}%>
            <%
                try{Class.forName("com.mysql.jdbc.Driver");}
                catch(Exception e){}
                try{
                    Connection con;
                    Statement sql;
                    ResultSet rs;
                    String uri="jdbc:mysql://127.0.0.1/carrot";
                    con=DriverManager.getConnection(uri, "root", "1499");
                    sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                    String condition="select number,name from movie";
                    rs=sql.executeQuery(condition);
                    rs.last();
                    int rowNumber=rs.getRow();
                    String [][]tableRecord=new String[rowNumber][2];
                    rs.beforeFirst();
                    int i=0;
                    while(rs.next()){
                        for(int k=0;k<2;k++){
                            tableRecord[i][k]=rs.getString(k+1);
                        }
                        i++;
                    }
                    con.close();
                    int movieSum=tableRecord.length;
                    int pages;//��ҳ��
                    if(movieSum%5==0){
                        pages=movieSum/5;
                    }
                    else{
                        pages=movieSum/5+1;
                    }
                    page0.setTotalSize(pages);
                     if(page0.getCurrentPage()<1){//�������ҳ��С��1
                        page0.setCurrentPage(1);
                    }
                    else if(page0.getCurrentPage()>pages){//�������ҳ��������ҳ��
                        page0.setCurrentPage(pages);
                    }
                     int start=(page0.getCurrentPage()-1)*5;
                    out.println(movieSum+"<table width=100% ><tr>");
                    if(page0.getCurrentPage()!=pages){//�����ǰҳ�治�����һҳ
                        for(int n=start;n<=start+4;n++){
                            out.println("<td align=center><img src=D:/pic/"+tableRecord[n][0]+".jpg height=175px></td>");
                        }
                        out.println("</tr><tr>");
                        for(int n=start;n<=start+4;n++){
                            String x=tableRecord[n][0];
                            out.println("<td align=center><a href=movie.jsp?number="+x+">"+tableRecord[n][1]+"</a></td>");
                            }
                        out.println("</tr></table>");
                    }
                    else{//�����ǰҳ��������һҳ
                        for(int n=start;n<movieSum;n++){
                            out.println("<td align=center><img src=D:/pic/"+tableRecord[n][0]+".jpg height=175px></td>");
                        }
                        out.println("</tr><tr>");
                        for(int n=start;n<movieSum;n++){
                             String x=tableRecord[n][0];
                            out.println("<td align=center><a href=movie.jsp?number="+x+">"+tableRecord[n][1]+"</a></td>");
                        }
                        out.println("</tr></table>");
                    }
                    

                }
                    catch(Exception e){}%>
                    <br>
                <p align="center">ÿҳ��ʾ 5 ����Ӱ
                    <br>��ǰ��ʾ�� <jsp:getProperty name="page0" property="currentPage"/> ҳ��
                    ���� <%=page0.getTotalSize()%> ҳ
                </p>
                <table width="100%">
                    <tr>
                        <td align="center">
                            <form action="" method="post">
                                <input type="hidden" name="currentPage" value="<%=page0.getCurrentPage()-1%>">
                                <input type="submit" value="��һҳ">
                            </form>
                        </td>
                        <td align="center">
                            <form action="" method="post">
                                <input type="hidden" name="currentPage" value="<%=page0.getCurrentPage()+1%>">
                                <input type="submit" value="��һҳ">
                            </form>
                        </td>
                        <td align="center">
                            <form action="" method="post">
                                ��ת����<input type="text" name="currentPage" value="<%=page0.getCurrentPage()%>">ҳ
                                <input type="submit" value="ȷ��">�����������0��С��<%=page0.getTotalSize()+1%>������Ŷ����
                            </form>
                        </td>
                    </tr>
                </table>
        </div>
    </body>
</html>

