<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>BookApp - Login</title>
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
                                    
                    input {
                    width: 125px;
                    }
                </style>
            </head>
            <body>
                <xsl:apply-templates />
            </body>
        </html>
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
            <a class="navbar-button" href="profile.jsp">Profile</a>
            <a class="navbar-button" href="logout.jsp">Logout</a>
        </div>
    </xsl:template>
	
    <xsl:template match="main">
        <h2>Login</h2>
        <table>
            <form action="login.jsp" method="post">
                <tr>
                    <td>Username:</td>
                    <td>
                        <input value="{username}" type="text" name="username" required="true" />
                    </td>
                </tr> 
                <tr>
                    <td>Password:</td>
                    <td>
                        <input type="password" name="password" required="true" />
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
                        <input type="submit" value="Submit" />
                    </td>
                </tr>
            </form>
        </table>
    </xsl:template>
    <xsl:template match="fail">
        <p>Incorrect username or password. Please try again</p>
		
        <p>or Click <a href="register.jsp">here</a> to register.</p>
            
    </xsl:template>>
	
    <xsl:template match="success">
        <p>Login successful</p>
        <p>Welcome, <xsl:value-of select="username"></xsl:value-of></p>
        <p>Click <a href="index.jsp">here</a> to go to the main page.</p>
        <p>Click <a href="profile.jsp">here</a> to go to your profile</p>
    </xsl:template>
	
	
</xsl:stylesheet>