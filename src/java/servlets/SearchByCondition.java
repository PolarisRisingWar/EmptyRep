package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.LinkedList;
import bags.Log;
import bags.DataByPage;
import com.sun.rowset.*;
public class SearchByCondition extends HttpServlet{
   CachedRowSetImpl rowSet=null;
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
      try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      request.setCharacterEncoding("gb2312");
      String searchMess= request.getParameter("searchMess");
      if(searchMess==null||searchMess.length()==0) {
         fail(request,response,"没有查询信息，无法查询");
         return;
      }
      String condition= "SELECT name,number FROM movie where name LIKE '%"+searchMess+"%'";       
      HttpSession session=request.getSession(true); 
      Connection con; 
      Statement sql;
      DataByPage dataBean=null;
      try{ 
           dataBean=(DataByPage)session.getAttribute("dataBean");
           if(dataBean==null){
              dataBean=new DataByPage();  //创建Javabean对象
              session.setAttribute("dataBean",dataBean);
           }
      }
      catch(Exception exp){
           dataBean=new DataByPage();  
           session.setAttribute("dataBean",dataBean);
      } 
      String uri = "jdbc:mysql://127.0.0.1/carrot?"+
                   "user=root&password=1499";
        ResultSet rs;
 try{     con=DriverManager.getConnection(uri);
          sql=con.createStatement(); 
          rs=sql.executeQuery(condition);
          rs.last();
          int rowNumber=rs.getRow();  //得到记录数
          String [][] tableRecord=dataBean.getTableRecord();
          tableRecord = new String[rowNumber][2];
          rs.beforeFirst();
          int i=0;
          while(rs.next()){
            for(int k=0;k<2;k++) {
                String x=rs.getString(k+1);
                tableRecord[i][k] = rs.getString(k+1);
            }   
            i++; 
          }
          dataBean.setTableRecord(tableRecord); //更新Javabean数据模型
          con.close();
          RequestDispatcher dispatcher=
          request.getRequestDispatcher("showRecord.jsp");
          dispatcher.forward(request,response);
     }
     catch(SQLException e){
           response.sendRedirect("index.jsp"); //重定向到index.jsp
    }  
   }
   public void doGet(HttpServletRequest request,
              HttpServletResponse response) 
                        throws ServletException,IOException{
       doPost(request,response);
   }
public void fail(HttpServletRequest request,HttpServletResponse response,
                      String backNews) {
        response.setContentType("text/html;charset=GB2312");
        try {
         PrintWriter out=response.getWriter();
         out.println("<html><body>");
         out.println("<h2>"+backNews+"</h2>") ;
         out.println("返回：");
         out.println("<a href =index.jsp>返回初始页面</a>");
         out.println("</body></html>");
        }
        catch(IOException exp){}
    }
}