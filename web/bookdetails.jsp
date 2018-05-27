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
        bookApplication.getBooks().findBook(title).setReserved(false);
        bookApplication.save();
        //bookApplication.updateXML(books, bookFilePath);

    }

    if (closebook != null) {
        //don't need the lower 2 trash lines.
        //bookApplication.getBooks().findBook(title).setReserved(false);
        //bookApplication.save();
        bookApplication.getBooks().removeBook(title);
        bookApplication.updateXML(books, bookFilePath);
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
                if (!book.isReserved()) {
                    //book
                    out.print("<p>This book is reserved</p>");
                } else if (user != null && book != null && user.getUsername().equals(book.getUserUsername())) {
                    out.print("<close><title>" + book.getTitle() + "</title></close>");
                }
        %>
        <details>
            <title><%= book.getTitle()%></title>
            <username><%= book.getUserUsername()%></username>
            <date><%= book.getDate()%></date>
            <location><%= book.getLocation()%></location>
            <description><%= book.getDescription()%></description>	
        </details>
        <%
            if (reserved == null && book.isReserved()) {
        %>

    <email>	
        <title><%= book.getTitle()%></title>

    </email>

    <%
    } else {
    %>
    <h2>Reserved By</h2>

    <%
        bookApplication.getBooks().findBook(title).addReserve(new Reserve(reserverName, reserverEmail));
        //bookApplication.save();
        bookApplication.updateXML(books, bookFilePath);
        //Reserve reserve = book.bookApplication.getReserves();
        //ArrayList reserve = bookApplication.getBooks().findBook(title).getReserves();
        for (Reserve reserve : bookApplication.getBooks().findBook(title).getReserves()) {
            //if (reserve.getReserve() <= 1)
    %>
    <reserve>
        <name><%= reserve.getName()%></name>
        <email><%= reserve.getEmail()%></email>
    </reserve>
    <%
  break;
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