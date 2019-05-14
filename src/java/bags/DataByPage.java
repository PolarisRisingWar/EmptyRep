package bags;
public class DataByPage {
   String [][] tableRecord=null;   //存放查询到的记录
   public DataByPage() {
      tableRecord = new String[1][1];
   }
   public void setTableRecord(String [][] s){
      tableRecord=s;
   }
   public String [][] getTableRecord(){
      return tableRecord;
   }
}

