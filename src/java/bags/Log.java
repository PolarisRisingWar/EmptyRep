package bags;
public class Log {
    String tip="",logname;//tip是用户登录时显示在登录界面的提示语，logName是用户名
    public void setTip(String t){
        tip=t;
    }
    public String getTip(){
        return tip;
    }
    public void setLogname(String l){
        logname=l;
    }
    public String getLogname(){
        return logname;
    }
}
