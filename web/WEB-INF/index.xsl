<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>BookApp - Register</title>
                <style>
                    html,
                    body {
                    margin: 0;
                    padding: 0;
                    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                    font-size: 30px;
                    }
                    
                    table {
                    padding: 2px;  
                    margin-left:10%;   
                   
                    }
                    .books {
                    margin-top: 10px;
                    }
                    
                    th, tr, td {
                    padding: 5px;
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
	
    <xsl:template match="main">
        <section class="main-content">
            <h2>Books</h2>
            <xsl:apply-templates />
        </section>
    </xsl:template>
	
    <xsl:template match="books">
        <table class = "books" border = "1" width = "80%">
            <tr>        
                <th width = "25%"> Book title</th>
                <th width = "25%"> Book Author</th>
                <th width = "25%"> Category</th>
                <th width = "25%"> Quantity</th>        
            </tr>    
        </table>
    </xsl:template>
        
    <xsl:template match="book">
        <table border = "1" width = "80%">
            <tr>
                <td width = "25%"> 
                    <a href="bookdetails.jsp?booktitle={title}"> 
                        <xsl:value-of select="title"/> 
                    </a>  
                </td> 
                <td width = "25%">
                    <xsl:value-of select="author"/>
                </td>   
                <td width = "25%"> 
                    <xsl:value-of select="category"/>   
                </td>  
                <td width = "25%">  
                    <xsl:value-of select="quantity"/> 
                </td>          
            </tr>
        </table>
    </xsl:template>
           
</xsl:stylesheet>