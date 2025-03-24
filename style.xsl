<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <title>Vinyl Records - Top Vinyls</title>
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
          
          .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
          }
          
          .glass {
            background: rgba(33, 33, 33, 0.7);
            border-radius: 8px;
            padding: 25px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(83, 83, 83, 0.2);
            margin-bottom: 30px;
          }
          
          .logo {
            text-align: center;
            margin-bottom: 30px;
            color: #e4a01b;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
          }
          
          .vinyls-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
          }
          
          .page-title {
            text-align: center;
            margin-bottom: 30px;
            color: #e4a01b;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
          }
          
          .vinyls-table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
          }
          
          .vinyls-table th {
            background: rgba(199, 90, 52, 0.3);
            color: #ffffff;
            font-weight: bold;
            padding: 15px;
            text-align: left;
            border-bottom: 2px solid rgba(83, 83, 83, 0.2);
          }
          
          .vinyls-table td {
            padding: 12px 15px;
            border-bottom: 1px solid rgba(83, 83, 83, 0.3);
          }
          
          .vinyls-table tr {
            background: rgba(33, 33, 33, 0.7);
            transition: all 0.3s;
          }
          
          .vinyls-table tr:hover {
            background: rgba(83, 83, 83, 0.3);
          }
          
          .main-nav {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
            justify-content: center;
            padding: 15px;
            background: rgba(41, 27, 24, 0.85);
            border-radius: 8px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(226, 175, 117, 0.2);
          }
          
          .nav-link {
            color: #ffffff;
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 4px;
            transition: all 0.3s;
            position: relative;
            border: 1px solid transparent;
          }
          
          .nav-link:hover {
            color: #e4a01b;
            background: rgba(228, 160, 27, 0.1);
            border-color: rgba(228, 160, 27, 0.3);
          }
          
          .nav-link.active {
            color: #e4a01b;
            background: rgba(228, 160, 27, 0.2);
            border-color: rgba(228, 160, 27, 0.5);
            font-weight: 600;
          }
          
          .footer-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 30px;
            padding: 20px;
            background: rgba(41, 27, 24, 0.85);
            border-radius: 8px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(226, 175, 117, 0.2);
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
            color: #e4a01b;
          }
          
          .content-wrapper {
            background: rgba(33, 33, 33, 0.7);
            border-radius: 8px;
            padding: 25px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(83, 83, 83, 0.2);
            margin-bottom: 30px;
          }
          
          .vinyl-icon {
            display: inline-block;
            animation: spin 10s linear infinite;
          }
          
          @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
          }
          
          .rank-value {
            font-weight: bold;
            color: #e4a01b;
          }

          @media (max-width: 768px) {
            .vinyls-table {
              font-size: 0.9rem;
            }
            
            .vinyls-table th, .vinyls-table td {
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
            
            .vinyls-table {
              font-size: 0.8rem;
            }
            
            .vinyls-table th, .vinyls-table td {
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
        <div class="container">
          <header class="glass">
            <h1 class="logo"><i class="fa-solid fa-record-vinyl"></i> Vinyl Records</h1>
            <nav class="main-nav">
              <a href="main.html" class="nav-link">Home</a>
              <a href="catalog.html" class="nav-link">Catalog</a>
              <a href="about.html" class="nav-link">About Us</a>
              <a href="program.xml" class="nav-link active top-vinyls-link">Top Vinyls</a>
            </nav>
          </header>

          <main>
            <section class="vinyls-container glass">
              <h2 class="page-title"><i class="fa-solid fa-record-vinyl vinyl-icon"></i> Top Vinyls of All Time</h2>
              <div class="content-wrapper">
                <table class="vinyls-table">
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
                    <xsl:for-each select="vinyls/vinyl">
                      <tr>
                        <td><span class="rank-value"><xsl:value-of select="rank"/></span></td>
                        <td><xsl:value-of select="title"/></td>
                        <td><xsl:value-of select="artist"/></td>
                        <td><xsl:value-of select="region"/></td>
                        <td><xsl:value-of select="period"/></td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </div>
            </section>
          </main>

          <footer class="glass">
            <div class="footer-content">
              <div class="footer-nav">
                <a href="main.html">Home</a>
                <a href="catalog.html">Catalog</a>
                <a href="about.html">About Us</a>
                <a href="program.xml" class="top-vinyls-link">Top Vinyls</a>
              </div>
              <p>&#169; 2025 Vinyl Records. All rights reserved.</p>
            </div>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet> 