<%@page import="java.util.ArrayList"%>
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
    <books></books>

    <%
        //ArrayList<Book> printedBooks = new ArrayList<Book>();
        Books books = bookApplication.getBooks();
        //removeBook
        int i = 0;
        for (Book book : bookApplication.getBooks().listBookByTitle()) {
            Integer quantity = bookApplication.getBooks().getQuantityBooks(book.getTitle()).size();
            //    for (String s : bookApplication.getBooks().getListTitle()){
            if (books.getQuantityBooks(book.getTitle()).contains(book)) {
                if (book.isReserved()) {
                    if (bookApplication.getBooks().getQuantityBooks(book.getTitle()).isEmpty() == false && i < book.getId()) {
                        i = book.getId();
                            out.print("<book><category>" + book.getCategory() + "</category><author>" + book.getAuthor() + "</author><title>" + book.getTitle() + "</title><quantity>" + quantity + "</quantity></book>");
                    }
                }
            }
        }


    %>

</body>

</c:set>
<c:import url="WEB-INF/index.xsl" var="xslt"/>
<x:transform xml="${xmltext}" xslt="${xslt}"/>
