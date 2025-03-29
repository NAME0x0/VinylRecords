import http.server
import socketserver
import os
import signal
import sys
from urllib.parse import unquote

class CustomHandler(http.server.SimpleHTTPRequestHandler):
    # Update MIME types with correct charset and content types
    extensions_map = {
        '': 'application/octet-stream',
        '.html': 'text/html; charset=utf-8',
        '.css': 'text/css; charset=utf-8',
        '.js': 'text/javascript; charset=utf-8',
        '.xml': 'text/xml; charset=utf-8',
        '.xsl': 'text/xml; charset=utf-8',
        '.dtd': 'application/xml-dtd; charset=utf-8',
        '.woff2': 'font/woff2',
        '.woff': 'font/woff',
        '.ttf': 'font/ttf',
        '.eot': 'application/vnd.ms-fontobject',
        '.otf': 'font/otf',
        '.svg': 'image/svg+xml; charset=utf-8',
        '.png': 'image/png',
        '.jpg': 'image/jpeg',
        '.jpeg': 'image/jpeg',
        '.gif': 'image/gif',
        '.ico': 'image/x-icon'
    }

    def end_headers(self):
        # Add security headers
        self.send_header('X-Content-Type-Options', 'nosniff')
        self.send_header('X-Frame-Options', 'SAMEORIGIN')
        self.send_header('X-XSS-Protection', '1; mode=block')
        
        # Add CORS headers
        self.send_header('Access-Control-Allow-Origin', '*')
        
        # Add cache control headers for static resources
        if self.path.endswith(('.css', '.js', '.woff2', '.woff', '.ttf', '.eot', '.otf', '.svg', '.png', '.jpg', '.jpeg', '.gif', '.ico')):
            self.send_header('Cache-Control', 'public, max-age=31536000, immutable')
        else:
            self.send_header('Cache-Control', 'no-cache')
        
        super().end_headers()

    def do_GET(self):
        # Handle XML files with XSL transformation
        if self.path.endswith('.xml'):
            try:
                with open('program.xml', 'r', encoding='utf-8') as f:
                    xml_content = f.read()
                
                # Check if there's a stylesheet reference
                if '<?xml-stylesheet' in xml_content:
                    self.send_response(200)
                    self.send_header('Content-Type', 'text/html; charset=utf-8')
                    self.end_headers()
                    self.wfile.write(xml_content.encode('utf-8'))
                else:
                    self.send_response(200)
                    self.send_header('Content-Type', 'text/xml; charset=utf-8')
                    self.end_headers()
                    self.wfile.write(xml_content.encode('utf-8'))
            except Exception as e:
                self.send_error(500, f"Error processing XML: {str(e)}")
        else:
            super().do_GET()

def run_server(port=8000):
    handler = CustomHandler
    with socketserver.TCPServer(("", port), handler) as httpd:
        print(f"Serving at http://localhost:{port}")
        httpd.serve_forever()

if __name__ == "__main__":
    PORT = 8000
    try:
        run_server(PORT)
    except KeyboardInterrupt:
        print("\nShutting down server...")
        sys.exit(0) 