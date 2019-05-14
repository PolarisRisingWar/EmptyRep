<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="dataBean" 
     class="bags.DataByPage" scope="session"/>
<HTML><body bgcolor=#DEEFF9><font size=2>
  <table border=1>
<%  String [][] record = dataBean.getTableRecord();
      for(int i=0;i<record.length;i++) {
  %>    <tr>
  <%     for(int j=0;j<record[i].length;j++) {
            String n=record[i][1];
            int number=Integer.parseInt(n);
  %>       

  <td><a href=movie.jsp?number=<%=number%>>
    <%= record[i][j] %>
    </a>
</td>

  <%     }
  %>    </tr>
  <%  }
  %>
  </table>
</font></body></HTML>

