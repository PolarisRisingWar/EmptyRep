<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="bags.Log" %>
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="log" class="bags.Log" scope="session"/>
        <jsp:getProperty name="log" property="logname"/>�ĵ�Ӱ
        &nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">�ص���ҳ</a>
        <hr>
         <% Connection con;
            Statement sql; //Ԥ�������
            ResultSet rs;           
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){
       out.println("���ǰ�MySQL���ݿ��JDBC-���ݿ����������Ƶ�JDK����չĿ¼��");
    }
          try { 
              String uri="jdbc:mysql://127.0.0.1/carrot";
              String user="root";
              String password="1499";
          con=DriverManager.getConnection(uri,user,password);                          
        //Ҳ����д��con=DriverManager.getConnection(uri+"?user=root&password=");
         sql=con.createStatement();
         //Log newbeans=new Log();
         String logname=log.getLogname();
         String condition="select has,now,want from user where name='"+logname+"'";
         rs=sql.executeQuery(condition);
         rs.next();
         String want=rs.getString("want");
         String now=rs.getString("now");
         String has=rs.getString("has");
         String regex=",";
         out.println("<table width=100% >�û��뿴�ĵ�Ӱ��<tr>");
            String wantm[]=want.split(regex);
            int wlength=wantm.length;
            int wantmovie[]=new int[wlength-1];
            for(int f=1;f<wlength;f++){
                wantmovie[f-1]=Integer.parseInt(wantm[f].trim());
                out.println("<td align=center><img src=D:/pic/"+wantmovie[f-1]+".jpg height=175px></td>");
                
            }
            out.println("</tr><tr>");
            for(int f=1;f<wlength;f++){
                String condition1="select name from movie where number='"+wantmovie[f-1]+"'";
                rs=sql.executeQuery(condition1);
                rs.next();
                out.println("<td align=center><a href=movie.jsp?number="+wantmovie[f-1]+">"+rs.getString(1)+"</a></td>");
            }
            out.println("</tr></table>");
            out.println("<table width=100% >�û��ڿ��ĵ�Ӱ��<tr>");
            String nowm[]=now.split(regex);
            int nlength=nowm.length;
            int nowmovie[]=new int[nlength-1];
            for(int f=1;f<nlength;f++){
                nowmovie[f-1]=Integer.parseInt(nowm[f].trim());
                out.println("<td align=center><img src=D:/pic/"+nowmovie[f-1]+".jpg height=175px></td>");
                
            }
            out.println("</tr><tr>");
            for(int f=1;f<nlength;f++){
                String condition1="select name from movie where number='"+nowmovie[f-1]+"'";
                rs=sql.executeQuery(condition1);
                rs.next();
                out.println("<td align=center><a href=movie.jsp?number="+nowmovie[f-1]+">"+rs.getString(1)+"</a></td>");
            }
            out.println("</tr></table>");
            
            out.println("<table width=100% >�û������ĵ�Ӱ��<tr>");
            String hasm[]=has.split(regex);
            int hlength=hasm.length;
            int hasmovie[]=new int[hlength-1];
            for(int f=1;f<nlength;f++){
                hasmovie[f-1]=Integer.parseInt(hasm[f].trim());
                out.println("<td align=center><img src=D:/pic/"+hasmovie[f-1]+".jpg height=175px></td>");
                
            }
            out.println("</tr><tr>");
            for(int f=1;f<nlength;f++){
                String condition1="select name from movie where number='"+hasmovie[f-1]+"'";
                rs=sql.executeQuery(condition1);
                rs.next();
                out.println("<td align=center><a href=movie.jsp?number="+hasmovie[f-1]+">"+rs.getString(1)+"</a></td>");
            }
            out.println("</tr></table>");
          con.close();
    }
    catch(SQLException e){ }%>
