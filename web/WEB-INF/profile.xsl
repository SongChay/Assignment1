<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>BookApp - Profile</title>
                <style>
                    html,
                    body {
                    margin: 0;
                    padding: 0;
                    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                    font-size: 30px;
                    }
                    .main-content {
                    padding: 10px;
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
                    .create-book-button {
                    text-decoration:none;
                    padding: 12px;
                    background-color: #2e76d2;
                    color: #fff;
                    box-shadow: 0 2px 8px #888888;
                    margin: 60px 0; 
                    width: 260px;
                    text-align: center;
                    display: block;
                    }
                    .create-book-button:hover {
                    box-shadow: 0 2px 16px #555;
                    }
                </style>
            </head>
            <body>
                <xsl:apply-templates />
            </body>	
        </html>
    </xsl:template>
	
    <xsl:template match="main">
        <section class="main-content">
            <h1>Your Books</h1>
            <div class="books">
                <xsl:apply-templates />
            </div>
            <a class="create-book-button" href="createbook.jsp">Create New Book</a>
        </section>
    </xsl:template>
	
    <xsl:template match="book">
        <p>
              <xsl:value-of select="title"></xsl:value-of>
            - <xsl:value-of select="status"></xsl:value-of>
        </p>
    </xsl:template>
	
    <xsl:template match="book-by-id">
        <p>
            <a href="bookdetails.jsp?id={bookid}">
                <xsl:value-of select="bookid"></xsl:value-of> - <xsl:value-of select="book"></xsl:value-of>
            </a>
            - <xsl:value-of select="status"></xsl:value-of>
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
            <a class="navbar-button" href="profile.jsp">Profile</a>
            <a class="navbar-button" href="logout.jsp">Logout</a>
        </div>
    </xsl:template>
</xsl:stylesheet>