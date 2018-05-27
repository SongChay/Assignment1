<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>MeatApp - Poll Details</title>
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
					background-color: #D32F2F;
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
					.medium-text {
						font-size: 22px;
					}
					.create-book-button {
					text-decoration:none;
					padding: 12px;
					background-color: #F44336;
					color: #fff;
					box-shadow: 0 2px 8px #888888;
					margin: 20px 10px; 
					width: 260px;
					text-align: center;
					display: block;
					font-size: 16px;
					border: none;
					cursor: pointer;
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
        
        <xsl:template match="success">
		<p>Poll Successfully Created</p>
		<p>
			Click <a href="index.jsp">here</a> to go back to the main page.
		</p>
	</xsl:template>

	<xsl:template match="navbar">
		<nav class="navbar">
			<a class="brand" href="index.jsp">MeatApp</a>
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
	
	<xsl:template match="details">
		<p>Title: <xsl:value-of select="title"></xsl:value-of></p>
		<p>User: <xsl:value-of select="username"></xsl:value-of></p>
		<p>Listed Date: <xsl:value-of select="date"></xsl:value-of></p>
		<p>Location: <xsl:value-of select="location"></xsl:value-of></p>
		<p>Description: <xsl:value-of select="description"></xsl:value-of></p>
	</xsl:template>
	
	<xsl:template match="email">
		<form action="bookdetails.jsp?booketitle={title}" method="post">
			<input type="hidden" name="voted" value="yes" />
			<div>
				<xsl:apply-templates></xsl:apply-templates>
			</div>
			<label class="medium-text" for="">Name:</label> <input type="text" required="true" placeholder="Name" name="voterName" />
			<label class="medium-text" for="">Email</label> <input type="text" required="true" placeholder="Email" name="voterEmail" />
			
                        <input type="submit"  value="vote"/>
		</form>
	</xsl:template>
        
	
	
	
	<xsl:template match="reserve">
		<p><xsl:value-of select="name"></xsl:value-of> - <xsl:value-of select="email"></xsl:value-of></p>
	</xsl:template>
	
	<xsl:template match="close">
		<form action="bookdetails.jsp" method="post">
			<input type="hidden" name="booketitle" value="{title}" ></input>
			<input type="hidden" name="closebook" value="closebook"></input>
			<input class="create-book-button" type="submit" value="Remove Listing"></input>
		</form>
	</xsl:template>
	
</xsl:stylesheet>