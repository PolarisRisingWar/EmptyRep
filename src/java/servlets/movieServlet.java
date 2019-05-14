package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.LinkedList;
import bags.Log;
public class movieServlet extends HttpServlet {
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
      try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      request.setCharacterEncoding("gb2312");
      HttpSession session=request.getSession(true); 
      Connection con=null; 
      String uri="jdbc:mysql://127.0.0.1/carrot";
      try{ 
           con=DriverManager.getConnection(uri,"root","1499");
           Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                                ResultSet.CONCUR_READ_ONLY);
           String xkn=request.getParameter("xkn");
           String logname=request.getParameter("logname");
           if("".equals(logname)){
               response.sendRedirect("login.jsp");
           }
            ResultSet rs;
           String condition="SELECT*FROM user where name='"+logname+"'";
           rs=sql.executeQuery(condition);
             rs.next();
             String xkm=rs.getString("want");
          StringBuffer bxkm=new StringBuffer(xkm);
          bxkm.append(","+xkn);
          sql.executeUpdate("UPDATE user SET want='"+bxkm+"'WHERE name='"+logname+"'");
          request.setAttribute("number", xkn);
     }
      catch(SQLException exp){System.out.println("添加失败");}  
      
      response.sendRedirect("success.jsp");
  }    
   public void doGet(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
    request.setCharacterEncoding("gb2312");
      HttpSession session=request.getSession(true); 
      Connection con=null; 
      String uri="jdbc:mysql://127.0.0.1/carrot";
      try{ 
           con=DriverManager.getConnection(uri,"root","1499");
           Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                                ResultSet.CONCUR_READ_ONLY);
            String kgn=request.getParameter("kgn");
            String logname=request.getParameter("logname");
           if("".equals(logname)){
               response.sendRedirect("login.jsp");
           }
           ResultSet rs;
           String condition="SELECT*FROM user where name='"+logname+"'";
           rs=sql.executeQuery(condition);
             rs.next();
             String xkm=rs.getString("has");
           StringBuffer bkgm=new StringBuffer(xkm);
          bkgm.append(","+kgn);
           
           sql.executeUpdate("UPDATE user SET has='"+bkgm+"'WHERE name='"+logname+"'");
      }
      catch(SQLException exp){System.out.println("添加失败");}
      response.sendRedirect("success.jsp");
   }   
}

