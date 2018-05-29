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
    String submitted = request.getParameter("submitted");
    User user = userApplication.getUsers().login(username, password);
    if (username == null) {
        username = "";
    }
%>

<c:set var="xmltext">
    <body>
        <title></title>
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
            session.setAttribute("user", user);
            out.print("<success><username>" + username + "</username></success>");

        } else {
            out.print("<main><username>" + username + "</username></main>");
            if (submitted != null) {
                 %>
    <fail></fail>
 <%           }
        }
    %>
</body>
</c:set>
<c:import url="WEB-INF/login.xsl" var="xslt" />
<x:transform xml="${xmltext}" xslt="${xslt}" />
