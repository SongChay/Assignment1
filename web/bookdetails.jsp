<%@page import="uts.wsd.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="uts.wsd.*" %>
<%
    String bookFilePath = application.getRealPath("WEB-INF/books.xml");
%>
<jsp:useBean id="bookApplication" class="uts.wsd.BookApplication" scope="application">
    <jsp:setProperty name="bookApplication" property="bookFilePath"
    value="<%=bookFilePath%>" />
</jsp:useBean>

<%
    User user = (User) session.getAttribute("user");
    String reserved = request.getParameter("reserved");
    String title = request.getParameter("booktitle");
    String reserverName = request.getParameter("reserverName");
    String reserverEmail = request.getParameter("reserverEmail");
    String closebook = request.getParameter("closebook");
    Book book = bookApplication.getBooks().findBook(title);
    Books books = bookApplication.getBooks();
    //if remove is selected
    if (reserved != null) {
        bookApplication.getBooks().findBook(title).getInfo().setReserved(false);
        //bookApplication.save();
        bookApplication.updateXML(books, bookFilePath);

    }

    if (closebook != null) {
        //don't need the lower 2 trash lines.
        //bookApplication.getBooks().findBook(title).setReserved(false);
        //bookApplication.save();
        bookApplication.getBooks().removeBook(title);
        bookApplication.updateXML(books, bookFilePath);
        //want to redirect to page.
        response.sendRedirect("/MyCoolBookApp/profile.jsp");
        //window.location.href = "bookdetails.jsp";
    }
%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<c:set var="xmltext">
    <body>

        <%
            if (user == null) {
                out.print("<navbar><logged-out></logged-out></navbar>");
            } else {
                out.print("<navbar><logged-in></logged-in></navbar>");
            }
        %>

        <%
            if (book != null) {
                if (!book.getInfo().isReserved()) {
                    //book
                    out.print("<p>This book is reserved</p>");
                } else if (user != null && book != null && user.getUsername().equals(book.getInfo().getUserUsername())) {
                    out.print("<close><title>" + book.getTitle() + "</title></close>");
                }
        %>
        <details>
            <username><%= book.getInfo().getUserUsername()%></username>
            <title><%= book.getTitle()%></title>
            <author><%= book.getAuthor()%></author>
            <description><%= book.getDescription()%></description>	
            <category><%= book.getCategory()%></category>
            <date><%= book.getDate()%></date>
            <condition><%= book.getInfo().getCondition()%></condition>
        </details>
        <%
            if (reserved == null && book.getInfo().isReserved()) {
        %>

    <email>	
        <title><%= book.getTitle()%></title>

    </email>

    <%
    } else {
    %>


    <%
        bookApplication.getBooks().findBook(title).addReserve(new Reserve(book.getTitle(), reserverName, reserverEmail));
        //bookApplication.save();
        bookApplication.updateXML(books, bookFilePath);
        //Reserve reserve = book.bookApplication.getReserves();
        //ArrayList reserve = bookApplication.getBooks().findBook(title).getReserves();
        for (Reserve reserve : bookApplication.getBooks().findBook(title).getReserves()) {
            //if (reserve.getName().equals(reserverName) && reserve.getEmail().equals(reserverEmail)){
            if (reserve.getName().isEmpty() && reserve.getEmail().isEmpty()) {
                bookApplication.getBooks().findBook(title).removeReserve(reserve);
                break;
            }

    %>
    <h2>Reserved By</h2>
    <reserve>
        <name><%= reserve.getName()%></name>
        <email><%= reserve.getEmail()%></email>
    </reserve>
    <%
                break;
                //}
            }
        }
    } else {
    %>
    <p>404 Book details not found.</p>
    <%
        }
    %> 
</body>
</c:set>
<c:import url="WEB-INF/bookdetails.xsl" var="xslt" />
<x:transform xml="${xmltext}" xslt="${xslt}" />