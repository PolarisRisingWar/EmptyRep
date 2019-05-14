package servlets;
import bags.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class HandleRegister extends HttpServlet {
   public void init(ServletConfig config) throws ServletException { 
      super.init(config);
      try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   }
   public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException {
      String uri="jdbc:mysql://127.0.0.1/carrot"+
                             "?user=root&password=1499&characterEncoding=gb2312";
      Connection con; 
      PreparedStatement sql; 
      Register userBean=new Register();  //创建的Javabean模型
      request.setAttribute("userBean",userBean);
      request.setCharacterEncoding("gb2312");
      String logname1=request.getParameter("logname");
      String logname=logname1.trim();
      String password=request.getParameter("password").trim();
      String again_password=request.getParameter("again_password").trim();
      if(logname==null)
           logname="";
      if(password==null)
           password="";
      if(!password.equals(again_password)) { 
         userBean.setBackNews("两次密码不同，注册失败，");
         RequestDispatcher   dispatcher= 
         request.getRequestDispatcher("register.jsp");
         dispatcher.forward(request, response);//转发
         return;
      }
      boolean isLD=true;
      boolean boo=logname.length()>0&&password.length()>0&&isLD;
      String backNews="";
     try{   con=DriverManager.getConnection(uri);
             String insertCondition="INSERT INTO user VALUES (?,?,?,?,?)";
             sql=con.prepareStatement(insertCondition);
             if(boo)
             { sql.setString(1,logname);
               sql.setString(2,password);
               sql.setString(3,"0");
               sql.setString(4,"0");
               sql.setString(5,"0");
               int m=sql.executeUpdate();
               if(m!=0){
                  backNews="注册成功";
                  userBean.setBackNews(backNews);
                  userBean.setLogname(logname);
               }
             }
             else {
                 backNews="信息填写不完整或名字中有非法字符";
                 userBean.setBackNews(backNews);  
             }
             con.close();
      }
      catch(SQLException exp){
             backNews="该会员名已被使用，请您更换名字";
             userBean.setBackNews(backNews); 
      }
      RequestDispatcher dispatcher= 
      request.getRequestDispatcher("register.jsp");
      dispatcher.forward(request, response);//转发
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
      doPost(request,response);
   }
}
