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
    String id = request.getParameter("id");
    String reserverName = request.getParameter("reserverName");
    String reserverEmail = request.getParameter("reserverEmail");
    String closebook = request.getParameter("closebook");
    Book book = null;

    //if title available
    if (title != null) {
        book = bookApplication.getBooks().findBook(title);
    } else if (id != null) {
        book = bookApplication.getBooks().findBookById(id);
    }
    Books books = bookApplication.getBooks();
    //if remove is selected
    if (reserved != null) {
        bookApplication.getBooks().findBook(title).setReserved(false);
        //bookApplication.save();
        bookApplication.updateXML(books, bookFilePath);

    }

    //Remove Book
    if (closebook != null) {
        bookApplication.getBooks().removeBook(title);
        int count = 1;
        for (Book bookUpdate : bookApplication.getBooks().getList()) {
            bookUpdate.setId(count);
            count++;
        }
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
                if (!book.isReserved()) {
                    //print when book is reserved
                    out.print("<p>This book is reserved</p>");
                } else if (user != null && book != null && user.getUsername().equals(book.getUserUsername())) {
                    //user login...
                    out.print("<close><title>" + book.getTitle() + "</title></close>");
                }
        %>
        <details>
            <username><%= book.getUserUsername()%></username>
            <title><%= book.getTitle()%></title>
            <author><%= book.getAuthor()%></author>
            <description><%= book.getDescription()%></description>	
            <category><%= book.getCategory()%></category>
            <date><%= book.getDate()%></date>
            <condition><%= book.getCondition()%></condition>
        </details>
        <% ////reserve button %>
    <re><titler><%= book.getTitle()%></titler></re>
            <%
                if (reserved == null && book.isReserved()) {
            %>



    <%
    } else {
    %>


    <%  
        //addReserve
        bookApplication.getBooks().findBook(title).addReserve(new Reserve(book.getTitle(), reserverName, reserverEmail));   
        bookApplication.updateXML(books, bookFilePath);
        for (Reserve reserve : bookApplication.getBooks().findBook(title).getReserves()) {
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