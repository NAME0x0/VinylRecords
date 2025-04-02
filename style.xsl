<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="no" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Vinyl Records Library</title>
                <link rel="stylesheet" href="styles.css"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
            </head>
            <body>
                <header class="glass-nav">
                    <nav>
                        <div class="logo">Vinyl Records</div>
                        <ul>
                            <li><a href="main.html">Home</a></li>
                            <li><a href="catalog.html">Catalog</a></li>
                            <li><a href="program.html" class="active">Vinyl Library</a></li>
                        </ul>
                    </nav>
                </header>

                <main>
                    <section class="glass-card">
                        <h1>Vinyl Records Library</h1>
                        <div class="library-controls">
                            <div class="search-box">
                                <i class="fas fa-search"></i>
                                <input type="text" placeholder="Search by title, artist, or genre..." class="search-input"/>
                            </div>
                            <div class="filter-options">
                                <select class="filter-select">
                                    <option value="">All Genres</option>
                                    <option value="Rock">Rock</option>
                                    <option value="Jazz">Jazz</option>
                                    <option value="Pop">Pop</option>
                                    <option value="Folk">Folk</option>
                                    <option value="Progressive Rock">Progressive Rock</option>
                                    <option value="Reggae">Reggae</option>
                                    <option value="Electronic">Electronic</option>
                                    <option value="R&amp;B">R&amp;B</option>
                                    <option value="Hip Hop">Hip Hop</option>
                                </select>
                                <select class="filter-select">
                                    <option value="">All Conditions</option>
                                    <option value="Mint">Mint</option>
                                    <option value="Excellent">Excellent</option>
                                    <option value="Good">Good</option>
                                    <option value="Fair">Fair</option>
                                    <option value="Poor">Poor</option>
                                </select>
                                <select class="filter-select">
                                    <option value="">Sort By</option>
                                    <option value="price-asc">Price: Low to High</option>
                                    <option value="price-desc">Price: High to Low</option>
                                    <option value="year-desc">Year: Newest First</option>
                                    <option value="year-asc">Year: Oldest First</option>
                                </select>
                            </div>
                        </div>

                        <section class="stats">
                            <h2>Library Statistics</h2>
                            <div class="stats-grid">
                                <div class="stat-item">
                                    <i class="fas fa-record-vinyl"></i>
                                    <h3>Total Records</h3>
                                    <p><xsl:value-of select="count(songs/song)"/></p>
                                </div>
                                <div class="stat-item">
                                    <i class="fas fa-star"></i>
                                    <h3>Mint Condition</h3>
                                    <p><xsl:value-of select="count(songs/song[@condition='Mint'])"/></p>
                                </div>
                                <div class="stat-item">
                                    <i class="fas fa-clock"></i>
                                    <h3>First Pressings</h3>
                                    <p><xsl:value-of select="count(songs/song[@pressing='First Pressing'])"/></p>
                                </div>
                                <div class="stat-item">
                                    <i class="fas fa-tag"></i>
                                    <h3>Limited Editions</h3>
                                    <p><xsl:value-of select="count(songs/song[@edition='Limited Edition'])"/></p>
                                </div>
                            </div>
                        </section>

                        <section class="records">
                            <h2>Available Records</h2>
                            <div class="table-container">
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
                                                <td class="condition-{@condition}"><xsl:value-of select="@condition"/></td>
                                                <td><xsl:value-of select="@pressing"/></td>
                                                <td><xsl:value-of select="stock"/></td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </section>
                </main>

                <footer class="glass-footer">
                    <div class="footer-content">
                        <div class="footer-section">
                            <h3>About Us</h3>
                            <p>Your trusted source for rare and collectible vinyl records since 1990.</p>
                        </div>
                        <div class="footer-section">
                            <h3>Quick Links</h3>
                            <ul>
                                <li><a href="main.html">Home</a></li>
                                <li><a href="catalog.html">Catalog</a></li>
                                <li><a href="program.html">Vinyl Library</a></li>
                            </ul>
                        </div>
                        <div class="footer-section">
                            <h3>Contact</h3>
                            <p>Email: info@vinylrecords.ae</p>
                            <p>Phone: +971 4 123 4567</p>
                        </div>
                    </div>
                    <div class="footer-bottom">
                        <p>&#169; 2024 Vinyl Records Library. All rights reserved.</p>
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet> 