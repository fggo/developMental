package com.kh.workman.common;

public class PageBarFactory {
  public static String getPageBar(int totalCount, int cPage, int numPerPage, String url){
    String pageBar ="";
    int pageBarSize = 5;

    int pageNo = ((cPage-1)/pageBarSize)*pageBarSize +1;
    int pageEnd = pageNo + pageBarSize - 1;
    
    int totalPage = (int)Math.ceil((double)totalCount/numPerPage);

    pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
    
    if(pageNo==1) {
      pageBar+="<li class='page-item disabled'>";
      pageBar+="<a class='page-link' href='#' tabindex='-1'><i class='fa fa-angle-double-left'>&nbsp;&nbsp;Prev</i></a>";
      pageBar+="</li>";
    }else {
      pageBar+="<li class='page-item'>";
      pageBar+="<a class='page-link' "
          + "href='javascript:ajaxJobPage(\"/job/jobBoard?cPage="+(pageNo-1) + "\");'><i class='fa fa-angle-double-left'>&nbsp;&nbsp;Prev</i></a>";
      pageBar+="</li>";
    }
    
    while(!(pageNo>pageEnd||pageNo>totalPage)) {
      if(cPage==pageNo) {
        pageBar+="<li class='page-item active'>";
        pageBar+="<span class='page-link'>"+pageNo+"</span>";
        pageBar+="</li>";
      }else {
        pageBar+="<li class='page-item'>";
        pageBar+="<a class='page-link' "
            + "href='javascript:ajaxJobPage(\"/job/jobBoard?cPage="+(pageNo)+"\");'>"+pageNo+"</a>";
        pageBar+="</li>";
      }
      pageNo++;
    }
    if(pageNo>totalPage) {
      pageBar+="<li class='page-item disabled'>";
      pageBar+="<a class='page-link' href='#' tabindex='-1'>Next&nbsp;&nbsp;<i class='fa fa-angle-double-right'></i></a>";
      pageBar+="</li>";
    }else {
      pageBar+="<li class='page-item'>";
      pageBar+="<a class='page-link' "
          + "href='javascript:ajaxJobPage(\"/job/jobBoard?cPage="+pageNo+"\");'>Next&nbsp;&nbsp;<i class='fa fa-angle-double-right'></i></a>";
      pageBar+="</li>";
    }
    pageBar+="</ul>";
    
    
    pageBar+="<script>";
    pageBar+="function fn_paging(cPage){";
    pageBar+="location.href='"+url+"?cPage="+cPage + "';";
    pageBar+="}";
    pageBar+="</script>";
    return pageBar;
  }

}
