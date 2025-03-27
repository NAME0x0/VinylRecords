<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Vinyl Library - Vinyl Records Dubai</title>
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
                            <li><a href="program.xml" class="active">Vinyl Library</a></li>
                        </ul>
                    </nav>
                </header>

                <main>
                    <section class="glass-card">
                        <h1>Vinyl Library</h1>
                        <p class="collection-intro">Browse our extensive collection of premium vinyl records, from rare first pressings to limited editions</p>
                        
                        <div class="library-stats">
                            <div class="stat-item">
                                <i class="fas fa-record-vinyl"></i>
                                <span>Total Records: <xsl:value-of select="count(songs/song)"/></span>
                            </div>
                            <div class="stat-item">
                                <i class="fas fa-star"></i>
                                <span>Mint Condition: <xsl:value-of select="count(songs/song[condition='Mint'])"/></span>
                            </div>
                            <div class="stat-item">
                                <i class="fas fa-clock"></i>
                                <span>First Pressings: <xsl:value-of select="count(songs/song[pressing='First Pressing'])"/></span>
                            </div>
                            <div class="stat-item">
                                <i class="fas fa-tag"></i>
                                <span>Limited Editions: <xsl:value-of select="count(songs/song[pressing='Limited Edition'])"/></span>
                            </div>
                        </div>

                        <div class="catalog-grid">
                            <xsl:for-each select="songs/song">
                                <div class="record-item">
                                    <div class="vinyl-sleeve">
                                        <div class="vinyl-disc"></div>
                                    </div>
                                    <div class="record-info">
                                        <h3><xsl:value-of select="title"/></h3>
                                        <p class="artist"><xsl:value-of select="artist"/></p>
                                        <p class="year"><xsl:value-of select="year"/></p>
                                        <p class="genre"><xsl:value-of select="genre"/></p>
                                        <p class="condition"><xsl:value-of select="condition"/></p>
                                        <p class="pressing"><xsl:value-of select="pressing"/></p>
                                        <p class="edition"><xsl:value-of select="edition"/></p>
                                        <p class="description"><xsl:value-of select="description"/></p>
                                        <p class="stock">In Stock: <xsl:value-of select="stock"/></p>
                                        <p class="price">AED <xsl:value-of select="price"/></p>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </section>
                </main>

                <footer class="glass-footer">
                    <div class="footer-content">
                        <div class="footer-section">
                            <h3>About Us</h3>
                            <p>Dubai&apos;s premier destination for premium vinyl records and high-fidelity listening experiences since 2024</p>
                        </div>
                        <div class="footer-section">
                            <h3>Quick Links</h3>
                            <ul>
                                <li><a href="main.html">Home</a></li>
                                <li><a href="catalog.html">Catalog</a></li>
                                <li><a href="program.xml">Vinyl Library</a></li>
                            </ul>
                        </div>
                        <div class="footer-section">
                            <h3>Contact</h3>
                            <p>Email: info@vinylrecords.ae</p>
                            <p>Phone: +971 4 123 4567</p>
                            <p>Private consultations available</p>
                        </div>
                    </div>
                    <div class="footer-bottom">
                        <p>&#169; 2024 Vinyl Records. All rights reserved.</p>
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet> 