from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

class CustomHandler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=os.getcwd(), **kwargs)
        self.extensions_map = {
            '': 'application/octet-stream',
            '.html': 'text/html; charset=utf-8',
            '.css': 'text/css; charset=utf-8',
            '.xml': 'application/xml; charset=utf-8',
            '.xsl': 'application/xslt+xml; charset=utf-8',
            '.dtd': 'application/xml-dtd; charset=utf-8',
        }

    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        super().end_headers()

def run(server_class=HTTPServer, handler_class=CustomHandler, port=8000):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f"Starting server on port {port}...")
    httpd.serve_forever()

if __name__ == '__main__':
    run() 