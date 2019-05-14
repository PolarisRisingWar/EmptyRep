package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.LinkedList;
import bags.Log;

/**
 *
 * @author matebook
 */
public class GradeServlet extends HttpServlet {

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
            String zkn=request.getParameter("zkn");
            String logname=request.getParameter("logname");
           if("".equals(logname)){
               response.sendRedirect("login.jsp");
           }
           ResultSet rs;
           String condition="SELECT*FROM user where name='"+logname+"'";
           rs=sql.executeQuery(condition);
             rs.next();
             String xkm=rs.getString("now");
           StringBuffer bzkm=new StringBuffer(xkm);
           bzkm.append(","+zkn);
        
           sql.executeUpdate("UPDATE user SET now='"+bzkm+"'WHERE name='"+logname+"'");
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
           ResultSet rs;
           String logname=request.getParameter("logname");
           if("".equals(logname)){
               response.sendRedirect("login.jsp");
           }
           String pfn=request.getParameter("pfn");
           String pf=request.getParameter("pf");
           String condition="SELECT*FROM movie where number='"+pfn+"'";
             rs=sql.executeQuery(condition);
             rs.next();
           String grades=rs.getString("grades");
           String grade=rs.getString("grade");
           if(grades!=null&&grade!=null){
           double dpf=Double.parseDouble(pf);
           double dgrade=Integer.parseInt(grade);
           double dgrades=Double.parseDouble(grades);
           double totalgrade=dgrade*dgrades+dpf;
           dgrades=dgrades+1;
           dgrade=totalgrade/dgrades;
           sql.executeUpdate("UPDATE movie SET grade='"+dgrade+"'WHERE number='"+pfn+"'");
           sql.executeUpdate("UPDATE movie SET grades='"+dgrades+"'WHERE number='"+pfn+"'");
           } 
    }
      catch(Exception exp){System.out.println("添加失败");} 
        //request.setAttribute(number);
        response.sendRedirect("success.jsp");
}

}
