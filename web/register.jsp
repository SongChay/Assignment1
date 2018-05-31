<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="uts.wsd.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<%
    String userFilePath = application.getRealPath("WEB-INF/users.xml");
%>
<jsp:useBean id="userApplication" class="uts.wsd.UserApplication"
             scope="application">
    <jsp:setProperty name="userApplication" property="userFilePath"
    value="<%=userFilePath%>" />
</jsp:useBean>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String passwordConfirm = request.getParameter("password-confirm");
    String submitted = request.getParameter("submitted");
    boolean passwordsMatch = false;
    Users users = userApplication.getUsers();

    if (username == null) {
        username = "";
    }
    if (email == null) {
        email = "";
    }
    if (password != null && passwordConfirm != null) {
        passwordsMatch = password.equals(passwordConfirm);
    }
%>


<c:set var="xmltext">
    <body>
    <head>
    <navbar>
        <%
            if (session.getAttribute("user") == null) {
                out.print("<logged-out></logged-out>");
            } else {
                out.print("<logged-in></logged-in>");
            }
        %>
    </navbar>
</head>
<%
    if (submitted != null && !users.userExists(username) && passwordsMatch) {

%>
<success>    

</success>
<%    userApplication.getUsers().addUser(new User(username, password, email));
    userApplication.save();
    userApplication.updateXML(users, userFilePath);
} else {
    out.print("<register><username>" + username + "</username></register>");
    if (submitted != null && !passwordsMatch) {
%>
<p>Passwords don't match</p>
<%
} else if (submitted != null && users.userExists(username)) {
%>
<p>The username <%=username%> already exists</p>

<%
        }
    }
%>



</body>
</c:set>
<c:import url="WEB-INF/register.xsl" var="xslt" />
<x:transform xml="${xmltext}" xslt="${xslt}" />
