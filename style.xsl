<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <!DOCTYPE html>
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <title>Vinyl Records Library</title>
                <link rel="stylesheet" href="styles.css"/>
            </head>
            <body>
                <header>
                    <nav>
                        <ul>
                            <li><a href="main.html">Home</a></li>
                            <li><a href="catalog.html">Catalog</a></li>
                            <li><a href="program.xml">Top Songs</a></li>
                        </ul>
                    </nav>
                </header>
                <main>
                    <h1>Vinyl Records Library</h1>
                    <section class="stats">
                        <h2>Library Statistics</h2>
                        <div class="stats-grid">
                            <div class="stat-item">
                                <h3>Total Records</h3>
                                <p><xsl:value-of select="count(songs/song)"/></p>
                            </div>
                            <div class="stat-item">
                                <h3>Mint Condition</h3>
                                <p><xsl:value-of select="count(songs/song[@condition='Mint'])"/></p>
                            </div>
                            <div class="stat-item">
                                <h3>First Pressings</h3>
                                <p><xsl:value-of select="count(songs/song[@pressing='First Pressing'])"/></p>
                            </div>
                            <div class="stat-item">
                                <h3>Limited Editions</h3>
                                <p><xsl:value-of select="count(songs/song[@edition='Limited Edition'])"/></p>
                            </div>
                        </div>
                    </section>
                    <section class="records">
                        <h2>Available Records</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Artist</th>
                                    <th>Year</th>
                                    <th>Genre</th>
                                    <th>Price</th>
                                    <th>Condition</th>
                                    <th>Pressing</th>
                                    <th>Stock</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="songs/song">
                                    <tr>
                                        <td><xsl:value-of select="title"/></td>
                                        <td><xsl:value-of select="artist"/></td>
                                        <td><xsl:value-of select="year"/></td>
                                        <td><xsl:value-of select="genre"/></td>
                                        <td>$<xsl:value-of select="price"/></td>
                                        <td><xsl:value-of select="@condition"/></td>
                                        <td><xsl:value-of select="@pressing"/></td>
                                        <td><xsl:value-of select="stock"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </section>
                </main>
                <footer>
                    <div class="footer-content">
                        <div class="footer-section">
                            <h3>About Us</h3>
                            <p>Your trusted source for rare and collectible vinyl records since 1990.</p>
                        </div>
                        <div class="footer-section">
                            <h3>Contact</h3>
                            <p>Email: info@vinylrecords.com</p>
                            <p>Phone: (555) 123-4567</p>
                        </div>
                    </div>
                    <div class="footer-bottom">
                        <p>&copy; 2024 Vinyl Records Library. All rights reserved.</p>
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet> 