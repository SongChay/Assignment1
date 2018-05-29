<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="uts.wsd.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%
    String bookFilePath = application.getRealPath("WEB-INF/books.xml");
%>
<jsp:useBean id="bookApplication" class="uts.wsd.BookApplication" scope="application">
    <jsp:setProperty name="bookApplication" property="bookFilePath"
    value="<%=bookFilePath%>" />
</jsp:useBean>
<%
    User user = (User) session.getAttribute("user");
%>

<c:set var="xmltext">

    <body>
    <navbar>
        <%
            if (user == null) {
                out.print("<logged-out></logged-out>");
            } else {
                out.print("<logged-in></logged-in>");
            }
        %>
    </navbar>

    <main>
      
        <%  
            
            for (Book book : bookApplication.getBooks().getList()) {
                if (book.isReserved()) {
                    out.print("<book><category>" + book.getCategory() + "</category><author>" + book.getAuthor() + "</author><title>"+book.getTitle()+"</title><quantity></quantity></book>");
                }
            }
        %>
    </main>
  
</body>

</c:set>
<c:import url="WEB-INF/index.xsl" var="xslt"/>
<x:transform xml="${xmltext}" xslt="${xslt}"/>
