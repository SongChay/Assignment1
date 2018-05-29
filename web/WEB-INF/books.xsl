<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>BookApp</title>
                <style>
                    html,
                    body {
                    margin: 0;
                    padding: 0;
                    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                    font-size: 30px;
                    }
                    .navbar {
                    width: 100%;
                    height: 40px;
                    background-color: #2e76d2;
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    padding: 16px;
                    }
                    .brand {
                    text-decoration:none;
                    color: #fff;
                    }
                    .navbar-button {
                    margin-right: 50px;
                    text-decoration:none;
                    color: #fff;
                    }
                </style>
            </head>
            <body>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>
	
    <xsl:template match="success">
        <p>Book Successfully Created</p>
        <p>
            Click <a href="index.jsp">here</a> to go back to the main page.
        </p>
    </xsl:template>

    <xsl:template match="navbar">
        <nav class="navbar">
            <h1>
                <a class="brand" href="index.jsp">BookApp</a>
            </h1>
            <xsl:apply-templates />
        </nav>
    </xsl:template>
	
    <xsl:template match="logged-out">
        <div class="navbar-buttons">
            <a class="navbar-button" href="register.jsp">Register</a>
            <a class="navbar-button" href="login.jsp">Login</a>
        </div>
    </xsl:template>
	
    <xsl:template match="logged-in">
        <div class="navbar-buttons">
            <a href="profile.jsp" class="navbar-button">Profile</a>
            <a class="navbar-button" href="logout.jsp">Logout</a>
        </div>
    </xsl:template>
	
    <xsl:template match="createbook">
        <h2>Enter Book Details</h2>
        <form action="createbook.jsp" method="post">
            <table>
                <tr>
                    <td>Title:</td>
                    <td>
                        <input type="text" name="title" required="true" />
                    </td>
                </tr>  
                <tr>
                    <td>Author: </td>
                    <td>
                        <input type="text" name="author" required="true" />
                    </td>
                </tr> 
                <tr>
                    <td>Abstract: </td>
                    <td>
                        <input type="text" name="abstractText" required ="true" />
                    </td>
                </tr>
                <tr>
                    <td>Date: </td>
                    <td>
                        <input type="date" name="date" required="true" />
                    </td>
                </tr>  
                <td>Category: </td>
                <td>
                    <select name="category" required = "true">
                        <option value="Sci-Fi">Science Fiction</option>
                        <option value="Romantic">Romance</option>
                        <option value="Biography">Biography</option>
                        <option value="Business">Business</option>
                        <option value="Technology">Technology</option>                        
                    </select>
                </td>
                <tr>
                    <td>Condition </td>
                    <td>
                        <select name="condition" required = "true">
                            <option value="Excellent">Excellent</option>
                            <option value="Good">Good</option>
                            <option value="Poor">Poor</option>
                        </select>
                    </td>
                </tr>
			
                <tr>
                    <td></td>
                    <td>
                        <input type="hidden" name="submitted" value="yes" />
                    </td>
                </tr> 
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Create Book" />
                    </td>
                </tr>
            </table>
        </form>
    </xsl:template>
	
	
</xsl:stylesheet>