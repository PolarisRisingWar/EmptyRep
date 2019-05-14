package bags;
//本javabean用于显示index.jsp中的页数
public class Page {
    int totalSize=1;//总页数
    int currentPage=1;//当前显示页
    public void setTotalSize(int t){
        totalSize=t;
    }
    public int getTotalSize(){
        return totalSize;
    }
    public void setCurrentPage(int c){
        currentPage=c;
    }
    public int getCurrentPage(){
        return currentPage;
    }
}

