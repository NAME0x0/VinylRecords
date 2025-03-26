<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY copy "&#169;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Vinyl Library - Vinyl Records Dubai</title>
                <link rel="stylesheet" href="styles.css"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
                <script>
                    function filterRecords() {
                        const searchText = document.getElementById('searchInput').value.toLowerCase();
                        const genreFilter = document.getElementById('genreFilter').value;
                        const conditionFilter = document.getElementById('conditionFilter').value;
                        const pressingFilter = document.getElementById('pressingFilter').value;
                        const sortBy = document.getElementById('sortBy').value;
                        
                        const records = document.getElementsByClassName('record-item');
                        let visibleCount = 0;
                        
                        Array.from(records).forEach(record => {
                            const title = record.querySelector('.record-info h3').textContent.toLowerCase();
                            const artist = record.querySelector('.artist').textContent.toLowerCase();
                            const genre = record.querySelector('.genre').textContent;
                            const condition = record.querySelector('.condition').textContent;
                            const pressing = record.querySelector('.pressing').textContent;
                            
                            const matchesSearch = title.includes(searchText) || artist.includes(searchText);
                            const matchesGenre = !genreFilter || genre === genreFilter;
                            const matchesCondition = !conditionFilter || condition === conditionFilter;
                            const matchesPressing = !pressingFilter || pressing === pressingFilter;
                            
                            if (matchesSearch &amp;&amp; matchesGenre &amp;&amp; matchesCondition &amp;&amp; matchesPressing) {
                                record.style.display = 'block';
                                visibleCount++;
                            } else {
                                record.style.display = 'none';
                            }
                        });
                        
                        document.getElementById('visibleCount').textContent = visibleCount;
                    }
                    
                    function sortRecords() {
                        const sortBy = document.getElementById('sortBy').value;
                        const container = document.querySelector('.catalog-grid');
                        const records = Array.from(document.getElementsByClassName('record-item'));
                        
                        records.sort((a, b) => {
                            switch(sortBy) {
                                case 'price-asc':
                                    return parseFloat(a.querySelector('.price').textContent.replace('AED ', '')) - 
                                           parseFloat(b.querySelector('.price').textContent.replace('AED ', ''));
                                case 'price-desc':
                                    return parseFloat(b.querySelector('.price').textContent.replace('AED ', '')) - 
                                           parseFloat(a.querySelector('.price').textContent.replace('AED ', ''));
                                case 'year-desc':
                                    return parseInt(b.querySelector('.year').textContent) - 
                                           parseInt(a.querySelector('.year').textContent);
                                case 'year-asc':
                                    return parseInt(a.querySelector('.year').textContent) - 
                                           parseInt(b.querySelector('.year').textContent);
                                default:
                                    return 0;
                            }
                        });
                        
                        records.forEach(record => container.appendChild(record));
                    }
                </script>
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
                        
                        <div class="library-controls">
                            <div class="search-box">
                                <i class="fas fa-search"></i>
                                <input type="text" id="searchInput" placeholder="Search by title, artist, or genre..." class="search-input" onkeyup="filterRecords()"/>
                            </div>
                            <div class="filter-options">
                                <select class="filter-select" id="genreFilter" onchange="filterRecords()">
                                    <option value="">All Genres</option>
                                    <xsl:for-each select="songs/song">
                                        <xsl:sort select="genre"/>
                                        <xsl:if test="not(preceding-sibling::song[genre=current()/genre])">
                                            <option><xsl:value-of select="genre"/></option>
                                        </xsl:if>
                                    </xsl:for-each>
                                </select>
                                <select class="filter-select" id="conditionFilter" onchange="filterRecords()">
                                    <option value="">All Conditions</option>
                                    <option value="Mint">Mint</option>
                                    <option value="Excellent">Excellent</option>
                                    <option value="Good">Good</option>
                                    <option value="Fair">Fair</option>
                                    <option value="Poor">Poor</option>
                                </select>
                                <select class="filter-select" id="pressingFilter" onchange="filterRecords()">
                                    <option value="">All Pressings</option>
                                    <option value="First Pressing">First Pressing</option>
                                    <option value="Limited Edition">Limited Edition</option>
                                    <option value="Original">Original</option>
                                </select>
                                <select class="filter-select" id="sortBy" onchange="sortRecords()">
                                    <option value="">Sort By</option>
                                    <option value="price-asc">Price: Low to High</option>
                                    <option value="price-desc">Price: High to Low</option>
                                    <option value="year-desc">Year: Newest First</option>
                                    <option value="year-asc">Year: Oldest First</option>
                                </select>
                            </div>
                        </div>

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
                                        <p class="year" style="display: none;"><xsl:value-of select="year"/></p>
                                        <p class="genre"><xsl:value-of select="genre"/></p>
                                        <p class="condition"><xsl:value-of select="condition"/></p>
                                        <p class="pressing"><xsl:value-of select="pressing"/></p>
                                        <p class="edition"><xsl:value-of select="edition"/></p>
                                        <p class="description"><xsl:value-of select="description"/></p>
                                        <p class="stock">In Stock: <xsl:value-of select="stock"/></p>
                                        <p class="price">AED <xsl:value-of select="price"/></p>
                                        <div class="record-actions">
                                            <button class="btn-details">View Details</button>
                                            <button class="btn-preview">Preview</button>
                                        </div>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>

                        <div class="results-count">
                            Showing <span id="visibleCount"><xsl:value-of select="count(songs/song)"/></span> records
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
                        <p>&copy; 2024 Vinyl Records. All rights reserved.</p>
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet> 