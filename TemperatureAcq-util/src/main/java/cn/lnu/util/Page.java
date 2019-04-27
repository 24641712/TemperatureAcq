package cn.lnu.util;

import java.io.Serializable;

/**
 * 实现分页功能的工具类
 * @Author ccl
 * @Date 2019/4/26
 */
public class Page implements Serializable {
    //当前页数
    private int pageNow = 1;

    //每页显示记录的条数
    private int pageSize = 14;

    //总的记录条数
    private int totalCount;

    //总的页数
    private int totalPageCount;

    //开始位置，从0开始
    @SuppressWarnings("unused")
    private int startPos;

    //是否有首页
    @SuppressWarnings("unused")
    private boolean hasFirst;

    //是否有前一页
    @SuppressWarnings("unused")
    private boolean hasPre;

    //是否有下一页
    @SuppressWarnings("unused")
    private boolean hasNext;

    //是否有最后一页
    @SuppressWarnings("unused")
    private boolean hasLast;

    /*
     *构造函数，
     *@param totalCount 总记录数
     *@param pageNow 当前页
     *@return null
     **/
    public Page(int totalCount,int pageNow) {
        this.pageNow = pageNow;
        this.totalCount = totalCount;
    }

    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    /*
     *获取总页数
     * 总页数 = 总记录数/页大小
     *@return
     **/
    public int getTotalPageCount() {
        totalPageCount = getTotalCount()/getPageSize();
        return (totalCount % pageSize==0)?totalPageCount:totalPageCount+1;
    }

    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }

    /*
     *取得记录的初始位置
     *@return
     **/
    public int getStartPos() {
        return (pageNow-1)*pageSize;
    }

    public void setStartPos(int startPos) {
        this.startPos = startPos;
    }

    /*
     *是否有首页
     *@return
     **/
    public boolean isHasFirst() {
        return (pageNow==1)?false:true;
    }

    public void setHasFirst(boolean hasFirst) {
        this.hasFirst = hasFirst;
    }

    /*
     *是否有上一页
     *@return
     **/
    public boolean isHasPre() {
        return isHasFirst()?true:false;
    }

    public void setHasPre(boolean hasPre) {
        this.hasPre = hasPre;
    }

    /*
     *是否有下一页
     *@return
     **/
    public boolean isHasNext() {
        return isHasLast()?true:false;
    }

    public void setHasNext(boolean hasNext) {
        this.hasNext = hasNext;
    }

    /*
     *是否有尾页
     *@return
     **/
    public boolean isHasLast() {
        return (pageNow==getTotalPageCount())?false:true;
    }

    public void setHasLast(boolean hasLast) {
        this.hasLast = hasLast;
    }

}
