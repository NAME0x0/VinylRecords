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
        '.xml': 'application/xml; charset=utf-8',
        '.xsl': 'application/xml; charset=utf-8',
        '.dtd': 'application/xml; charset=utf-8',
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
        # Handle XML files consistently
        if self.path.endswith('.xml'):
            f = None  # Initialize f to None
            try:
                # Use the correct file path from self.path, removing leading '/'
                file_path = self.path.lstrip('/')
                # Decode URL-encoded characters (e.g., %20 for space)
                file_path = unquote(file_path)
                
                # Basic security check to prevent accessing files outside the current directory
                if '..' in file_path or file_path.startswith('/'):
                     self.send_error(403, "Forbidden")
                     return

                f = open(file_path, 'rb') # Open in binary mode
                self.send_response(200)
                # Always send as application/xml to let the browser handle the PI
                self.send_header('Content-Type', 'application/xml; charset=utf-8') 
                fs = os.fstat(f.fileno())
                self.send_header("Content-Length", str(fs[6]))
                self.send_header("Last-Modified", self.date_time_string(fs.st_mtime))
                self.end_headers()
                # Copy file contents to output stream
                import shutil
                shutil.copyfileobj(f, self.wfile)
            except FileNotFoundError:
                 self.send_error(404, "File not found")
            except Exception as e:
                self.send_error(500, f"Error processing request: {str(e)}")
            finally:
                if f:
                    f.close()
        else:
            # Default handling for other file types
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