<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="uts.wsd.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<%
    String bookFilepath = application.getRealPath("WEB-INF/books.xml");
%>
<jsp:useBean id="bookApplication" class="uts.wsd.BookApplication" scope="application">
    <jsp:setProperty name="bookApplication" property="bookFilePath"
    value="<%=bookFilepath%>" />
</jsp:useBean>
<%
    String submitted = request.getParameter("submitted");
    User user = (User) session.getAttribute("user");
    boolean bookexists = false;
    if (submitted != null) {
        Book book = bookApplication.getBooks().findBook(request.getParameter("title"));
        if (book != null) {
            bookexists = true;
        }
    }
    if (submitted != null) {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String date = request.getParameter("date");
        String category = request.getParameter("category");
        String abstractText = request.getParameter("abstractText");
        String condition = request.getParameter("condition");
        Integer id = (bookApplication.getBooks().getList().size() + 1);
        
        //reserverd (true) = open
        Book book = new Book(id, title, author, date, category, abstractText, condition, user.getUsername(), true);
        Books books = bookApplication.getBooks();
        bookApplication.getBooks().addBook(book);
        bookApplication.save();
        bookApplication.updateXML(books, bookFilepath);
    }
%>

<c:set var="xmltext">
    <body>
    <head>
        <title></title>
    </head>
    <navbar>
        <%
            if (user == null) {
                out.print("<logged-out></logged-out>");
            } else {
                out.print("<logged-in></logged-in>");
            }
        %>
    </navbar>

    <%
        if (user != null) {
            if (submitted == null && !bookexists) {
                out.print("<createbook></createbook>");
            } else if (submitted != null && bookexists) {
                out.print("<createbook></createbook>");
                out.print("The book title \"" + request.getParameter("title") + "\" already exists");
            } else {
    %>
    <success></success>
        <%
                }
            } else {
                out.print("Please log in to create a book");
            }
        %>
</body>

</c:set>
<c:import url="WEB-INF/books.xsl" var="xslt" />
<x:transform xml="${xmltext}" xslt="${xslt}" />
