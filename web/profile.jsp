<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="uts.wsd.*" import="java.util.ArrayList"%>
<%
    String bookFilePath = application.getRealPath("WEB-INF/books.xml");
%>
<jsp:useBean id="bookApplication" class="uts.wsd.BookApplication" scope="application">
    <jsp:setProperty name="bookApplication" property="bookFilePath"
    value="<%=bookFilePath%>" />
</jsp:useBean>
<%
    User user = (User) session.getAttribute("user");
    ArrayList<Book> books = bookApplication.getBooks().getBookByUser(user.getUsername());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<c:set var="xmltext">
    <body>
        <%
            if (user == null) {
                out.print("<navbar><logged-out></logged-out></navbar>");
                out.print("<p>404 Profile not found</p>");
            } else {
                out.print("<navbar><logged-in></logged-in></navbar>");
                out.print("<main>");

                if (books.isEmpty()) {
                    out.print("You currently have no books");
                }

                for (Book book : books) {
                    out.print("<book><title>" + book.getTitle() + "</title><status>" + (book.isReserved() ? "listing" : "reserved") + "</status></book>");
                }

                out.print("</main>");
            }
        %>
    </body>
</c:set>
<c:import url="WEB-INF/profile.xsl" var="xslt" />
<x:transform xml="${xmltext}" xslt="${xslt}" />