<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <title>SpoRecords - Top Songs</title>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="styles.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <style>
          body {
            background: #121212;
            color: #b3b3b3;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            line-height: 1.6;
            min-height: 100vh;
            padding: 20px;
          }
          
          .songs-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
          }
          
          .page-title {
            text-align: center;
            margin-bottom: 30px;
            color: #1db954;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
          }
          
          .songs-table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
          }
          
          .songs-table th {
            background: rgba(29, 185, 84, 0.3);
            color: #ffffff;
            font-weight: bold;
            padding: 15px;
            text-align: left;
            border-bottom: 2px solid rgba(83, 83, 83, 0.2);
          }
          
          .songs-table td {
            padding: 12px 15px;
            border-bottom: 1px solid rgba(83, 83, 83, 0.3);
          }
          
          .songs-table tr {
            background: rgba(33, 33, 33, 0.7);
            transition: all 0.3s;
          }
          
          .songs-table tr:hover {
            background: rgba(83, 83, 83, 0.3);
          }
          
          .main-nav {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
          }
          
          .nav-link {
            color: #ffffff;
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 4px;
            transition: all 0.3s;
            position: relative;
          }
          
          .nav-link:hover {
            color: #1db954;
          }
          
          .nav-link.active {
            color: #1db954;
            font-weight: 600;
          }
          
          .footer-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 30px;
          }
          
          .footer-nav {
            display: flex;
            gap: 20px;
            margin-bottom: 15px;
          }
          
          .footer-nav a {
            color: #b3b3b3;
            text-decoration: none;
            transition: all 0.3s;
          }
          
          .footer-nav a:hover {
            color: #1db954;
          }
          
          .content-wrapper {
            background: rgba(33, 33, 33, 0.7);
            border-radius: 8px;
            padding: 25px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(83, 83, 83, 0.2);
            margin-bottom: 30px;
          }

          @media (max-width: 768px) {
            .songs-table {
              font-size: 0.9rem;
            }
            
            .songs-table th, .songs-table td {
              padding: 8px 10px;
            }
            
            .main-nav {
              flex-wrap: wrap;
              justify-content: center;
            }
          }

          @media (max-width: 480px) {
            body {
              padding: 10px;
            }
            
            .content-wrapper {
              padding: 15px;
            }
            
            .songs-table {
              font-size: 0.8rem;
            }
            
            .songs-table th, .songs-table td {
              padding: 6px 8px;
            }
            
            .main-nav {
              gap: 10px;
            }
            
            .nav-link {
              padding: 6px 10px;
              font-size: 0.9rem;
            }
          }
        </style>
      </head>
      <body>
        <div class="songs-container">
          <h1 class="page-title"><i class="fa-solid fa-record-vinyl"></i> SpoRecords - Top Songs</h1>
          
          <div class="main-nav">
            <a href="main.html" class="nav-link">Home</a>
            <a href="catalog.html" class="nav-link">Catalog</a>
            <a href="about.html" class="nav-link">About Us</a>
            <a href="program.xml" class="nav-link active">Top Songs</a>
          </div>
          
          <div class="content-wrapper">
            <table class="songs-table">
              <thead>
                <tr>
                  <th>Rank</th>
                  <th>Title</th>
                  <th>Artist</th>
                  <th>Region</th>
                  <th>Period</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="songs/song">
                  <tr>
                    <td><xsl:value-of select="rank"/></td>
                    <td><xsl:value-of select="title"/></td>
                    <td><xsl:value-of select="artist"/></td>
                    <td><xsl:value-of select="region"/></td>
                    <td><xsl:value-of select="period"/></td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
          
          <div class="footer-content">
            <div class="footer-nav">
              <a href="main.html">Home</a>
              <a href="catalog.html">Catalog</a>
              <a href="about.html">About Us</a>
              <a href="program.xml">Top Songs</a>
            </div>
            <p>&copy; 2025 SpoRecords. All rights reserved.</p>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet> 