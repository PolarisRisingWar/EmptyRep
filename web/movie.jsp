<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="gb2312"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>烂萝卜-西财青年自己的电影评分网站</title>
    </head>
    <body>
        <%! String name,director,type,area,language,year,length,name2,grade,summary,grades,writer,actor;%>
        <%String s=(String)request.getParameter("number");//注意此处
            int number=Integer.parseInt(s);
        try{Class.forName("com.mysql.jdbc.Driver");}
                catch(Exception e){}
        try{ Connection con;
             Statement sql;
             ResultSet rs;
             String uri="jdbc:mysql://127.0.0.1/carrot";
             con=DriverManager.getConnection(uri, "root", "1499");
             sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
             String condition="SELECT*FROM movie where number="+number;
             rs=sql.executeQuery(condition);
             rs.next();
             name=rs.getString("name");
             director=rs.getString("director");
             type=rs.getString("type");
             area=rs.getString("area");
             language=rs.getString("language");
             year=rs.getString("year");
             length=rs.getString("length");
             name2=rs.getString("name2");
             grade=rs.getString("grade");
             summary=rs.getString("summary");
             grades=rs.getString("grades");
             writer=rs.getString("writer");
             actor=rs.getString("actor");
        }
        catch(Exception ee){}
        %>
        <h1><%=name%></h1>
        <table border="0">
<tr>
  <td><% out.print("<img src='D:/pic/"+number+".jpg' align='top'width=123px height=200px>");%></td>
  <td>导演：<%=director%><br>
        编剧：<%=writer%><br>
        主演：<%=actor%><br>
        类型：<%=type%><br>
        地区：<%=area%><br>
        语言：<%=language%><br>
        年份：<%=year%><br>
        时长：<%=length%>分钟<br>
        又名：<%=name2%><br></td>
</tr>
</table>
       
        <jsp:useBean id="log" class="bags.Log" scope="session"/>
        <hr width="100%" size="1" color="black">
        烂萝卜评分：<%=grade%>(共<%=grades%>人评过)
        <form action="movieServlet" method="post">
            <%out.print("<input type='hidden' name='xkn' value="+number+">");
            if(log!=null){
                if(log.getLogname()==null||log.getLogname().length()==0){
                    out.print("<input type='hidden' name='logname' value="+""+">");
                }
                else{
                    String logname=log.getLogname();
                    out.print("<input type='hidden' name='logname' value="+logname+">");
                }
            }
            %>
            <input type="submit" name="submit" value="想看" >
        </form>    
        <form action="GradeServlet" method="post">
            <input type="submit" name="submit" value="在看" >
            <%out.print("<input type='hidden' name='zkn' value="+number+">");
            if(log!=null){
                if(log.getLogname()==null||log.getLogname().length()==0){
                    out.print("<input type='hidden' name='logname' value="+""+">");
                }
                else{
                    String logname=log.getLogname();
                    out.print("<input type='hidden' name='logname' value="+logname+">");
                }
            }%>
        </form>
        <form action="movieServlet" method="get">
            <input type="submit" name="submit" value="看过" >
            <%out.print("<input type='hidden' name='kgn' value="+number+">");
            if(log!=null){
                if(log.getLogname()==null||log.getLogname().length()==0){
                    out.print("<input type='hidden' name='logname' value="+""+">");
                }
                else{
                    String logname=log.getLogname();
                    out.print("<input type='hidden' name='logname' value="+logname+">");
                }
            }%>
        </form>
        <form action="GradeServlet" method="get">
            <input type="submit" name="submit" value="评分" >
             <select name="pf">
                <Option selected value="100">五星
                <Option value="80">四星
                <Option value="60">三星
                <Option value="40">二星
                <Option value="20">一星
            </select>
            <%out.print("<input type='hidden' name='pfn' value="+number+">");
            if(log!=null){
                if(log.getLogname()==null||log.getLogname().length()==0){
                    out.print("<input type='hidden' name='logname' value="+""+">");
                }
                else{
                    String logname=log.getLogname();
                    out.print("<input type='hidden' name='logname' value="+logname+">");
                }
            }%>
        </form>
        <br><br>剧情简介：<%=summary%>
    </body>
</html>



